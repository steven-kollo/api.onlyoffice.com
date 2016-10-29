<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddLineBreak</span>
</h1>
<p class="dscr">
        Add line break to the current position and start the next element from a new line.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = oParagraph.AddText("This is the text for the first line. Nothing special.");
oParagraph.AddLineBreak();
oRun = oParagraph.AddText("This is the text which starts from the beginning of the second line. ");
oRun = oParagraph.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
builder.SaveFile("docx", "ApiParagraph.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>