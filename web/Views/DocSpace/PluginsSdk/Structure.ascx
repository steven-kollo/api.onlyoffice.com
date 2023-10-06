<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Plugin structure</span>
</h1>

<p class="dscr">
    Each DocSpace plugin is a folder with files. It must contain the following files required for the plugin to work:
</p>
<ul>
    <li><b>assets</b> - a folder for storing plugin images. Nesting is not supported. The following formats are curretly supported: <em>.jpg, .jpeg, .png, .svg</em>.</li>
    <li><b>dist</b> - a folder for storing the compiled plugin version.</li>
    <li><b>scripts</b> - a folder for storing script files for building the plugin.
    The <em>createZip.js</em> script is added to this folder. The script is executed when building the plugin to automatically archive it and create the <em>config.json</em> file.</li>
    <li><b>src</b> - a folder for the plugin source files.</li>
    <li>
        <p><b>src/index.ts</b> - the entry point for building the plugin. This file is required.
        All the necessary functionality is added to this file for the plugin to work in the specified scope.
        In this file, the plugin is declared in the <em>window.Plugins.[pluginName]</em> DocSpace scope,
        where <em>pluginName</em> must match the same parameter from the <em>package.json</em> file:</p>
        <pre>
window.Plugins.PDFConverter = plugin || {};
</pre>
    </li>
    <li>
        <p><b>webpack.config.js</b> - the webpack configuration file. This file can be edited but this is important that in the <em>output</em> parameter,
        the <em>fileName</em> field is equal to <em>plugin.js</em> and the <em>path</em> field is equal to <em>dist</em>:</p>
        <pre>
"output": {
    "filename": "plugin.js",
    "path": path.resolve(__dirname, "dist"),
}
</pre>
    </li>
    <li><b>tsconfig</b> - the <em>typescript</em> configuration file. This file can be edited.</li>
    <li><b>package.json</b> - a file with the information about the plugin and dependencies. This file can be edited and the new dependencies can be added.</li>
    <li><b>.prettierrc</b> - the configuration file for the <em>prettier</em> npm package. This file can be edited.</li>
</ul>
