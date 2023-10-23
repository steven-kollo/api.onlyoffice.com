<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Box</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">A container that lays out its contents in one direction. Box provides general CSS capabilities like flexbox layout, paddings, background color, border, and animation.</p>
<p><b>Interface</b>: IBox.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-box--docs" target="_blank">storybook</a>.</p>
<img alt="Box" class="screenshot" src="<%= Url.Content("~/content/img/docspace/box.png") %>" />

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
            <td id="children" class="copy-link">children</td>
            <td>The box components.</td>
            <td>array of <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/component") %>">Components</a></td>
            <td>[inputComponent]</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>To set borders to the Box component, use a stroke or the <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/components/IBox.ts" target="_blank">IBorderProp</a> interface.</p>

<div class="header-gray">Example</div>
<pre>
import {IBox, IInput, Components, InputGroup} from "@onlyoffice/docspace-plugin-sdk";

const nameInputProps: IInput = {
    "value": "",
    "onChange": () =&gt; {},
    "scale": true,
    "placeholder": "",
};

const inputComponent: InputGroup = {
    "component": Components.input,
    "props": nameInputProps,
};

const inputBox: IBox = {
    "marginProp": "0 0 24px",
    "children": [inputComponent],
};
</pre>
