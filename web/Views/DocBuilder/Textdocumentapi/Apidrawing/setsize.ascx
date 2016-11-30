<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSize</span>
</h1>

<h4 class="header-gray" id="SetSize">SetSize(nWidth, nHeight)</h4>
<p class="dscr">
Set the size of the object (image, shape, chart) bounding box.
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
            <td><em>nWidth</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td>The object width measured in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nHeight</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td>The object height measured in English measure units.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with a shape. ");
oParagraph.AddText("The text wraps the rectangular box that bounds the object. ");
oParagraph.AddText("The distance between the shape and the text is half an inch (457200 English measure units).");
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(155, 64, 1), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 1908000, 1404000, oFill, oStroke);
oDrawing.SetDistances(457200, 457200, 457200, 0);
oDrawing.SetWrappingStyle("square");
oDrawing.SetSize(2 * 914400, 2 * 914400);
oParagraph.AddDrawing(oDrawing);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("The shape was created with a size of 53x39 millimeters, then resized to the size of 2x2 inches.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetSize.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887486&doc=UDdjbGNiM3l3K3cxUkFyU0pZV3hvOWM3K0dxeElLbWlsU3JXLy9vWHQ1QT0_IjQ4ODc0ODYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>