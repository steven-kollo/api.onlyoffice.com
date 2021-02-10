<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingplugins/") %>"></a>
    <span class="hdr">Adding plugins to ONLYOFFICE Docs on-premises</span>
</h1>
<p>There are two ways to add the plugins to <b>ONLYOFFICE Docs on-premises</b>:</p>

<p><b>Option 1.</b> Put the folder with the plugin code to the <b>ONLYOFFICE Docs</b> folder. The path to the folder depends on the operating system you use:</p>
<ul style="list-style: none;">
    <li>For Linux - <em>/var/www/onlyoffice/documentserver/sdkjs-plugins/</em></li>
    <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\sdkjs-plugins\</em></li>
</ul>
<p>The plugins will be available to all the users of <b>ONLYOFFICE Docs on-premises</b>. 
<a href="https://nodejs.org/docs/latest/api/fs.html#fs_availability" target="_blank">In some cases</a>, service restart is required.</p>
<p>For debugging, start ONLYOFFICE Docs together with the shared <em>sdkjs-plugins</em> folder:</p>
<pre>
docker run -itd -p 80:80 -v /absolutly_path_to_work_dir:/var/www/onlyoffice/documentserver/sdkjs-plugins/plugin onlyoffice/documentserver-ie:latest
</pre>

<p><b>Option 2.</b> Edit the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs config</a> adding the relative path 
    to the <em>config.json</em> file of the necessary plugin to the <em>plugins.pluginsData</em> parameter:</p>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
            "autostart": [
                "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                ...
            ],
            "pluginsData": [
                "https://example.com/plugin1/config.json",
                "https://example.com/plugin2/config.json",
                ...
            ]
        },
        ...
    },
    ...
});
</pre>
<p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed and the plugins are placed. 
    See the <a href="<%= Url.Action("howitworks", "editors") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.</p>
<p><em>https://example.com/plugin1/config.json</em> is the path to the plugin.</p>
<p>If there is already a test example in the config, replace the following line <em>/etc/onlyoffice/documentserver-example/local.json</em> 
    with the path to the necessary plugin config.</p>
<p>See the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs API</a> documentation for more information on where to find the config 
    and what and how can be changed there.</p>

<note>
    <p>Some known issues to pay attention to:</p>
    <ul>
        <li><p>In the <em>index.html</em> file there is always a default link to 
        the <a href="https://raw.githubusercontent.com/ONLYOFFICE/sdkjs-plugins/feature/desktop_build/pluginBase.js" target="_blank">pluginBase.js</a> file 
        which is not usually added to the plugin. This means that in this installation option you need to add it directly to the plugin folder.</p></li>
        <li><p>If the plugins placed into the folder and the plugins specified in the config coincide, the latter will be used.</p></li>
        <li>
            <p>If you want to upload the plugin to the S3 or Nginx servers, you need to allow cross-domain requests from the address of your document server. 
            Or you can just let everyone use your plugin:</p>
            <pre>
add_header 'Access-Control-Allow-Origin' '*';  
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
</pre>
        </li>
    </ul>
</note>


<h2>Removing plugins from ONLYOFFICE Docs on-premises</h2>

<p>You can uninstall plugins in two ways:</p>
<p><b>Option 1.</b> Edit the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs config</a> removing the corresponding plugin. 
The plugin will become unavailable for all portal users at the editor next start:</p>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
            "autostart": [
                <strike>"asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}"</strike>,
                "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                ...
            ],
            "pluginsData": [
                <strike>"https://example.com/plugin1/config.json"</strike>,
                "https://example.com/plugin2/config.json",
                ...
            ]
        },
        ...
    },
    ...
});                
</pre>
<p><b>Option 2.</b> Go to the <em>sdkjs-plugins</em> folder and remove the corresponding plugin folder from this directory.</p>
<p>The plugins will be removed for all the users. 
<a href="https://nodejs.org/docs/latest/api/fs.html#fs_availability" target="_blank">In some cases</a>, service restart is required.</p>
