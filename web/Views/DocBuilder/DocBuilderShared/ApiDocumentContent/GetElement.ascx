<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="GetElement">GetElement() &rarr; (nullable) {<a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>}</h4>
<p class="dscr">
Get the element by its position in the document.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
    </dd>
</dl>
