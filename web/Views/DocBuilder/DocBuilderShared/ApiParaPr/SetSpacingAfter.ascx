<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetSpacingAfter">SetSpacingAfter(nAfter, isAfterAuto<sub>opt</sub>)</h4>
<p class="dscr">
Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>nAfter</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
            </td>
            <td>
                <br>
            </td>
            <td></td>
            <td>The value of the spacing after the current paragraph measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
        <tr class="tablerow">
            <td><em>isAfterAuto</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>&lt;optional><br>
            </td>
            <td>false</td>
            <td>The <em>true</em> value will disable the <em>nAfter</em> parameter.</td>
        </tr>
    </tbody>
</table>
