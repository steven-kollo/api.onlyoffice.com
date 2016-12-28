<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableLook</span>
</h1>

<h4 class="header-gray" id="SetTableLook">SetTableLook(isFirstColumn, isFirstRow, isLastColumn, isLastRow, isHorBand, isVerBand)</h4>
<p class="dscr">Specify the components of the conditional formatting of the referenced table style (if one exists)which will be applied to the set of table rows with the current table-level property exceptions. A table style canspecify up to six different optional conditional formats, for example, different formatting for first column, which then can be applied or omitted from individual table rows in the parent table.</p>
<p>The default setting is to apply the row and column banding formatting, but not the first row, last row, firstcolumn, or last column formatting.</p>

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
                        <td><em>isFirstColumn</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>Specifies that the first column conditional formatting will be applied to the table.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isFirstRow</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>Specifies that the first row conditional formatting will be applied to the table.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isLastColumn</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>Specifies that the last column conditional formatting will be applied to the table.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isLastRow</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>Specifies that the last row conditional formatting will be applied to the table.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isHorBand</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>Specifies that the horizontal banding conditional formatting will not be applied to the table.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>isVerBand</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>Specifies that the vertical banding conditional formatting will not be applied to the table.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the table look to override the current table style:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oTable.SetTableLook(true, true, true, true, true, true);
oTableStyle.GetConditionalTableStyle("topLeftCell").GetTableCellPr().SetShd("clear", 255, 0, 0);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableLook.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4895057&doc=UDl3VEJycTdiQjhwSFUzUkxVSTlWTFVKekZjUEU1eE1JZzl2TEEzOStVST0_IjQ4OTUwNTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>