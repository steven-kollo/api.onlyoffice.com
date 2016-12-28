<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveRow</span>
</h1>

<h4 class="header-gray" id="RemoveRow">RemoveRow(oCell) &rarr; {boolean}</h4>
<p class="dscr">Remove the table row with a specified cell.</p>

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
                        <td>The cell which is present in the row that will be removed.</td>
                    </tr>
                </tbody>
                </table>

            <h2>Returns:</h2>
            <p>
            Whether the table is empty after the row removal or there are any rows left.
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
oParagraph.AddText("We create a 3x3 table and remove one row (the second one), so that it becomes 3x2:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oCell = oTable.GetRow(1).GetCell(0);
oTable.RemoveRow(oCell);
oDocument.Push(oTable);
builder.SaveFile("docx", "RemoveRow.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894894&doc=TkdObEtVcEVHYTFHMDFvRjV5SFVFaEtwYUE0L2lwdlNtTE5kUE9ldnlEcz0_IjQ4OTQ4OTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>