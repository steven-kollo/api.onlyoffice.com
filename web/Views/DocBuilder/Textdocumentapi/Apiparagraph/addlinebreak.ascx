<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddLineBreak</span>
</h1>

<h4 class="header-gray" id="AddLineBreak">AddLineBreak() &rarr; {<a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">
Add line break to the current position and start the next element from a new line.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = oParagraph.AddText("This is the text for the first line. Nothing special.");
oParagraph.AddLineBreak();
oRun = oParagraph.AddText("This is the text which starts from the beginning of the second line. ");
oRun = oParagraph.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
builder.SaveFile("docx", "ApiParagraph.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888991&doc=dXhxYU1laGQ1ZGFvLzBlSDdwOXJlU1pEVlZNUHVKSGg5emNHaUpGT2ZIND0_IjQ4ODg5OTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>