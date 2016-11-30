<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetItalic</span>
</h1>

<h4 class="header-gray" id="SetItalic">SetItalic(isItalic)</h4>
<p class="dscr">
Set the italic property to the text character.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <th>Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>isItalic</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed italicized.</td>
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
oTextPr.SetItalic(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font set to italicized letters using the text properties.");
builder.SaveFile("docx", "SetItalic.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898123&doc=djZPa1ZXQjFDRFROTUFEUUNVTFRzcFloZC9vYXFBS2FaeFh6ZENWbUVVTT0_IjQ4OTgxMjMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>