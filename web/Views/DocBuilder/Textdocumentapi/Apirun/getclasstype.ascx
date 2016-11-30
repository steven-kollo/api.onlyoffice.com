<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"run"}</h4>
    <dl class="details">
        <dt>Overrides:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/getclasstype") %>">ApiTextPr.GetClassType</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Get the type of this class.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>"run"</em>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. Nothing special.");
oParagraph.AddElement(oRun);
var oClassType = oRun.GetClassType();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Class Type = " + oClassType);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896249&doc=SytpOHVCbFo1RHdBVnlqK1hBVGdTLytUdThXdXZsRjYwN21acUc1Ull6RT0_IjQ4OTYyNDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>