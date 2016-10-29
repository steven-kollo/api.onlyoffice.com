<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllElements</span>
</h1>
<p class="dscr"></p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oDocument.RemoveAllElements();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the first paragraph. ");
oParagraph.AddText("We removed all document elements (including the first paragraph, created by default). ");
oParagraph.AddText("This paragraph now took its place.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "RemoveAllElements.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>