<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetSpacing">SetSpacing(nSpacing)</h4>
<p class="dscr">
Set text spacing measured in twentieths of a point.
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
            <td><em>nSpacing</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
            </td>
            <td>The value of the text spacing measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
    </tbody>
</table>
