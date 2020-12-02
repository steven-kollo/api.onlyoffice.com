<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("EndAction", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows specifying the end action for long operations.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("EndAction", [type, description]);
</pre>
<p>Where:</p>
<ul>
    <li><em>type</em> is a value which defines an action type which can take 0 if this is an Information action or 1 if this is a BlockInteraction action;</li>
    <li><em>description</em> is a string value that specifies the description text for the end action of the operation.</li>
</ul>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("EndAction", [1, "Save to localstorage..."]);
</pre>