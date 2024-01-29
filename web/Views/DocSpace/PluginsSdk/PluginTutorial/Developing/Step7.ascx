<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Step 7. Add plugin icons</span>
</h1>

<p>Create the <a href="https://github.com/ONLYOFFICE/docspace-plugins/tree/master/speech-to-text/assets" target="_blank">assets</a> folder in the root plugin folder and add there all the plugin icons.
    The number of icons and their sizes will depend on the plugin types you implement.
    For the <b>speech-to-text</b> plugin, we need the following icons:</p>
<ul>
    <li>
        <p>The default plugin type requires a <a href="<%= Url.Action("pluginssdk/config") %>#image">logo</a> image.
            It is equal to the <em>logo</em> parameter from the <em>package.json</em> file.
            The logo will be displayed in the DocSpace plugin settings.
            The required icon size is 48x48 px. Otherwise, it will be compressed to this size.</p>
        <img alt="Plugin logo" class="screenshot max-width-300" src="<%= Url.Content("~/content/img/docspace/plugin-logo.png") %>" />
    </li>
    <li>
        <p>The context menu plugin uses an <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/contextmenuitem") %>#icon">icon</a> on the <b>Convert to text</b> button.
            The required icon size is 16x16 px. Otherwise, it will be compressed to this size.</p>
        <img alt="Convert to text" class="screenshot" src="<%= Url.Content("~/content/img/docspace/convert-to-text.png") %>" />
        <p>This icon can be also used for the main button icon.
            For example, in the <b>draw.io</b> plugin, the same icon is used for the context and main button menu.</p>
        <img alt="Main button icon" class="screenshot" src="<%= Url.Content("~/content/img/docspace/main-button-icon.png") %>" />
        <p>The <b>draw.io</b> plugin also uses the specific file icon near the <em>.drawio</em> files, which are created with the file plugin type.
            The preferred icon size for the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/fileitem") %>#fileRowIcon">table format</a> is 32x32 px.</p>
        <img alt="File icon" class="screenshot" src="<%= Url.Content("~/content/img/docspace/file-icon.png") %>" />
        <p>In this plugin, the same file icon is also used for the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/fileitem") %>#fileTileIcon">tile view</a>.
            But it is recommended to add another icon of the 96x96 px size in this case.</p>
        <img alt="File icon tile" class="screenshot" src="<%= Url.Content("~/content/img/docspace/file-icon-tile.png") %>" />
    </li>
</ul>
