<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetElement</span>
</h1>
<h4 class="header-gray" id="GetElement">GetElement(nPos) &rarr; (nullable) {<a href="<%= Url.Action("global") %>#ParagraphContent">ParagraphContent</a>}</h4>
<p class="dscr">
Get the element of the paragraph using the position specified.
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
            <td><em>nPos</em></td>
            <td>
                <em>number</em>
            </td>
            <td>The position where the element which content we want to get must be located.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("global") %>#ParagraphContent">ParagraphContent</a>
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
oParagraph.RemoveAllElements();
oRun = Api.CreateRun();
oRun.AddText("This is the text for the first text run. Do not forget a space at its end to separate from the second one. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText("This is the text for the second run. We will set it bold afterwards. It also needs space at its end. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText("This is the text for the third run. It ends the paragraph.");
oParagraph.AddElement(oRun);
oRun = oParagraph.GetElement(1);
oRun.SetBold(true);
builder.SaveFile("xlsx", "GetElement.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004866&doc=c0tFdFZVK1FaT0JnK2NPWjE5c2ZXRnFTb2Z1SXpPSmpUSnd2RGZMZHN4RT0_IjUwMDQ4NjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>