<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetRangeByNumber</span>
</h1>

<h4 class="header-gray" id="GetRange">GetRangeByNumber(nRow, nCol) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a>}</h4>
<p class="dscr">Returns an object that represents the selected range of the current sheet using the <b>row/column</b> coordinates for the cell selection.</p>

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
                        <td><em>nRow</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the row to set the cell coordinates.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr class="tablerow">
                        <td><em>nCol</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the column to set the cell coordinates.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRangeByNumber(1, 2).SetValue("42");
builder.SaveFile("xlsx", "GetRangeByNumber.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5003326&doc=SnBCdGE5dVVScXJSbG1kc2lNdkhwa3pON3ZJeDJ1d1R5cDdlRzhoUjJHUT0_IjUwMDMzMjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
