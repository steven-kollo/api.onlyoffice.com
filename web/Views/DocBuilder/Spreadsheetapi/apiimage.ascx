<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiImage</span>
</h1>
<h4 class="header-gray" id="ApiImage">new ApiImage()</h4>
<p class="dscr">Class representing base properties of objects like images, shapes and charts.</p>
            
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
                        <td><a href="<%= Url.Action("spreadsheetapi/apiimage/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oImage = oWorksheet.AddImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000, 0, 2 * 36000, 2, 3 * 36000);
var oClassType = oImage.GetClassType();
oWorksheet.SetColumnWidth(0, 15);
oWorksheet.SetColumnWidth(1, 10);
oWorksheet.GetRange('A1').SetValue('Class Type = ');
oWorksheet.GetRange('B1').SetValue(oClassType);
builder.SaveFile("xlsx", "ApiImage.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004483&doc=OE8vSlVCYkxUa1pwQTdhd2JkQzd2SlB1cWh4SzJ2NlpPemV4eEZObVFnND0_IjUwMDQ0ODMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>