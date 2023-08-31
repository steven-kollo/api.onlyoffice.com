const http = require('https');
const fs = require('fs/promises');
const path = require('path');
const { exec } = require("child_process");
const jsdoc2md = require('jsdoc-to-markdown');
const resources = require('./resources.json');

const baseUrl = "https://raw.githubusercontent.com/ONLYOFFICE"
const resourcesPath = "resources";
const documentationPath = "documentation";
const downloadFiles = true;
const parseDocs = true;

(async () => {
    let resourcesFolder = path.join(__dirname, resourcesPath);

    if (downloadFiles) {
        console.log("downloading files..");
        await downloadResources(resourcesFolder, resources);
    }

    let tmpFolder = path.join(__dirname, "tmp"); 

    try {
        await fs.rm(tmpFolder, { recursive: true });
    } catch { }

    //cloning resources to tmp folder
    await fs.cp(resourcesFolder, tmpFolder, { recursive: true });

    if (parseDocs) {
        console.log("removing anonymous functions..");
        for (let resource of resources) {
            console.log(`removing anonymous functions in sources module (${resource.module})`);
            await reformatScripts(path.join(tmpFolder, resource.module, 'sources'));
        }
    }

    console.log("generating docs..");
    await generateDocs(resources, tmpFolder);
    
    try {
        await fs.rm(tmpFolder, { recursive: true });
    } catch { }
})();

async function downloadResources(resourcesFolder, resources) {
    try {
        await fs.rm(resourcesFolder, { recursive: true });
    } catch { }

    await fs.mkdir(resourcesFolder);

    for (let resource of resources) {
        console.log(`downloading: resources for module: ${resource.module}`);
        const moduleFolder = path.join(resourcesFolder, resource.module);

        await fs.mkdir(moduleFolder);

        console.log(`downloading: sources for module: ${resource.module}`);
        const sourcesFolder = path.join(moduleFolder, 'sources');

        await fs.mkdir(sourcesFolder);

        for (let source of resource.sources) {
            console.log(`downloading: source (${source.name}) from branch (${source.branch})`);
            for (let file of source.files) {
                const pathToFile = `${source.name}/${source.branch}/${file.path}`
                const fileName = pathToFile.replace(/^.*[\\\/]/, '');
                const outputFolder = path.join(sourcesFolder, file.folder);
                const outputFile =  path.join(outputFolder, fileName);
                console.log(`downloading: ${pathToFile} -> ${outputFile}`);

                try {
                    await fs.mkdir(outputFolder);
                } catch { }

                await downloadFile(`${baseUrl}/${pathToFile}`, outputFile);
            }
        }

        console.log(`downloading: examples for module: ${resource.module}`);
        const examplesFolder = path.join(moduleFolder, 'examples');
        //ToDo: change after creating repo with examples
        await fs.cp(path.join(__dirname, '../..', 'web', 'App_Data', resource.module, 'examples'), examplesFolder, {recursive: true});
    }
}

async function downloadFile(url, pathToSave) {
    return new Promise((resolve, reject) => {
        http.get(url, async res => {
            let file = await fs.open(pathToSave, "w");
            let stream = file.createWriteStream();

            res.pipe(stream);

            stream.on("finish", () => {
                stream.close(() => {
                    file.close();
                    resolve(true);
                });
            })
        });
    });
}

