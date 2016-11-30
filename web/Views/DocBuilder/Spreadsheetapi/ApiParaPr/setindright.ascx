<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetIndRight</span>
</h1>
<h4 class="header-gray" id="SetIndRight">SetIndRight(nValue)</h4>
<p class="dscr">
Set the paragraph right side indentation.
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
            <td><em>nValue</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
            </td>
            <td>The paragraph right side indentation value measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill, oParagraph, oParaPr;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParaPr = oParagraph.GetParaPr();
oParaPr.SetIndRight(2880);
oParagraph.AddText("This is the first paragraph with the right offset of 2 inches set to it. ");
oParagraph.AddText("This offset is set by the paragraph style. No paragraph inline style is applied. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
builder.SaveFile("xlsx", "SetIndRight.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006310&doc=UE4rakk5ekpmbHlJUCtFTngrWXZhYndCa0NIVXlMYmRld0ZzWmYzN25Rcz0_IjUwMDYzMTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>