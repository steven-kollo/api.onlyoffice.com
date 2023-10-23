<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Toast</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Toast.</p>
<p><b>Interface</b>: IToast.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-toast--docs" target="_blank">storybook</a>.</p>
<img alt="Toast" class="screenshot" src="<%= Url.Content("~/content/img/docspace/toast.png") %>" />
<p>To change the toast type, use <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IToast.ts" target="_blank">ToastType</a> (<em>success, error, warning, info</em>).</p>

<div class="header-gray">Example</div>
<pre>
import {IToast, ToastType} from "@onlyoffice/docspace-plugin-sdk";

const toast: IToast = {
    "type": ToastType.error,
    "title": "Wrong file format",
};
</pre>
