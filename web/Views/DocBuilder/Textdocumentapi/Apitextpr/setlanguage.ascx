<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetLanguage</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetLanguage("en-CA");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the language set to English (Canada) using the text properties.");
builder.SaveFile("docx", "SetLanguage.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>