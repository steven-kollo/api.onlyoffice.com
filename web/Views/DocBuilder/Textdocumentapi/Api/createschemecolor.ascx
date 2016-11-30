<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSchemeColor</span>
</h1>

<h4 class="header-gray" id="CreateSchemeColor">CreateSchemeColor(sSchemeColorId) &rarr; {<a href="<%= Url.Action("textdocumentapi/apischemecolor") %>">ApiSchemeColor</a>}</h4>
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
        <a href="<%= Url.Action("textdocumentapi/apischemecolor") %>">ApiSchemeColor</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oFill, oStroke, oDrawing, oParagraph, oSchemeColor;
oParagraph = oDocument.GetElement(0);
oSchemeColor = Api.CreateSchemeColor("accent6");
oFill = Api.CreateSolidFill(oSchemeColor);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("curvedUpArrow", 5930900, 595605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreateSchemeColor.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887176&doc=R09nRjhWTVhaNzBSb0FGZHlkLzdKUlgzL0xvc3o3VGZ3ZFY2QnE1S0Z0RT0_IjQ4ODcxNzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>