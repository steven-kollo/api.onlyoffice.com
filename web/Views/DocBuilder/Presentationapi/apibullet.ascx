<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiBullet</span>
</h1>
<h4 class="header-gray" id="ApiBullet">new ApiBullet()</h4>
<p class="dscr">Class representing a base bullet class.</p>

<h2>Methods</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apibullet/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

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
oBullet = Api.CreateBullet("-");
oParagraph.SetBullet(oBullet);
oParagraph.AddText(" This is an example of the bulleted paragraph.");
var oClassType = oBullet.GetClassType();
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("Class Type = " + oClassType);
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiBullet.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007720&doc=TlI1OHVoU2UySENBWmorYm4za3FxSk1VYjBTaXRNOWN1ZFdhbFdudUVYZz0_IjUwMDc3MjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>