<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("ShowInputHelper", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows showing the input helper.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("ShowInputHelper", [guid, w, h, isKeyboardTake]);
</pre>
<p>Where:</p>
<ul>
    <li><em>guid</em> is a string value which specifies an OLE object program identifier which must be of the <em>asc.{UUID}</em> type;</li>
    <li><em>w</em> is a number which specifies an object width measured in millimeters;</li>
    <li><em>h</em> is a number which specifies an object height measured in millimeters;</li>
    <li><em>isKeyboardTake</em> defines if the keyboard is caught (true) or not (false).</li>
</ul>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("ShowInputHelper", ["asc.{UUID}", 70, 70, true]);
</pre>
