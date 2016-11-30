<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddColumnBreak</span>
</h1>

<h4 class="header-gray" id="AddColumnBreak">AddColumnBreak() &rarr; {<a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">Add column break to the current position and start the next element from a new column.</p>

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
var oSection = oDocument.GetFinalSection();
oSection.SetEqualColumns(2, 720);
oRun = oParagraph.AddText("This is the text for the first column. It is written all in one text run. Nothing special.");
oParagraph.AddColumnBreak();
oRun = oParagraph.AddText("This is the text which starts from the beginning of the second column. ");
oRun = oParagraph.AddText("It is written in two text runs, you need a space at the end of the first run sentence to separate them.");
builder.SaveFile("docx", "AddColumnBreak.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888985&doc=UmhSb2hTdEtwU2hXRDBYS0M5UFlBcHN4cWg0ZFJrRkpzNWVvU2MvS0RZaz0_IjQ4ODg5ODUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>