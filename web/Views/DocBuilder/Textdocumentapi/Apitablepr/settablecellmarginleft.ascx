<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableCellMarginLeft</span>
</h1>
<h4 class="header-gray" id="SetTableCellMarginLeft">SetTableCellMarginLeft(nValue)</h4>
                
<p class="dscr">Specify the amount of space which will be present between the left extent of the cell contents and the leftborder of all table cells within the parent table (or table row).</p>

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
                        <td><em>nValue</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>The value for the amount of space to the left extent of the cell measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the left margin for the cells in the table to be half an inch:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTablePr.SetTableCellMarginLeft(720);
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableCellMarginLeft.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896658&doc=bW1UVzVqTGU1WEs4ZHNHRjdmbHp3dlp4THltako5blc0ZStoa3VPVmdTWT0_IjQ4OTY2NTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>