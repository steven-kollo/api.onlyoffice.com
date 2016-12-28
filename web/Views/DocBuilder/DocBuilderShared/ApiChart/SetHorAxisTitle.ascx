<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetHorAxisTitle">SetHorAxisTitle(sTitle, nSize)</h4>
<p class="dscr">
Specify the horizontal axis chart title.
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
            <td><em>sTitle</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The title which will be displayed for the horizontal axis of the current chart.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nSize</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#pt">pt</a>
            </td>
            <td>The text size value measured in points.</td>
        </tr>
    </tbody>
</table>
