<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllElements</span>
</h1>

<h4 class="header-gray" id="RemoveAllElements">RemoveAllElements()</h4>

<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeallelements") %>">ApiDocumentContent.RemoveAllElements</a>
                    </li></ul></dd>
</dl>
<p class="dscr">Remove all elements from the current document or from the current document element.</p>
                                    
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oDocument.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the first paragraph. ");
oParagraph.AddText("We removed all document elements (including the first paragraph, created by default). ");
oParagraph.AddText("This paragraph now took its place.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "RemoveAllElements.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887294&doc=ZHBFa1B2TjRGZTR6cjJFKytxbWZzd01CYm42R0oyQ3B1VXNPUEFmNVFOcz0_IjQ4ODcyOTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>