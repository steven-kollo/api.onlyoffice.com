<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingBefore</span>
</h1>
<h4 class="header-gray" id="SetSpacingBefore">SetSpacingBefore(nBefore, isBeforeAuto<sub>opt</sub>)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("presentationapi/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a>
                </li>
            </ul>
        </dd>
    </dl>
<p class="dscr">
Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>nBefore</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
            </td>
            <td></td>
            <td></td>
            <td>The value of the spacing before the current paragraph measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
        <tr class="tablerow">
            <td><em>isBeforeAuto</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>&lt;optional></td>
            <td>false</td>
            <td>The <em>true</em> value will disable the <em>nBefore</em> parameter.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
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
oParagraph.AddText("This is an example of setting a space before a paragraph. ");
oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ");
oParagraph.AddText("This is due to the fact that the second paragraph has this offset enabled.");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.");
oParagraph.SetSpacingBefore(1440);
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetSpacingBefore.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5009965&doc=LzdiVzNUd3k5c3p3aEVrM0RyTE1Ya09KYmdKVXRTL0M4RjBubGpCMmJVOD0_IjUwMDk5NjUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>