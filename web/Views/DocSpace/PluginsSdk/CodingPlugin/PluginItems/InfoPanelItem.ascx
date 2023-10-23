<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">InfoPanelItem</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>"></a>
</h1>

<p class="dscr">Describes an item that will be embedded in the file info panel as a separate tab.</p>

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
            <td>"test-info-panel"</td>
        </tr>
        <tr class="tablerow">
            <td id="submenu" class="copy-link">submenu</td>
            <td>Defines the item submenu. This object contains two parameters:
                <ul>
                    <li>
                        <b>name</b> - the tab display name,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Test";
                    </li>
                    <li>
                        <b>onClick</b> - a function that takes the file/folder/room id as an argument. This function can be asynchronous. It will be executed when clicking on the tab,
                        <br />
                        <b>type</b>: func,
                        <br />
                        <b>example</b>: () => {}.
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
                "name": "Test",
                "onClick": () => {}
            }
            </td>
        </tr>
        <tr class="tablerow">
            <td id="body" class="copy-link">body</td>
            <td>Defines the tab UI of the info panel.</td>
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/box") %>">IBox</a></td>
            <td>parentBox</td>
        </tr>
        <tr class="tablerow">
            <td id="onLoad" class="copy-link">onLoad</td>
            <td>Defines a function that is executed after opening a tab. It returns a new <em>body</em>.
            If this functionality is not needed, the old <em>body</em> value is returned.</td>
            <td>func</td>
            <td>() =&gt; {}</td>
        </tr>
        <tr class="tablerow">
            <td id="fileExt" class="copy-link">fileExt</td>
            <td>Defines the extensions of files where the current item will be displayed in the info panel.
                It only works if the <em>FilesType.Files</em> is specified in the <em>fileType</em> parameter.
                If this parameter is not specified, then the current  info panel item will be displayed in any file extension.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Files.ts" target="_blank">FilesExst</a>/string</td>
            <td>[FilesExst.docx, FilesExst.xlsx]</td>
        </tr>
        <tr class="tablerow">
            <td id="fileType" class="copy-link">fileType</td>
            <td>Defines the types of files where the current item will be displayed in the  info panel.
                Presently the following file types are available: <b>room, file, folder, image, video</b>.
                If this parameter is not specified, then the current  info panel item will be displayed in any file type.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Files.ts" target="_blank">FilesType</a></td>
            <td>[FilesType.room, FilesType.file]</td>
        </tr>
        <tr class="tablerow">
            <td id="usersType" class="copy-link">usersType</td>
            <td>Defines the types of users who will see the current item in the info panel.
            Currently the following user types are available: <b>owner, docSpaceAdmin, roomAdmin, collaborator, user</b>.
            If this parameter is not specified, then the current  info panel item will be displayed for all user types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/UsersType.ts" target="_blank">UsersType</a></td>
            <td>[UsersType.owner, UsersType.docSpaceAdmin, UsersType.roomAdmin]</td>
        </tr>
        <tr class="tablerow">
            <td id="devices" class="copy-link">devices</td>
            <td>Defines the types of devices where the current item will be displayed in the info panel.
                At the moment the following device types are available: <b>mobile, tablet, desktop</b>.
                If this parameter is not specified, then the current  info panel item will be displayed in any device types.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Devices.ts" target="_blank">Devices</td>
            <td>[Devices.desktop]</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {IInfoPanelItem, IBox, IComponent, IInfoPanelSubMenu, FilesExst, FilesType} from "@onlyoffice/docspace-plugin-sdk";

import {headerBox} from "./Header";
import {checkboxBox} from "./Checkbox";
import {textAreaGroupBox} from "./TextArea";
import {inputGroupBox} from "./Input";
import {buttonBox} from "./Button";
import {toggleButtonBox} from "./ToggleButton";

const parentBoxChildren: IComponent[] = [headerBox, checkboxBox, textAreaGroupBox, inputGroupBox, toggleButtonBox, buttonBox];

const parentBox: IBox = {
    "widthProp": "100%",
    "heightProp": "auto",
    "marginProp": "0",
    "displayProp": "flex",
    "paddingProp": "0",
    "flexDirection": "column",
    "children": parentBoxChildren
};

const infoPanelSubMenu: IInfoPanelSubMenu = {
    "name": "Test",
    "onClick": () =&gt; { },
};

export const InfoPanelItem: IInfoPanelItem = {
    "key": "test-info-panel",
    "subMenu": infoPanelSubMenu,
    "body": parentBox,
    "filesExsts": [FilesExst.docx, FilesExst.xlsx],
    "filesType": [FilesType.room, FilesType.file]
};
</pre>
