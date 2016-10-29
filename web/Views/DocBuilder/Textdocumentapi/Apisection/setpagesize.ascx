<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPageSize</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oHeader;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with a page size set. ");
oParagraph.AddText("The page width is 5 inches (7200 twentieths of a point). ");
oParagraph.AddText("The page height is 3 inches (4320 twentieths of a point). ");
oParagraph.AddText("The font size is default (11 points).");
var oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(720, 720, 720, 720);
oSection.SetPageSize(7200, 4320);
builder.SaveFile("docx", "SetPageSize.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>