async function reformatScripts(folder) {
    const reg = /\(function\s?\(window\,\s?builder\)\s*?{([\s\S]*)}/m;

    let files = await fs.readdir(folder, {recursive: true});

    for (let file of files) {
        let filePath = path.join(folder, file);
        let stat = await fs.stat(filePath);
        if  (stat.isDirectory()) {
            await reformatScripts(filePath);
        } else {
            console.log(`processing ${filePath}`);
            let content = (await fs.readFile(filePath)).toString();
            let matches = content.match(reg);
            if (matches != null) {
                await fs.writeFile(filePath, matches[1]);
            }
        }
    }
}

async function generateDocs(resources, targetFolder) {
    let documentationFolder = path.join(__dirname, documentationPath);
    try {
        await fs.rm(documentationFolder, { recursive: true });
    } catch { }
    await fs.mkdir(documentationFolder);

    for (let resource of resources) {
        console.log(`generating documentation for module (${resource.module})`);
        const moduleFolder = path.join(documentationFolder, resource.module);
        await fs.mkdir(moduleFolder);

        for (let source of resource.sources) {
            for(let file of source.files) {
                const fileName = file.path.replace(/^.*[\\\/]/, '');
                const sourceFile = path.join(targetFolder, resource.module, 'sources', file.folder, fileName);
                const outputFolder = path.join(moduleFolder, file.folder);

                await generateMD(sourceFile, outputFolder);
            }
        }
    }
}

async function generateMD(sourceFile, outputFolder) {
    console.log(`processing ${sourceFile}`);
    const fileName = sourceFile.replace(/^.*[\\\/]/, '');
    const templateData = jsdoc2md.getTemplateDataSync({ files: [sourceFile] });

    const fileGlobalFolder = path.join(outputFolder, 'Global');

    const classNames = templateData.reduce((classNames, identifier) => {
        if (identifier.kind === 'class') classNames.push(identifier.name)
        return classNames
    }, []);

    // ToDo: fix api docs (https://github.com/ONLYOFFICE/sdkjs-forms/blob/master/apiBuilder.js#L348), missing lines:
    ///**
    // * Base class.
    // * @global
    // * @class
    // * @name ApiDocument
    // */
    if (outputFolder.split('\\').pop() === 'form' && fileName === 'apiBuilder.js') {
        classNames.push('ApiDocument');
    }

    // ToDo: fix api docs (https://github.com/ONLYOFFICE/sdkjs-forms/blob/master/apiPlugins.js#L37), missing lines:
    ///**
    // * Base class.
    // * @global
    // * @class
    // * @name Api
    // */
    if (outputFolder.split('\\').pop() === 'form' && fileName === 'apiPlugins.js') {
        classNames.push('Api');
    }

    if (classNames.length > 0) {
        await fs.mkdir(outputFolder);
    }

    for (const className of classNames) {
        console.log(`generating md for ${fileName}->${className}`);
        var classFolder = path.join(outputFolder, className);
        const classMethodsFolder = path.join(classFolder, 'Methods');
        const classEventsFolder = path.join(classFolder, 'Events');

        const functionNames = templateData.reduce((functionNames, identifier) => {
            if (identifier.kind === 'function'
                && identifier.memberof === className
                && !identifier.name.startsWith('private_')) functionNames.push(identifier.name);
            return functionNames;
        }, []);

        if (functionNames.length > 0) {
            await fs.mkdir(classFolder);
            await fs.mkdir(classMethodsFolder);
        }

        for (const functionName of functionNames) {
            const template = `{{#function name="${functionName}" memberof="${className}"}}{{>docs}}{{/function}}`;
            const output = jsdoc2md.renderSync({ data: templateData, template: template });
            await fs.writeFile(path.join(classMethodsFolder, `${functionName}.md`), output);
        }

        const eventNames = templateData.reduce((eventNames, identifier) => {
            if (identifier.kind === 'event'&& identifier.memberof === className) eventNames.push(identifier.name);
            return eventNames;
        }, []);

        if (eventNames.length > 0) {
            try {
                await fs.mkdir(classFolder);
            } catch { }

            await fs.mkdir(classEventsFolder);
        }

        for (const eventName of eventNames) {
            const template = `{{#identifier name="${eventName}" memberof="${className}"}}{{>docs}}{{/identifier}}`;
            const output = jsdoc2md.renderSync({ data: templateData, template: template });
            await fs.writeFile(path.join(classEventsFolder, `${eventName}.md`), output);
        }
    }

    console.log(`generating md for ${fileName}->Global`);
    const globalTypeNames = templateData.reduce((globalTypeNames, identifier) => {
        if (identifier.scope === 'global' && identifier.kind === 'typedef') globalTypeNames.push(identifier.name);
        return globalTypeNames;
    }, []);

    if (globalTypeNames.length > 0) {
        await fs.mkdir(fileGlobalFolder);
    }

    for (const globalTypeName of globalTypeNames) {
        const template = `{{#globals name="${globalTypeName}"}}{{>docs}}{{/globals}}`;
        const output = jsdoc2md.renderSync({ data: templateData, template: template });
        await fs.writeFile(path.join(fileGlobalFolder, `${globalTypeName}.md`), output);
    }
}

async function execute(cmd) {
    return new Promise((resolve, reject) => {
        exec(cmd, (error, stdout) => {
            if (error) {
                reject(error);
            }
            resolve(stdout);
        });
    });
}