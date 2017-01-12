<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableInd</span>
</h1>

<h4 class="header-gray" id="SetTableInd">SetTableInd(nValue)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablepr/settableind") %>">ApiTablePr.SetTableInd</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Specify the indentation which will be added before the leading edge of the current table in the document (theleft edge in a left-to-right table, and the right edge in a right-to-left table).</p>

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
                        <td><em>nValue</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td>The indentation value measured in twentieths of a point (1/1440 of an inch).</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the indent of 1 inch for the table:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 50);
oTable.SetStyle(oTableStyle);
oTable.SetTableInd(1440);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableInd.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4895049&doc=UGhLU1Rud0JVZXpVTGZ1aHBXOEhNTEUrdWdud2pRbUt1S0w2RklYeE94QT0_IjQ4OTUwNDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>