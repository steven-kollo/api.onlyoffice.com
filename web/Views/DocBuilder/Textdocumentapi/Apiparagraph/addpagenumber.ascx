<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddPageNumber</span>
</h1>

<h4 class="header-gray" id="AddPageNumber">AddPageNumber() &rarr; {<a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">Insert the number of the current document page into the paragraph.</p>
<div class="note">This method works for the paragraphs in the document header/footer only.</div>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("First page");
oParagraph.AddPageBreak();
oParagraph.AddText("Second page");
oParagraph.AddPageBreak();
oParagraph.AddText("Third page");
var oSection = oDocument.GetFinalSection();
var oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("Page #");
oParagraph.AddPageNumber();
var oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("Page #");
oParagraph.AddPageNumber();
builder.SaveFile("docx", "AddPageNumber.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5057167&doc=OEZySnhVWWtpb1RUdzBzb0RqZktia2FkVmJZREE4RDV5Z29WRkkzc0hRZz0_IjUwNTcxNjci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
