<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveElement</span>
</h1>
<h4 class="header-gray" id="RemoveElement">RemoveElement(nPos)</h4>
<p class="dscr">
Remove element using the position specified.
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
            <td>The element number (position) in the document or inside other element.</td>
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
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is paragraph #1.");
for (var nParaIncrease = 1; nParaIncrease < 5; ++nParaIncrease)
{
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ".");
oDocContent.Push(oParagraph);
}
oDocContent.RemoveElement(2);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed paragraph #3, check that out above.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "RemoveElement.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006400&doc=VElUcmpmaGYvZ0tYN21KQnE1dHdYRi8vNzZ2d2V2ZEUwdEZ3UzR5YUQrST0_IjUwMDY0MDAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>