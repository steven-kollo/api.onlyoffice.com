<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableBorderInsideV</span>
</h1>

<h4 class="header-gray" id="SetTableBorderInsideV">SetTableBorderInsideV(sType, nSize, nSpace, r, g, b)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderinsidev") %>">ApiTablePr.SetTableBorderInsideV</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Specify the border which will be displayed on all vertical table cell borders which are not on anoutmost edge of the parent table (all vertical borders which are not the leftmost or rightmost border).</p>

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
                        <a href="<%= Url.Action("global") %>#BorderType">BorderType</a>
                        </td>
                        <td>The vertical table cell border style.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSize</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt_8">pt_8</a>
                        </td>
                        <td>The width of the current border measured in eighths of a point.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSpace</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt">pt</a>
                        </td>
                        <td>The spacing offset in the vertical table cells of the table measured in points used to place this border.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>r</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Red color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>g</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Green color component value.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>b</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#byte">byte</a>
                        </td>
                        <td>Blue color component value.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and add the inside vertical 4 point red borders:");
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetTableBorderTop("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderBottom("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderLeft("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderRight("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderInsideV("single", 32, 0, 255, 0, 0);
oTable.SetTableBorderInsideH("single", 4, 0, 255, 0, 0);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableBorderInsideV.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4894944&doc=SVRQZnJaaVVYNWkyVHozRXpHdmF6d3V1MFhHTVdnQnp3THBaRyt2K3lBRT0_IjQ4OTQ5NDQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>