<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVerPosition</span>
</h1>

<h4 class="header-gray" id="SetVerPosition">SetVerPosition(sRelativeFrom, nDistance)</h4>
<p class="dscr">Set an absolute measurement for the vertical positioning of the floating object.</p>

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
                        <td><em>sRelativeFrom</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#RelFromV">RelFromV</a>
                        </td>
                        <td>The document element which will be taken as a countdown point for the object vertical alignment.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nDistance</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The distance from the bottom part of the document element to the floating object measured in English measure units.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with a shape. ");
oParagraph.AddText("The text wraps the rectangular box that bounds the object. ");
oParagraph.AddText("The distance between the shape and the text (horizontally) is half an inch (457200 English measure units).");
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(155, 64, 1), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 1908000, 1404000, oFill, oStroke);
oDrawing.SetDistances(457200, 457200, 457200, 0);
oDrawing.SetWrappingStyle("square");
oDrawing.SetVerPosition("page", 914400);
oParagraph.AddDrawing(oDrawing);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("The shape is aligned to the top of the page, and outstands from the page top 1 inch.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetVerPosition.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887521&doc=QUZxdkgvbDhOWEt5N3dmNXI4dFFoRkplNjh3MEFJUDVkYmU1Sjh6QzQ3VT0_IjQ4ODc1MjEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>