<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreatePatternFill">CreatePatternFill(sPatternType, BgColor, FgColor) &rarr; {<a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
Create a pattern fill which allows to fill the object using a selected pattern as the object background.
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
            <td><em>sPatternType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PatternType">PatternType</a>
            </td>
            <td>The pattern type used for the fill selected from one of the available pattern types.</td>
        </tr>
        <tr class="tablerow">
            <td><em>BgColor</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apiunicolor") %>">ApiUniColor</a>
            </td>
            <td>The background color used for the pattern creation.</td>
        </tr>
        <tr class="tablerow">
            <td><em>FgColor</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apiunicolor") %>">ApiUniColor</a>
            </td>
            <td>The foreground color used for the pattern creation.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>
    </dd>
</dl>