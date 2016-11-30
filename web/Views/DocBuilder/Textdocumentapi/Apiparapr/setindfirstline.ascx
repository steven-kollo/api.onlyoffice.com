<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetIndFirstLine</span>
</h1>

<h4 class="header-gray" id="SetIndFirstLine">SetIndFirstLine(nValue)</h4>
<p class="dscr">
Set the paragraph first line indentation.
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
            <td>The paragraph first line indentation value measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetIndFirstLine(1440);
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the first paragraph with the indent of 1 inch set to the first line. ");
oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the second paragraph with the indent of 1 inch set to the first line. ");
oParagraph.AddText("This indent is set by the paragraph style. No paragraph inline style is applied. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetIndFirstLine.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891338&doc=clhkRGd3bkFJWW53ckZwRjViYUM3TllWZWs4WkhzeVBSVU0vL1BCZFpDdz0_IjQ4OTEzMzgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>