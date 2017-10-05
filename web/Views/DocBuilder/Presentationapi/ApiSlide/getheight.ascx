<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetHeight</span>
</h1>

<h4 class="header-gray" id="GetHeight">GetHeight() &rarr; {<a href="<%= Url.Action("global") %>#EMU">EMU</a>}</h4>
<p class="dscr">Get the slide height in English measure units.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
oPresentation.SetSizes(254 * 36000, 190 * 36000);
var oSlide = oPresentation.GetCurrentSlide();
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("rect", 200 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
var oSlideHeight = oSlide.GetHeight();
oParagraph.AddText("The slide height = " + oSlideHeight/36000 + " mm");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetHeight.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011443&doc=VUxFTHEzcGpUZWU0Q3RrR2hQNUNMdVllakdwcWlRYllhaGNYWTJjTGluTT0_IjUwMTE0NDMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
