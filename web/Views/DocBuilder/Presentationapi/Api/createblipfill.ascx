<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateBlipFill</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateBlipFill", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oFill = Api.CreateBlipFill("https://api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile");
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateBlipFill.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007636&doc=cGwraURxM29qWXVXRkxMUkpmNWlITjBLbktlMjZtTkllbjlJbE43LzlObz0_IjUwMDc2MzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>