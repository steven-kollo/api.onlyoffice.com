<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetSmallCaps">SetSmallCaps(isSmallCaps)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action(data + "/apitextpr/setsmallcaps") %>">ApiTextPr.SetSmallCaps</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.
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
            <td><em>isSmallCaps</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed capitalized two points smaller.</td>
        </tr>
    </tbody>
</table>
