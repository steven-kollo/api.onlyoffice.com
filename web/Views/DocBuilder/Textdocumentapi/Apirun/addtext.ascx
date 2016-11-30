<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddText</span>
</h1>

<h4 class="header-gray" id="AddText">AddText(sText)</h4>
<p class="dscr">
Add some text to this run.
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
            <td><em>sText</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The text which will be added to the current run.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. Nothing special.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddText.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891439&doc=MEY4YlNZK2ZQcUtuSm1WbmhROHY3ZXJWWVBlajc0L1AwaWVUN0F1UHVEMD0_IjQ4OTE0Mzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>