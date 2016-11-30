<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetItalic</span>
</h1>

<h4 class="header-gray" id="SetItalic">SetItalic(isItalic)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setitalic") %>">ApiTextPr.SetItalic</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Set the italic property to the text character.
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
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetItalic(true);
oRun.AddText("This is a text run with the font set to italicized letters.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetItalic.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892197&doc=SVUzeG9SbWVvZHBvQTRad2ZPOTZRS1Q5NEJobUZ1VURJNS9BYWswY2N4ST0_IjQ4OTIxOTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>