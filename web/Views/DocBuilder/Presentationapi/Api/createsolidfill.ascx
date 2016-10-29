<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSolidFill</span>
</h1>
<p class="dscr">
        Create a solid fill which allows to fill the object using a selected solid color as the object background.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oRGBColor = Api.CreateRGBColor(0, 255, 0);
oFill = Api.CreateSolidFill(oRGBColor);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateSolidFill.pptx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>