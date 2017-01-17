<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetTabs">SetTabs(aPos, aVal)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apiparapr/settabs") %>">ApiParaPr.SetTabs</a>
                </li>
            </ul>
        </dd>
    </dl>
<p class="dscr">
Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.<br />
<b>Warning</b>: the lengths of <em>aPos</em> array and <em>aVal</em> array <b>MUST BE</b> equal to each other.</p>

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
            <td><em>aPos</em></td>
            <td>
                <em>Array.&lt;<a href="<%= Url.Action("global") %>#twips">twips</a>></em>
            </td>
            <td>An array of the positions of custom tab stops with respect to the current page margins measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
        <tr class="tablerow">
            <td><em>aVal</em></td>
            <td>
                <em>Array.&lt;<a href="<%= Url.Action("global") %>#TabJc">TabJc</a>></em>
            </td>
            <td>An array of the styles of custom tab stops, which determines the behavior of the tab stop and the alignment which will be applied to text entered at the current custom tab stop.</td>
        </tr>
    </tbody>
</table>
