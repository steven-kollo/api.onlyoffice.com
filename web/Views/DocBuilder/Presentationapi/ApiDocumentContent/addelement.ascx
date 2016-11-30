<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddElement</span>
</h1>
<h4 class="header-gray" id="AddElement">AddElement(nPos, oElement)</h4>
<p class="dscr">
Add paragraph or table using its position in the document.
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
            <td><em>nPos</em></td>
            <td>
                <em>number</em>
            </td>
            <td>The position where the current element will be added.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oElement</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
            </td>
            <td>The document element which will be added at the current position.</td>
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
oDocContent.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.");
oDocContent.AddElement(oParagraph);
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "AddElement.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007728&doc=VHdmLzBidkVtV2djOEIwcHBhV3Fma0JjUjVmcHppZ21oRk1oc3RJRGd2cz0_IjUwMDc3Mjgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>