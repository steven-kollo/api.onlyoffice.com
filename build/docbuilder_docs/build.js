const http = require('https');
const fs = require('fs/promises');
const path = require('path');
const { exec } = require("child_process");
const jsdoc2md = require('jsdoc-to-markdown');

const baseUrl = "https://raw.githubusercontent.com/ONLYOFFICE"
const inputPath = "sdkjs";
const outPath = "jsdoc";
const downloadFiles = true;
const parseDocs = true;

const files = {
    "sdkjs/master": {
        "word.js": "word/apiBuilder.js",
        "cell.js": "cell/apiBuilder.js",
        "slide.js": "slide/apiBuilder.js",
        "wordPluginMethods.js": "word/api_plugins.js",
        "cellPluginMethods.js": "cell/api_plugins.js",
        "slidePluginMethods.js": "slide/api_plugins.js",
        "sharedPluginMethods.js": "common/apiBase_plugins.js",
        "pluginBase.js": "common/plugins/plugin_base_api.js"
    },
    "sdkjs-forms/master": {
        "form.js": "apiBuilder.js",
        "formPluginMethods.js": "apiPlugins.js"
    }
};

(async () => {
    let inputFolder = path.join(__dirname, inputPath);

    if (downloadFiles) {
        try {
            await fs.rm(inputFolder, { recursive: true });
        } catch { }

        await fs.mkdir(inputFolder);

        console.log("downloading files..");
        for (let repo in files) {
            for (let file in files[repo]) {
                console.log(`downloading ${repo}/${files[repo][file]} -> ${file}`);
                await downloadFile(`${baseUrl}/${repo}/${files[repo][file]}`, path.join(inputFolder, file));
            }
        }
    }

    if (parseDocs) {
        let tmpFolder = path.join(__dirname, "tmp");
        let jsdocFolder = path.join(__dirname, outPath);

        try {
            await fs.rm(tmpFolder, { recursive: true });
            await fs.rm(jsdocFolder, { recursive: true });
        } catch { }

        await fs.cp(inputFolder, tmpFolder, { recursive: true });

        console.log("removing anonymous functions..");
        await reformatScripts(tmpFolder);

        console.log("generating docs..");
        await generateJsDocs(jsdocFolder);
    }

})();

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

    let files = await fs.readdir(folder);

    for (let file of files) {
        console.log(`processing ${file}`);
        let filePath = path.join(folder, file);
        let content = (await fs.readFile(filePath)).toString();
        let matches = content.match(reg);
        if (matches != null) {
           await fs.writeFile(filePath, matches[1]);
        }
    }
}

async function generateJsDocs(outputFolder) {
    let tmpFolder = path.join(__dirname, "tmp");

    await fs.mkdir(outputFolder);

    let files = await fs.readdir(tmpFolder);
    for (let file of files) {
        console.log(`processing ${file}`);
        const templateData = jsdoc2md.getTemplateDataSync({ files: [`tmp/${file}`] });
        const fileFolder = path.join(outputFolder, file.slice(0, file.lastIndexOf(".")));

        const classNames = templateData.reduce((classNames, identifier) => {
            if (identifier.kind === 'class') classNames.push(identifier.name)
            return classNames
        }, []);

        if (classNames.length > 0) {
            await fs.mkdir(fileFolder);
        }

        for (const className of classNames) {
            console.log(`generating md for ${file}->${className}`);
            var classFolder = path.join(fileFolder, className);

            const functionNames = templateData.reduce((functionNames, identifier) => {
                if ((identifier.kind === 'function' || identifier.kind === 'member')
                    && identifier.memberof === className
                    && !identifier.name.startsWith('private_')) functionNames.push(identifier.name)
                return functionNames
            }, []);

            if (functionNames.length > 0) {
                await fs.mkdir(classFolder);
            }

            for (const functionName of functionNames) {
                const template = `{{#function name="${functionName}"}}{{>docs}}{{/function}}`;
                const output = jsdoc2md.renderSync({ data: templateData, template: template });
                await fs.writeFile(path.join(classFolder, `${functionName}.md`), output);
            }
        }
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