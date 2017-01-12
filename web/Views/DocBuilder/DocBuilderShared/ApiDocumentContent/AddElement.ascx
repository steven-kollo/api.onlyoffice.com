<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="AddElement">AddElement(nPos, oElement)</h4>
<p class="dscr">
Add paragraph or table using its position in the document.
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
            <td><em>nPos</em></td>
            <td>
                <em>number</em>
            </td>
            <td>The position where the current element will be added.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oElement</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
            </td>
            <td>The document element which will be added at the current position.</td>
        </tr>
    </tbody>
</table>
