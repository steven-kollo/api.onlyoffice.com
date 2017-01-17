<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SaveFile</span>
</h1>

                <h4 class="header-gray" id="SaveFile">bool SaveFile(nType, sPath);</h4>
                <p class="dscr">Save the file after all the changes are made. The type of the file which will be saved needs to be set.</p>
                
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
                        <td><em>nType</em></td>
                        <td>const&nbsp;int&
                        </td>
                        <td>The type of the file to be saved set as a hexadecimal integer for the C++ code; for the <em>.docbuilder</em> script file the following values are possible: <b>docx</b>, <b>odt</b>, <b>rtf</b>, <b>txt</b>, <b>pptx</b>, <b>xlsx</b>, <b>ods</b>, <b>csv</b>, <b>pdf</b>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sPath</em></td>
                        <td>const&nbsp;wchar_t*
                        </td>
                        <td>The path to the file to be saved together with its name and extension.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
#define OFFICESTUDIO_FILE_DOCUMENT          0x0040
#define OFFICESTUDIO_FILE_DOCUMENT_DOCX     OFFICESTUDIO_FILE_DOCUMENT + 0x0001
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.SaveFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX, L"D:/TESTFILES/document.docx");
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
builder.SaveFile("docx", "D:/TESTFILES/document.docx");
</pre>
            