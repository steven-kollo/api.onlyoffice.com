<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateNumbering</span>
</h1>

<h4 class="header-gray" id="CreateNumbering">CreateNumbering(sType, nStartAt) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apibullet") %>">ApiBullet</a>}</h4>
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
        <a class="changeable" href="<%= Url.Action("spreadsheetapi/apibullet") %>">ApiBullet</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oBullet = Api.CreateNumbering("ArabicParenR", 1);
oParagraph.SetBullet(oBullet);
oParagraph.AddText(" This is an example of the numbered paragraph.");
oParagraph = Api.CreateParagraph();
oParagraph.SetBullet(oBullet);
oParagraph.AddText(" This is an example of the numbered paragraph.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "CreateNumbering.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006579&doc=dTlCRmVvd2pUUlh2YSswa1pocHpDMVAxWnZQSlBvRWtHOFVEYWJaWDY5Zz0_IjUwMDY1Nzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>