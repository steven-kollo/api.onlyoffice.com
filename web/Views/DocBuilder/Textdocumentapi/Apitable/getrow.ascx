<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetRow</span>
</h1>

<h4 class="header-gray" id="GetRow">GetRow(nPos) &rarr; {<a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>}</h4>
<p class="dscr">Get the table row by its position in the table.</p>

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
                        <td>The row position within the table.</td>
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
builder.SaveFile("docx", "GetRow.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894684&doc=VkVqMTVwRGt4ZFo4YjV1a0lHTFV3WGpOL21ub2s2QzZHRnNpODNmSjNqTT0_IjQ4OTQ2ODQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>