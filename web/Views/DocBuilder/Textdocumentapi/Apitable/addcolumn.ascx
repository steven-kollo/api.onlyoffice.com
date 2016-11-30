<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddColumn</span>
</h1>

<h4 class="header-gray" id="AddColumn">AddColumn(oCell<sub>opt</sub>, isBefore<sub>opt</sub>)</h4>
<p class="dscr">Add a new column to the current table.</p>

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
                        <td><em>oCell</em></td>
                        <td>
                            <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                        </td>
                        <td>&lt;optional><br>
                        </td>
                        <td></td>
                        <td>The cell after which the new column will be added. If not specified the new column will be added at the end of the table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>isBefore</em></td>
                        <td>
                            <em>boolean</em>
                        </td>
                        <td>&lt;optional><br>
                        </td>
                        <td>false
                    </td>
                        <td>Add a new column before or after the specified cell. If no cell is specified then this parameter will be ignored.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 2x2 table and add a new column, so that it becomes 3x2:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oTable.AddColumn(oTable.GetRow(0).GetCell(1), true);
oDocument.Push(oTable);
builder.SaveFile("docx", "AddColumn.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894681&doc=LzhEYUZJcmUrMDFuY2lNSytaSHJJVGZNK3RzcVZFTEd4cTd1cGRRdGtHZz0_IjQ4OTQ2ODEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>