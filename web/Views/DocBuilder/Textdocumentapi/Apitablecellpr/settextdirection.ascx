<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTextDirection</span>
</h1>
<h4 class="header-gray" id="SetTextDirection">SetTextDirection(sType)</h4>
                
<p class="dscr">Specify the direction of the text flow for this table cell.</p>

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
<em>"lrtb"</em>
|
<em>"tbrl"</em>
|
<em>"btlr"</em>
                        </td>
                        <td>The available types of the text direction in the table cell: <em>"lrtb"</em> - text direction left-to-right moving from top to bottom, <em>"tbrl"</em> - text direction top-to-bottom moving from right to left, <em>"btlr"</em> - text direction bottom-to-top moving from left to right.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableCellPr;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("atLeast", 1440);
oTableCellPr = oTableStyle.GetTableCellPr();
oTableCellPr.SetTextDirection("btlr");
oCell = oTable.GetRow(0).GetCell(0);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("btlr");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTextDirection.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896505&doc=RG5OZFZOeUhqM2wvZWlRTDhUSGFsVkxXMmlNVmhwZGJ5d2REZEVORFlBOD0_IjQ4OTY1MDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>