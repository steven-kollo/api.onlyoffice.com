<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCellMarginLeft</span>
</h1>
<h4 class="header-gray" id="SetCellMarginLeft">SetCellMarginLeft(nValue<sub>nullable</sub>)</h4>
                
<p class="dscr">Specify the amount of space which will be left between the left extent of the cell contents and the border of a specific table cell within a table.</p>

            <h2>Parameters:</h2>
            <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Attributes</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>nValue</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td> &lt;nullable><br></td>
                        <td>The value for the amount of space to the left extent of the cell measured in twentieths of a point (1/1440 of an inch). If this value is <em>null</em>, then default table cell left margin will be used,otherwise the table cell left margin will be overridden with the specified value for the current cell.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableCellPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and add a half an inch wide left margin to all cells:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableCellPr = oTableStyle.GetTableCellPr();
oTableCellPr.SetCellMarginLeft(720);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetCellMarginLeft.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896458&doc=bFRqYVNCTlhidDNMVHpGTEt1M3ltV3kyRTBaZ3pWaVJham1yQksyMnVhWT0_IjQ4OTY0NTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>