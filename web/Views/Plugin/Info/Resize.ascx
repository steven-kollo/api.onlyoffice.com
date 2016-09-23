<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <%= Html.ActionLink(" ", "info/", null, new {@class = "up"}) %>
    <span class="hdr">window.Asc.plugin.info.resize</span>
    <span class="comment">read-only</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Checks if the OLE object size has been changed.</p>

<p>In case <em>window.Asc.plugin.info.resize === true</em> the object will be redrawn.</p>

<div class="header-gray">Returns</div>

<p>Type boolean</p>

<div class="header-gray">Example</div>

<pre>
if (window.Asc.plugin.info.resize === true) {
    return window.Asc.plugin.button(0);
}
</pre>
