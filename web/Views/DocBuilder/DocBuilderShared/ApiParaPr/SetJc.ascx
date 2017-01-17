<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetJc">SetJc(sJc)</h4>
<p class="dscr">
Set paragraph contents justification.
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
            <td><em>sJc</em></td>
            <td>
                <em>"left"</em>
                |
                <em>"right"</em>
                |
                <em>"both"</em>
                |
                <em>"center"</em>
            </td>
            <td>The parameters will define the justification type that will be applied to the paragraph contents.</td>
        </tr>
    </tbody>
</table>
