<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCellSpacing</span>
</h1>
<h4 class="header-gray" id="SetCellSpacing">SetCellSpacing(nValue<sub>nullable</sub>)</h4>
                
<p class="dscr">Specify the default table cell spacing (the spacing between adjacent cells and the edges of the table).</p>

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
                        <td><em>nValue</em></td>
                        <td>
                        <a href="<%= Url.Action("global") %>#twips">twips</a>
                        </td>
                        <td> &lt;nullable><br></td>
                        <td>Spacing value measured in twentieths of a point (1/1440 of an inch). <em>"Null"</em> means no spacing will be applied.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the cell spacing to half an inch:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(3, 3);
oTable.SetStyle(oTableStyle);
oTablePr.SetCellSpacing(720);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetCellSpacing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912909&doc=MkVheWlLVkFXeVpISS9kVmdaT3h1QWMzNzg5VXFTTjdyb3FLVzU2YmVjaz0_IjQ5MTI5MDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
