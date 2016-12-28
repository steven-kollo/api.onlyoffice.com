<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>
<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"presentation"}</h4>
<p class="dscr">Get the type of this class.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <em>"presentation"</em>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
var oClassType = oPresentation.GetClassType();
oParagraph.AddText("Class Type = " + oClassType);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetClassType.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011271&doc=YjdOcURrK1QwRFNwdllHSkZNTEZhY1NWNXUvdG5WbEE2T2NUa0ZGSXNOVT0_IjUwMTEyNzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>