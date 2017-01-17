<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontName</span>
</h1>

<h4 class="header-gray" id="SetFontName">SetFontName(name)</h4>
<p class="dscr">Set the specified font family as the font name for the current cell range.</p>

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
                        <td><em>name</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td>The font family name used for the current cell range.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.SetFontName("Arial");
builder.SaveFile("xlsx", "SetFontName.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882021&doc=L1JsOHpBUm4zTHBpYXRHTitocEhZaUxDeGtoZTdlNURzeUdqRnVUTS9oVT0_IjQ4ODIwMjEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>