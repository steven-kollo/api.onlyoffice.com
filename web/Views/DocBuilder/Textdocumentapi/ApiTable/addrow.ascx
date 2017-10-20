<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddRow</span>
</h1>

<h4 class="header-gray" id="AddRow">AddRow(oCell<sub>opt</sub>, isBefore<sub>opt</sub>) &rarr; {<a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>}</h4>
<p class="dscr">Add a new row to the current table.</p>

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
                        <td>The cell after which the new row will be added. If not specified the new row will be added at the end of the table.</td>
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
                        <td>Add a new row before or after the specified cell. If no cell is specified then this parameter will be ignored.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Returns:</h2>
            <dl class="param-type">
            <dt>
            Type
            </dt>
            <dd>
            <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>
            </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 2x2 table and add a new row, so that it becomes 2x3:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oTable.AddRow(oTable.GetRow(1).GetCell(0), true);
oDocument.Push(oTable);
builder.SaveFile("docx", "AddRow.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894684&doc=WHdydXcwbDlMcXA1dkgxSkpCd1MwMkdXcE5LelFHWUJSbHQwcEoyWGRBUT0_IjQ4OTQ2ODQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
