<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">EventListenerItem</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>"></a>
</h1>

<p class="dscr">Describes an item that allows the plugin to respond to the built-in DocSpace events (creating a room/file, etc.).
    Each event can have several listeners. When the event is activated, the dialog cannot be hooked.</p>

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
            <td>"event-listener-item"</td>
        </tr>
        <tr class="tablerow">
            <td id="eventType" class="copy-link">eventType</td>
            <td>Defines the event type which will be executed.
                Now the following events are available: <b>CREATE, RENAME, ROOM_CREATE, ROOM_EDIT, CHANGE_COLUMN, CHANGE_USER_TYPE, CREATE_PLUGIN_FILE</b>.</td>
            <td><a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/Events.ts" target="_blank">Events</a></td>
            <td>Events.CREATE</td>
        </tr>
        <tr class="tablerow">
            <td id="eventHandler" class="copy-link">eventHandler</td>
            <td>Defines a function that will be executed when the event is triggered.
                This function can be asynchronous. After the event is executed, only updating the items or displaying toast is possible, other actions are blocked.</td>
            <td>func</td>
            <td>() =&gt; {}</td>
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
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {IEventListenerItem, Events} from "@onlyoffice/docspace-plugin-sdk";

const eventItem: IEventListenerItem = {
    "key": "event-listener-item",
    "eventType": Events.CREATE,
    "eventHandler": () =&gt; {},
};
</pre>
