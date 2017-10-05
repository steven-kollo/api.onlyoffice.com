<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetActiveSheet</span>
</h1>

<h4 class="header-gray" id="GetActiveSheet">GetActiveSheet() &rarr; {<a href="<%= Url.Action("spreadsheetapi/apiworksheet") %>">ApiWorksheet</a>}</h4>
<p class="dscr">Get the object that represents the active sheet.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("spreadsheetapi/apiworksheet") %>">ApiWorksheet</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('B1').SetValue('2');
oWorksheet.GetRange('B2').SetValue('2');
oWorksheet.GetRange('A3').SetValue('2x2=');
oWorksheet.GetRange('B3').SetValue('=B1*B2');
builder.SaveFile("xlsx", "GetActiveSheet.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882026&doc=bHBrTXVQK3FmeXFnZVE4Z0pCYjZ3N2ZyVDFjNC84Q2k0Z08yQTBZd2NPbz0_IjQ4ODIwMjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
