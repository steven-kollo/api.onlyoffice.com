<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetSpacingLine">SetSpacingLine(nLine, sLineRule)</h4>
<p class="dscr">
Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em>or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. Ifthe value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em>parameter will be interpreted as 240ths of a line.
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
            <td><em>nLine</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
                |
                <a href="<%= Url.Action("global") %>#line240">line240</a>
            </td>
            <td>The line spacing value measured either in twentieths of a point (1/1440 of an inch) or in 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sLineRule</em></td>
            <td>
                <em>"auto"</em>
                |
                <em>"atLeast"</em>
                |
                <em>"exact"</em>
            </td>
            <td>The rule that determines the measuring units of the <em>nLine</em> parameter.</td>
        </tr>
    </tbody>
</table>
