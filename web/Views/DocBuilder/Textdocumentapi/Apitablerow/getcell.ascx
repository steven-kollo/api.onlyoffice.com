<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetCell</span>
</h1>

<h4 class="header-gray" id="GetCell">GetCell(nPos) &rarr; {<a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>}</h4>
<p class="dscr">Get the cell by its position.</p>

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
                        <td>The cell position in the current table.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRow;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("atLeast", 1440);
oCell = oTableRow.GetCell(1);
oCell.SetVerticalAlign("bottom");
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Align bottom");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "GetCell.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896826&doc=R1BiK3NBdmxCNzNxMW9tZzB6UUE5MGZpV1VPbFFPeUd3UWdlWHBjMVNqYz0_IjQ4OTY4MjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>