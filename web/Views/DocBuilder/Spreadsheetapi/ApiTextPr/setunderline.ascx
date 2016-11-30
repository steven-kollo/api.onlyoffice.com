<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetUnderline</span>
</h1>
<h4 class="header-gray" id="SetUnderline">SetUnderline(isUnderline)</h4>
<p class="dscr">
Specify that the contents of this run are displayed along with a line appearing directly below thecharacter (less than all the spacing above and below the characters on the line).
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
            <td><em>isUnderline</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed underlined.</td>
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
oTextPr.SetFontSize(30);
oTextPr.SetUnderline(true);
oParagraph.SetJc("left");
oRun.AddText("This is an underlined text inside the shape.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetUnderline.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006244&doc=NUdjT1o3L2djSHdwN3FWOFkyUjljc2ZocjlmOXNzR0xsY21DNnUrRnRZRT0_IjUwMDYyNDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>