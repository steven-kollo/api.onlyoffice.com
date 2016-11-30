<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCellSpacing</span>
</h1>

<h4 class="header-gray" id="SetCellSpacing">SetCellSpacing(nValue<sub>nullable</sub>)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablepr/setcellspacing") %>">ApiTablePr.SetCellSpacing</a>
                </li></ul></dd>
                </dl>
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
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set the cell spacing to half an inch:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetStyle(oTableStyle);
oTable.SetCellSpacing(720);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetCellSpacing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4912898&doc=SDRtem4yeWkyOGphOVpqcUdrSXVWM2hUSllVU3N2QzEwSFl0V1VzendzRT0_IjQ5MTI4OTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>