<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVerticalAlign</span>
</h1>
<h4 class="header-gray" id="SetVerticalAlign">SetVerticalAlign(sType)</h4>
                
<p class="dscr">Specify the vertical alignment for text contents within the current table cell.</p>

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
<em>"top"</em>
|
<em>"center"</em>
|
<em>"bottom"</em>
                        </td>
                        <td>The available types of the vertical alignment for the text contents of the current table cell.</td>
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
oTableCellPr.SetVerticalAlign("bottom");
oCell = oTable.GetRow(0).GetCell(0);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Align bottom");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetVerticalAlign.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896512&doc=SUw0Rm1Da0hQUDM1TTQ5OVdyUzlKV3paYmRPRjRnVFpHb1RpbWdlcm15WT0_IjQ4OTY1MTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>