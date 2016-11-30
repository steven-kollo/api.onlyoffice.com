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
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(50);
oTextPr.SetBold(true);
oParagraph.SetJc("left");
oRun.AddText("This is a sample text inside the shape with the font weight set to bold using the text properties.");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetBold.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011327&doc=dll5eWlTWXkyWVBtWWkrZFdDc3RUS2VHVUdjZ0kxZjF1cU5Jdzgya0dMZz0_IjUwMTEzMjci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>