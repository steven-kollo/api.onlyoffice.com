<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">img</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">A component that is used to embed an image not from the <em>assets</em> folder into a modal window or the settings page.
    The full path to the image must be specified in the <em>src</em> parameter.</p>
<p><b>Interface</b>: <a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IImage.ts" target="_blank">IImage</a>.</p>

<div class="header-gray">Example</div>
<pre>
import {IImage} from "@onlyoffice/docspace-plugin-sdk";

const imageProps: IImage = {
    "width": "64px",
    "height": "64px",
    "alt": "sample",
    "src": "image.png",
};
</pre>
