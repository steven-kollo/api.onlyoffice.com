<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetShowDataLabels">SetShowDataLabels(bShowSerName, bShowCatName, bShowVal, bShowPercent)</h4>
<p class="dscr">
Specifies which chart data labels are shown for the chart.
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
            <td><em>bShowSerName</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Whether to show or hide the source table column names used for the data which the chart will be build from.</td>
        </tr>
        <tr class="tablerow">
            <td><em>bShowCatName</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Whether to show or hide the source table row names used for the data which the chart will be build from.</td>
        </tr>
        <tr class="tablerow">
            <td><em>bShowVal</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Whether to show or hide the chart data values.</td>
        </tr>
        <tr class="tablerow">
            <td><em>bShowPercent</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Whether to show or hide the percent for the data values (works with stacked chart types).</td>
        </tr>
    </tbody>
</table>
