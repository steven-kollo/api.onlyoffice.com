<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetFontFamily">SetFontFamily(sFontFamily)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apitextpr/setfontfamily") %>">ApiTextPr.SetFontFamily</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Set all 4 font slots with the specified font family.
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
            <td><em>sFontFamily</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The font family or families used for the current text run.</td>
        </tr>
    </tbody>
</table>
