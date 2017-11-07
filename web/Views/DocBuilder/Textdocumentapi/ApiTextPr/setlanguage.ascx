<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetLanguage</span>
</h1>

<h4 class="header-gray" id="SetLanguage">SetLanguage(sLangId)</h4>
<p class="dscr">Specify the languages which will be used to check spelling and grammar (if requested) when processing the
contents of this text run.</p>

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
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetLanguage("en-CA");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the language set to English (Canada) using the text properties.");
builder.SaveFile("docx", "SetLanguage.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898125&doc=RXduUVJzVGdMbFNjWGpqd0N1R0NLcmhIeFhVYkduWk40ekw0Q0UrMVpPND0_IjQ4OTgxMjUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
