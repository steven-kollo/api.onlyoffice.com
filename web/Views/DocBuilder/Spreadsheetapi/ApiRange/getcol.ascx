<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetCol</span>
</h1>

<h4 class="header-gray" id="GetCol">GetCol(val) &rarr; {number}</h4>
<p class="dscr">Get the number of the column for the selected cell.</p>

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
                        <td>The cell from the current sheet to return the column number for.</td>
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
var oRange = oWorksheet.GetRange("D9").GetCol();
oWorksheet.GetRange("A2").SetValue(oRange.toString());
builder.SaveFile("xlsx", "GetCol.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004446&doc=d1Z1bk5TS1o4QkhURW85NmVlMVgrUlZGZmw4VGFMNTZxUlNPWWkxZXE2Zz0_IjUwMDQ0NDYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>