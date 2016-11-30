<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetDocContent</span>
</h1>
<h4 class="header-gray" id="GetDocContent">GetDocContent() &rarr; {<a href="<%= Url.Action("presentationapi/apidocumentcontent") %>">ApiDocumentContent</a>}</h4>
<p class="dscr">
Get the shape inner contents where a paragraph or text runs can be inserted.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("presentationapi/apidocumentcontent") %>">ApiDocumentContent</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
oPresentation.SetSizes(254 * 36000, 190 * 36000);
var oSlide = oPresentation.GetCurrentSlide();
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartOnlineStorage", 200 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oShape.SetVerticalTextAlign("bottom");
oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("We removed all elements from the shape and added a new paragraph inside it ");
oParagraph.AddText("aligning it vertically by the bottom.");
oDocContent.Push(oParagraph);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetDocContent.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011498&doc=TGg1aDRvaUZNV0JtUExwMU85VXg5eU8waWNoT3UvdUF0TkYvQzRLTk1WVT0_IjUwMTE0OTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>