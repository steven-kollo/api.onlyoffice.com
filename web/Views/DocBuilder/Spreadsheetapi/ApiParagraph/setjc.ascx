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
                    <a href="<%= Url.Action("spreadsheetapi/apiparapr/setjc") %>">ApiParaPr.SetJc</a>
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
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
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
builder.SaveFile("xlsx", "SetJc.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006331&doc=VlErZ2RCTVl0blY1d3FVWHVPV1RHNTZteTJZUjhrOTcxeWdtZE1aZ3BCOD0_IjUwMDYzMzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>