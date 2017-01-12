<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSchemeColor</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateSchemeColor", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSchemeColor = Api.CreateSchemeColor("accent6");
oGs1 = Api.CreateGradientStop(oSchemeColor, 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateSchemeColor.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004812&doc=bDlLNm1mVG9oVXp3emxWeDFGOFhCNk9QcDRXejg3TjlzY0tkMjZhcU9qbz0_IjUwMDQ4MTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>