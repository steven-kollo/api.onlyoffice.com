<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateFile</span>
</h1>


            <h4 class="header-gray" id="CreateFile">bool CreateFile(nType);</h4>
            <p class="dscr">Create a new file. The type of the file which will be created needs to be set.</p>
             
            <h2>Parameters:</h2>
            <div id="mobile-content"></div>
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
                        <td>The type of the file to be created set as a hexadecimal integer for the C++ code or <b>docx</b>, <b>xlsx</b> or <b>pptx</b> for the <em>.docbuilder</em> script file.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Example</h2>
            <h4 class="header-gray" >C++</h4>
<pre>#define OFFICESTUDIO_FILE_DOCUMENT          0x0040
#define OFFICESTUDIO_FILE_DOCUMENT_DOCX     OFFICESTUDIO_FILE_DOCUMENT + 0x0001
NSDoctRenderer::CDocBuilder::Initialize();
NSDoctRenderer::CDocBuilder oBuilder;
oBuilder.CreateFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX);
NSDoctRenderer::CDocBuilder::Dispose();
</pre>
             <h4 class="header-gray" >.docbuilder</h4>     
<pre>builder.CreateFile("docx");
</pre>
                