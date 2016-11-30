<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddPagesCount</span>
</h1>

<h4 class="header-gray" id="AddPagesCount">AddPagesCount() &rarr; {<a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">Insert the number of pages in the current document into the paragraph.</p>
<div class="note">This method works for the paragraphs in the document header/footer only.</div>
                
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
var oParagraph;
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("First page");
oParagraph.AddPageBreak();
oParagraph.AddText("Second page");
var oSection = oDocument.GetFinalSection();
var oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("Page ");
oParagraph.AddPageNumber();
oParagraph.AddText(" of ");
oParagraph.AddPagesCount();
builder.SaveFile("docx", "AddPagesCount.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<p>The resulting sample document will be available here with the nearest ONLYOFFICE Document Builder API documentation website update.</p>