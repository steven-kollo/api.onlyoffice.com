<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBold</span>
</h1>
<h4 class="header-gray" id="SetBold">SetBold(isBold)</h4>
<p class="dscr">
Set the bold property to the text character.
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
            <td><em>isBold</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of this run are displayed bold.</td>
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
oTextPr.SetBold(true);
oParagraph.SetJc("left");
oRun.AddText("This is a sample text inside the shape with the font weight set to bold using the text properties.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetBold.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006260&doc=elFMOUJMOEs0UlN4ME00bHhNeGV5S2YrakkwM0dkaFRKNWNOYS9uakxKZz0_IjUwMDYyNjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>