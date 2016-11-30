<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetUnderline</span>
</h1>

<h4 class="header-gray" id="SetUnderline">SetUnderline(isUnderline)</h4>
<p class="dscr">
Specify that the contents of this run are displayed along with a line appearing directly below thecharacter (less than all the spacing above and below the characters on the line).
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
            <td><em>isUnderline</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed underlined.</td>
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
oTextPr.SetUnderline(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text underlined with a single line.");
builder.SaveFile("docx", "SetUnderline.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898203&doc=K0NHTVhqaURIQ3BZU3ZmMEV6bm1MbTVmdE5pR2ZlaEsxSHR2c21NYVNmQT0_IjQ4OTgyMDMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>