<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStyle</span>
</h1>

<h4 class="header-gray" id="SetStyle">SetStyle(oStyle)</h4>
<p class="dscr">The text style base method.</p>
<div class="note">This method is not used by itself, as it only forms the basis for the <a href="<%= Url.Action("textdocumentapi/apirun/setstyle") %>">ApiRun.SetStyle</a> method which sets the selected or created style for the text.</div>

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
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891497&doc=L2hZVXhrMnJHV0RTOEl3K1JoYnIwQUgvQmR3ZVI4V3ZOV2c0TldCWGFHWT0_IjQ4OTE0OTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
