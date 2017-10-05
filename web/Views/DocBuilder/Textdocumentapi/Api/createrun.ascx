<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateRun</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateRun", "textdocumentapi");%>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
var oDocument = Api.GetDocument();
oRun = Api.CreateRun();
oRun.AddText("This is a text run");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "CreateRun.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4883384&doc=YnhPQ0J1RnFyd1dJdlU4NEpvcGJSTU5QbDd2V3Yvd3NqTU1zcXh5ZlAyYz0_IjQ4ODMzODQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
