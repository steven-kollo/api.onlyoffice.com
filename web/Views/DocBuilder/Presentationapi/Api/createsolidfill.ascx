<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSolidFill</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateSolidFill", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oRGBColor = Api.CreateRGBColor(0, 255, 0);
oFill = Api.CreateSolidFill(oRGBColor);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateSolidFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004820&doc=MUJXR0xaSzh0RTNHaGxhSnppK09TT1JGSDB3UmtleS8wSnlHZ3BIaitDST0_IjUwMDQ4MjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>