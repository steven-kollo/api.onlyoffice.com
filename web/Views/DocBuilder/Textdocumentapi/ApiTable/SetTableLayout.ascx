<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableLayout</span>
</h1>

<h4 class="header-gray" id="SetTableLayout">SetTableLayout(sType)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">ApiTablePr.SetTableLayout</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Specify the algorithm which will be used to lay out the contents of this table within the document.</p>

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
                        <td><em>sType</em></td>
                        <td>
<em>"autofit"</em>
|
<em>"fixed"</em>
                        </td>
                        <td>The type of the table layout in the document.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the table cells to preserve their size:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetTableLayout("fixed");
oCell = oTable.GetRow(0).GetCell(0);
oCell.GetContent().GetElement(0).AddText("Fixed layout");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableLayout.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4895070&doc=STJ2V2M4aUJQQU9DdXBQbGY3Q3dmeUFjVGJmdEV3UUh5ZTRDTWQwb3I5dz0_IjQ4OTUwNzAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
