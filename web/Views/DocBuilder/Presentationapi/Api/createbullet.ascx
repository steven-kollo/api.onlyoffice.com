<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateBullet</span>
</h1>
<h4 class="name" id="CreateBullet">CreateBullet(sBullet) &rarr; {<a href="<%= Url.Action("presentationapi/apibullet") %>">ApiBullet</a>}</h4>
<p class="dscr">
Create a bullet for a paragraph with the character or symbol specified with the <em>sBullet</em> parameter.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sBullet</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The character or symbol which will be used to create the bullet for the paragraph.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("presentationapi/apibullet") %>">ApiBullet</a>
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
oBullet = Api.CreateBullet("-");
oParagraph.SetBullet(oBullet);
oParagraph.AddText(" This is an example of the bulleted paragraph.");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "CreateBullet.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007659&doc=RUk2TmpFdWpTK3lUb0h4c1FCOGlTYnNseFQxdzJ5S21yeVFubldkN05TYz0_IjUwMDc2NTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>