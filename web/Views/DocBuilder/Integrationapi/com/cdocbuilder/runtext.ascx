<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RunText</span>
</h1>

<h4 class="header-gray" id="Run">HRESULT RunText([in] BSTR commands, [out, retval] VARIANT_BOOL* result);</h4>
<p class="dscr">Runs all the commands for the document creation using a single command.
Compared to <a href="<%= Url.Action("integrationapi/com/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> where only one command at a time is allowed,
<em>CDocBuilder.RunText</em> makes it possible to enter all the commands for the document creation at once.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.RunText</em> method is not used.</div>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>commands</em></td>
            <td>BSTR</td>
            <td>The commands which will be used to create the document file (in COM, the escape character must be used when the command contains quotation symbols).
            All the commands containing <em>builder.</em> are line separated, i.e. you cannot write them in one line, each command <b>must</b> start with its own line.</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>VARIANT_BOOL*</td>
            <td>Specifies if the operation of running the commands is successful or not.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder-&gt;Initialize();
oBuilder-&gt;RunText(L"builder.SetTmpFolder(\"DocBuilderTemp\");\n\
builder.CreateFile(\"docx\");\n\
var oDocument = Api.GetDocument();var oParagraph;oParagraph = oDocument.GetElement(0);oParagraph.SetJc(\"center\");oParagraph.AddText(\"Center\");\n\
builder.SaveFile(\"pdf\", \"images.pdf\");\n\
builder.CloseFile();", &b);
oBuilder-&gt;Dispose();
</pre>
