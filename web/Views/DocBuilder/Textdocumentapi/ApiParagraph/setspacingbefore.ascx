<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingBefore</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiParagraph/SetSpacingBefore", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of setting a space before a paragraph. ");
oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ");
oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.");
oParagraph.SetSpacingBefore(1440);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetSpacingBefore.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891099&doc=QWtBSUZ2WVVXeUFpOHJVWW85UkFDcXBCbnhkOGdpdVRiMHVnd09wc2EyUT0_IjQ4OTEwOTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
