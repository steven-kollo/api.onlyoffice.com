<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetDefaultTextPr</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
oParagraph = oDocument.GetElement(0);
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(30);
oTextPr.SetLanguage("en-US");
oTextPr.SetFontFamily("Comic Sans MS");
oParagraph.AddText("This is just a text.");
builder.SaveFile("docx", "GetDefaultTextPr.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>