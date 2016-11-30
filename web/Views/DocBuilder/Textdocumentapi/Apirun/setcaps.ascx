<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCaps</span>
</h1>

<h4 class="header-gray" id="SetCaps">SetCaps(isCaps)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setcaps") %>">ApiTextPr.SetCaps</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.
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
            <td><em>isCaps</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed capitalized.</td>
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
oRun.SetCaps(true);
oRun.AddText("This is a text run with the font set to capitalized letters.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetCaps.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892183&doc=OE01a0RUVW1obEpaeGZrazBjTU1iTW5iWG04STQrbnJ3SVFEU1dXNTcraz0_IjQ4OTIxODMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>