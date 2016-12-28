<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"document"}</h4>

<dl class="details">
                <dt>Overrides:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getclasstype") %>">ApiDocumentContent.GetClassType</a>
                </li></ul></dd>
</dl>
                              
<p class="dscr">Get this class type.</p>  

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>"document"</em>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = Api.CreateParagraph();
var oClassType = oDocument.GetClassType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896214&doc=c3NiTVd0MkVHbUZWWVVsN2VlZGJWUnB0WjcreG41WTB2Y3UzV242UVZNZz0_IjQ4OTYyMTQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>