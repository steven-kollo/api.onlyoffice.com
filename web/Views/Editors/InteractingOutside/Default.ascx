<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to interact from the outside</span>
</h1>

<p class="dscr">The following examples will show you how to interact with text documents, spreadsheets, presentations, and fillable forms from the outside.
To achieve this, use our <a href="<%= Url.Action("connector") %>">Automation API</a>.</p>
<ul>
    <li><a href="<%= Url.Action("interactingoutside/comments") %>">Working with comments</a></li>
    <li><a href="<%= Url.Action("interactingoutside/reviewwork") %>">Working with review changes</a></li>
    <li><a href="<%= Url.Action("interactingoutside/fillingform") %>">Filling out the form</a></li>
</ul>
