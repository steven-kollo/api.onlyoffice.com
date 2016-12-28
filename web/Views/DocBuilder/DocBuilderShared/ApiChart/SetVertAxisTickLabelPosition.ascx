<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>" %>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetVertAxisTickLabelPosition">SetVertAxisTickLabelPosition(sTickLabelPosition)</h4>
<p class="dscr">
    Set the possible values for the position of the chart tick labels in relation to the main vertical label or the values of the chart data.
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
            <td><em>sTickLabelPosition</em></td>
            <td>
                <em><a href="<%= Url.Action("global") %>#TickLabelPosition">TickLabelPosition</a> | string</em>
            </td>
            <td>Set the position of the chart vertical tick labels.</td>
        </tr>
    </tbody>
</table>