<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTableBorderRight</span>
</h1>
<h4 class="header-gray" id="SetTableBorderRight">SetTableBorderRight(sType, nSize, nSpace, r, g, b)</h4>
                
<p class="dscr">Set the border which will be displayed on the right of the current table.</p>

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
                        <td>The right border style.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSize</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt_8">pt_8</a>
                        </td>
                        <td>The width of the current right border measured in eighths of a point.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>nSpace</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#pt">pt</a>
                        </td>
                        <td>The spacing offset in the right part of the table measured in points used to place this border.</td>
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
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We add the right 4 point blue border:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTablePr.SetTableBorderRight("single", 32, 0, 0, 0, 255);
oTable.SetTableLook(true, true, true, true, false, false);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableBorderRight.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896632&doc=WVRDZUVObWFYMnV0c09Sd0JwWnd0QnlJZExibXlJUFF2QjMwa203SXJMOD0_IjQ4OTY2MzIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>