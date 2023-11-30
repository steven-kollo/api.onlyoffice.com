<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Label</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Field name in the form.</p>
<p><b>Interface</b>: ILabel.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-label--docs" target="_blank">storybook</a>.</p>
<img alt="Label" class="screenshot" src="<%= Url.Content("~/content/img/docspace/label.png") %>" />

<div class="header-gray">Example</div>
<pre>
import {ILabel} from "@onlyoffice/docspace-plugin-sdk";

const label: ILabel = {
    "text": "Input:",
    "isRequired": false,
    "truncate": true,
};
</pre>
