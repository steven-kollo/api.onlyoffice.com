<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetNoWrap</span>
</h1>

<h4 class="header-gray" id="SetNoWrap">SetNoWrap(isNoWrap)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setnowrap") %>">ApiTableCellPr.SetNoWrap</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Specify how this table cell is laid out when the parent table is displayed in a document. This settingonly affects the behavior of the cell when the <a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">SetTableLayout</a> table layout for this table isset to use the <em>"autofit"</em> algorithm.</p>

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
                        <td><em>isNoWrap</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the <em>SetNoWrap</em> method use.</td>
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
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetNoWrap(true);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("The text within this cell is set not to wrap.");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetNoWrap.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896367&doc=bTFoVjRxem8yeDc1TjRPL3h5a3dFZTNsbi95NGpYMlZuemJhNHl1ZEN1UT0_IjQ4OTYzNjci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>