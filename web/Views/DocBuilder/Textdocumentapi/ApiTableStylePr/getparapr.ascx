<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetParaPr</span>
</h1>

<h4 class="header-gray" id="GetParaPr">GetParaPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>}</h4>
<p class="dscr">Get the set of the paragraph properties which will be applied to all the paragraphs within a table which match the conditional formatting type.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTableStylePr, oParaPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the text alignment to center for row #1:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableStylePr = oTableStyle.GetConditionalTableStyle("firstRow");
oTable.SetTableLook(true, true, true, true, true, true);
oParaPr = oTableStylePr.GetParaPr();
oParaPr.SetJc("center");
oParagraph = oTable.GetRow(0).GetCell(0).GetContent().GetElement(0);
oParagraph.AddText("This is a paragraph with the text in it aligned by the center.");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "GetParaPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898068&doc=d1hFQkgzRHhvQk1VcGlOZnYvWkltSHZVSVk3ZUxIRXY0NTVHMGo4MjFTVT0_IjQ4OTgwNjgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
