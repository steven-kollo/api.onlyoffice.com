<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStrikeout</span>
</h1>
<p class="dscr">
        Specify that the contents of this run are displayed with a single horizontal line through the center of the line.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetStrikeout(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text struck out with a single line.");
builder.SaveFile("docx", "SetStrikeout.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>