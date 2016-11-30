<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetClassType</span>
</h1>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"document"}</h4>

<dl class="details">
        <dt>Overrides:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apiparapr/getclasstype") %>">ApiParaPr.GetClassType</a>
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
        <em>"document"</em>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
var oClassType = oParagraph.GetClassType();
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4896240&doc=N0xyUjdxdE9UMXpzYVUwZ0tWTmNnaEdENTVJcjlYM0tPRFd5bThjZ2lqdz0_IjQ4OTYyNDAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>