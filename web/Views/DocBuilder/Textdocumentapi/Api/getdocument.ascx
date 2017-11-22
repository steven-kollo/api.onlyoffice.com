<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetDocument</span>
</h1>


<h4 class="header-gray" id="GetDocument">GetDocument() &rarr; {<a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>}</h4>
<p class="dscr">Get the main document.</p>
                
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a new paragraph");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetDocument.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882310&doc=NUdkSjVKQkU0TXhOb2JIM08vejhuOG8rR1Q4WW9QcUZkdUthMDZNcjFGUT0_IjQ4ODIzMTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
