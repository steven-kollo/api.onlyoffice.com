<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetNumberFormat</span>
</h1>

<h4 class="header-gray" id="SetNumberFormat">SetNumberFormat(sNumberFormat)</h4>
<p class="dscr">
    Specifies whether the number in the cell should be treated like number, currency, date, time, etc. or just like text.
</p>

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
            <td><em>sNumberFormat</em></td>
            <td>
                <em>string</em>
            </td>
            <td>Specifies the mask applied to the number in the cell.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetColumnWidth(0, 30);
oWorksheet.SetColumnWidth(1, 30);
oWorksheet.GetRange("A2").SetValue("123456");
oWorksheet.GetRange("B2").SetValue("General");
oWorksheet.GetRange("A2").SetNumberFormat("General");
oWorksheet.GetRange("A3").SetValue("123456");
oWorksheet.GetRange("B3").SetValue("Number");
oWorksheet.GetRange("A3").SetNumberFormat("0.00");
oWorksheet.GetRange("A4").SetValue("123456");
oWorksheet.GetRange("B4").SetValue("Currency");
oWorksheet.GetRange("A4").SetNumberFormat("$#,##0.00");
oWorksheet.GetRange("A5").SetValue("123456");
oWorksheet.GetRange("B5").SetValue("Accounting");
oWorksheet.GetRange("A5").SetNumberFormat("_($* #,##0.00_)");
oWorksheet.GetRange("A6").SetValue("123456");
oWorksheet.GetRange("B6").SetValue("DateShort");
oWorksheet.GetRange("A6").SetNumberFormat("m/d/yyyy");
oWorksheet.GetRange("A7").SetValue("123456");
oWorksheet.GetRange("B7").SetValue("DateLong");
oWorksheet.GetRange("A7").SetNumberFormat("[$-F800]dddd, mmmm dd, yyyy");
oWorksheet.GetRange("A8").SetValue("123456");
oWorksheet.GetRange("B8").SetValue("Time");
oWorksheet.GetRange("A8").SetNumberFormat("[$-F400]h:mm:ss AM/PM");
oWorksheet.GetRange("A9").SetValue("123456");
oWorksheet.GetRange("B9").SetValue("Percentage");
oWorksheet.GetRange("A9").SetNumberFormat("0.00%");
oWorksheet.GetRange("A10").SetValue("123456");
oWorksheet.GetRange("B10").SetValue("Percent");
oWorksheet.GetRange("A10").SetNumberFormat("0%");
oWorksheet.GetRange("A11").SetValue("123456");
oWorksheet.GetRange("B11").SetValue("Fraction");
oWorksheet.GetRange("A11").SetNumberFormat("# ?/?");
oWorksheet.GetRange("A12").SetValue("123456");
oWorksheet.GetRange("B12").SetValue("Scientific");
oWorksheet.GetRange("A12").SetNumberFormat("0.00E+00");
oWorksheet.GetRange("A13").SetValue("123456");
oWorksheet.GetRange("B13").SetValue("Text");
oWorksheet.GetRange("A13").SetNumberFormat("@");
builder.SaveFile("xlsx", "SetNumberFormat.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5114914&doc=MW1OMWllWncvSXB0WVhpVzNZc1IrL0ludWZiNVpGc2RRckVvWDBJd3BOOD0_IjUxMTQ5MTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>