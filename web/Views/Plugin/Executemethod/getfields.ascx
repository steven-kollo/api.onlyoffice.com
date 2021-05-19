<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetFields", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows opening file with fields.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetFields");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the <em>list</em> of field values.</p>
