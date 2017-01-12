<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetDoubleStrikeout">SetDoubleStrikeout(isDoubleStrikeout)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apitextpr/setdoublestrikeout") %>">ApiTextPr.SetDoubleStrikeout</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.
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
            <td><em>isDoubleStrikeout</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed double struck through.</td>
        </tr>
    </tbody>
</table>
