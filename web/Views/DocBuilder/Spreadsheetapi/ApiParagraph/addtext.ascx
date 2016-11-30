<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddText</span>
</h1>
<h4 class="header-gray" id="AddText">AddText(sText<sub>opt</sub>) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">
Add some text to the element.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sText</em></td>
            <td>
                <em>string</em>
            </td>
            <td>&lt;optional><br>
            </td>
            <td>""
            </td>
            <td>The text that we want to insert into the current document element.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("spreadsheetapi/apirun") %>">ApiRun</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.SetJc("left");
oParagraph.AddText("This is a text inside the shape aligned left.");
oParagraph.AddLineBreak();
oParagraph.AddText("This is a text after the line break.");
builder.SaveFile("xlsx", "AddText.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5009725&doc=aVE0Y3pmeVlmbUd6SUNGak45NkovNGVVNW9kSVJCemRZWlhoYVVUQWh6RT0_IjUwMDk3MjUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>