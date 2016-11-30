<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateNumbering</span>
</h1>
<h4 class="header-gray" id="CreateNumbering">CreateNumbering(sType, nStartAt) &rarr; {<a href="<%= Url.Action("presentationapi/apibullet") %>">ApiBullet</a>}</h4>
<p class="dscr">
Create a bullet for a paragraph with the character or symbol specified with the <em>sType</em> parameter.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#BulletType">BulletType</a>
            </td>
            <td></td>
            <td>The numbering type the paragraphs will be numbered with.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nStartAt</em></td>
            <td>
                <em>number</em>
            </td>
            <td>&lt;optional></td>
            <td>The number the first numbered paragraph will start with.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a class="changeable" href="<%= Url.Action("presentationapi/apibullet") %>">ApiBullet</a>
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
oBullet = Api.CreateNumbering("ArabicParenR", 1);
oParagraph.SetBullet(oBullet);
oParagraph.AddText(" This is an example of the numbered paragraph.");
oParagraph = Api.CreateParagraph();
oParagraph.SetBullet(oBullet);
oParagraph.AddText(" This is an example of the numbered paragraph.");
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateNumbering.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007696&doc=cVVmWnJsRGRnS1Y0bDU4VXBialdzMU93TDdCdEtCNGJ3L05FMXNHQ2pzbz0_IjUwMDc2OTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>