<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetParagraphMarkTextPr</span>
</h1>

<h4 class="header-gray" id="GetParagraphMarkTextPr">GetParagraphMarkTextPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>}</h4>
<p class="dscr">Get the text properties of the paragraph mark which is used to mark the paragraph end. The mark can also acquire common text properties like <em>bold</em>, <em>italic</em>, <em>underline</em>, etc.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParagraphMarkTextPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the font size, font color and spacing for the paragraph mark. ");
oParagraph.AddText("You can see it if you download the document, open it and enable the invisible symbols display.");
var oParagraphMarkTextPr = oParagraph.GetParagraphMarkTextPr();
oParagraphMarkTextPr.SetFontSize(52);
oParagraphMarkTextPr.SetColor(255, 255, 0, false);
oParagraphMarkTextPr.SetSpacing(5);
builder.SaveFile("docx", "GetParagraphMarkTextPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912784&doc=Z0dmdFNNYkc0Z2NmajdVUEg3cFVYMUgwN2lCM2YzNTBWQk1tN1pUa3J2Zz0_IjQ5MTI3ODQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>