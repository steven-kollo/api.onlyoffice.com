<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreatePatternFill</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreatePatternFill", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oFill = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 224, 204), Api.CreateRGBColor(255, 164, 101));
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateLinearGradientFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004801&doc=NXNjMXRTakg4SkdndEgwc3VETi94Ti9jOVFTZFNhWlZXM0ZaSGFDQzdRRT0_IjUwMDQ4MDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
