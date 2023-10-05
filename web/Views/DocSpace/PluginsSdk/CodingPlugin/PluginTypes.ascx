<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Plugin types</span>
</h1>

<p class="dscr">
    The following plugin types can be distinguished:
</p>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Type</td>
            <td>Interface</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/plugin") %>">Plugin</a></td>
            <td>IPlugin</td>
            <td>The default plugin.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/settingsplugin") %>">SettingsPlugin</a></td>
            <td>ISettingsPlugin</td>
            <td>The plugin that manages settings for the administrator or owner.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/apiplugin") %>">APIPlugin</a></td>
            <td>IApiPlugin</td>
            <td>The plugin that is provided with the origin, proxy, and prefix to make requests to the portal server.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/contextmenuplugin") %>">ContextMenuPlugin</a></td>
            <td>IContextMenuPlugin</td>
            <td>The plugin that is embedded in the context menu of files, folders, rooms, images, video (audio).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/infopanelplugin") %>">InfoPanelPlugin</a></td>
            <td>IInfoPanelPlugin</td>
            <td>The plugin that is embedded as a separate tab in the file info panel.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/mainbuttonplugin") %>">MainButtonPlugin</a></td>
            <td>IMainButtonPlugin</td>
            <td>The plugin that is embedded in the main button.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/profilemenuplugin") %>">ProfileMenuPlugin</a></td>
            <td>IProfileMenuPlugin</td>
            <td>The plugin that is embedded in the profile menu.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/eventlistenerplugin") %>">EventListenerPlugin</a></td>
            <td>IEventListenerPlugin</td>
            <td>The plugin that is given the access to the portal events.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/fileplugin") %>">FilePlugin</a></td>
            <td>IFilePlugin</td>
            <td>The plugin that can interact with the file list.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
