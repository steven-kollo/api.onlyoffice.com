<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiParaPr</span>
</h1>
<h4 class="header-gray" id="ApiParaPr">new ApiParaPr()</h4>
<p class="dscr">Class representing a paragraph properties.</p>
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
            <td><a href="<%= Url.Action("presentationapi/apiparapr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setbullet") %>">SetBullet</a></td>
            <td>Set the bullet or numbering to the current paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a></td>
            <td>Set the paragraph first line indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setindleft") %>">SetIndLeft</a></td>
            <td>Set the paragraph left side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setindright") %>">SetIndRight</a></td>
            <td>Set the paragraph right side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setjc") %>">SetJc</a></td>
            <td>Set paragraph contents justification.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a></td>
            <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a></td>
            <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setspacingline") %>">SetSpacingLine</a></td>
            <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/settabs") %>">SetTabs</a></td>
            <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
        </tr>
    </tbody>
</table>

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
oParaPr = oParagraph.GetParaPr();
oParaPr.SetJc("center");
oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ");
oParagraph.AddText("The justification is specified in the paragraph style. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiParaPr.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5010013&doc=UGhrbVd4WE1DYkE1cXd0RSs5Nkl0ckZvV3ZlV29seTJJdExiZVcxc0hnZz0_IjUwMTAwMTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
