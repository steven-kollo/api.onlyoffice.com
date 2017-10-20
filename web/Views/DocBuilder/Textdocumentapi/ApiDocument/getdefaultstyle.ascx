<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetDefaultStyle</span>
</h1>

<h4 class="header-gray" id="GetDefaultStyle">GetDefaultStyle(sStyleType) &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>}</h4>
<p class="dscr">Get the default style parameters for the specified document element.</p>    
                
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
                            <td><em>sStyleType</em></td>
                            <td>
                            <a href="<%= Url.Action("global") %>#StyleType">StyleType</a>
                            </td>
                            <td>The document element which we want to get the style for.</td>
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
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
oParagraph = oDocument.GetElement(0);
oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(276, "auto");
oParaPr.SetSpacingAfter(200);
var oNormalStyle = oDocument.GetDefaultStyle("paragraph");
oParaPr = oNormalStyle.GetParaPr();
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetJc("both");
oParagraph.AddText("This is just a text.");
builder.SaveFile("docx", "GetDefaultStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887222&doc=TmVqSE1qMTNubDN6RCtzTjg4L2o3QjhUVm13Um1tV3VMVFlmYU8vb1lSST0_IjQ4ODcyMjIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
