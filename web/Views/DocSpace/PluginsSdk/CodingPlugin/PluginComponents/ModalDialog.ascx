<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ModalDialog</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Modal dialog.</p>
<p><b>Interface</b>: IModalDialog.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-modaldialog--docs" target="_blank">storybook</a>.</p>
<img alt="Modal dialog" class="screenshot" src="<%= Url.Content("~/content/img/docspace/modal-dialog.png") %>" />
<p>To change the modal dialog type, use <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/components/IModalDialog.ts" target="_blank">ModalDisplayType</a> (<em>modal</em> or <em>aside</em>).</p>

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
            <td id="fullScreen" class="copy-link">fullScreen</td>
            <td>Specifies whether to display the modal dialog body in the full screen mode without paddings.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {Actions, Components, IBox, IFrame, IMessage, IModalDialog, ISkeleton, ModalDisplayType} from "@onlyoffice/docspace-plugin-sdk";

export const frameProps: IFrame = {
    "width": "100%",
    "height": "100%",
    "name": "test-drawio",
    "src": "",
};

const skeletonProps: ISkeleton = {
    "width": "100%",
    "height": "100%",
};

const body: IBox = {
    "widthProp": "100vw",
    "heightProp": "calc(var(--vh, 1vh) * 100)",

    "children": [
        {
            "component": Components.iFrame,
            "props": frameProps,
        },
    ],
};

const bodySkeleton: IBox = {
    "widthProp": "100vw",
    "heightProp": "calc(var(--vh, 1vh) * 100)",
    "children": [
        {
            "component": Components.skeleton,
            "props": skeletonProps,
        },
    ],
};

export const drawIoModalDialogProps: IModalDialog = {
    "dialogHeader": "",
    "dialogBody": body,
    "displayType": ModalDisplayType.modal,
    "onClose": () =&gt; {
        const message: IMessage = {
        "actions": [Actions.closeModal],
    };

    return message;
},

    "onLoad": async () =&gt; {
        return {
            "newDialogHeader": drawIoModalDialogProps.dialogHeader,
            "newDialogBody": drawIoModalDialogProps.dialogBody,
        };
    },
    "autoMaxHeight": true,
    "autoMaxWidth": true,
};
</pre>
