<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetLanguage</span>
</h1>

<h4 class="header-gray" id="SetLanguage">SetLanguage(sLangId)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apitextpr/setlanguage") %>">ApiTextPr.SetLanguage</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Specify the languages which will be used to check spelling and grammar (if requested) when processing the contents of this text run.</p>

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
                        <td><em>sLangId</em></td>
                        <td>
                        <em>string</em>
                        </td>
                        <td>The possible value for this parameter is a language identifier as defined by RFC 4646/BCP 47. Example: "en-CA".</td>
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
oRun.SetLanguage("en-CA");
oRun.AddText("This is a text run with the text language set to English (Canada).");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetLanguage.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892202&doc=YzVWZlhocGxsaGx6UG1MMnVGc2Q5R0NzT2pQM2xCNzNUdWxUeGsyQ2J6TT0_IjQ4OTIyMDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>