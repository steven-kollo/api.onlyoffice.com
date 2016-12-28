<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTablePr</span>
</h1>

<h4 class="header-gray" id="GetTablePr">GetTablePr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>}</h4>
<p class="dscr">Get the set of the table properties which will be applied to all the regions within a table which match the conditional formatting type.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTableStylePr, oParaPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the bottom 4 point green border to it:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableStylePr = oTableStyle.GetConditionalTableStyle("wholeTable");
oTable.SetTableLook(true, true, true, true, true, true);
oTableStylePr.GetTablePr().SetTableBorderBottom("single", 32, 0, 0, 255, 0);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "GetTablePr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898075&doc=TUkwb0tiVGNMaUYrZGlZdXdZQnZTV0NoTEd3a01Kb2wyVlh6M3RHOWFYQT0_IjQ4OTgwNzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>