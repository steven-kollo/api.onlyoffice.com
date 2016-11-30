<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddPageBreak</span>
</h1>

<h4 class="header-gray" id="AddPageBreak">AddPageBreak() &rarr; {<a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">Add page break and start the next element from the next page.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = oParagraph.AddText("This is the text for the first page. After it a page break will be added. Scroll down to the second page to see the text there.");
oParagraph.AddPageBreak();
oRun = oParagraph.AddText("This is the text which starts from the beginning of the second page. ");
oRun = oParagraph.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
builder.SaveFile("docx", "AddPageBreak.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888992&doc=Rm5jaHByMjRLdUVwUUlTZm9uMkR6LzE3WjRsNllYVEpjanB2ZGd5ODVORT0_IjQ4ODg5OTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>