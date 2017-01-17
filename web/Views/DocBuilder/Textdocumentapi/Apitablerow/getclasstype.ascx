<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"tableRow"}</h4>
                <dl class="details">
                <dt>Overrides:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablerowpr/getclasstype") %>">ApiTableRowPr.GetClassType</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Get the type of this class.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <em>"tableRow"</em>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRow;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
var oClassType = oTableRow.GetClassType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896837&doc=VlRueStFOFp6R25lR2wrdWc2VDJlVkJmbTlYRFlvK0VXREZlQ0RxMnc2ND0_IjQ4OTY4Mzci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>