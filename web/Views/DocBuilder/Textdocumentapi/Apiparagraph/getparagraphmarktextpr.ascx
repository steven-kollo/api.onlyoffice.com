<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetParagraphMarkTextPr</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParagraphMarkTextPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the font size, font color and spacing for the paragraph mark. ");
oParagraph.AddText("You can see it if you download the document, open it and enable the invisible symbols display.");
var oParagraphMarkTextPr = oParagraph.GetParagraphMarkTextPr();
oParagraphMarkTextPr.SetFontSize(52);
oParagraphMarkTextPr.SetColor(255, 255, 0, false);
oParagraphMarkTextPr.SetSpacing(5);
builder.SaveFile("docx", "GetParagraphMarkTextPr.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>