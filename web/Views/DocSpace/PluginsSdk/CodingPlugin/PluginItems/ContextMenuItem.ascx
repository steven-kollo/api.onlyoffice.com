<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ContextMenuItem</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>"></a>
</h1>

<p class="dscr">Describes an item that will be embedded in the <b>Actions</b> item of the file context menu.</p>
<img alt="ContextMenuItem" class="screenshot" src="<%= Url.Content("~/content/img/docspace/context-menu-plugin.png") %>" />

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="key" class="copy-link">key</td>
            <td>Defines the unique item identifier used by the service to recognize the item.</td>
            <td>string</td>
            <td>"convert-file-item"</td>
        </tr>
        <tr class="tablerow">
            <td id="label" class="copy-link">label</td>
            <td>Defines the item display name.</td>
            <td>string</td>
            <td>"Convert to PDF"</td>
        </tr>
        <tr class="tablerow">
            <td id="icon" class="copy-link">icon</td>
            <td>Defines the item display icon. The icon image must be uploaded to the <em>assets</em> folder. Only the image name with the extension must be specified in this field.
            The required icon size is 16x16 px. Otherwise, it will be compressed to this size.</td>
            <td>string</td>
            <td>"convert-16.png"</td>
        </tr>
        <tr class="tablerow">
            <td id="onClick" class="copy-link">onClick</td>
            <td>Defines a function that takes the file/folder/room id as an argument. This function can be asynchronous.</td>
            <td>func</td>
            <td>(id: number) =&gt; {}</td>
        </tr>
        <tr class="tablerow">
            <td id="fileExt" class="copy-link">fileExt</td>
            <td>Defines the extensions of files where the current item will be displayed in the context menu.
                It only works if the <em>FilesType.Files</em> is specified in the <em>fileType</em> parameter.
                If this parameter is not specified, then the current context menu item will be displayed in any file extension.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/Files.ts" target="_blank">FilesExst</a>/string</td>
            <td>[FilesExst.docx, FilesExst.xlsx]</td>
        </tr>
        <tr class="tablerow">
            <td id="fileType" class="copy-link">fileType</td>
            <td>Defines the types of files where the current item will be displayed in the context menu.
                Presently the following file types are available: <b>room, file, folder, image, video</b>.
                If this parameter is not specified, then the current context menu item will be displayed in any file type.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/Files.ts" target="_blank">FilesType</a></td>
            <td>[FilesType.file]</td>
        </tr>
        <tr class="tablerow">
            <td id="usersType" class="copy-link">usersType</td>
            <td>Defines the types of users who will see the current item in the context menu.
            Currently the following user types are available: <b>owner, docSpaceAdmin, roomAdmin, collaborator, user</b>.
            If this parameter is not specified, then the current context menu item will be displayed for all user types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/UsersType.ts" target="_blank">UsersType</a></td>
            <td>[UsersType.owner, UsersType.docSpaceAdmin, UsersType.roomAdmin]</td>
        </tr>
        <tr class="tablerow">
            <td id="devices" class="copy-link">devices</td>
            <td>Defines the types of devices where the current item will be displayed in the info panel.
                At the moment the following device types are available: <b>mobile, tablet, desktop</b>.
                If this parameter is not specified, then the current context menu item will be displayed in any device types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/Devices.ts" target="_blank">Devices</td>
            <td>[Devices.desktop]</td>
        </tr>
        <tr class="tablerow">
            <td id="withActiveItem" class="copy-link">withActiveItem</td>
            <td>Specifies whether to add the action state to the item in the file list when the <a href="#onClick">onClick</a> event is triggered.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {FilesType, IContextMenuItem, UsersType} from "@onlyoffice/docspace-plugin-sdk";

export const convertFileItem: IContextMenuItem = {
    "key": "convert-file-item",
    "label": "Convert to PDF",
    "icon": "convert-16.png",
    "onClick": (id: number) =&gt; {},
    "fileType": [FilesType.file],
    "usersTypes": [UsersType.owner, UsersType.docSpaceAdmin, UsersType.roomAdmin]
};
</pre>
