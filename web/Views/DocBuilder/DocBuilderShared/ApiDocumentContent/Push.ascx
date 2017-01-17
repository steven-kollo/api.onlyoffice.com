<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="Push">Push(oElement)</h4>
<p class="dscr">
Push a paragraph or a table to actually add it to the document.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>oElement</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
            </td>
            <td>The type of the element which will be pushed to the document.</td>
        </tr>
    </tbody>
</table>
