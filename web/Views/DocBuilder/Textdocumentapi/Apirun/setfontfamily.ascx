<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontFamily</span>
</h1>

<h4 class="header-gray" id="SetFontFamily">SetFontFamily(sFontFamily)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setfontfamily") %>">ApiTextPr.SetFontFamily</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Set all 4 font slots with the specified font family.
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
            <td><em>sFontFamily</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The font family or families used for the current text run.</td>
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
oRun.SetFontFamily("Calibri Light");
oRun.AddText("This is a text run with the font family set to 'Calibri Light'.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetFontFamily.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892189&doc=R3FrQnVwQTNQKytxQnEzTnNPMEc4WXZmNHlyaEtNSzBVRXNPaStXYVFtMD0_IjQ4OTIxODki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>