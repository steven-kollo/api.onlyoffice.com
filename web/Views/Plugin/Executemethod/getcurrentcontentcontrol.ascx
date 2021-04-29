<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetCurrentContentControl", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the identifier of the selected
content control (i.e. the content control where the mouse cursor is currently positioned).</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetCurrentContentControl");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the content control internal ID in the <em>string</em> format.</p>

<div class="header-gray">Example</div>

<pre>
document.getElementById("buttonIDChangeState").onclick = function () {
    _Control = [];
    window.buttonIDChangeState_click = true;
    window.Asc.plugin.executeMethod("GetCurrentContentControl");
};
</pre>
