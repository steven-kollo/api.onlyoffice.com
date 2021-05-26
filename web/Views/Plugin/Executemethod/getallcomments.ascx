<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetAllComments", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting all the comments from the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetAllComments");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns an <em>array</em> which contains all the comments from the document.</p>
