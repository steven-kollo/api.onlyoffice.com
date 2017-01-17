<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetVerticalTextAlign">SetVerticalTextAlign(VerticalAlign)</h4>
<p class="dscr">
Set the vertical alignment for the shape content where a paragraph or text runs can be inserted.
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
            <td><em>VerticalAlign</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#VerticalTextAlign">VerticalTextAlign</a>
            </td>
            <td>The type of the vertical alignment for the shape inner contents.</td>
        </tr>
    </tbody>
</table>

