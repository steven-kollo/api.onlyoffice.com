<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateChart</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateChart", "presentationapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oShape = Api.CreateChart("bar3D", [[200, 240, 280],[250, 260, 280]], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oShape.SetSize(300 * 36000, 130 * 36000);
oShape.SetPosition(608400, 1267200);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateChart.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007679&doc=TDgrVCtGazRjUnJtTnA0VGUra2hlVDNuV0JHMkVGeloxdDBNNGJ4Z1hKQT0_IjUwMDc2Nzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
