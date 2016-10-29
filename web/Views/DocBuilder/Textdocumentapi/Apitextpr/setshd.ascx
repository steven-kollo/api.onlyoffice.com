<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetShd</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetShd("clear", 0, 255, 0);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the shading set to green.");
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>