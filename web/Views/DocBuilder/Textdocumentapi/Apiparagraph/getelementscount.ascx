<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetElementsCount</span>
</h1>

<h4 class="header-gray" id="GetElementsCount">GetElementsCount() &rarr; {number}</h4>
<p class="dscr">
Get the number of elements in the current paragraph.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>number</em>
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
oParagraph.RemoveAllElements();
oRun = Api.CreateRun();
oRun.AddText("Number of paragraph elements at this point: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
oRun.AddLineBreak();
oParagraph.AddElement(oRun);
oRun.AddText("Number of paragraph elements after we added a text run: ");
oRun.AddTabStop();
oRun.AddText("" + oParagraph.GetElementsCount());
builder.SaveFile("docx", "GetElementsCount.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889009&doc=MEJVejYraWNVODNoRmdpM0hSMzE5S3B2dm94dGZRVDM1aC91VEk0QjBxND0_IjQ4ODkwMDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>