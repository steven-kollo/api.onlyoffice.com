<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTitlePage</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oFooter;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This page does not have a footer, as it is a title page. ");
oParagraph.AddText("Scroll down the page to see if the footer was removed.");
var oSection = oDocument.CreateSection(oParagraph);
oSection.SetTitlePage(true);
oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("This is page footer. ");
oParagraph.AddText("You will only see it for page #2.");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is page #2 and it has a footer. ");
oParagraph.AddText("Scroll down the page to see it.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetTitlePage.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>