<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreatePresetColor</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreatePresetColor", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("lightYellow"), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreatePresetColor.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004805&doc=VERLRVRQUUwyb1NBMm5FTFhYQ1NWL0d5aFRsSDNuRVRxRjVwTGIreERDUT0_IjUwMDQ4MDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
