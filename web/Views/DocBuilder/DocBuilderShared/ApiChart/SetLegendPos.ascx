<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetLegendPos">SetLegendPos(sLegendPos)</h4>
<p class="dscr">
Specify the chart legend position.
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
            <td><em>sLegendPos</em></td>
            <td>
                <em>"left"</em>
                |
                <em>"top"</em>
                |
                <em>"right"</em>
                |
                <em>"bottom"</em>
                |
                <em>"none"</em>
            </td>
            <td>The position of the chart legend inside the chart window.</td>
        </tr>
    </tbody>
</table>
