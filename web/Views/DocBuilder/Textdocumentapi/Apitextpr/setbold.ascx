<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBold</span>
</h1>

<h4 class="header-gray" id="SetBold">SetBold(isBold)</h4>
<p class="dscr">
Set the bold property to the text character.
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
            <td><em>isBold</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of this run are displayed bold.</td>
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
oTextPr.SetBold(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font weight set to bold using the text properties.");
builder.SaveFile("docx", "SetBold.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898099&doc=QzdWZ1U0ck91RDhZRVFzWkJNRFcrbTVldjVmYWQ0OTBhUDNLazFoZDRoaz0_IjQ4OTgwOTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>