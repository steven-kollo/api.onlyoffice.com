<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBottomBorder</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first paragraph. We will add a thin red border below it.");
oParagraph.SetBottomBorder("single", 8, 0, 255, 0, 0);
builder.SaveFile("docx", "SetBottomBorder.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>