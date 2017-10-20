<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTableRowPr</span>
</h1>

<h4 class="header-gray" id="GetTableRowPr">GetTableRowPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a>}</h4>
<p class="dscr">Get  the set of the table row properties which will be applied to all the rows within a table which match the conditional formatting type.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTableStylePr, oParaPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the height of half an inch to all the rows:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableStylePr = oTableStyle.GetConditionalTableStyle("wholeTable");
oTable.SetTableLook(true, true, true, true, true, true);
oTableStylePr.GetTableRowPr().SetHeight("atLeast", 720);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "GetTableRowPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898076&doc=MVBTOXJnUW9semx3a3JaYXFSbS9JRTRDK3k5Q2tRZzA3QjNKSUVaeExzTT0_IjQ4OTgwNzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
