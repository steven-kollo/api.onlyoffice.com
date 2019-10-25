<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ExecuteCommand</span>
</h1>



                <h4 class="header-gray" id="ExecuteCommand">bool ExecuteCommand(sCommand);</h4>
                
                    <p class="dscr">
                        Execute the command which will be used to create the document file (text document, spreadsheet, PDF, etc.).
                        See the <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a> and <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a> sections for more information which commands are available for various document types.
                    </p>
                    <div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.ExecuteCommand</em> method is not used explicitly, the command itself is used instead, see the example below.</div>
                
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
                        <td><em>sCommand</em></td>
                        <td>const&nbsp;wchar_t*
                        </td>
                        <td>The command which will be used to create the document file (in C++ the escape character must be used when the command contains quotation symbols).</td>
                    </tr>
                </tbody>
            </table>

            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.ExecuteCommand(L"oParagraph.AddText(\"Center\");");
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>    
<pre>
oParagraph.AddText("Center");
</pre>