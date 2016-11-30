<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddElement</span>
</h1>
<h4 class="header-gray" id="AddElement">AddElement(nPos, oElement)</h4>
    <p class="dscr">
        Add paragraph or table using its position in the document.
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
            <td><em>nPos</em></td>
            <td>
                <em>number</em>
            </td>
            <td>The position where the current element will be added.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oElement</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
            </td>
            <td>The document element which will be added at the current position.</td>
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
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oDocContent.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.");
oDocContent.AddElement(oParagraph);
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "AddElement.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006393&doc=MlUzWU53d3JRdlp5aGNoZ0I1RXlBMHFsRmE2OHhSU2xpdlQ3K2tkVE1uWT0_IjUwMDYzOTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>