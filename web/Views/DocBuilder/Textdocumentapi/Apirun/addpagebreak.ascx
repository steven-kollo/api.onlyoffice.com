<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddPageBreak</span>
</h1>

<h4 class="header-gray" id="AddPageBreak">AddPageBreak()</h4>
<p class="dscr">Add a page break and start the next element from a new page.</p>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is the text for the first page. After it a page break will be added. Scroll down to the second page to see the text there.");
oRun.AddPageBreak();
oRun.AddText("This is the text which starts from the beginning of the second page. ");
oRun.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddPageBreak.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891436&doc=bFpOdCtqTmJ0NWxrZUtxbnc5Ty9kOEJEaVVQQm9WQnE3dXVNK1RJUWZMRT0_IjQ4OTE0MzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>