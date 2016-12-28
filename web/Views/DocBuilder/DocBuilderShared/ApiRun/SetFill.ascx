<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetFill">SetFill(oFill)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apitextpr/setfill") %>">ApiTextPr.SetFill</a>
                </li>
            </ul>
        </dd>
    </dl>
<p class="dscr">
Set the text color for the current text run.
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
            <td><em>oFill</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>
            </td>
            <td>The color or pattern used to fill the text color.</td>
        </tr>
    </tbody>
</table>
