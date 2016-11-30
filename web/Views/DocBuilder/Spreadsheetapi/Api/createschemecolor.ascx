<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSchemeColor</span>
</h1>
<h4 class="header-gray" id="CreateSchemeColor">CreateSchemeColor(sSchemeColorId) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apischemecolor") %>">ApiSchemeColor</a>}</h4>
    <p class="dscr">
        Create a complex color scheme selecting from one of the available schemes.
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
            <td><em>sSchemeColorId</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#SchemeColorId">SchemeColorId</a>
            </td>
            <td>The solor scheme identifier.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("spreadsheetapi/apischemecolor") %>">ApiSchemeColor</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oGs1, oGs2, oFill, oStroke, oSchemeColor;
oSchemeColor = Api.CreateSchemeColor("accent6");
oGs1 = Api.CreateGradientStop(oSchemeColor, 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreateSchemeColor.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004635&doc=ZUJ3WGhzaFlmM3EyZHE3NGk3ajd1OWZVRG1YRnpVMm51eDI3SWhJeDNxdz0_IjUwMDQ2MzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>