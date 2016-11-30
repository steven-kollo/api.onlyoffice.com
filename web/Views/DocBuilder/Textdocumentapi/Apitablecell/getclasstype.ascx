<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"tableCell"}</h4>

            <dl class="details">
                <dt>Overrides:</dt>
                <dd>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("textdocumentapi/apitablecellpr/getclasstype") %>">ApiTableCellPr.GetClassType</a>
                        </li>
                    </ul>
                </dd>
            </dl>
<p class="dscr">Get the type of this class.</p>
            
            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <em>"tableCell"</em>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oCell = oTable.GetRow(0).GetCell(0);
oCell.GetContent().GetElement(0).AddText("Cell #1");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
var oClassType = oCell.GetClassType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896291&doc=OXlJZkUvVzdUWk9JZyttRG1mYjh4N1lhQjA2WFYvaWZmYkNnUHRDajBNOD0_IjQ4OTYyOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>