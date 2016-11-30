<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVertAlign</span>
</h1>
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

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
var oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetVertAlign("superscript");
oParagraph.SetJc("left");
oRun.AddText("This is a text inside the shape with vertical alignment set to 'superscript'.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetVertAlign.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006242&doc=U1FqbkR4WjVPUHhPdlAvN3loQ3hRbjE2RllGUlZiTGM0RkN2SDZaK1V0bz0_IjUwMDYyNDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>