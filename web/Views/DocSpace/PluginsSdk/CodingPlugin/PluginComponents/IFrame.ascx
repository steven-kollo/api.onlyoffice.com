<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">IFrame</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">A component that is used to embed a third-party website into a modal window or the settings page.</p>
<p><b>Interface</b>: <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/components/IFrame.ts" target="_blank">IFrame</a>.</p>

<div class="header-gray">Example</div>
<pre>
import {IFrame} from "@onlyoffice/docspace-plugin-sdk";

const frameProps: IFrame = {
    "width": "100%",
    "height": "100%",
    "name": "test",
    "src": "",
};    
</pre>
