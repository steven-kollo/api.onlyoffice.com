<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddLineBreak</span>
</h1>
<h4 class="header-gray" id="AddLineBreak">AddLineBreak()</h4>
    
<p class="dscr">
Add a line break to the current run position and start the next element from a new line.
</p>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is the text for the first line. Nothing special.");
oRun.AddLineBreak();
oRun.AddText("This is the text which starts from the beginning of the second line. ");
oRun.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddLineBreak.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891435&doc=b1lSdFlyTlNuTzlOY25LYldsTjB2cW9XZGFLSEkrd1BaOGgwaHRNam9SYz0_IjQ4OTE0MzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>