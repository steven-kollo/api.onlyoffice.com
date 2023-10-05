<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Skeleton</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">A component that is used to hide components during uploading.</p>
<p><b>Interface</b>: <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/components/ISkeleton.ts" target="_blank">ISkeleton</a>.</p>

<div class="header-gray">Example</div>
<pre>
import {ISkeleton} from "@onlyoffice/docspace-plugin-sdk";

const skeletonProps: ISkeleton = {
    "width": "100%",
    "height": "100%",
};
</pre>
