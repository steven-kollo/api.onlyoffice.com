<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ProfileMenuItem</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>"></a>
</h1>

<p class="dscr">Describes an item that will be embedded in the profile menu.</p>

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
            <td>"profile-menu-plugin"</td>
        </tr>
        <tr class="tablerow">
            <td id="label" class="copy-link">label</td>
            <td>Defines the item display name.</td>
            <td>string</td>
            <td>"Profile menu item"</td>
        </tr>
        <tr class="tablerow">
            <td id="icon" class="copy-link">icon</td>
            <td>Defines the item display icon. The icon image must be uploaded to the <em>assets</em> folder. Only the image name with the extension must be specified in this field.
            The required icon size is 16x16 px. Otherwise, it will be compressed to this size.</td>
            <td>string</td>
            <td>"logo.png"</td>
        </tr>
        <tr class="tablerow">
            <td id="onClick" class="copy-link">onClick</td>
            <td>Defines a function that takes the file/folder/room id as an argument. This function can be asynchronous.</td>
            <td>func</td>
            <td>() =&gt; {}</td>
        </tr>
        <tr class="tablerow">
            <td id="usersType" class="copy-link">usersType</td>
            <td>Defines the types of users who will see  the current item in the profile menu.
            Currently the following user types are available: <b>owner, docSpaceAdmin, roomAdmin, collaborator, user</b>.
            If this parameter is not specified, then the current profile menu item will be displayed for all user types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/UsersType.ts" target="_blank">UsersType</a></td>
            <td>[UsersType.owner, UsersType.docSpaceAdmin, UsersType.roomAdmin]</td>
        </tr>
        <tr class="tablerow">
            <td id="devices" class="copy-link">devices</td>
            <td>Defines the types of devices where the current item will be displayed in the profile menu.
                At the moment the following device types are available: <b>mobile, tablet, desktop</b>.
                If this parameter is not specified, then the current profile menu item will be displayed in any device types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Devices.ts" target="_blank">Devices</td>
            <td>[Devices.desktop]</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {IProfileMenuItem} from "@onlyoffice/docspace-plugin-sdk";

export const ProfileMenuItem: IProfileMenuItem = {
    "key": "profile-menu-plugin",
    "label": "Profile menu item",
    "icon": "logo.jpg",
    "onClick": () => {},
};
</pre>
