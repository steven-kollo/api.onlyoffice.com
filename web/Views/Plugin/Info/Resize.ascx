<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("info/") %>"></a>
    <span class="hdr">window.Asc.plugin.info.resize</span>
    <span class="comment">read-only</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that checks if the size of the OLE object has been changed.</p>

<p>In case <em>window.Asc.plugin.info.resize === true</em> the object will be redrawn.</p>

<div class="header-gray">Returns</div>

<p>Type boolean</p>

<div class="header-gray">Example</div>

<pre>
if (window.Asc.plugin.info.resize === true) {
    return window.Asc.plugin.button(0);
}
</pre>
