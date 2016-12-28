<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVerticalTextAlign</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiShape/SetVerticalTextAlign", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oStroke, oFill, oDocContent;
oParagraph = oDocument.GetElement(0);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 3212465, 963295, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
oDocContent = oDrawing.GetDocContent();
oDrawing.SetVerticalTextAlign("top");
oDocContent.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it, aligned top.");
oDocContent.Push(oParagraph);
builder.SaveFile("docx", "SetVerticalTextAlign.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892538&doc=blVZb3BJN3NoTHhEbDFocUtkVjJ2Y3RqM1BCdDZUSjhRWTZHWm4vNjdtdz0_IjQ4OTI1Mzgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>