<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStyle</span>
</h1>

<h4 class="header-gray" id="SetStyle">SetStyle(oStyle)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setstyle") %>">ApiTextPr.SetStyle</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Specify the style of the text character display.</p>

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
                        <td><em>oStyle</em></td>
                        <td>
                        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
                        </td>
                        <td>The style which must be applied to the text character.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun, oTextPr;
var MyNewRunStyle = oDocument.CreateStyle("My New Run Style", "run");
oTextPr = MyNewRunStyle.GetTextPr();
oTextPr.SetCaps(true);
oTextPr.SetFontFamily("Calibri Light");
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oRun.AddText("The text properties are changed and the style is added to the paragraph. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetStyle(MyNewRunStyle);
oRun.AddText("This is a text run with its own style.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891497&doc=YWxqVHBPNUQyQ2tYUm53b2p2TzRnNW9EYk9sbkg2K2dFcWE4Q3ZCRFVkMD0_IjQ4OTE0OTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>