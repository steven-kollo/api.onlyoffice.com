<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetWidth</span>
</h1>

<h4 class="header-gray" id="SetWidth">SetWidth(sType, nValue<sub>opt</sub>)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setwidth") %>">ApiTableCellPr.SetWidth</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Set the preferred width for the current table cell.</p>

            <h2>Parameters:</h2>
            <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Attributes</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>sType</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#TableWidth">TableWidth</a>
                        </td>
                        <td></td>
                        <td>Type of the width value from one of the available width values types.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nValue</em></td>
                        <td>
                        <em>number</em>
                        </td>
                        <td>  &lt;optional></td>
                        <td>The table cell width value measured in positive integers.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetWidth("twips", 2880);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("2 inches");
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetWidth("twips", 1440);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("1 inch");
oCell = oTable.GetRow(0).GetCell(2);
oCell.SetWidth("twips", 4320);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("3 inches");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetWidth.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896410&doc=S3NVT1ZCSGlRQWFoS1hXOFErVEVidzlrTXluZjFWZEZPcGlMYXQxayszUT0_IjQ4OTY0MTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
