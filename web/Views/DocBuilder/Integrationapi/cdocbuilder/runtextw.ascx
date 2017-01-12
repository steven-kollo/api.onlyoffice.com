<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RunTextW</span>
</h1>

                <h4 class="header-gray" id="Run">bool RunTextW(sCommands);</h4>
                    <p class="dscr">Run the all the commands for the document creation using a single command. Compared to <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> where only one command at a time is allowed, <em>CDocBuilder.RunTextW</em> makes it possible to enter all the commands for the document creation at once.</p>
                    <div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.RunTextW</em> method is not used.</div>
                
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
                        <td><em>sCommands</em></td>
                        <td>const&nbsp;wchar_t*
                        </td>
                        <td>The commands in Unicode format which will be used to create the document file (in C++ the escape character must be used when the command contains quotation symbols). All the commands containing <em>builder.</em> are line separated, i.e. you cannot write them in one line, each command <b>must</b> start with its own line.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.RunTextW(L"builder.SetTmpFolder(\"D:/DocBuilderTemp\");\n\
builder.CreateFile(\"docx\");\n
var oDocument = Api.GetDocument();var oParagraph;oParagraph = oDocument.GetElement(0);oParagraph.SetJc(\"center\");oParagraph.AddText(\"Center\");\n\
builder.SaveFile(\"pdf\", \"D:/TESTFILES/images.pdf\");\n\
builder.CloseFile();");
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
            