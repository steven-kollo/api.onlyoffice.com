<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingLine</span>
</h1>
<p class="dscr">
        Set the paragraph line spacing. If the value of the <code>sLineRule</code> parameter is either <code>"atLeast"</code>or <code>"exact"</code>, then the value of <code>nLine</code> will be interpreted as twentieths of a point. Ifthe value of the <code>sLineRule</code> parameter is <code>"auto"</code>, then the value of the <code>nLine</code>parameter will be interpreted as 240ths of a line.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle1 = oDocument.CreateStyle("My document style #1");
oParaPr = oMyStyle1.GetParaPr();
oParaPr.SetSpacingLine(3 * 240, "auto");
var oMyStyle2 = oDocument.CreateStyle("My document style #2");
oParaPr = oMyStyle2.GetParaPr();
oParaPr.SetSpacingLine(200, "exact");
var oMyStyle3 = oDocument.CreateStyle("My document style #3");
oParaPr = oMyStyle3.GetParaPr();
oParaPr.SetSpacingLine(400, "atLeast");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oMyStyle1);
oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle2);
oParagraph.AddText("Paragraph 2. Spacing: exact 10 points.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle3);
oParagraph.AddText("Paragraph 3. Spacing: atLeast 20 points.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetSpacingLine.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>