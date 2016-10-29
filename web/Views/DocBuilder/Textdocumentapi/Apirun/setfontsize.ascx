<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontSize</span>
</h1>
<p class="dscr">
        Set the font size for the characters of the current text run.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetFontSize(30);
oRun.AddText("This is a text run with the font size set to 15 points (30 half-points).");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetFontSize.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>