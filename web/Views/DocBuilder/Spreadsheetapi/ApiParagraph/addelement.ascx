<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddElement</span>
</h1>
<h4 class="header-gray" id="AddElement">AddElement(oElement, nPos<sub>opt</sub>) &rarr; {boolean}</h4>
<p class="dscr">
Add an element to the current paragraph.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>oElement</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#ParagraphContent">ParagraphContent</a>
            </td>
            <td></td>
            <td>The document element which will be added at the current position. Returns <em>false</em> if the type of <em>oElement</em> is not supported by a paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nPos</em></td>
            <td>
                <em>number</em>
            </td>
            <td>&lt;optional>
            </td>
            <td>The number of the paragraph where the current element will be added. If this value is not specified then the element will be added at the end of the current paragraph.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>boolean</em>
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
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is the text for a text run. Nothing special.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "AddElement.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006373&doc=bkU4K0R1RUpIcm5YcjhKVklQaUFEbGRnT2JNbmNNNjNJNWJWL0U5TW1hYz0_IjUwMDYzNzMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>