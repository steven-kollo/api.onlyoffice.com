<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddColumnBreak</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
var oSection = oDocument.GetFinalSection();
oSection.SetEqualColumns(2, 720);
oRun = oParagraph.AddText("This is the text for the first column. It is written all in one text run. Nothing special.");
oParagraph.AddColumnBreak();
oRun = oParagraph.AddText("This is the text which starts from the beginning of the second column. ");
oRun = oParagraph.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
builder.SaveFile("docx", "AddColumnBreak.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>