<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingplugins/") %>"></a>
    <span class="hdr">ONLYOFFICE Desktop Editors</span>
</h1>
<p>There are two ways to add the plugins to <b>ONLYOFFICE Desktop Editors</b>:</p>

    <p><b>Through the plugin manager</b></p>
    <ol>
        <li>
            <p>Take all the <a href="<%= Url.Action("structure") %>">plugin files</a>, archive them and change the file extension to <em>.plugin</em>.</p>
            <note>After downloading a plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins" target="_blank">GitHub</a>, 
                you need to unpack the plugin folder first and only then archive its elements.</note>
        </li>
        <li>
            <p>Click the <b>Settings</b> button on the <b>Plugins</b> tab. The plugin settings window will be opened:</p>
            <img alt="Plugin settings" src="<%= Url.Content("~/content/img/plugins/plugin-settings.png") %>" />
        </li>
        <li>
            <p>Use the <b>Add plugin</b> button to load your created plugin:</p>
            <img alt="Adding plugin" src="<%= Url.Content("~/content/img/plugins/adding-plugins.png") %>" />
        </li>
    </ol>
    <p>The plugin will be added immediately to the opened editors and all the editors you will open afterwords. Now you can see the plugin icon on the <b>Plugins</b> tab.</p>
    <img alt="Plugins tab" src="<%= Url.Content("~/content/img/plugins/plugins-tab.png") %>" />

    <p></p>
    <br />
    <p><b>Through the plugin folder</b></p>
    <ol>
        <li>
            <p>Create a new folder in the <em>sdkjs-plugins</em> directory. The path to this folder depends on your operating system:</p>
            <ul style="list-style: none;">
                <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
                <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\sdkjs-plugins\</em></li>
            </ul>
        </li>
        <li>
            <p>Use a plugin <b>GUID</b> as a name. You can find the plugin GUID in the <em>config.json</em> file.</p>
            <p>For example, for the <b>Extended comments</b> plugin the <em>guid</em> parameter will look the following way:</p>
            <pre>
{
    "name" : "Extended comments",
    "guid" : "asc.{91EAC419-EF8B-440C-A960-B451C7DF3A37}",
    ...
}
</pre>
        <p>So, the folder name of this plugin is <em>{91EAC419-EF8B-440C-A960-B451C7DF3A37}</em>.</p>
        </li>
        <li>
            <p>Put all the plugin files to this folder:</p>
            <img alt="Plugin folder" src="<%= Url.Content("~/content/img/plugins/plugins-folder.png") %>" />
        </li>
        <li>
            <p>Start ONLYOFFICE Desktop Editors. If everything is done correctly, the plugin will be displayed within the <b>Plugins</b> tab:</p>
            <img alt="Extended comments" src="<%= Url.Content("~/content/img/plugins/extended-comments.png") %>" />
        </li>
    </ol>
    