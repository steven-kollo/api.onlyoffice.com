<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"slide"}</h4>
<p class="dscr">Get the type of this class.</p>

            <h5>Returns:</h5>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <em>"slide"</em>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(0, 0, 255), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(61, 74, 107), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
var oClassType = oSlide.GetClassType();
oParagraph.AddText("Class Type = " + oClassType);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetClassType.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011415&doc=bGZINXl4YkQ0UXBtVmRsQXFqbENVTFM0T3FrZ25mSkRDQUNOQkEzdVpqdz0_IjUwMTE0MTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
