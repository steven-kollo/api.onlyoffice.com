<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStrikeout</span>
</h1>

<h4 class="header-gray" id="SetStrikeout">SetStrikeout(isStrikeout)</h4>
<p class="dscr">
Specify that the contents of this run are displayed with a single horizontal line through the center of the line.
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
            <td><em>isStrikeout</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed struck through.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetStrikeout(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text struck out with a single line.");
builder.SaveFile("docx", "SetStrikeout.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898176&doc=RlE1RldkYkZCTURJZUJZbWxHUnl4bWozeDdibVdmYktZbUdvT3MzVSt5WT0_IjQ4OTgxNzYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>