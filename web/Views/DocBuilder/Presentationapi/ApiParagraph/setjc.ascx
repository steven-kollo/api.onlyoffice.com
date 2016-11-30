<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetJc</span>
</h1>
<h4 class="header-gray" id="SetJc">SetJc(sJc)</h4>

<dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("presentationapi/apiparapr/setjc") %>">ApiParaPr.SetJc</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Set paragraph contents justification.
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
            <td><em>sJc</em></td>
            <td>
                <em>"left"</em>
                |
                <em>"right"</em>
                |
                <em>"both"</em>
                |
                <em>"center"</em>
            </td>
            <td>The parameters will define the justification type that will be applied to the paragraph contents.</td>
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
oParagraph.AddText("This is a paragraph with the text in it aligned by the center. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("center");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the right side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("right");
oDocContent.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with the text in it aligned by the left side. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetJc("left");
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetJc.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5009960&doc=cUVOSnUzdDlrK2Rhb3hDSlFCNjIra0JmdFBJZjNNS0JjRGF4UmRYNWRwND0_IjUwMDk5NjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>