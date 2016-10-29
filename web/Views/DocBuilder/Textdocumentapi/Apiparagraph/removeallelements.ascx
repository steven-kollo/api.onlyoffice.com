<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveAllElements</span>
</h1>
<p class="dscr">
        Remove all elements from the current paragraph.
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oParagraph.RemoveAllElements();
oRun = Api.CreateRun();
oRun.AddText("This is the first document paragraph. We removed all the elements to get the number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". If we had not done that the number before this sentence would be '1'.");
oParagraph.AddElement(oRun);
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.AddText("This is the second paragraph. It is created without any elements, so there is no need to remove them. The number of paragraph elements at this point: ");
oRun.AddText("" + oParagraph.GetElementsCount() + ". It is '0' and should be that way.");
oParagraph.AddElement(oRun);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "RemoveAllElements.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>