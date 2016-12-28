<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="SetVertAlign">SetVertAlign(sType)</h4>
<p class="dscr">
Specify the alignment which will be applied to the contents of this run in relation to the defaultappearance of the run text:</p>
        <ul>
            <li><b>"baseline"</b> - the characters in the current text run will be aligned by the default text baseline.</li>
            <li><b>"subscript"</b> - the characters in the current text run will be aligned below the default text baseline.</li>
            <li><b>"superscript"</b> - the characters in the current text run will be aligned above the default text baseline.</li>
        </ul>

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
            <td><em>sType</em></td>
            <td>
                <em>"baseline"</em>
                |
                <em>"subscript"</em>
                |
                <em>"superscript"</em>
            </td>
            <td>The vertical alignment type applied to the text contents.</td>
        </tr>
    </tbody>
</table>
