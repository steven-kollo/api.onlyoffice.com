<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Plugin items</span>
</h1>

<p class="dscr">
    Each plugin type has the specific plugin items that are described in this section:
</p>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/contextmenuitem") %>">ContextMenuItem</a></td>
            <td>Describes an item that will be embedded in the <b>Actions</b> item of the file context menu.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/infopanelitem") %>">InfoPanelItem</a></td>
            <td>Describes an item that will be embedded in the file info panel as a separate tab.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/mainbuttonitem") %>">MainButtonItem</a></td>
            <td>Describes an item that will be embedded in the <b>More</b> item of the main button menu. It is available only inside a room (folder) and is not available for the room list.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/profilemenuitem") %>">ProfileMenuItem</a></td>
            <td>Describes an item that will be embedded in the profile menu.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/fileitem") %>">FileItem</a></td>
            <td>Describes an item that allows the plugin to control clicking on the specified file type. It does not work with the files that already have some actions.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/eventlisteneritem") %>">EventListenerItem</a></td>
            <td>Describes an item that allows the plugin to respond to the built-in DocSpace events (creating a room/file, etc.).
                Each event can have several listeners. When the event is activated, the dialog cannot be hooked.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
