<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddColumnBreak</span>
</h1>

<h4 class="header-gray" id="AddColumnBreak">AddColumnBreak()</h4>
<p class="dscr">Add a column break to the current run position and start the next element from a new column.</p>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
var oSection = oDocument.GetFinalSection(oParagraph);
oSection.SetEqualColumns(2, 720);
oRun = Api.CreateRun();
oRun.AddText("This is the text for the first column. It is written all in one text run. Nothing special.");
oRun.AddColumnBreak();
oRun.AddText("This is the text which starts from the beginning of the second column. ");
oRun.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddColumnBreak.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891431&doc=ZnhjOWtjQnFoaGkvQVg1dXR1TjR6UUFVNU1DTUltclNkT0NVTDFnVFJ2VT0_IjQ4OTE0MzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>