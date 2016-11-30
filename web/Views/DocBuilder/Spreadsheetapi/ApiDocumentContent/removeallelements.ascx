<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllElements</span>
</h1>
<h4 class="header-gray" id="RemoveAllElements">RemoveAllElements()</h4>
    <p class="dscr">
        Remove all elements from the current document or from the current document element.
    </p>
    <div class="note">When all elements are removed, a new empty paragraph is automatically created. If you want to add content to this paragraph, use the <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelement") %>">ApiDocumentContent.GetElement</a> method.</div>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oParagraph, oStroke, oFill, oDocContent;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oDocContent.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it.");
oDocContent.Push(oParagraph);
builder.SaveFile("xlsx", "RemoveAllElements.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004831&doc=KzlLSjF5d0JrK1hMa0hWd1pXWUxqalNxZENJVG9UdUdRZXF5eE1JMjJtZz0_IjUwMDQ4MzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>