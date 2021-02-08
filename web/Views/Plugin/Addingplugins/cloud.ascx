<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingplugins/") %>"></a>
    <span class="hdr">ONLYOFFICE Cloud</span>
</h1>
<p>You can add a plugin to the <b>Cloud service</b> as a Chrome extension:</p>
    <ol>
        <li>Create a main folder on your computer and put there 
            <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/chrome_extension_example/manifest.json" target="_blank">manifest.json</a> 
            and <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/chrome_extension_example/main.js" target="_blank">main.js</a> extension files. 
            You also need to add <a href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.js" target="_blank">plugin.js</a> 
            and <a href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css" target="_blank">plugin.css</a> files to this folder 
            if they are necessary for your plugin to work correctly.</li>
        <li>Create a subfolder with the plugin files and name it as the future extension.</li>
        <li>
            <p>Launch your Chrome browser and go to <em>chrome://extensions/</em>. Turn on the <b>Developer mode</b> and click the <b>Load unpacked</b> button.</p>
            <p>Select the created main extension folder:</p>
            <img alt="Extension folder" src="<%= Url.Content("~/content/img/plugins/extension-folder.png") %>" />
            <p>The new extension is now available in your browser:</p>
            <img alt="Extension" src="<%= Url.Content("~/content/img/plugins/extension.png") %>" />
        </li>
        <li>
            <p>Launch your ONLYOFFICE and open any document to check if the new plugin is available in the editors:</p>
            <img alt="Hello world" src="<%= Url.Content("~/content/img/plugins/hello-world.png") %>" />
        </li>
    </ol>
