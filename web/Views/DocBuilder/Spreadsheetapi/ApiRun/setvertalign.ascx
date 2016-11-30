<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVertAlign</span>
</h1>
<h4 class="header-gray" id="SetVertAlign">SetVertAlign(sType)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("spreadsheetapi/apitextpr/setvertalign") %>">ApiTextPr.SetVertAlign</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Specify the alignment which will be applied to the contents of this run in relation to the defaultappearance of the run text:
</p>
        <ul>
            <li><b>"baseline"</b> - the characters in the current text run will be aligned by the default text baseline.</li>
            <li><b>"subscript"</b> - the characters in the current text run will be aligned below the default text baseline.</li>
            <li><b>"superscript"</b> - the characters in the current text run will be aligned above the default text baseline.</li>
        </ul>

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
            <td><em>sType</em></td>
            <td>
                <em>"baseline"</em>
                |
                <em>"subscript"</em>
                |
                <em>"superscript"</em>
            </td>
            <td>The vertical alignment type applied to the text contents.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph, oRun;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetVertAlign("subscript");
oRun.AddText("This is a text run with the text aligned below the baseline vertically. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetVertAlign("baseline");
oRun.AddText("This is a text run with the text aligned by the baseline vertically. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetVertAlign("superscript");
oRun.AddText("This is a text run with the text aligned above the baseline vertically.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetVertAlign.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006262&doc=K1dRWlhhZnRsd3Rtd3N2QnpRL05obGdZd29Uc200RDcwQzlZYjVwNytEYz0_IjUwMDYyNjIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>