<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllObjects</span>
</h1>

<h4 class="header-gray" id="RemoveAllObjects">RemoveAllObjects()</h4>
<p class="dscr">Remove all the objects from the current slide.</p>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
oPresentation.SetSizes(254 * 36000, 190 * 36000);
var oSlide = oPresentation.GetCurrentSlide();
oSlide.RemoveAllObjects();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "RemoveAllObjects.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011291&doc=NExpMkRTNHdpdTgzQ2J2Y3BiRVREcTJzdTgreElIalB4RTltOHZlNjVMcz0_IjUwMTEyOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>