<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Planning</span>
</h1>

<p><b>Step 1</b>. Install all the necessary packages and programs</p>
<ul>
    <li>
        <p>ONLYOFFICE DocSpace on-premises.</p>
        <div class="list-buttons">
            <a class="button" href="https://www.onlyoffice.com/download-docspace.aspx?from=api#docspace-enterprise" target="_blank">Get ONLYOFFICE DocSpace</a>
        </div>
        <p>Both <a href="https://helpcenter.onlyoffice.com/installation/docspace-enterprise-index.aspx?from=api" target="_blank">Enterprise</a>
        and <a href="https://helpcenter.onlyoffice.com/installation/docspace-community-index.aspx?from=api" target="_blank">Community</a> versions are available.</p>
    </li>
    <li>
        <p><em>@onlyoffice/docspace-plugin-sdk</em> npm package</p>
        <p>To install the <em>@onlyoffice/docspace-plugin-sdk</em> npm package globally, use the following  command:</p>
        <pre>
npm i -g @onlyoffice/docspace-plugin-sdk
</pre>
    </li>
</ul>

<p><b>Step 2</b>. Design the way your plugin will work</p>
<ol>
    <li>
        <p>Choose the service that allows you to add the necessary functionality to your DocSpace.</p>
        <p>For example, in our plugin samples, we use:</p>
        <ul>
            <li><a href="https://www.assemblyai.com/" target="_blank">AssemblyAI</a> to convert speech from audio and video files into text;</li>
            <li><a href="https://www.convertapi.com/" target="_blank">ConvertAPI</a> to convert documents, spreadsheets, presentations, and forms into <em>pdf</em>;</li>
            <li><a href="https://www.drawio.com/" target="_blank">Draw.io</a> to create, edit, and insert professional-looking diagrams.</li>
        </ul>
        <note>Please make sure that the service documentation is available, check its license, availability of API methods, etc.
        For some services, the user must obtain an API key to start using the plugin.</note>
    </li>
    <li>
        <p>Think about where to implement the plugin, what the plugin's structure will be, how the user will interact with the plugin's components, etc.
        Make a list of the required plugin types and items depending on this information.
        For more information, read the <a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>">Plugin types</a>
        and <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>">Plugin items</a> sections of the Plugins SDK documentation.</p>
        <p>For example, for the <b>speech-to-text</b> plugin, we use the following plugin interfaces:</p>
        <ul>
            <li><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/plugin") %>">IPlugin</a>. Required for each plugin.
            It contains the plugin <a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/plugin") %>#status">status</a> (PluginStatus) variable,
            used to embed the plugin into the DocSpace.</li>
            <li><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/apiplugin") %>">IApiPlugin</a>. Required as we implement a third-party service.</li>
            <li><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/settingsplugin") %>">ISettingsPlugin</a>
            and <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/settings/ISettings.ts" target="_blank">ISettings</a>.
            Used to add settings block for plugin's configuration. The users will access this block from <b>Settings -&gt; Integration -&gt; Plugins</b> to adjust the plugin's parameters.</li>
            <li><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/contextmenuplugin") %>">IContextMenuPlugin</a>
            and <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/contextmenuitem") %>">IContextMenuItem</a>.
            Used to implement a context menu action. In the <b>speech-to-text</b> plugin, it will be available for video and audio files allowing users to convert content into text.</li>
        </ul>
        <p>The list of interfaces may be longer. For example, in the <b>draw.io</b> plugin:</p>
        <ul>
            <li><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/mainbuttonplugin") %>">IMainButtonPlugin</a>
            and <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/mainbuttonitem") %>">IMainButtonItem</a>.
            Used to implement the main button action. In the <b>draw.io</b> plugin, we use the <b>Action button -&gt; More</b> menu elements
            in the <b>My documents</b> section or in the selected room to create draw.io diagrams.</li>
            <li><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/fileplugin") %>">IFilePlugin</a>
            and <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/fileitem") %>">IFileItem</a>.
            Used to interact with the specified file types. In this case, with the <em>.drawio</em> files.</li>
        </ul>
    </li>
    <li>
        <p>Come up with the plugin's structure. All the required files are described <a href="<%= Url.Action("pluginssdk/structure") %>">here</a>.
        Everything else can be organized as you wish. For example, in the <b>draw.io</b> plugin, we put the code for each plugin type in separate folders,
        while in the <b>speech-to-text</b> plugin, this code is placed in the <em>src</em> folder.</p>
        <img alt="Speech plugin structure" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/docspace/speech-plugin-structure.png") %>" />
    </li>
    <li>Choose a name for your plugin and write a description for it.</li>
</ol>
