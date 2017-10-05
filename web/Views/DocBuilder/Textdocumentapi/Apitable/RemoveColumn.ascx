<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveColumn</span>
</h1>

<h4 class="header-gray" id="RemoveColumn">RemoveColumn(oCell) &rarr; {boolean}</h4>
<p class="dscr">Remove the table column with a specified cell.</p>

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
                        <td><em>oCell</em></td>
                        <td>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                        </td>
                        <td>The cell which is present in the column that will be removed.</td>
                    </tr>
                </tbody>
                </table>

            <h2>Returns:</h2>
            <p>
            Whether the table is empty after the column removal or there are any columns left.
            </p>
            <dl class="param-type">
            <dt>
            Type
            </dt>
            <dd>
            <em>boolean</em>
            </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and remove one column (the second one), so that it becomes 2x3:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oCell = oTable.GetRow(2).GetCell(1);
oTable.RemoveColumn(oCell);
oDocument.Push(oTable);
builder.SaveFile("docx", "RemoveColumn.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894835&doc=dENRQzV4TEVuV3h4VVRJaUxzSEJncHdxRkhHTWM5VlMvUWxYRm9sa2prbz0_IjQ4OTQ4MzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
