<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("installation/") %>"></a>
    <span class="hdr">Adding plugins to ONLYOFFICE Cloud</span>
</h1>
<p>You can add a plugin to the <b>Cloud service</b> as a <b>Chrome extension</b>.</p>

<ol>
    <li>Create a main folder on your computer and put <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/chrome_extension_example/manifest.json" target="_blank">manifest.json</a> 
    and <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/chrome_extension_example/main.js" target="_blank">main.js</a> extension files.</li>
    <li>Create a subfolder with the plugin files.</li>
    <li>
        <p>In the <em>main.js</em> file, change the directory to the necessary plugin:</p>
        <pre>
(function(window, undefined){
    if ("frameEditor" == window.name)
    {
        var _url = chrome.extension.getURL("main.js");
        _url = _url.substr(0, _url.lastIndexOf("main.js"));
        var _baseUrl = _url + "helloworld/";
        var _configUrl = _baseUrl + "config.json";
        ...
    }
})(window, undefined);
</pre>
    </li>
    <li>
        <p>Change the plugin name and description, the paths to the plugin icons and all the necessary plugin resources in the <em>manifest.json</em> file:</p>
        <pre>
{
    "name": "Asc.helloworld",
    "description": "Plugin for ONLYOFFICE. helloworld",
    "version": "1.0",
    "manifest_version": 2,
    "background": {
    },
    "browser_action": {
        "default_icon": {
            "19": "/helloworld/resources/img/icon.png",
            "38": "/helloworld/resources/img/icon@2x.png"
        }
    },
    "web_accessible_resources": [
        "/main.js",
        "/helloworld/scripts/helloworld.js",
        "/helloworld/config.json",
        "/helloworld/resources/img/icon.png",
        "/helloworld/resources/img/icon@2x.png",
        "/helloworld/index.html",
        "/helloworld/index_about.html"
    ],
    ...
}
</pre>
    </li>
    <li>
        <p>Launch your Chrome browser and go to <em>chrome://extensions/</em>. Turn on the <b>Developer mode</b>, 
        click the <b>Load unpacked</b> button and select the created main extension folder:</p>
        <img alt="Extension folder" src="<%= Url.Content("~/content/img/plugins/extension_folder.png") %>" />
        <p>The new extension is now available in your browser:</p>
        <img alt="Extension" src="<%= Url.Content("~/content/img/plugins/extension_example.png") %>" />
    </li>
    <li>
        <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
        <img alt="Hello world extension" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
</ol>



<h2 id="remove" class="copy-link">Removing plugins from ONLYOFFICE Cloud</h2>

<p>Click the <b>Remove</b> button on the extension tab and in the opened window confirm your action:</p>
<img alt="Remove extension" src="<%= Url.Content("~/content/img/plugins/remove-extension.png") %>" />
<p>The plugin will be removed from ONLYOFFICE Cloud after its start.</p>
