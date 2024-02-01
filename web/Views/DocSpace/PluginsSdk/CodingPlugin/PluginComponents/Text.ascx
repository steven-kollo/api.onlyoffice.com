<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Text</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Plain text.</p>
<p><b>Interface</b>: IText.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-text--docs" target="_blank">storybook</a>.</p>
<img alt="Text" class="screenshot" src="<%= Url.Content("~/content/img/docspace/text.png") %>" />

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
            <td id="text" class="copy-link">text</td>
            <td>The text inserted into the component.</td>
            <td>string</td>
            <td>"Sample for text component"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
import {IText} from "@onlyoffice/docspace-plugin-sdk";

const text: IText = {
    "text": "Sample for text component",
    "fontWeight": 600,
    "fontSize": "13px",
    "lineHeight": "20px",
    "noSelect": true,
};
</pre>
