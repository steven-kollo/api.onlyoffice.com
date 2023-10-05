<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">FileItem</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>"></a>
</h1>

<p class="dscr">Describes an item that allows the plugin to control clicking on the specified file type. It does not work with the files that already have some actions.</p>

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
            <td id="extension" class="copy-link">extension</td>
            <td>Defines the file extension. If several plugins have the same extension, the last plugin from this list is taken.</td>
            <td>string</td>
            <td>".drawio"</td>
        </tr>
        <tr class="tablerow">
            <td id="onClick" class="copy-link">onClick</td>
            <td>Defines a function that takes the <em>File</em> object with the file data as an argument. This function can be asynchronous.
                It will be executed when the user clicks on a file with the required extension.</td>
            <td>func</td>
            <td>async (item: File) =&gt; {}</td>
        </tr>
        <tr class="tablerow">
            <td id="usersType" class="copy-link">usersType</td>
            <td>Defines the types of users who have the access to the current item.
            Now the following user types are available: <b>owner, docSpaceAdmin, roomAdmin, collaborator, user</b>.
            If this parameter is not specified, then the current item will be available for all user types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/UsersType.ts" target="_blank">UsersType</a></td>
            <td>[UsersType.owner, UsersType.docSpaceAdmin, UsersType.roomAdmin]</td>
        </tr>
        <tr class="tablerow">
            <td id="devices" class="copy-link">devices</td>
            <td>Defines the types of devices where the current item will be available.
                Now the following device types are available: <b>mobile, tablet, desktop</b>.
                If this parameter is not specified, then the current item will be available in any device types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/Devices.ts" target="_blank">Devices</td>
            <td>[Devices.desktop]</td>
        </tr>
        <tr class="tablerow">
            <td id="fileTypeName" class="copy-link">fileTypeName</td>
            <td>Defines a file type which is displayed in the list (for example, Document/Folder).</td>
            <td>string</td>
            <td>"Diagram"</td>
        </tr>
        <tr class="tablerow">
            <td id="fileIcon" class="copy-link">fileIcon</td>
            <td>Defines a file icon which is displayed in the list.</td>
            <td>string</td>
            <td>"drawio-32.svg"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {IFileItem, File} from "@onlyoffice/docspace-plugin-sdk";

export const drawIoItem: IFileItem = {
    "extension": ".drawio",
    "fileTypeName": "Diagram",
    "fileIcon": "drawio-32.svg",
    "onClick": async (item: File) =&gt; {},
};
</pre>
