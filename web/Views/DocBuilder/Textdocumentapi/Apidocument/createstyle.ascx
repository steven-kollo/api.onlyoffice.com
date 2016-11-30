<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateStyle</span>
</h1>

<h4 class="header-gray" id="CreateStyle">CreateStyle(sStyleName, sType<sub>opt</sub>) &rarr; {<a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>}</h4>
<p class="dscr">Create a new style with the specified type and name. If there is a style with the same name it will be replaced with a new one.
</p>           
                    
<h2>Parameters:</h2>
                <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Attributes</td>
                            <td>Default</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr class="tablerow">
                        <td><em>sStyleName</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td><br>
                        </td>
                        <td></td>
                        <td>The name of the style which will be created.</td>
                    </tr>
                        <tr class="tablerow">
                        <td><em>sType</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#StyleType">StyleType</a>
                        </td>
                        <td>&lt;optional><br>
                        </td>
                        <td>"paragraph"</td>
                        <td>The document element which the style will be applied to.</td>
                    </tr>
                </tbody>
                </table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oHeading1Style = oDocument.CreateStyle("Heading 1", "paragraph");
oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetKeepNext(true);
oParaPr.SetKeepLines(true);
oParaPr.SetSpacingAfter(240);
oTextPr = oHeading1Style.GetTextPr();
oTextPr.SetColor(0xff, 0x68, 0x00, false);
oTextPr.SetFontSize(40);
oTextPr.SetFontFamily("Calibri Light");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("This is a heading with a style created above");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is just a text.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887126&doc=SnI5aVZldHV3OFZhKzBQY3ZuU3RaUDNFQjFuaWFTQks5RXgvUUkvRllNND0_IjQ4ODcxMjYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>