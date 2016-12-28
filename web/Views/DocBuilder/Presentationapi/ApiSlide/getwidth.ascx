<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetWidth</span>
</h1>

<h4 class="header-gray" id="GetWidth">GetWidth() &rarr; {<a href="<%= Url.Action("global") %>#EMU">EMU</a>}</h4>
<p class="dscr">Get the slide width in English measure units.</p>

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
var oSlideWidth = oSlide.GetWidth();
oParagraph.AddText("The slide width = " + oSlideWidth/36000 + " mm");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetWidth.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011468&doc=VDh4NXZiNmVqcHJtYlM0UUs3cFgwRDBSemsrRDZXY1dPaDFVYnZtT2R4TT0_IjUwMTE0Njgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>