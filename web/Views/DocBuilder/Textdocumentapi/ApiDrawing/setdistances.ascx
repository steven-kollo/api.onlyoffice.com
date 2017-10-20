<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetDistances</span>
</h1>

<h4 class="header-gray" id="SetDistances">SetDistances(nLeft, nTop, nRight, nBottom)</h4>
<p class="dscr">Specify the minimum distance which will be maintained between the edges of this drawing object and any subsequent text.</p>
                
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
                        <td><em>nLeft</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The distance from the left side of the current object and the subsequent text run measured in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nTop</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The distance from the top side of the current object and the preceding text run measured in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nRight</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The distance from the right side of the current object and the subsequent text run measured in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nBottom</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The distance from the bottom side of the current object and the subsequent text run measured in English measure units.</td>
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
oParagraph.AddText("The distance between the shape and the text is 1 inch (914400 English measure units).");
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(155, 64, 1), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 1908000, 1404000, oFill, oStroke);
oDrawing.SetDistances(914400, 0, 914400, 0);
oDrawing.SetWrappingStyle("square");
oParagraph.AddDrawing(oDrawing);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is another paragraph.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetDistances.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887427&doc=V2I3ODRGQlJhZ1l2VVRXbkNGOFZYcy9UcG10R0ltS0ZydGd3Yy93TnVpND0_IjQ4ODc0Mjci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
