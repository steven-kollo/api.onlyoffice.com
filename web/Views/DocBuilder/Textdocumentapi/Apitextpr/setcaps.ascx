<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCaps</span>
</h1>
<p class="dscr">
        Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetCaps(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text set to capital letters using the text properties.");
builder.SaveFile("docx", "SetCaps.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>