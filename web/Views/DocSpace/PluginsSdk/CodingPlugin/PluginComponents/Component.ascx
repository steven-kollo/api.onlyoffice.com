<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Component</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">A component that is used to add components into <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/box") %>">Box</a>.
    Only components that are embedded into DOM can be wrapped (toast, modal dialog, etc. cannot be wrapped).</p>
<p><b>Interface</b>: <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/Component.ts" target="_blank">Component</a>.</p>

<div class="header-gray">Extra parameters</div>
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
            <td id="contextName" class="copy-link">contextName</td>
            <td>The context name that updates the component via React context.</td>
            <td>string</td>
            <td>"acceptButton"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {Actions, ButtonGroup, ButtonSize, Components, IButton, IMessage, ToastType} from "@onlyoffice/docspace-plugin-sdk";

const onClick = () =&gt; {
    const message: IMessage = {
        "actions": [Actions.showToast, Actions.updateProps],
        "toastProps": [{"title": "Data is saved", "type": ToastType.success}],
        "newProps": {...adminButtonProps, isDisabled: true},
    };

    return message;
};

export const adminButtonProps: IButton = {
    onClick,
    "size": ButtonSize.normal,
    "label": "Save",
    "scale": false,
    "primary": true,
    "isDisabled": true,
};

const buttonComponent: ButtonGroup = {
    "component": Components.button,
    "props": buttonProps,
    "contextName": "acceptButton",
};
</pre>
