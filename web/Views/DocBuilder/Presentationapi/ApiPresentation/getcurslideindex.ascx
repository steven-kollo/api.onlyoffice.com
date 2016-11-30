<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetCurSlideIndex</span>
</h1>

<h4 class="header-gray" id="GetCurSlideIndex">GetCurSlideIndex() &rarr; {number}</h4>
<p class="dscr">Get the index for the current slide.</p>

            <h5>Returns:</h5>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <em>number</em>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
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
var oCurrentSlideIndex = oPresentation.GetCurSlideIndex();
oParagraph.AddText("Current Slide Index = " + oCurrentSlideIndex);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetCurSlideIndex.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011274&doc=RWJkY05kRTVOUzJ4M3pJaXVFaHdDcFR3M0RZTXU5RytlZ2tGZ1hlZEorZz0_IjUwMTEyNzQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>