<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingAfter</span>
</h1>
<h4 class="header-gray" id="SetSpacingAfter">SetSpacingAfter(nAfter, isAfterAuto<sub>opt</sub>)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("spreadsheetapi/apiparapr/setspacingafter") %>">ApiParaPr.SetSpacingAfter</a>
                </li>
            </ul>
        </dd>
    </dl>
<p class="dscr">
Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.
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
            <td><em>nAfter</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
            </td>
            <td></td>
            <td></td>
            <td>The value of the spacing after the current paragraph measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
        <tr class="tablerow">
            <td><em>isAfterAuto</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>&lt;optional></td>
            <td>false</td>
            <td>The <em>true</em> value will disable the <em>nAfter</em> parameter.</td>
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
oParagraph.AddText("This is an example of setting a space after a paragraph. ");
oParagraph.AddText("The second paragraph will have an offset of one inch from the top. ");
oParagraph.AddText("This is due to the fact that the first paragraph has this offset enabled.");
oParagraph.SetSpacingAfter(1440);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph and it is one inch away from the first paragraph.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "SetSpacingAfter.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006325&doc=MVV5TW50VmxDRGxuSnU0TlVHbGdLaG1Ua3UyTmg0OW96QlZ5TmRFSUhNQT0_IjUwMDYzMjUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>