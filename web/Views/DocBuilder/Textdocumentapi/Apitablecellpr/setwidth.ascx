<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetWidth</span>
</h1>
<h4 class="header-gray" id="SetWidth">SetWidth(sType, nValue<sub>opt</sub>)</h4>
                
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
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableCellPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("All cells are at least 2 inches wide:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTableCellPr = oTableStyle.GetTableCellPr();
oTableCellPr.SetWidth("twips", 2880);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetWidth.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<p>The resulting sample document will be available here with the nearest ONLYOFFICE Document Builder API documentation website update.</p>