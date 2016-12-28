<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiColor</span>
</h1>
<h4 class="header-gray" id="ApiColor">new ApiColor()</h4>
<p class="dscr">Class representing an RGB color.</p>

<h2>Methods</h2>
<table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apicolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oColor = Api.CreateColorFromRGB(49, 133, 154);
oWorksheet.GetRange("A2").SetValue("Text with color");
oWorksheet.GetRange("A2").SetFontColor(oColor);
oColorClassType = oColor.GetClassType();
oWorksheet.GetRange("A4").SetValue("Class type = " + oColorClassType);
builder.SaveFile("xlsx", "ApiColor.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5116045&doc=allRakZXWUp0WDlGMllubFF2cU5ZcmdDamtLT29kYVNjb3hBSithekFUQT0_IjUxMTYwNDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
