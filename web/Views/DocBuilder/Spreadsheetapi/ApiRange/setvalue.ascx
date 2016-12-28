<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetValue</span>
</h1>

<h4 class="header-gray" id="SetValue">SetValue(val)</h4>
<p class="dscr">Set the value for the current cell or a cell range.</p>

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
                        <td><em>val</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td>The general value for the cell or cell range in string format.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('B1').SetValue('2');
oWorksheet.GetRange('B2').SetValue('2');
oWorksheet.GetRange('A3').SetValue('2x2=');
oWorksheet.GetRange('B3').SetValue('=B1*B2');
builder.SaveFile("xlsx", "SetValue.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882026&doc=M3ZjUVlCZE11Z09QVi9MV0tSeEVKbTRwRmVqTit4LzFWMGkxRFA4SkJnRT0_IjQ4ODIwMjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>