<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPosition</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetPosition(10);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text raised 5 points (10 half-points) above the baseline using the text properties.");
builder.SaveFile("docx", "SetPosition.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>