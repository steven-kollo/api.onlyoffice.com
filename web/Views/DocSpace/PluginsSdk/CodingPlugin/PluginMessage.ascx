<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Plugin message</span>
</h1>

<p class="dscr">
    Each item which interacts with a user (onClick, onChange, onSelect, etc.) can return a message that is represented as the <em>IMessage</em> object with the following parameters:
</p>

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
            <td id="actions" class="copy-link">actions</td>
            <td>Defines a collection of <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>">events</a> that will be processed on the portal side.
                The specified actions will be performed depending on the set of values.</td>
            <td>array of <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Actions.ts" target="_blank">Actions</a></td>
            <td>[Actions.showToast, Actions.closeModal]</td>
        </tr>
        <tr class="tablerow">
            <td id="newProps" class="copy-link">newProps</td>
            <td>Defines the properties that update the state of the items which interact with the users.
                This parameter is used only with <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>#updateProps">Actions.updateProps</a>.</td>
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/input") %>">IInput</a>, <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/checkbox") %>">ICheckbox</a>,
            <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/togglebutton") %>">IToggleButton</a>, <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/button") %>">IButton</a>,
            <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/textarea") %>">ITextArea</a>, <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/combobox") %>">IComboBox</a></td>
            <td>{IInput}</td>
        </tr>
        <tr class="tablerow">
            <td id="toastProps" class="copy-link">toastProps</td>
            <td>Defines the properties that display a toast notification after the user actions.
                This parameter is used only with <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>#showToast">Actions.showToast</a>.</td>
            <td>array of <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/toast") %>">IToast</a></td>
            <td>[IToast]</td>
        </tr>
        <tr class="tablerow">
            <td id="contextProps" class="copy-link">contextProps</td>
            <td>
                Defines the properties that update the state of the parent or child item after the event was executed:
                <ul>
                    <li>
                        <b>name</b> - the item name,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "accept-button";
                    </li>
                    <li>
                        <b>props</b> - the new properties for the parent or child item,
                        <br />
                        <b>type</b>: object,
                        <br />
                        <b>example</b>: {...acceptButtonProps, "isDisabled": false}.
                    </li>
                </ul>
                This parameter is used only with <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>#updateContext">Actions.updateContext</a>
                and works in the administator or owner settings block that is embedded in the modal window with the plugin description.
            </td>
            <td>array of objects</td>
            <td>[
                    {
                        "name": "accept-button",
                        "props": {...acceptButtonProps, "isDisabled": false}
                    }
                ]
            </td>
        </tr>
        <tr class="tablerow">
            <td id="createDialogProps" class="copy-link">createDialogProps</td>
            <td>Defines the properties that display the default dialog box for creating a file/folder managed by the plugin.
                This parameter is used only with <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>#showCreateDialogModal">Actions.showCreateDialogModal</a>.</td>
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/createdialog") %>">ICreateDialog</a></td>
            <td>{ICreateDialog}</td>
        </tr>
        <tr class="tablerow">
            <td id="modalDialogProps" class="copy-link">modalDialogProps</td>
            <td>Defines the properties that display the modal window. This parameter is used only with <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>#showModal">Actions.showModal</a>.</td>
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/modaldialog") %>">IModalDialog</a></td>
            <td>{IModalDialog}</td>
        </tr>
        <tr class="tablerow">
            <td id="postMessage" class="copy-link">postMessage</td>
            <td>Defines the properties that are used to send a message to a frame. If the frame ID is not specified or the frame with such an ID does not exist, then nothing changes.
                This parameter is used only with <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>#sendPostMessage">Actions.sendPostMessage</a>.</td>
            <td><a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/utils/index.ts" target="_blank">IPostMessage</a></td>
            <td>{IPostMessage}</td>
        </tr>
        <tr class="tablerow">
            <td id="settings" class="copy-link">settings</td>
            <td>Defines a parameter that is used to save and transfer the administrator or owner plugin settings to all the portal users.
                This parameter is used only with <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>#saveSettings">Actions.saveSettings</a>.</td>
            <td>string</td>
            <td>"{settings}"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {IMessage, Actions, ToastType} from "@onlyoffice/docspace-plugin-sdk";

const message: IMessage = {
    "actions": [Actions.showToast, Actions.closeModal],
    "toastProps": [
        {
            "type": ToastType.success,
            "title": toastTitle,
        },
    ],
};
</pre>
