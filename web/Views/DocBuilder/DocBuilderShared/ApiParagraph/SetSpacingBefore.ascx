<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetSpacingBefore">SetSpacingBefore(nBefore, isBeforeAuto<sub>opt</sub>)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a>
                </li>
            </ul>
        </dd>
    </dl>
<p class="dscr">
Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.
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
            <td><em>nBefore</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
            </td>
            <td></td>
            <td></td>
            <td>The value of the spacing before the current paragraph measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
        <tr class="tablerow">
            <td><em>isBeforeAuto</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>&lt;optional></td>
            <td>false</td>
            <td>The <em>true</em> value will disable the <em>nBefore</em> parameter.</td>
        </tr>
    </tbody>
</table>
