<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetRow</span>
</h1>

<h4 class="header-gray" id="GetRow">GetRow(val) &rarr; {number}</h4>
<p class="dscr">Get the number of the row for the selected cell.</p>

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
                        <td>The cell from the current sheet to return the row number for.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <em>number</em>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("A9").GetRow();
oWorksheet.GetRange("A2").SetValue(oRange.toString());
builder.SaveFile("xlsx", "GetRow.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5003345&doc=eWZkaUtUZmdmQ3Q3TW1iMmhOMFI1YWd2TnFaRFVDYXp4Yzcyd0pYY09Daz0_IjUwMDMzNDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>