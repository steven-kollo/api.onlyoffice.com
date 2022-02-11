<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("installation/") %>"></a>
    <span class="hdr">Adding plugins to ONLYOFFICE Cloud</span>
</h1>
<p>You can add a plugin to the <b>Cloud service</b> as an <b>extension</b>. It can be done for Google Chrome, Mozilla Firefox, Opera or, Microsoft Edge browsers.</p>

<h2 id="create-extensions" class="copy-link">Step 1. Creating extensions</h2>

<p>There are two ways to create extensions: through the special script or manually.</p>

<p><b>Option 1</b></p>
<ol>
    <li>Insert the <a href="https://github.com/ONLYOFFICE/onlyoffice-api-dev/blob/master/extensions/create_extension.py" target="_blank">script file</a> into the plugin folder.</li>
    <li>
        <p>Run the script. A folder with the <em>extension-dist</em> name will be created in the plugin folder.</p>
        <img alt="Extension dist" src="<%= Url.Content("~/content/img/plugins/extension-dist.png") %>" />
    </li>
</ol>

<p><b>Option 2</b></p>
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
</ol>


<h2 id="upload-extensions" class="copy-link">Step 2. Uploading extensions to the browser</h2>

<p>After your extension is ready, upload it to the browser. Follow the instructions below for the browser you use.</p>
<div class="container">
    <ul class="browser">
        <li class="browser tab active">Google Chrome</li>
        <li class="browser tab">Mozilla Firefox</li>
        <li class="browser tab">Opera</li>
        <li class="browser tab">Microsoft Edge</li>
    </ul>
    <div class="content active">
        <p><b>Installing extensions to Google Chrome</b></p>
        <ol>
            <li>Launch your Chrome browser and go to <em>chrome://extensions/</em>.</li>
            <li>
                <p>Turn on the <b>Developer mode</b> and click the <b>Load unpacked</b> button:</p>
                <img alt="Chrome developer mode" src="<%= Url.Content("~/content/img/plugins/chrome-developer-mode.png") %>" />
            </li>
            <li>
                <p>Select the created main extension folder:</p>
                <img alt="Chrome extension folder" src="<%= Url.Content("~/content/img/plugins/chrome-extension-folder.png") %>" />
            </li>
            <li>
                <p>The new extension is now available in your browser:</p>
                <img alt="Chrome extension" src="<%= Url.Content("~/content/img/plugins/chrome-extension.png") %>" />
            </li>
            <li>
                <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
                <img width="832px" alt="Hello world icon" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
            </li>
        </ol>
        <br />
        <p><b>Removing extensions from Google Chrome</b></p>
        <p>Click the <b>Remove</b> button on the extension tab and, in the opened window, confirm your action:</p>
        <img alt="Chrome removing extension" src="<%= Url.Content("~/content/img/plugins/chrome-removing-extension.png") %>" />
        <p>The plugin will be removed from ONLYOFFICE Cloud after page reload.</p>
    </div>
    <div class="content">
        <p><b>Installing extensions to Mozilla Firefox</b></p>
        <ol>
            <li>Launch your Mozilla browser and go to <em>about:debugging</em>.</li>
            <li>
                <p>Choose the <b>This Firefox</b> tab and click the <b>Load Temporary Add-on...</b> button:</p>
                <img alt="Mozilla extensions" src="<%= Url.Content("~/content/img/plugins/mozilla-extensions.png") %>" />
            </li>
            <li>
                <p>Select the <em>manifest.json</em> file in the extension folder:</p>
                <img alt="Manifest" src="<%= Url.Content("~/content/img/plugins/manifest.png") %>" />
            </li>
            <li>
                <p>The new extension is now available in your browser:</p>
                <img alt="Mozilla extension" src="<%= Url.Content("~/content/img/plugins/mozilla-extension.png") %>" />
            </li>
            <li>
                <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
                <img width="832px" valt="Hello world icon" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
            </li>
        </ol>
        <br />
        <p><b>Removing plugins from Mozilla Firefox</b></p>
        <p>Click the <b>Remove</b> button on the extension tab. The plugin will be removed from ONLYOFFICE Cloud after page reload.</p>
        <img alt="Mozilla removing extension" src="<%= Url.Content("~/content/img/plugins/mozilla-removing-extension.png") %>" />
    </div>
    <div class="content">
        <p><b>Installing extensions to Opera</b></p>
        <ol>
            <li>Launch your Opera browser.</li>
            <li>
                <p>Click the extensions icon in the top right corner of the browser window and, in the opened <b>Extensions</b> window, click <b>Manage extensions</b>:</p>
                <img alt="Opera extensions" src="<%= Url.Content("~/content/img/plugins/opera-extensions.png") %>" />
            </li>
            <li>
                <p>Turn on the <b>Developer mode</b> and click the <b>Load unpacked</b> button:</p>
                <img alt="Opera develoer mode" src="<%= Url.Content("~/content/img/plugins/opera-developer-mode.png") %>" />
            </li>
            <li>
                <p>Select the created main extension folder:</p>
                <img alt="Opera extension folder" src="<%= Url.Content("~/content/img/plugins/opera-extension-folder.png") %>" />
            </li>
            <li>
                <p>The new extension is now available in your browser:</p>
                <img alt="Opera extension" src="<%= Url.Content("~/content/img/plugins/opera-extension.png") %>" />
            </li>
            <li>
                <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
                <img width="832px" alt="Hello world icon" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
            </li>
        </ol>
        <br />
        <p><b>Removing plugins from Opera</b></p>
        <p>To remove the plugin from the <b>Plugins</b> tab in ONLYOFFICE editors, click the <b>Disable</b> button on the extension tab or turn off the switcher.
        You can enable the extension again at any time.</p>
        <img alt="Opera disabling extension" src="<%= Url.Content("~/content/img/plugins/opera-disabling-extension.png") %>" />
        <p>To remove the extension completely from the Opera browser:</p>
        <ol>
            <li>Click the extension tab.</li>
            <li>Click the <b>Remove extension</b> button at the bottom of the page.</li>
            <li>
                <p>In the opened window confirm your action:</p>
                <img alt="Opera removing extension" src="<%= Url.Content("~/content/img/plugins/opera-removing-extension.png") %>" />
            </li>
        </ol>
        <p>The plugin will be removed from ONLYOFFICE Cloud after page reload.</p>
    </div>
    <div class="content">
        <p><b>Installing extensions to Microsoft Edge</b></p>
        <ol>
            <li>Launch your Microsoft Edge browser and go to <em>edge://extensions/</em>.</li>
            <li>
                <p>Go to the <b>Extensions</b> tab, turn on the <b>Developer mode</b> and click the <b>Load unpacked</b> button:</p>
                <img alt="Edge developer mode" src="<%= Url.Content("~/content/img/plugins/edge-developer-mode.png") %>" />
            </li>
            <li>
                <p>Select the created main extension folder:</p>
                <img alt="Edge extension folder" src="<%= Url.Content("~/content/img/plugins/edge-extension-folder.png") %>" />
            </li>
            <li>
                <p>The new extension is now available in your browser:</p>
                <img alt="Edge extension" src="<%= Url.Content("~/content/img/plugins/edge-extension.png") %>" />
            </li>
            <li>
                <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
                <img width="832px" lt="Hello world icon" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
            </li>
        </ol>
        <br />
        <p><b>Removing plugins from Microsoft Edge</b></p>
        <p>To remove the plugin from the <b>Plugins</b> tab in ONLYOFFICE editors, disable it by turning off the switcher. You can enable the extension again at any time.</p>
        <p>To remove the extension completely from the Microsoft Edge browser, click the <b>Remove</b> button on the extension tab and, in the opened window, confirm your action:</p>
        <img alt="Edge removing extension" src="<%= Url.Content("~/content/img/plugins/edge-removing-extension.png") %>" />
        <p>The plugin will be removed from ONLYOFFICE Cloud after page reload.</p>
    </div>
</div>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">
    $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
        $(this)
          .addClass('active').siblings().removeClass('active')
          .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
    });
</script>
