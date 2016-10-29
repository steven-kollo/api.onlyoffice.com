<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiDrawing</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(155, 64, 1), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
oDrawing.SetSize(2000 * 635, 2000 * 635);
oDrawing.SetWrappingStyle("inFront");
oDrawing.SetHorAlign("margin", "right");
oDrawing.SetVerAlign("page", "top");
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "ApiDrawing.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>