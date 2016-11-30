<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetWidth</span>
</h1>

<h4 class="header-gray" id="SetWidth">SetWidth(sType, nValue<sub>opt</sub>)</h4>
                <dl class="details">
                    <dt>Overrides:</dt>
                    <dd>
                        <ul>
                            <li>
                                <a href="<%= Url.Action("textdocumentapi/apitablepr/setwidth") %>">ApiTablePr.SetWidth</a>
                            </li>
                        </ul>
                    </dd>
                </dl>
<p class="dscr">Set the preferred width for this table.</p>

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
                        <td>&lt;optional><br></td>
                        <td>The table width value measured in positive integers.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We set the table width to 100 percent:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetWidth.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4895052&doc=bUg4N3pwUnZpQjJnYlI1cXYvd1dGekg2N3ZtSElLaDZRS3Fwdk1vbmd2az0_IjQ4OTUwNTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>