<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Using command line arguments</span>
</h1>

<p class="dscr">If you need to pass some arguments to the created document using the command line, you can do that with <b>Document Builder</b>. To do that you will need to modify the code of your <b>.docbuilder</b> script file and include the arguments you need into the command running <b>Document Builder</b>.</p>

<div class="note">This is the same as using the <a href="<%= Url.Action("integrationapi/cdocbuilder/setproperty") %>">SetProperty</a> method.</div>

<p>In this case the command will look like this:</p>
<pre><code>docbuilder.exe "--argument={\"company\":\"ONLYOFFICE\",\"product\":\"ONLYOFFICE Document Builder\",\"compatibility\":\"100%\"}" "path-to-file\sample_with_arguments.docbuilder"</code></pre>

<p>The sample code for the <b>.docbuilder</b> script file can be like this:</p>

<h2>Example</h2>
<pre>builder.CreateFile("docx");
var sCompany   = Argument["company"];
var sProduct = Argument["product"];
var sCompatibility    = Argument["compatibility"];
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of using command line arguments with ONLYOFFICE Document Builder.");
oParagraph.AddLineBreak();
oParagraph.AddLineBreak();
oParagraph.AddText("Company name: " + sCompany);
oParagraph.AddLineBreak();
oParagraph.AddText("Product:  " + sProduct);
oParagraph.AddLineBreak();
oParagraph.AddText("Compatibility with OOXML standards: " + sCompatibility);
builder.SaveFile("docx", "D:/TESTFILES/ArgumentUse.docx");
builder.CloseFile();</pre>