<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingplugins/") %>"></a>
    <span class="hdr">ONLYOFFICE Docs on-premises</span>
</h1>
<p>There are two ways to add the plugins to <b>ONLYOFFICE Docs on-premises</b>:</p>
    <ol>
        <li>
            <p>Put the folder with the plugin code to the ONLYOFFICE Docs folder depending on the operating system:</p>
        <ul style="list-style: none;">
            <li>For Linux - <em>/var/www/onlyoffice/documentserver/sdkjs-plugins/</em></li>
            <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\sdkjs-plugins\</em></li>
        </ul>
    <p>The plugins will be available to all the users of ONLYOFFICE Docs on-premises. 
        <a href="https://nodejs.org/docs/latest/api/fs.html#fs_availability" target="_blank">In some cases</a>, service restart is required.</p>
    <p>For debugging, start the document server together with the shared <em>sdkjs-plugins</em> folder:</p>
    <pre>
docker run -itd -p 80:80 -v /absolutly_path_to_work_dir:/var/www/onlyoffice/documentserver/sdkjs-plugins/plugin onlyoffice/documentserver-ie:latest
</pre>
        </li>
        <li>
            <p>Edit the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs config</a> by adding the relative path 
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
            <p>Please note that in the <em>index.html</em> file there is always a default link 
                to the <a href="https://raw.githubusercontent.com/ONLYOFFICE/sdkjs-plugins/feature/desktop_build/pluginBase.js" target="_blank">pluginBase.js</a> file 
                which is not usually added to the plugin. That is why, in this case of installing a plugin you need to add it directly to the plugin folder.</p>
        </li>
    </ol>
    
    <note>If the plugins placed into the folder and the plugins specified in the config coincide, the latter will be used.</note>
    <p>See the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs API</a> documentation for more information on where to find the config 
        and what and how can be changed there.</p>

    <br />
    <p>You can upload the plugin to the <b>S3</b> or <b>Nginx</b> servers. To do it, you need to allow cross-domain requests from the address of your document server. 
            Or you can let everyone use your plugin:</p>
        <pre>
add_header 'Access-Control-Allow-Origin' '*';  
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
</pre>
