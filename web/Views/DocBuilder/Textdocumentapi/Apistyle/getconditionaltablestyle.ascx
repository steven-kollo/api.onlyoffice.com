<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetConditionalTableStyle</span>
</h1>

<h4 class="header-gray" id="GetConditionalTableStyle">GetConditionalTableStyle(sType<sub>opt</sub>) &rarr; {<a href="<%= Url.Action("textdocumentapi/apitablestylepr") %>">ApiTableStylePr</a>}</h4>
<p class="dscr">Get a set of formatting properties which will be conditionally applied to the parts of a table that match therequirement specified in the <em>sType</em> parameter.</p>

            <h2>Parameters:</h2>
                <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Attributes</td>
                            <td>Default</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>sType</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#TableStyleOverrideType">TableStyleOverrideType</a>
                        </td>
                        <td> &lt;optional></td>
                        <td>"wholeTable"</td>
                        <td>The part of the table which the formatting properties must be applied to.</td>
                    </tr>
                </tbody>
                </table>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitablestylepr") %>">ApiTableStylePr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTableStyle, oTable, oCellContent;
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 100);
oDocument.Push(oTable);
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTable.SetStyle(oTableStyle);
oTable.SetTableLook(true, true, true, true, true, true);
oTableStyle.GetTablePr().SetTableBorderTop("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderBottom("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderLeft("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderRight("single", 4, 0, 0, 0, 255);
oTableStyle.GetTablePr().SetTableBorderInsideV("single", 4, 0, 255, 0, 0);
oTableStyle.GetTablePr().SetTableBorderInsideH("single", 4, 0, 255, 0, 0);
oTableStyle.GetConditionalTableStyle("bandedColumn").GetTextPr().SetItalic(true);
oCellContent = oTable.GetRow(0).GetCell(0).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This cell font is set to italic");
oCellContent = oTable.GetRow(1).GetCell(0).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This cell font is also set to italic");
oCellContent = oTable.GetRow(0).GetCell(1).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This set font remains default");
oCellContent = oTable.GetRow(1).GetCell(1).GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("This set font also remains default");
builder.SaveFile("docx", "GetConditionalTableStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892601&doc=ZExzL2hDQlBnbUNvRmNoSkxhaHg5b1ZqK096REE0YmVKM2JCRytScXN6dz0_IjQ4OTI2MDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>