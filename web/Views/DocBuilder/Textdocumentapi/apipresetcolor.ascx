<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiPresetColor</span>
</h1>

<h4 class="header-gray" id="ApiPresetColor">new ApiPresetColor()</h4>
<p class="dscr">Class representing a preset color.</p>

<h2>Methods</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apipresetcolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph, oPresetColor;
oParagraph = oDocument.GetElement(0);
oPresetColor = Api.CreatePresetColor("lightYellow");
oGs1 = Api.CreateGradientStop(oPresetColor, 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
var oClassType = oPresetColor.GetClassType();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Class Type = " + oClassType);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896244&doc=V3JLd0xVcTlGUlN4cXFGRmU0QVNFRlQ5b3lURi9waVhpMGt3em1RaVUrOD0_IjQ4OTYyNDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>