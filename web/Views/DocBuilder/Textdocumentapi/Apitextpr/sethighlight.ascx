<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetHighlight</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetHighlight(255, 255, 0, false);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text highlighted with yellow color using the text properties.");
builder.SaveFile("docx", "SetHighlight.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>