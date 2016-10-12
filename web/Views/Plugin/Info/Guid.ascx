<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("info/") %>"></a>
    <span class="hdr">window.Asc.plugin.info.guid</span>
    <span class="comment">read-only</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">The OLE object GUID in the current document.</p>

<div class="header-gray">Returns</div>

<p>Type string</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.init = function () {
    var plugin_uuid = window.Asc.plugin.info.guid;
};
</pre>
