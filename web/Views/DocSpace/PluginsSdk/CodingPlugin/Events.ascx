<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Events</span>
</h1>

<p class="dscr">The events from the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#actions">Actions</a> collection are processed on the portal side. The specified actions are performed depending on the set of values:</p>

<h2>Events and their description:</h2>
<ul>
    <li>
        <p><b id="updateProps" class="copy-link">updateProps</b> - the function called when updating the state of the item which action was passed.
            It does not work if the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#newProps">newProps</a> parameter is not passed to the message.</p>
        <pre>
const message: IMessage = {
    "newProps": { ...acceptButton, isDisabled: true },
    "actions": [Actions.showToast, Actions.updateStatus, Actions.updateProps],
    toastProps,
};
</pre>
    </li>
    <li>
        <p><b id="updateContext" class="copy-link">updateContext</b> - the function called when updating the state of the the parent or child items which were passed.
            It does not work if the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#contextProps">contextProps</a> parameter is not passed to the message.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.updateProps, Actions.updateContext],
    "newProps": { ...nameInputProps, value },
    "contextProps": [
        {
            "name": "accept-button",
            "props": {
                ...acceptButtonProps,
                "isDisabled": !value,
            },
        },
    ],
};
</pre>
    </li>
    <li>
        <p><b id="updateStatus" class="copy-link">updateStatus</b> - the function called when updating the plugin status.</p>
        <pre>
const message: IMessage = {
    "newProps": { ...acceptButton, isDisabled: true },
    "actions": [Actions.showToast, Actions.updateProps, Actions.updateStatus],
    toastProps,
};
</pre>
    </li>
    <li>
        <p><b id="updateContextMenuItems" class="copy-link">updateContextMenuItems</b> - the function called when updating all the context menu items.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.updateContextMenuItems]
};
</pre>
    </li>
    <li>
        <p><b id="updateInfoPanelItems" class="copy-link">updateInfoPanelItems</b> - the function called when updating all the info panel items.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.updateInfoPanelItems]
};
</pre>
    </li>
    <li>
        <p><b id="updateMainButtonItems" class="copy-link">updateMainButtonItems</b> - the function called when updating all the main button menu items.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.updateMainButtonItems]
};
</pre>
    </li>
    <li>
        <p><b id="updateProfileMenuItems" class="copy-link">updateProfileMenuItems</b> - the function called when updating all the profile menu items.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.updateProfileMenuItems]
};
</pre>
    </li>
    <li>
        <p><b id="updateFileItems" class="copy-link">updateFileItems</b> - the function called when updating all the file items.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.updateFileItems]
};
</pre>
    </li>
    <li>
        <p><b id="updateEventListenerItems" class="copy-link">updateEventListenerItems</b> - the function called when updating all the event listener items.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.updateEventListenerItems]
};
</pre>
    </li>
    <li>
        <p><b id="showToast" class="copy-link">showToast</b> - the function called when displaying a toast notification after the user actions.
            It does not work if the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#toastProps">toastProps</a> parameter is not passed to the message.</p>
        <pre>
const message: IMessage = {
    "newProps": { ...acceptButton, isDisabled: true },
    "actions": [Actions.showToast, Actions.updateProps, Actions.updateStatus],
    toastProps,
};
</pre>
    </li>
    <li>
        <p><b id="showCreateDialogModal" class="copy-link">showCreateDialogModal</b> - the function called when opening a modal window for creating certain item (file, folder, etc.).
            It does not work if the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#createDialogProps">createDialogProps</a> parameter is not passed to the message.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.showCreateDialogModal],
    "createDialogProps": {
        "title": "Create diagram",
        "startValue": "New diagram",
        "visible": true,
        "isCreateDialog": true,
        "extension": ".drawio",
        "onSave": async (e: any, value: string) =&gt; {
            await drawIo.createNewFile(value);
        },
        "onCancel": (e: any) =&gt; {
            drawIo.setCurrentFolderId(null);
        },
        "onClose": (e: any) =&gt; {
            drawIo.setCurrentFolderId(null);
        },
    },
};
</pre>
    </li>
    <li>
        <p><b id="showModal" class="copy-link">showModal</b> - the function called when opening a modal window.
            It does not work if the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#modalDialogProps">modalDialogProps</a> parameter is not passed to the message.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.showModal],
    "modalDialogProps": openFromUrlProps,
};
</pre>
    </li>
    <li>
        <p><b id="closeModal" class="copy-link">closeModal</b> - the function called when closing a modal window.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.closeModal],
};
</pre>
    </li>
    <li>
        <p><b id="sendPostMessage" class="copy-link">sendPostMessage</b> - the function called when sending a message to a frame.
            It does not work if the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#postMessage">postMessage</a> parameter is not passed to the message or the specified frame is not found.</p>
        <pre>
const message: IMessage = {
    "actions": [Actions.sendPostMessage],
    "postMessage": {
        "frameId": this.frameId,
        "message": {
            "action": "export",
            "format": this.format,
            "xml": msg.xml,
            "spinKey": "export",
        },
    },
};
</pre>
    </li>
    <li>
        <p><b id="saveSettings" class="copy-link">saveSettings</b> - the function called when saving the data that was transferred
        in the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>#settings">settings</a> parameter
        and returning it in the <a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/settingsplugin") %>#setAdminPluginSettingsValue">setAdminPluginSettingsValue</a> method
        each time the plugin is requested. It functions only when the <b>Save</b> button is clicked in the <b>Settings</b> block.</p>
        <pre>
const message: IMessage = {
    "actions": [
      Actions.showToast,
      Actions.updateProps,
      Actions.updateStatus,
      Actions.saveSettings,
    ],
    "toastProps": [{ "title": "Token is saved", "type": ToastType.success }],
    "newProps": { ...userButtonProps, "isDisabled": true },
    "settings": tokenInput.value,
};
</pre>
    </li>
</ul>
