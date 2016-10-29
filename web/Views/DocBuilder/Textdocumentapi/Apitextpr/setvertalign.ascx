<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVertAlign</span>
</h1>
<p class="dscr">
        Specify the alignment which will be applied to the contents of this run in relation to the defaultappearance of the run text:
        <ul>
            <li><b>"baseline"</b> - the characters in the current text run will be aligned by the default text baseline.</li>
            <li><b>"subscript"</b> - the characters in the current text run will be aligned below the default text baseline.</li>
            <li><b>"superscript"</b> - the characters in the current text run will be aligned above the default text baseline.</li>
        </ul>
    </p>
  <h5>Example</h5><pre class="prettyprint source linenums"><code>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetVertAlign("subscript");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text aligned below the baseline vertically.");
builder.SaveFile("docx", "SetVertAlign.docx");
builder.CloseFile();</code></pre><h5>Resulting document</h5>