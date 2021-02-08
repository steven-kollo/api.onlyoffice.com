<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingplugins/") %>"></a>
    <span class="hdr">Uninstalling plugins</span>
</h1>
<p><b>For desktop editors</b></p>

    <p>You can uninstall plugins in two ways:</p>
    <ol>
        <li>
            <p>Open the <b>Plugins</b> tab, go to the plugin <b>Settings</b> and click the <b>Remove</b> button 
            <img alt="Remove plugin button" src="<%= Url.Content("~/content/img/plugins/remove-plugin-button.png") %>" /> near the necessary plugin.</p>
            <note>This option is not available for the default plugins and the plugins added via plugins folder.</note>
        </li>
        <li>
            <p>Go to the <em>sdkjs-plugins</em> folder and remove the necessary plugin folder from this directory.</p>
            <p>In this way you can remove default plugins from the desktop editors. 
                For example, to uninstall the <b>Translator</b> plugin, you need to remove <em>{7327FC95-16DA-41D9-9AF2-0E7F449F6800}</em> folder.</p>
            <p>A table below contains default plugins guids to make it easier for you to find them:</p>
            <h2>Default plugins guid&#8217;s</h2>
            <table class="try-now-table">
                <tbody>
                    <tr>
                        <td>Highlight code</td>
                        <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}</td>
                    </tr>
                    <tr>
                        <td>Mendeley</td>
                        <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9441}</td>
                    </tr>
                    <tr>
                        <td>OCR</td>
                        <td>{440EBF13-9B19-4BD8-8621-05200E58140B}</td>
                    </tr>
                    <tr>
                        <td>Photo editor</td>
                        <td>{07FD8DFA-DFE0-4089-AL24-0730933CC80A}</td>
                    </tr>
                    <tr>
                        <td>Speech</td>
                        <td>{D71C2EF0-F15B-47C7-80E9-86D671F9C595}</td>
                    </tr>
                    <tr>
                        <td>Thesaurus</td>
                        <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9840}</td>
                    </tr>
                    <tr>
                        <td>Translator</td>
                        <td>{7327FC95-16DA-41D9-9AF2-0E7F449F6800}</td>
                    </tr>
                    <tr>
                        <td>YouTube</td>
                        <td>{38E022EA-AD92-45FC-B22B-49DF39746DB4}</td>
                    </tr>
                    <tr>
                        <td>Zotero</td>
                        <td>{BFC5D5C6-89DE-4168-9565-ABD8D1E48711}</td>
                    </tr>
                    <tr>
                        <td>Send</td>
                        <td>{B509123E-6335-40BD-B965-91EB799346E3}</td>
                    </tr>
                </tbody>
            </table>
            <note>Please note that after app updating the default plugins will appear again and you will need to uninstall them one more time.</note>
        </li>
    </ol>

    <br />
    <p><b>For ONLYOFFICE Docs on-premises</b></p>
    <p>You can uninstall plugins in two ways:</p>
    <ol>
        <li>
            <p>Edit the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs config</a> to remove the lines according to the plugin. 
                The plugin will become unavailable for all the portal users at the editors next start:</p>
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
        </li>
        <li>
            <p>Go to the <em>sdkjs-plugins</em> folder and remove the necessary plugin folder from this directory. 
            For example, remove <em>translator</em> folder, to uninstall <b>Translator</b> plugin.</p>
            <p>The plugins will be removed for all the users of ONLYOFFICE Docs. 
                <a href="https://nodejs.org/docs/latest/api/fs.html#fs_availability" target="_blank">In some cases</a>, service restart is required.</p>
        </li>
    </ol>

    <br />
    <p><b>For cloud service</b></p>
    <p>Click the <b>Remove</b> button on the extension tab. The plugin will be removed from the ONLYOFFICE editor after its start.</p>
    