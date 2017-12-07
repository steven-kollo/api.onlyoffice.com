<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilder</span>
</h1>


            <h4 class="header-gray" id="CDocBuilder">new CDocBuilder</h4>
            <p class="dscr">Base class used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, PDF) to be generated.</p>
                  

            <h2>Methods</h2>
            <table class="table">
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/closefile") %>">CloseFile</a></td>
                        <td>Close the file to stop working with it. You can use a single <b>ONLYOFFICE Document Builder</b> instance to work with all your files, but you need to close the previous file before you can start working with the next one in this case.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/createfile") %>">CreateFile</a></td>
                        <td>Create a new file. The type of the file which will be created needs to be set.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/dispose") %>">Dispose</a></td>
                        <td>Unloading the <b>ONLYOFFICE Document Builder</b> from the application memory when it is no longer needed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">ExecuteCommand</a></td>
                        <td>Execute the command which will be used to create the document file (text document, spreadsheet, PDF, etc.). See the <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a> and <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a> sections for more information which commands are available for various document types.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/initialize") %>">Initialize</a></td>
                        <td>Initializing the <b>ONLYOFFICE Document Builder</b> as a library for the application to be able to work with it.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/openfile") %>">OpenFile</a></td>
                        <td>Open the document file which will be edited and saved afterwards.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/run") %>">Run</a></td>
                        <td>Run <b>ONLYOFFICE Document Builder</b> executable. If you do not want to write a C++ application, you can simply use the <b>docbuilder.exe</b> executable file and run it with the <b>.docbuilder</b> file as an argument, where all the code for the document file creation will be written. For C++ the path to the executable file from the <em>sPath</em> parameter must be used, the <em>CDocBuilder</em> object created and the <em>Run</em> method is called.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/runtexta") %>">RunTextA</a></td>
                        <td>Run the all the commands for the document creation using a single command. Compared to <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> where only one command at a time is allowed, <em>CDocBuilder.RunTextA</em> makes it possible to enter all the commands for the document creation at once.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/runtextw") %>">RunTextW</a></td>
                        <td>Run the all the commands for the document creation using a single command. Compared to <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> where only one command at a time is allowed, <em>CDocBuilder.RunTextW</em> makes it possible to enter all the commands for the document creation at once.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/savefile") %>">SaveFile</a></td>
                        <td>Save the file after all the changes are made. The type of the file which will be saved needs to be set.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/setproperty") %>">SetProperty</a></td>
                        <td>The argument which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/setpropertyw") %>">SetPropertyW</a></td>
                        <td>The argument which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("integrationapi/cdocbuilder/settmpfolder") %>">SetTmpFolder</a></td>
                        <td>The path to the folder where the program will temporarily save files needed for the program correct work. After the successful document file creation all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Example</h2>
            <h4 class="header-gray" >C++</h4>
            
<pre >#include "docbuilder.h"
#define OFFICESTUDIO_FILE_DOCUMENT              0x0040
#define OFFICESTUDIO_FILE_DOCUMENT_DOCX         OFFICESTUDIO_FILE_DOCUMENT + 0x0001
#define OFFICESTUDIO_FILE_DOCUMENT_ODT          OFFICESTUDIO_FILE_DOCUMENT + 0x0003
#define OFFICESTUDIO_FILE_DOCUMENT_RTF          OFFICESTUDIO_FILE_DOCUMENT + 0x0004
#define OFFICESTUDIO_FILE_DOCUMENT_TXT          OFFICESTUDIO_FILE_DOCUMENT + 0x0005
#define OFFICESTUDIO_FILE_PRESENTATION          0x0080
#define OFFICESTUDIO_FILE_PRESENTATION_PPTX     OFFICESTUDIO_FILE_PRESENTATION + 0x0001
#define OFFICESTUDIO_FILE_SPREADSHEET           0x0100
#define OFFICESTUDIO_FILE_SPREADSHEET_XLSX      OFFICESTUDIO_FILE_SPREADSHEET + 0x0001
#define OFFICESTUDIO_FILE_SPREADSHEET_ODS       OFFICESTUDIO_FILE_SPREADSHEET + 0x0003
#define OFFICESTUDIO_FILE_SPREADSHEET_CSV       OFFICESTUDIO_FILE_SPREADSHEET + 0x0004
#define OFFICESTUDIO_FILE_CROSSPLATFORM         0x0200
#define OFFICESTUDIO_FILE_CROSSPLATFORM_PDF     OFFICESTUDIO_FILE_CROSSPLATFORM + 0x0001
int wmain(int argc, wchar_t *argv[])
{
  if (argc <= 0)
    return 0;
  NSDoctRenderer::CDocBuilder::Initialize();
  NSDoctRenderer::CDocBuilder oBuilder;
#ifdef _DOC_BUILDER_EXECUTABLE_
  std::wstring sBuildFile(argv[argc - 1]);
  oBuilder.Run(argv[argc - 1]);
#else
  oBuilder.SetTmpFolder(L"DocBuilderTemp");
  oBuilder.CreateFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX);
  oBuilder.ExecuteCommand(L"var oDocument = Api.GetDocument();");
  oBuilder.ExecuteCommand(L"var oParagraph;");
  oBuilder.ExecuteCommand(L"oParagraph = oDocument.GetElement(0);");
  oBuilder.ExecuteCommand(L"oParagraph.SetJc(\"center\");");
  oBuilder.ExecuteCommand(L"oParagraph.AddText(\"Center\");");
  oBuilder.SaveFile(OFFICESTUDIO_FILE_CROSSPLATFORM_PDF, L"document.pdf");
  oBuilder.CloseFile();
#endif
  NSDoctRenderer::CDocBuilder::Dispose();
  return 0;
}</pre>
                <h4 class="header-gray" >.docbuilder</h4>
<pre>builder.SetTmpFolder("DocBuilderTemp");
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.SetJc("center");
oParagraph.AddText("Center");
builder.SaveFile("pdf", "images.pdf");
builder.CloseFile();</pre>
                