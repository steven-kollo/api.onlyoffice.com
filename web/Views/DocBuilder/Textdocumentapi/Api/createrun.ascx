<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateRun</span>
</h1>

<h4 class="header-gray" id="CreateRun">CreateRun() &rarr; {<a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">
Create a new smaller text block to be inserted to the current paragraph or table.
</p>
    
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
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
var oDocument = Api.GetDocument();oRun = Api.CreateRun();
oRun.AddText("This is a text run");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "CreateRun.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4883384&doc=eVFmVDdLbkFZNHh5RkEwU3d5cFQwdXhnYjVFcHRGUjVYbHRNOUs1a1BXdz0_IjQ4ODMzODQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>