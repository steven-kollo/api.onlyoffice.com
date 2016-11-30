<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>
<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"run"}</h4>
    <dl class="details">
        <dt>Overrides:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("spreadsheetapi/apitextpr/getclasstype") %>">ApiTextPr.GetClassType</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Get the type of this class.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>"run"</em>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph, oRun;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
var oClassType = oRun.GetClassType();
oRun.SetFontSize(30);
oRun.AddText("Class Type = " + oClassType);
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "GetClassType.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006292&doc=WTkrUTNBSHlPeWRNcjNQemhGaGlFdGZqVFdvblQ5ZDllTkExUDdQUzJlRT0_IjUwMDYyOTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>