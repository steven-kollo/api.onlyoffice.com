<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetElement</span>
</h1>

<h4 class="header-gray" id="GetElement">GetElement() &rarr; (nullable) {<a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>}</h4>

<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">ApiDocumentContent.GetElement</a>
                    </li></ul></dd>
</dl>
             
<p class="dscr">Get the element by its position in the document.</p>                    
                
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. Nothing special.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "GetElement.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887224&doc=VFp4MkxEU25IZ29KbG9DOUhjcVMwQy9QSkVXVXkxWFZlZFpRendadjgxOD0_IjQ4ODcyMjQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
