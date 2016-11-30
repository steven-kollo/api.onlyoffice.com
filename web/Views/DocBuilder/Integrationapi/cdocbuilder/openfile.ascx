<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">OpenFile</span>
</h1>


                <h4 class="header-gray" id="OpenFile">bool OpenFile(sPath, sParams);</h4>                
                    <p class="dscr">Open the document file which will be edited and saved afterwards.</p>
                
            <h2>Parameters:</h2>
            <table class="table">
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Type</td>
                        <td>Attributes</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><em>sPath</em></td>
                        <td>const&nbsp;wchar_t*</td>
                        <td></td>
                        <td>The path to the file to be opened together with its name and extension.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sParams</em></td>
                        <td>const&nbsp;wchar_t*
                        </td>
                        <td>&lt;optional></td>
                        <td>The parameters needed for the correct file opening (most commonly the encoding is used for the <em>txt</em> file type or the delimiter for the <em>csv</em> files, for other file types this is just an empty string).</td>
                    </tr>
                </tbody>
            </table>

            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.OpenFile(L"D:/DocBuilder/text-document.docx", "");
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
builder.OpenFile("D:/DocBuilder/text-document.docx", "");
</pre>