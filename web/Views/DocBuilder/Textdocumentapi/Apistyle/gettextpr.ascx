<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetTextPr</span>
</h1>

<h4 class="header-gray" id="GetTextPr">GetTextPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>}</h4>
<p class="dscr">Get the text properties of the current style.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type
                </dt>
                <dd>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
var oNormalStyle = oDocument.GetDefaultStyle("paragraph");
oTextPr = oNormalStyle.GetTextPr();
oTextPr.SetColor(0x26, 0x26, 0x26, false);
oTextPr.SetFontFamily("Calibri Light");
oTextPr.SetFontSize(32);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the text color, font family and font size set using the text style. ");
oParagraph.AddText("We do not change the style of the paragraph itself. ");
oParagraph.AddText("Only document-wide text styles are applied.");
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892892&doc=UjMwbGd6ZFRoWEFCWUJJbWxjZkV0ekZ6eXd3TW5vVVh0eTYrSy9CbUx3MD0_IjQ4OTI4OTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>