<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">MergeCells</span>
</h1>

<h4 class="header-gray" id="MergeCells">MergeCells(aCells) &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>}</h4>
<p class="dscr">Merge an array of cells. If the merge is done successfully it will return the resulting merged cell, otherwise the result will be <em>"null"</em>.</p>                
<div class="note"><b>Please note</b>: the number of cells in any row and the number of rows in the current table may be changed.</div>

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
                        <td><em>aCells</em></td>
                        <td>
                        <em>Array.&lt;<a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>></em>
                        </td>
                        <td>The array of cells to be merged.</td>
                    </tr>
                </tbody>
                </table>
<h2>Returns:</h2>
            <dl class="param-type">
            <dt>
            Type
            </dt>
            <dd>
            <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
            </dd>
            </dl>
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable, oTableStyle, oCell;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(5, 5);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oCell = oTable.MergeCells([oTable.GetRow(1).GetCell(1), oTable.GetRow(1).GetCell(2), oTable.GetRow(2).GetCell(1), oTable.GetRow(2).GetCell(2)]);
oCell.GetContent().GetElement(0).AddText("Merged cell");
oDocument.Push(oTable);
builder.SaveFile("docx", "MergeCells.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894751&doc=YTB1V29rR1lSVDZRRTV0YTk4OVRzaG85T2ZRb2loOUsxWnp0ZjhkLzVCOD0_IjQ4OTQ3NTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>