<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    List of all ONLYOFFICE Document Builder classes and methods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">List of all ONLYOFFICE Document Builder classes and methods</span>
    </h1>

    <h2 id="Integration"><a href="<%= Url.Action("integrationapi/cdocbuilder") %>">Integration API</a></h2>
    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">CDocBuilder</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
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

    <h2 id="TextDocuments"><a href="<%= Url.Action("textdocumentapi") %>">Text documents API</a></h2>
    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createblipfill") %>">CreateBlipFill</a></td>
                        <td>Create a blip fill which allows to fill the object using a selected image as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createchart") %>">CreateChart</a></td>
                        <td>Create a chart with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/creategradientstop") %>">CreateGradientStop</a></td>
                        <td>Create a gradient stop used for different types of gradients.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createimage") %>">CreateImage</a></td>
                        <td>Create an image with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a></td>
                        <td>Create a linear gradient fill which allows to fill the object using a selected linear gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createnofill") %>">CreateNoFill</a></td>
                        <td>Create no fill and remove the fill from the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createparagraph") %>">CreateParagraph</a></td>
                        <td>Create a new paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createpatternfill") %>">CreatePatternFill</a></td>
                        <td>Create a pattern fill which allows to fill the object using a selected pattern as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createpresetcolor") %>">CreatePresetColor</a></td>
                        <td>Create a color selecting it from one of the available color presets.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a></td>
                        <td>Create a radial gradient fill which allows to fill the object using a selected radial gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/creatergbcolor") %>">CreateRGBColor</a></td>
                        <td>Create an RGB color setting the appropriate values for the red, green and blue color components.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createrun") %>">CreateRun</a></td>
                        <td>Create a new smaller text block to be inserted to the current paragraph or table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createschemecolor") %>">CreateSchemeColor</a></td>
                        <td>Create a complex color scheme selecting from one of the available schemes.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createshape") %>">CreateShape</a></td>
                        <td>Create a shape with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createsolidfill") %>">CreateSolidFill</a></td>
                        <td>Create a solid fill which allows to fill the object using a selected solid color as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createstroke") %>">CreateStroke</a></td>
                        <td>Create a stroke adding shadows to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/createtable") %>">CreateTable</a></td>
                        <td>Create a new table with a specified number of rows and columns.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/api/getdocument") %>">GetDocument</a></td>
                        <td>Get the main document.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apichart/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apichart/sethoraxistitle") %>">SetHorAxisTitle</a></td>
                        <td>Specify the horizontal axis chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apichart/setlegendpos") %>">SetLegendPos</a></td>
                        <td>Specify the chart legend position.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apichart/setshowdatalabels") %>">SetShowDataLabels</a></td>
                        <td>Specifies which chart data labels are shown for the chart.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apichart/settitle") %>">SetTitle</a></td>
                        <td>Specify a chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apichart/setveraxistitle") %>">SetVerAxisTitle</a></td>
                        <td>Specify the vertical axis chart title.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/addelement") %>">AddElement</a></td>
                        <td>Add paragraph or table using its position in the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/createnumbering") %>">CreateNumbering</a></td>
                        <td>Create an abstract multilevel numbering with a specified type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/createsection") %>">CreateSection</a></td>
                        <td>Create a new document section which ends at the specified paragraph. Allows to set local parameters for the current section - page size, footer, header, columns, etc.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/createstyle") %>">CreateStyle</a></td>
                        <td>Create a new style with the specified type and name. If there is a style with the same name it will be replaced with a new one.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getclasstype") %>">GetClassType</a></td>
                        <td>Get this class type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getcommentsreport") %>">GetCommentsReport</a></td>
                        <td>Get a report about all the comments added to the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getdefaultparapr") %>">GetDefaultParaPr</a></td>
                        <td>Get a set of default paragraph properties in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getdefaultstyle") %>">GetDefaultStyle</a></td>
                        <td>Get the default style parameters for the specified document element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getdefaulttextpr") %>">GetDefaultTextPr</a></td>
                        <td>Get a set of default properties for the text run in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">GetElement</a></td>
                        <td>Get the element by its position in the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getelementscount") %>">GetElementsCount</a></td>
                        <td>Get the number of elements in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getfinalsection") %>">GetFinalSection</a></td>
                        <td>Get the document final section.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getreviewreport") %>">GetReviewReport</a></td>
                        <td>Get a report about every change which was made to the document in the review mode.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/getstyle") %>">GetStyle</a></td>
                        <td>Get a style by the style name.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">Push</a></td>
                        <td>Push a paragraph or a table to actually add it to the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/removeallelements") %>">RemoveAllElements</a></td>
                        <td>Remove all elements from the current document or from the current document element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/removeelement") %>">RemoveElement</a></td>
                        <td>Remove element using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apidocument/setevenandoddhdrftr") %>">SetEvenAndOddHdrFtr</a></td>
                        <td>Specify whether sections in this document will have different headers and footers for even and odd pages (one header/footer for odd pages and another header/footer for even pages).</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>
    </h5>
    <table class="table table-classlist">
                    <thead>
                        <tr class="tablerow">
                            <td class="table-classlist-name">Name</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/addelement") %>">AddElement</a></td>
                            <td>Add paragraph or table using its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getclasstype") %>">GetClassType</a></td>
                            <td>Get the type of the current class.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">GetElement</a></td>
                            <td>Get the element by its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a></td>
                            <td>Get the number of elements in the current document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/push") %>">Push</a></td>
                            <td>Push a paragraph or a table to actually add it to the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a></td>
                            <td>Remove all elements from the current document or from the current document element.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeelement") %>">RemoveElement</a></td>
                            <td>Remove element using the position specified.</td>
                        </tr>
                    </tbody>
                </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>
    </h5>
    <table class="table table-classlist">
    <thead>
        <tr class="tablerow">
            <td class="table-classlist-name">Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of the class based on this base class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setdistances") %>">SetDistances</a></td>
            <td>Specify the minimum distance which will be maintained between the edges of this drawing object and any subsequent text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/sethoralign") %>">SetHorAlign</a></td>
            <td>Specify how the floating object will be horizontally aligned.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/sethorposition") %>">SetHorPosition</a></td>
            <td>Set an absolute measurement for the horizontal positioning of the floating object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setsize") %>">SetSize</a></td>
            <td>Set the size of the object (image, shape, chart) bounding box.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setveralign") %>">SetVerAlign</a></td>
            <td>Specify how the floating object will be vertically aligned.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setverposition") %>">SetVerPosition</a></td>
            <td>Set an absolute measurement for the vertical positioning of the floating object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setwrappingstyle") %>">SetWrappingStyle</a></td>
            <td>Set the wrapping type of this object (image, shape, chart).</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apifill") %>">ApiFill</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apifill/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apigradientstop") %>">ApiGradientStop</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apigradientstop/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apiimage") %>">ApiImage</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiimage/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumbering/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumbering/getlevel") %>">GetLevel</a></td>
                        <td>Get the specified level of the current numbering.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getlevelindex") %>">GetLevelIndex</a></td>
                        <td>Get the level index.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getnumbering") %>">GetNumbering</a></td>
                        <td>Get the numbering definition.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getparapr") %>">GetParaPr</a></td>
                        <td>The paragraph properties which are applied to any numbered paragraph that references the given numbering definition and numbering level.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/gettextpr") %>">GetTextPr</a></td>
                        <td>Specify the text properties which will be applied to the text in the current numbering level itself, not to the text in the subsequent paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setcustomtype") %>">SetCustomType</a></td>
                        <td>Set your own customized numbering type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setrestart") %>">SetRestart</a></td>
                        <td>Specify a one-based index which determines when a numbering level should restart to its starting value. A numbering level restarts when an instance of the specified numbering level, which will be higher (earlier than the this level) is used in the given document contents. By default this value is true.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setstart") %>">SetStart</a></td>
                        <td>Specify the starting value for the numbering used by the parent numbering level within a given numbering level definition. By default this value is 1.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setsuff") %>">SetSuff</a></td>
                        <td>Specify the content which will be added between a given numbering level text and the text of every numbered paragraph which references that numbering level. By default this value is <em>"tab"</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apinumberinglevel/settemplatetype") %>">SetTemplateType</a></td>
                        <td>Set one of the existing predefined numbering templates.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addcolumnbreak") %>">AddColumnBreak</a></td>
                        <td>Add column break to the current position and start the next element from a new column.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/adddrawing") %>">AddDrawing</a></td>
                        <td>Add an object (image, shape or chart) to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addelement") %>">AddElement</a></td>
                        <td>Add an element to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add line break to the current position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagebreak") %>">AddPageBreak</a></td>
                        <td>Add page break and start the next element from the next page.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagenumber") %>">AddPageNumber</a></td>
                        <td>Insert the number of the current document page into the paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagescount") %>">AddPagesCount</a></td>
                        <td>Insert the number of pages in the current document into the paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext") %>">AddText</a></td>
                        <td>Add some text to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getelement") %>">GetElement</a></td>
                        <td>Get the element of the paragraph using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getelementscount") %>">GetElementsCount</a></td>
                        <td>Get the number of elements in the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getnumbering") %>">GetNumbering</a></td>
                        <td>Get a numbering definition and numbering level for the numbered list.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getparagraphmarktextpr") %>">GetParagraphMarkTextPr</a></td>
                        <td>Get the text properties of the paragraph mark which is used to mark the paragraph end. The mark can also acquire common text properties like <em>bold</em>, <em>italic</em>, <em>underline</em>, etc.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/getparapr") %>">GetParaPr</a></td>
                        <td>Get paragraph properties.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/removeallelements") %>">RemoveAllElements</a></td>
                        <td>Remove all elements from the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/removeelement") %>">RemoveElement</a></td>
                        <td>Remove the element using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setbetweenborder") %>">SetBetweenBorder</a></td>
                        <td>Specify the border which will be displayed between each paragraph in a set of paragraphs which have the same set of paragraph border settings.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setbottomborder") %>">SetBottomBorder</a></td>
                        <td>Specify the border which will be displayed below a set of paragraphs which have the same paragraph border settings.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setcontextualspacing") %>">SetContextualSpacing</a></td>
                        <td>Specify that any space before or after this paragraph set using the spacing element <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a> or <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">ApiParaPr.SetSpacingAfter</a>, should not be applied when the preceding and following paragraphs are of the same paragraph style, affecting the top and bottom spacing respectively.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a></td>
                        <td>Set the paragraph first line indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setindleft") %>">SetIndLeft</a></td>
                        <td>Set the paragraph left side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setindright") %>">SetIndRight</a></td>
                        <td>Set the paragraph right side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setjc") %>">SetJc</a></td>
                        <td>Set paragraph contents justification.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setkeeplines") %>">SetKeepLines</a></td>
                        <td>Specify that when rendering this document using a page view, all lines of this paragraph are maintained on a single page whenever possible.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setkeepnext") %>">SetKeepNext</a></td>
                        <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are at least partly rendered on the same page as the following paragraph whenever possible.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setleftborder") %>">SetLeftBorder</a></td>
                        <td>Specify the border which will be displayed at the left side of the page around the specified paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setnumbering") %>">SetNumbering</a></td>
                        <td>Specify that the current paragraph references a numbering definition instance in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setnumpr") %>">SetNumPr</a></td>
                        <td>Specify that the current paragraph references a numbering definition instance in the current document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setpagebreakbefore") %>">SetPageBreakBefore</a></td>
                        <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are rendered at the beginning of a new page in the document.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setrightborder") %>">SetRightBorder</a></td>
                        <td>Specify the border which will be displayed at the right side of the page around the specified paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setshd") %>">SetShd</a></td>
                        <td>Specify the shading applied to the contents of the paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></td>
                        <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a></td>
                        <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingline") %>">SetSpacingLine</a></td>
                        <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setstyle") %>">SetStyle</a></td>
                        <td>Set paragraph style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/settabs") %>">SetTabs</a></td>
                        <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/settopborder") %>">SetTopBorder</a></td>
                        <td>Specify the border which will be displayed above a set of paragraphs which have the same set of paragraph border settings.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiparagraph/setwidowcontrol") %>">SetWidowControl</a></td>
                        <td>Specify whether a single line of this paragraph will be prevented from being displayed on a separate page from the remaining content at display time by moving the line onto the following page.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setbetweenborder") %>">SetBetweenBorder</a></td>
            <td>Specify the border which will be displayed between each paragraph in a set of paragraphs which have the same set of paragraph border settings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setbottomborder") %>">SetBottomBorder</a></td>
            <td>Specify the border which will be displayed below a set of paragraphs which have the same paragraph border settings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setcontextualspacing") %>">SetContextualSpacing</a></td>
            <td>Specify that any space before or after this paragraph set using the spacing element <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a> or <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">ApiParaPr.SetSpacingAfter</a>, should not be applied when the preceding and following paragraphs are of the same paragraph style, affecting the top and bottom spacing respectively.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a></td>
            <td>Set the paragraph first line indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setindleft") %>">SetIndLeft</a></td>
            <td>Set the paragraph left side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setindright") %>">SetIndRight</a></td>
            <td>Set the paragraph right side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setjc") %>">SetJc</a></td>
            <td>Set paragraph contents justification.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setkeeplines") %>">SetKeepLines</a></td>
            <td>Specify that when rendering this document using a page view, all lines of this paragraph are maintained on a single page whenever possible.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setkeepnext") %>">SetKeepNext</a></td>
            <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are at least partly rendered on the same page as the following paragraph whenever possible.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setleftborder") %>">SetLeftBorder</a></td>
            <td>Specify the border which will be displayed at the left side of the page around the specified paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setnumpr") %>">SetNumPr</a></td>
            <td>Specify that the current paragraph references a numbering definition instance in the current document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setpagebreakbefore") %>">SetPageBreakBefore</a></td>
            <td>Specify that when rendering this document using a paginated view, the contents of this paragraph are rendered at the beginning of a new page in the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setrightborder") %>">SetRightBorder</a></td>
            <td>Specify the border which will be displayed at the right side of the page around the specified paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setshd") %>">SetShd</a></td>
            <td>Specify the shading applied to the contents of the paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a></td>
            <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a></td>
            <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingline") %>">SetSpacingLine</a></td>
            <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setstyle") %>">SetStyle</a></td>
            <td>The paragraph style base method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/settabs") %>">SetTabs</a></td>
            <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/settopborder") %>">SetTopBorder</a></td>
            <td>Specify the border which will be displayed above a set of paragraphs which have the same set of paragraph border settings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apiparapr/setwidowcontrol") %>">SetWidowControl</a></td>
            <td>Specify whether a single line of this paragraph will be prevented from being displayed on a separate page from the remaining content at display time by moving the line onto the following page.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apipresetcolor") %>">ApiPresetColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apipresetcolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apirgbcolor") %>">ApiRGBColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirgbcolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addcolumnbreak") %>">AddColumnBreak</a></td>
                        <td>Add a column break to the current run position and start the next element from a new column.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/adddrawing") %>">AddDrawing</a></td>
                        <td>Add an object (image, shape or chart) to the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add a line break to the current run position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addpagebreak") %>">AddPageBreak</a></td>
                        <td>Add a page break and start the next element from a new page.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/addtext") %>">AddText</a></td>
                        <td>Add some text to this run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/clearcontent") %>">ClearContent</a></td>
                        <td>Remove all content from the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the text properties of the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setbold") %>">SetBold</a></td>
                        <td>Set the bold property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setcaps") %>">SetCaps</a></td>
                        <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setcolor") %>">SetColor</a></td>
                        <td>Set the text color for the current text run in the RGB format.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
                        <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setfontfamily") %>">SetFontFamily</a></td>
                        <td>Set all 4 font slots with the specified font family.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setfontsize") %>">SetFontSize</a></td>
                        <td>Set the font size for the characters of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/sethighlight") %>">SetHighlight</a></td>
                        <td>Specify a highlighting color in the RGB format which is applied as a background for the contents of the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setitalic") %>">SetItalic</a></td>
                        <td>Set the italic property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setlanguage") %>">SetLanguage</a></td>
                        <td>Specify the languages which will be used to check spelling and grammar (if requested) when processing the contents of this text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setposition") %>">SetPosition</a></td>
                        <td>Specify the amount by which text is raised or lowered for this run in relation to the default baseline of the surrounding non-positioned text.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setshd") %>">SetShd</a></td>
                        <td>Specify the shading applied to the contents of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setsmallcaps") %>">SetSmallCaps</a></td>
                        <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setspacing") %>">SetSpacing</a></td>
                        <td>Set text spacing measured in twentieths of a point.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setstrikeout") %>">SetStrikeout</a></td>
                        <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setstyle") %>">SetStyle</a></td>
                        <td>Specify the style of the text character display.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setunderline") %>">SetUnderline</a></td>
                        <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apirun/setvertalign") %>">SetVertAlign</a></td>
                        <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apischemecolor") %>">ApiSchemeColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apischemecolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apisection") %>">ApiSection</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/getfooter") %>">GetFooter</a></td>
                        <td>Get the content for the specified footer type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/getheader") %>">GetHeader</a></td>
                        <td>Get the content for the specified header type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/removefooter") %>">RemoveFooter</a></td>
                        <td>Remove the footer of the specified type from the current section. After removal the footer will be inherited from the previous section or, if this is the first section in the document, no footer of the specified type will be present.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/removeheader") %>">RemoveHeader</a></td>
                        <td>Remove the header of the specified type from the current section. After removal the header will be inherited from the previous section or, if this is the first section in the document, no header of the specified type will be present.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setequalcolumns") %>">SetEqualColumns</a></td>
                        <td>Specify that all text columns in the current section are of equal width.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setfooterdistance") %>">SetFooterDistance</a></td>
                        <td>Specify the distance from the bottom edge of the page to the bottom edge of the footer.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setheaderdistance") %>">SetHeaderDistance</a></td>
                        <td>Specify the distance from the top edge of the page to the top edge of the header.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setnotequalcolumns") %>">SetNotEqualColumns</a></td>
                        <td>Specify that all columns in the current section are of a different width. Number of columns is equal to the length of the <em>aWidth</em> array. The length of the <em>aSpaces</em> array <b>MUST BE</b> equal to (<em>aWidth.length - 1</em>).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setpagemargins") %>">SetPageMargins</a></td>
                        <td>Specify the page margins for all pages in this section.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/setpagesize") %>">SetPageSize</a></td>
                        <td>Specify the properties (size and orientation) for all pages in the current section.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/settitlepage") %>">SetTitlePage</a></td>
                        <td>Specify whether the current section in this document have different header and footer for the section first page.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apisection/settype") %>">SetType</a></td>
                        <td>Specify the type of the current section. The section type defines how the contents of the current section are placed relative to the previous section.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apishape") %>">ApiShape</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apishape/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apishape/getdoccontent") %>">GetDocContent</a></td>
                        <td>Get the shape inner contents where a paragraph or text runs can be inserted.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apishape/setverticaltextalign") %>">SetVerticalTextAlign</a></td>
                        <td>Set the vertical alignment for the shape content where a paragraph or text runs can be inserted.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apistroke") %>">ApiStroke</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistroke/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getconditionaltablestyle") %>">GetConditionalTableStyle</a></td>
                        <td>Get a set of formatting properties which will be conditionally applied to the parts of a table that match the requirement specified in the <em>sType</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getname") %>">GetName</a></td>
                        <td>Get the name of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/getparapr") %>">GetParaPr</a></td>
                        <td>Get the paragraph properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettablecellpr") %>">GetTableCellPr</a></td>
                        <td>Get the table cell properties for the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettablepr") %>">GetTablePr</a></td>
                        <td>Get the table properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettablerowpr") %>">GetTableRowPr</a></td>
                        <td>Get the table row properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the text properties of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/gettype") %>">GetType</a></td>
                        <td>Get the type of the current style.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/setbasedon") %>">SetBasedOn</a></td>
                        <td>Specify the reference to the parent style which this style inherits from in the style hierarchy.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apistyle/setname") %>">SetName</a></td>
                        <td>Set the name of the current style.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/addcolumn") %>">AddColumn</a></td>
            <td>Add a new column to the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/addrow") %>">AddRow</a></td>
            <td>Add a new row to the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/getrow") %>">GetRow</a></td>
            <td>Get the table row by its position in the table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/getrowscount") %>">GetRowsCount</a></td>
            <td>Get the number of rows in the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/mergecells") %>">MergeCells</a></td>
            <td>Merge an array of cells. If the merge is done successfully it will return the resulting merged cell, otherwise the result will be <em>"null"</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/removecolumn") %>">RemoveColumn</a></td>
            <td>Remove the table column with a specified cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/removerow") %>">RemoveRow</a></td>
            <td>Remove the table row with a specified cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setcellspacing") %>">SetCellSpacing</a></td>
            <td>Specify the default table cell spacing (the spacing between adjacent cells and the edges of the table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setjc") %>">SetJc</a></td>
            <td>Specify the alignment of the current table with respect to the text margins in the current section.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setshd") %>">SetShd</a></td>
            <td>Specify the shading which is applied to the extents of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setstyle") %>">SetStyle</a></td>
            <td>Set the style for the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setstylecolbandsize") %>">SetStyleColBandSize</a></td>
            <td>Specify the number of columns which will comprise each table column band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setstylerowbandsize") %>">SetStyleRowBandSize</a></td>
            <td>Specify the number of rows which will comprise each table row band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderbottom") %>">SetTableBorderBottom</a></td>
            <td>Set the border which will be displayed at the bottom of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderinsideh") %>">SetTableBorderInsideH</a></td>
            <td>Specify the border which will be displayed on all horizontal table cell borders which are not on an outmost edge of the parent table (all horizontal borders which are not the topmost or bottommost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderinsidev") %>">SetTableBorderInsideV</a></td>
            <td>Specify the border which will be displayed on all vertical table cell borders which are not on an outmost edge of the parent table (all vertical borders which are not the leftmost or rightmost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderleft") %>">SetTableBorderLeft</a></td>
            <td>Set the border which will be displayed on the left of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableborderright") %>">SetTableBorderRight</a></td>
            <td>Set the border which will be displayed on the right of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablebordertop") %>">SetTableBorderTop</a></td>
            <td>Set the border which will be displayed at the top of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginbottom") %>">SetTableCellMarginBottom</a></td>
            <td>Specify the amount of space which will be left between the bottom extent of the cell contents and the border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginleft") %>">SetTableCellMarginLeft</a></td>
            <td>Specify the amount of space which will be present between the left extent of the cell contents and the left border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginright") %>">SetTableCellMarginRight</a></td>
            <td>Specify the amount of space which will be present between the right extent of the cell contents and the right border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablecellmargintop") %>">SetTableCellMarginTop</a></td>
            <td>Specify the amount of space which will be present between the top extent of the cell contents and the top border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settableind") %>">SetTableInd</a></td>
            <td>Specify the indentation which will be added before the leading edge of the current table in the document (the left edge in a left-to-right table, and the right edge in a right-to-left table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablelayout") %>">SetTableLayout</a></td>
            <td>Specify the algorithm which will be used to lay out the contents of this table within the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/settablelook") %>">SetTableLook</a></td>
            <td>Specify the components of the conditional formatting of the referenced table style (if one exists) which will be applied to the set of table rows with the current table-level property exceptions. A table style can specify up to six different optional conditional formats, for example, different formatting for first column, which then can be applied or omitted from individual table rows in the parent table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitable/setwidth") %>">SetWidth</a></td>
            <td>Set the preferred width for this table.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/getcontent") %>">GetContent</a></td>
                        <td>Get the cell content.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderbottom") %>">SetCellBorderBottom</a></td>
                        <td>Set the border which will be displayed at the bottom of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderleft") %>">SetCellBorderLeft</a></td>
                        <td>Set the border which will be displayed to the left of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderright") %>">SetCellBorderRight</a></td>
                        <td>Set the border which will be displayed to the right of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellbordertop") %>">SetCellBorderTop</a></td>
                        <td>Set the border which will be displayed at the top of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginbottom") %>">SetCellMarginBottom</a></td>
                        <td>Specify the amount of space which will be left between the bottom extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginleft") %>">SetCellMarginLeft</a></td>
                        <td>Specify the amount of space which will be left between the left extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginright") %>">SetCellMarginRight</a></td>
                        <td>Specify the amount of space which will be left between the right extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmargintop") %>">SetCellMarginTop</a></td>
                        <td>Specify the amount of space which will be left between the upper extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setnowrap") %>">SetNoWrap</a></td>
                        <td>Specify how this table cell is laid out when the parent table is displayed in a document. This settingonly affects the behavior of the cell when the <a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">SetTableLayout</a> table layout for this table isset to use the <em>"autofit"</em> algorithm.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setshd") %>">SetShd</a></td>
                        <td>Specify the shading applied to the contents of the table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/settextdirection") %>">SetTextDirection</a></td>
                        <td>Specify the direction of the text flow for this table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setverticalalign") %>">SetVerticalAlign</a></td>
                        <td>Specify the vertical alignment for text contents within the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecell/setwidth") %>">SetWidth</a></td>
                        <td>Set the preferred width for the current table cell.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellborderbottom") %>">SetCellBorderBottom</a></td>
                        <td>Set the border which will be displayed at the bottom of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellborderleft") %>">SetCellBorderLeft</a></td>
                        <td>Set the border which will be displayed to the left of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellborderright") %>">SetCellBorderRight</a></td>
                        <td>Set the border which will be displayed to the right of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellbordertop") %>">SetCellBorderTop</a></td>
                        <td>Set the border which will be displayed at the top of the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmarginbottom") %>">SetCellMarginBottom</a></td>
                        <td>Specify the amount of space which will be left between the bottom extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmarginleft") %>">SetCellMarginLeft</a></td>
                        <td>Specify the amount of space which will be left between the left extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmarginright") %>">SetCellMarginRight</a></td>
                        <td>Specify the amount of space which will be left between the right extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmargintop") %>">SetCellMarginTop</a></td>
                        <td>Specify the amount of space which will be left between the upper extent of the cell contents and the border of a specific table cell within a table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setnowrap") %>">SetNoWrap</a></td>
                        <td>Specify how this table cell is laid out when the parent table is displayed in a document. This settingonly affects the behavior of the cell when the <a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">SetTableLayout</a> table layout for this table isset to use the <em>"autofit"</em> algorithm.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setshd") %>">SetShd</a></td>
                        <td>Specify the shading applied to the contents of the table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/settextdirection") %>">SetTextDirection</a></td>
                        <td>Specify the direction of the text flow for this table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setverticalalign") %>">SetVerticalAlign</a></td>
                        <td>Specify the vertical alignment for text contents within the current table cell.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablecellpr/setwidth") %>">SetWidth</a></td>
                        <td>Set the preferred width for the current table cell.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setcellspacing") %>">SetCellSpacing</a></td>
            <td>Specify the default table cell spacing (the spacing between adjacent cells and the edges of the table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setjc") %>">SetJc</a></td>
            <td>Specify the alignment of the current table with respect to the text margins in the current section.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setshd") %>">SetShd</a></td>
            <td>Specify the shading which is applied to the extents of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setstylecolbandsize") %>">SetStyleColBandSize</a></td>
            <td>Specify the number of columns which will comprise each table column band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setstylerowbandsize") %>">SetStyleRowBandSize</a></td>
            <td>Specify the number of rows which will comprise each table row band for this table style.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderbottom") %>">SetTableBorderBottom</a></td>
            <td>Set the border which will be displayed at the bottom of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderinsideh") %>">SetTableBorderInsideH</a></td>
            <td>Specify the border which will be displayed on all horizontal table cell borders which are not on an outmost edge of the parent table (all horizontal borders which are not the topmost or bottommost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderinsidev") %>">SetTableBorderInsideV</a></td>
            <td>Specify the border which will be displayed on all vertical table cell borders which are not on an outmost edge of the parent table (all vertical borders which are not the leftmost or rightmost border).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderleft") %>">SetTableBorderLeft</a></td>
            <td>Set the border which will be displayed on the left of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderright") %>">SetTableBorderRight</a></td>
            <td>Set the border which will be displayed on the right of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablebordertop") %>">SetTableBorderTop</a></td>
            <td>Set the border which will be displayed at the top of the current table.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginbottom") %>">SetTableCellMarginBottom</a></td>
            <td>Specify the amount of space which will be left between the bottom extent of the cell contents and the border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginleft") %>">SetTableCellMarginLeft</a></td>
            <td>Specify the amount of space which will be present between the left extent of the cell contents and the left border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginright") %>">SetTableCellMarginRight</a></td>
            <td>Specify the amount of space which will be present between the right extent of the cell contents and the right border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmargintop") %>">SetTableCellMarginTop</a></td>
            <td>Specify the amount of space which will be present between the top extent of the cell contents and the top border of all table cells within the parent table (or table row).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settableind") %>">SetTableInd</a></td>
            <td>Specify the indentation which will be added before the leading edge of the current table in the document (the left edge in a left-to-right table, and the right edge in a right-to-left table).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">SetTableLayout</a></td>
            <td>Specify the algorithm which will be used to lay out the contents of this table within the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitablepr/setwidth") %>">SetWidth</a></td>
            <td>Set the preferred width for this table.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/getcell") %>">GetCell</a></td>
                        <td>Get the cell by its position.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/getcellscount") %>">GetCellsCount</a></td>
                        <td>Get the number of cells in the current row.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/setheight") %>">SetHeight</a></td>
                        <td>Set the height of the current table row within the current table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerow/settableheader") %>">SetTableHeader</a></td>
                        <td>Specify that the current table row will be repeated at the top of each new page wherever this table is displayed. This gives this table row the behavior of a 'header' row on each of these pages. This element can be applied to any number of rows at the top of the table structure in order to generate multi-row table headers.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerowpr/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerowpr/setheight") %>">SetHeight</a></td>
                        <td>Set the height of the current table row within the current table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablerowpr/settableheader") %>">SetTableHeader</a></td>
                        <td>Specify that all the current table rows will be styled as its header row.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitablestylepr") %>">ApiTableStylePr</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/getparapr") %>">GetParaPr</a></td>
                        <td>Get the set of the paragraph properties which will be applied to all the paragraphs within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablecellpr") %>">GetTableCellPr</a></td>
                        <td>Get the set of the table cell properties which will be applied to all the cells within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablepr") %>">GetTablePr</a></td>
                        <td>Get the set of the table properties which will be applied to all the regions within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablerowpr") %>">GetTableRowPr</a></td>
                        <td>Get the set of the table row properties which will be applied to all the rows within a table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the set of the text run properties which will be applied to all the text runs within the table which match the conditional formatting type.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettype") %>">GetType</a></td>
                        <td>Get the type of the current table conditional style.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setcaps") %>">SetCaps</a></td>
            <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setcolor") %>">SetColor</a></td>
            <td>Set the text color for the current text run in the RGB format.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
            <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setfontfamily") %>">SetFontFamily</a></td>
            <td>Set all 4 font slots with the specified font family.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/sethighlight") %>">SetHighlight</a></td>
            <td>Specify a highlighting color in the RGB format which is applied as a background for the contents of the current run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setlanguage") %>">SetLanguage</a></td>
            <td>Specify the languages which will be used to check spelling and grammar (if requested) when processing the contents of this text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setposition") %>">SetPosition</a></td>
            <td>Specify the amount by which text is raised or lowered for this run in relation to the default baseline of the surrounding non-positioned text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setshd") %>">SetShd</a></td>
            <td>Specify the shading applied to the contents of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a></td>
            <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setspacing") %>">SetSpacing</a></td>
            <td>Set text spacing measured in twentieths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setstyle") %>">SetStyle</a></td>
            <td>The text style base method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apitextpr/setvertalign") %>">SetVertAlign</a></td>
            <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apiunicolor") %>">ApiUniColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiunicolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("textdocumentapi/apiunsupported") %>">ApiUnsupported</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("textdocumentapi/apiunsupported/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h2 id="SpreadsheetDocuments"><a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a></h2>
    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/api") %>">Api</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createblipfill") %>">CreateBlipFill</a></td>
                        <td>Create a blip fill which allows to fill the object using a selected image as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createbullet") %>">CreateBullet</a></td>
                        <td>Create a bullet for a paragraph with the character or symbol specified with the <em>sBullet</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createcolorbyname") %>">CreateColorByName</a></td>
                        <td>Create a color selecting it from one of the available color presets.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb") %>">CreateColorFromRGB</a></td>
                        <td>Create an RGB color setting the appropriate values for the red, green and blue color components.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/creategradientstop") %>">CreateGradientStop</a></td>
                        <td>Create a gradient stop used for different types of gradients.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a></td>
                        <td>Create a linear gradient fill which allows to fill the object using a selected linear gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createnofill") %>">CreateNoFill</a></td>
                        <td>Create no fill and remove the fill from the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createnumbering") %>">CreateNumbering</a></td>
                        <td>Create a bullet for a paragraph with the character or symbol specified with the <em>sType</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createparagraph") %>">CreateParagraph</a></td>
                        <td>Create a new paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createpatternfill") %>">CreatePatternFill</a></td>
                        <td>Create a pattern fill which allows to fill the object using a selected pattern as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createpresetcolor") %>">CreatePresetColor</a></td>
                        <td>Create a color selecting it from one of the available color presets.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a></td>
                        <td>Create a radial gradient fill which allows to fill the object using a selected radial gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/creatergbcolor") %>">CreateRGBColor</a></td>
                        <td>Create an RGB color setting the appropriate values for the red, green and blue color components.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createrun") %>">CreateRun</a></td>
                        <td>Create a new smaller text block to be inserted to the current paragraph or table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createschemecolor") %>">CreateSchemeColor</a></td>
                        <td>Create a complex color scheme selecting from one of the available schemes.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createsolidfill") %>">CreateSolidFill</a></td>
                        <td>Create a solid fill which allows to fill the object using a selected solid color as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createstroke") %>">CreateStroke</a></td>
                        <td>Create a stroke adding shadows to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/getactivesheet") %>">GetActiveSheet</a></td>
                        <td>Get the object that represents the active sheet.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirange/getthemescolors") %>">GetThemesColors</a></td>
                        <td>Get the list of all available theme colors for the spreadsheet.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirange/setthemecolors") %>">SetThemeColors</a></td>
                        <td>Set the theme colors to the current spreadsheet.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apibullet") %>">ApiBullet</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apibullet/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apichart") %>">ApiChart</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxisorientation") %>">SetHorAxisOrientation</a></td>
                        <td>Specifies the direction of the data displayed on the horizontal axis.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxisticklabelposition") %>">SetHorAxisTickLabelPosition</a></td>
                        <td>Set the possible values for the position of the chart tick labels in relation to the main horizontal label or the values of the chart data.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxistitle") %>">SetHorAxisTitle</a></td>
                        <td>Specify the horizontal axis chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setlegendpos") %>">SetLegendPos</a></td>
                        <td>Specify the chart legend position.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setshowdatalabels") %>">SetShowDataLabels</a></td>
                        <td>Specifies which chart data labels are shown for the chart.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/settitle") %>">SetTitle</a></td>
                        <td>Specify a chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setveraxisorientation") %>">SetVerAxisOrientation</a></td>
                        <td>Specifies the direction of the data displayed on the vertical axis.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setveraxistitle") %>">SetVerAxisTitle</a></td>
                        <td>Specify the vertical axis chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apichart/setvertaxisticklabelposition") %>">SetVertAxisTickLabelPosition</a></td>
                        <td>Set the possible values for the position of the chart tick labels in relation to the main vertical label or the values of the chart data.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apicolor") %>">ApiColor</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("spreadsheetapi/apicolor/getclasstype") %>">GetClassType</a></td>
                <td>Get the type of this class.</td>
            </tr>
        </tbody>
    </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent") %>">ApiDocumentContent</a>
    </h5>
    <table class="table table-classlist">
                    <thead>
                        <tr class="tablerow">
                            <td class="table-classlist-name">Name</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/addelement") %>">AddElement</a></td>
                            <td>Add paragraph or table using its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getclasstype") %>">GetClassType</a></td>
                            <td>Get the type of the current class.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelement") %>">GetElement</a></td>
                            <td>Get the element by its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a></td>
                            <td>Get the number of elements in the current document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/push") %>">Push</a></td>
                            <td>Push a paragraph or a table to actually add it to the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a></td>
                            <td>Remove all elements from the current document or from the current document element.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/removeelement") %>">RemoveElement</a></td>
                            <td>Remove element using the position specified.</td>
                        </tr>
                    </tbody>
                </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apidrawing") %>">ApiDrawing</a>
    </h5>
    <table class="table table-classlist">
    <thead>
        <tr class="tablerow">
            <td class="table-classlist-name">Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apidrawing/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of the class based on this base class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apidrawing/setposition") %>">SetPosition</a></td>
            <td>Change the position for the drawing object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apidrawing/setsize") %>">SetSize</a></td>
            <td>Set the size of the object (image, shape, chart) bounding box.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apifill/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apigradientstop") %>">ApiGradientStop</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apigradientstop/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apiimage") %>">ApiImage</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiimage/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apiparagraph") %>">ApiParagraph</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addelement") %>">AddElement</a></td>
                        <td>Add an element to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add line break to the current position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/addtext") %>">AddText</a></td>
                        <td>Add some text to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getelement") %>">GetElement</a></td>
                        <td>Get the element of the paragraph using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getelementscount") %>">GetElementsCount</a></td>
                        <td>Get the number of elements in the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/getparapr") %>">GetParaPr</a></td>
                        <td>Get paragraph properties.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/removeallelements") %>">RemoveAllElements</a></td>
                        <td>Remove all elements from the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/removeelement") %>">RemoveElement</a></td>
                        <td>Remove the element using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setbullet") %>">SetBullet</a></td>
                        <td>Set the bullet or numbering to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a></td>
                        <td>Set the paragraph first line indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindleft") %>">SetIndLeft</a></td>
                        <td>Set the paragraph left side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindright") %>">SetIndRight</a></td>
                        <td>Set the paragraph right side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setjc") %>">SetJc</a></td>
                        <td>Set paragraph contents justification.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></td>
                        <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a></td>
                        <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingline") %>">SetSpacingLine</a></td>
                        <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiparagraph/settabs") %>">SetTabs</a></td>
                        <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apiparapr") %>">ApiParaPr</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setbullet") %>">SetBullet</a></td>
            <td>Set the bullet or numbering to the current paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a></td>
            <td>Set the paragraph first line indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setindleft") %>">SetIndLeft</a></td>
            <td>Set the paragraph left side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setindright") %>">SetIndRight</a></td>
            <td>Set the paragraph right side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setjc") %>">SetJc</a></td>
            <td>Set paragraph contents justification.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a></td>
            <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a></td>
            <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/setspacingline") %>">SetSpacingLine</a></td>
            <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiparapr/settabs") %>">SetTabs</a></td>
            <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apipresetcolor") %>">ApiPresetColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apipresetcolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/getcol") %>">GetCol</a></td>
            <td>Get the number of the column for the selected cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/getrow") %>">GetRow</a></td>
            <td>Get the number of the row for the selected cell.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/merge") %>">Merge</a></td>
            <td>Merge the selected cell range into a single cell or a cell row.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setalignhorizontal") %>">SetAlignHorizontal</a></td>
            <td>Set the horizontal alignment of the text in the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setalignvertical") %>">SetAlignVertical</a></td>
            <td>Set the vertical alignment of the text in the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text characters in the current cell or cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setborders") %>">SetBorders</a></td>
            <td>Set the border to the cell/cell range with the parameters specified.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfillcolor") %>">SetFillColor</a></td>
            <td>Set the background color for the current cell range with the previously created color object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfontcolor") %>">SetFontColor</a></td>
            <td>Set the text color for the current cell range in the RGB format.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfontname") %>">SetFontName</a></td>
            <td>Set the specified font family as the font name for the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text characters in the current cell or cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setnumberformat") %>">SetNumberFormat</a></td>
            <td>Specifies whether the number in the cell should be treated like number, currency, date, time, etc. or just like text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of the cell/cell range are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this cell/cell range are displayed along with a line appearing directly below the character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setvalue") %>">SetValue</a></td>
            <td>Set the value for the current cell or a cell range.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/setwrap") %>">SetWrap</a></td>
            <td>Specifies whether the words in the cell must be wrapped to fit the cell size or not.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apirange/unmerge") %>">UnMerge</a></td>
            <td>Split the selected merged cell range into single cells.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apirgbcolor") %>">ApiRGBColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirgbcolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apirun") %>">ApiRun</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add a line break to the current run position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/addtext") %>">AddText</a></td>
                        <td>Add some text to this run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/clearcontent") %>">ClearContent</a></td>
                        <td>Remove all content from the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the text properties of the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setbold") %>">SetBold</a></td>
                        <td>Set the bold property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setcaps") %>">SetCaps</a></td>
                        <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
                        <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setfill") %>">SetFill</a></td>
                        <td>Set the text color for the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setfontfamily") %>">SetFontFamily</a></td>
                        <td>Set all 4 font slots with the specified font family.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setfontsize") %>">SetFontSize</a></td>
                        <td>Set the font size for the characters of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setitalic") %>">SetItalic</a></td>
                        <td>Set the italic property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setsmallcaps") %>">SetSmallCaps</a></td>
                        <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setspacing") %>">SetSpacing</a></td>
                        <td>Set text spacing measured in twentieths of a point.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setstrikeout") %>">SetStrikeout</a></td>
                        <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setunderline") %>">SetUnderline</a></td>
                        <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirun/setvertalign") %>">SetVertAlign</a></td>
                        <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apischemecolor") %>">ApiSchemeColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apischemecolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apishape") %>">ApiShape</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apishape/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apishape/getdoccontent") %>">GetDocContent</a></td>
                        <td>Get the shape inner contents where a paragraph or text runs can be inserted.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apishape/setverticaltextalign") %>">SetVerticalTextAlign</a></td>
                        <td>Set the vertical alignment for the shape content where a paragraph or text runs can be inserted.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apistroke") %>">ApiStroke</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apistroke/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apitextpr") %>">ApiTextPr</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setcaps") %>">SetCaps</a></td>
            <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
            <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setfill") %>">SetFill</a></td>
            <td>Set the text color for the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setfontfamily") %>">SetFontFamily</a></td>
            <td>Set all 4 font slots with the specified font family.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a></td>
            <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setspacing") %>">SetSpacing</a></td>
            <td>Set text spacing measured in twentieths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apitextpr/setvertalign") %>">SetVertAlign</a></td>
            <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apiunicolor") %>">ApiUniColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apiunicolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("spreadsheetapi/apiworksheet") %>">ApiWorksheet</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/addchart") %>">AddChart</a></td>
            <td>Create a chart of the set type from the selected data range of the current sheet.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/addimage") %>">AddImage</a></td>
            <td>Adds the image to the current sheet with the parameters specified.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/addshape") %>">AddShape</a></td>
            <td>Adds the shape to the current sheet with the parameters specified.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/formatastable") %>">FormatAsTable</a></td>
            <td>Format the selected range of cells from the current sheet as a table (with the first row formatted as a header).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange") %>">GetRange</a></td>
            <td>Returns an object that represents the selected range of the current sheet. Can be a single cell - <b>A1</b>, or cells from a single row - <b>A1:E1</b>, or cells from a single column - <b>A1:A10</b>, or cells from several rows and columns - <b>A1:E10</b>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrangebynumber") %>">GetRangeByNumber</a></td>
            <td>Returns an object that represents the selected range of the current sheet using the <b>row/column</b> coordinates for the cell selection.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/setcolumnwidth") %>">SetColumnWidth</a></td>
            <td>Set the width to the selected column of the current active sheet. The width is equal to the set number multiplied by 7 pixels - so if you set the width to 10 it will be equal to 70 pixels.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/setdisplaygridlines") %>">SetDisplayGridlines</a></td>
            <td>Specifies whether the current sheet gridlines must be displayed or not.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/setdisplayheadings") %>">SetDisplayHeadings</a></td>
            <td>Specifies whether the current sheet row/column headers must be displayed or not.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("spreadsheetapi/apiworksheet/setname") %>">SetName</a></td>
            <td>Set a name to the current active sheet.</td>
        </tr>
    </tbody>
</table>

    <h2 id="PresentationDocuments"><a href="<%= Url.Action("presentationapi") %>">Presentation API</a></h2>
    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/api") %>">Api</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createblipfill") %>">CreateBlipFill</a></td>
                        <td>Create a blip fill which allows to fill the object using a selected image as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createbullet") %>">CreateBullet</a></td>
                        <td>Create a bullet for a paragraph with the character or symbol specified with the <em>sBullet</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createchart") %>">CreateChart</a></td>
                        <td>Create a chart with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/creategradientstop") %>">CreateGradientStop</a></td>
                        <td>Create a gradient stop used for different types of gradients.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createimage") %>">CreateImage</a></td>
                        <td>Create an image with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a></td>
                        <td>Create a linear gradient fill which allows to fill the object using a selected linear gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createnofill") %>">CreateNoFill</a></td>
                        <td>Create no fill and remove the fill from the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createnumbering") %>">CreateNumbering</a></td>
                        <td>Create a bullet for a paragraph with the character or symbol specified with the <em>sType</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createparagraph") %>">CreateParagraph</a></td>
                        <td>Create a new paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createpatternfill") %>">CreatePatternFill</a></td>
                        <td>Create a pattern fill which allows to fill the object using a selected pattern as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createpresetcolor") %>">CreatePresetColor</a></td>
                        <td>Create a color selecting it from one of the available color presets.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a></td>
                        <td>Create a radial gradient fill which allows to fill the object using a selected radial gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/creatergbcolor") %>">CreateRGBColor</a></td>
                        <td>Create an RGB color setting the appropriate values for the red, green and blue color components.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createrun") %>">CreateRun</a></td>
                        <td>Create a new smaller text block to be inserted to the current paragraph or table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createschemecolor") %>">CreateSchemeColor</a></td>
                        <td>Create a complex color scheme selecting from one of the available schemes.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createshape") %>">CreateShape</a></td>
                        <td>Create a shape with the parameters specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createslide") %>">CreateSlide</a></td>
                        <td>Create a new slide.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createsolidfill") %>">CreateSolidFill</a></td>
                        <td>Create a solid fill which allows to fill the object using a selected solid color as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/createstroke") %>">CreateStroke</a></td>
                        <td>Create a stroke adding shadows to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/api/getpresentation") %>">GetPresentation</a></td>
                        <td>Get the main presentation.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apibullet") %>">ApiBullet</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apibullet/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apichart") %>">ApiChart</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apichart/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apichart/sethoraxistitle") %>">SetHorAxisTitle</a></td>
                        <td>Specify the horizontal axis chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apichart/setlegendpos") %>">SetLegendPos</a></td>
                        <td>Specify the chart legend position.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apichart/setshowdatalabels") %>">SetShowDataLabels</a></td>
                        <td>Specifies which chart data labels are shown for the chart.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apichart/settitle") %>">SetTitle</a></td>
                        <td>Specify a chart title.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apichart/setveraxistitle") %>">SetVerAxisTitle</a></td>
                        <td>Specify the vertical axis chart title.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apidocumentcontent") %>">ApiDocumentContent</a>
    </h5>
    <table class="table table-classlist">
                    <thead>
                        <tr class="tablerow">
                            <td class="table-classlist-name">Name</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/addelement") %>">AddElement</a></td>
                            <td>Add paragraph or table using its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/getclasstype") %>">GetClassType</a></td>
                            <td>Get the type of the current class.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/getelement") %>">GetElement</a></td>
                            <td>Get the element by its position in the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a></td>
                            <td>Get the number of elements in the current document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/push") %>">Push</a></td>
                            <td>Push a paragraph or a table to actually add it to the document.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a></td>
                            <td>Remove all elements from the current document or from the current document element.</td>
                        </tr>
                        <tr class="tablerow">
                            <td><a href="<%= Url.Action("presentationapi/apidocumentcontent/removeelement") %>">RemoveElement</a></td>
                            <td>Remove element using the position specified.</td>
                        </tr>
                    </tbody>
                </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>
    </h5>
    <table class="table table-classlist">
    <thead>
        <tr class="tablerow">
            <td class="table-classlist-name">Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apidrawing/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of the class based on this base class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apidrawing/setposition") %>">SetPosition</a></td>
            <td>Set the position of the drawing on the slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apidrawing/setsize") %>">SetSize</a></td>
            <td>Set the size of the object (image, shape, chart) bounding box.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apifill/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apigradientstop") %>">ApiGradientStop</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apigradientstop/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apiimage") %>">ApiImage</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiimage/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/addelement") %>">AddElement</a></td>
                        <td>Add an element to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add line break to the current position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/addtext") %>">AddText</a></td>
                        <td>Add some text to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/getelement") %>">GetElement</a></td>
                        <td>Get the element of the paragraph using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/getelementscount") %>">GetElementsCount</a></td>
                        <td>Get the number of elements in the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/getparapr") %>">GetParaPr</a></td>
                        <td>Get paragraph properties.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/removeallelements") %>">RemoveAllElements</a></td>
                        <td>Remove all elements from the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/removeelement") %>">RemoveElement</a></td>
                        <td>Remove the element using the position specified.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setbullet") %>">SetBullet</a></td>
                        <td>Set the bullet or numbering to the current paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a></td>
                        <td>Set the paragraph first line indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setindleft") %>">SetIndLeft</a></td>
                        <td>Set the paragraph left side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setindright") %>">SetIndRight</a></td>
                        <td>Set the paragraph right side indentation.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setjc") %>">SetJc</a></td>
                        <td>Set paragraph contents justification.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></td>
                        <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a></td>
                        <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/setspacingline") %>">SetSpacingLine</a></td>
                        <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiparagraph/settabs") %>">SetTabs</a></td>
                        <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setbullet") %>">SetBullet</a></td>
            <td>Set the bullet or numbering to the current paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a></td>
            <td>Set the paragraph first line indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setindleft") %>">SetIndLeft</a></td>
            <td>Set the paragraph left side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setindright") %>">SetIndRight</a></td>
            <td>Set the paragraph right side indentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setjc") %>">SetJc</a></td>
            <td>Set paragraph contents justification.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a></td>
            <td>Set the spacing after the current paragraph. If the value of the <em>isAfterAuto</em> parameter is <em>true</em>, then any value of the <em>nAfter</em> is ignored. If <em>isAfterAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a></td>
            <td>Set the spacing before the current paragraph. If the value of the <em>isBeforeAuto</em> parameter is <em>true</em>, then any value of the <em>nBefore</em> is ignored. If <em>isBeforeAuto</em> parameter is not specified, then it will be interpreted as <em>false</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/setspacingline") %>">SetSpacingLine</a></td>
            <td>Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em> or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. If the value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em> parameter will be interpreted as 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apiparapr/settabs") %>">SetTabs</a></td>
            <td>Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apipresentation") %>">ApiPresentation</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/addslide") %>">AddSlide</a></td>
            <td>Append a new slide to the end of the presentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getcurslideindex") %>">GetCurSlideIndex</a></td>
            <td>Get the index for the current slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getcurrentslide") %>">GetCurrentSlide</a></td>
            <td>Get the current slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/getslidebyindex") %>">GetSlideByIndex</a></td>
            <td>Get the slide by its position in the presentation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apipresentation/setsizes") %>">SetSizes</a></td>
            <td>Set the size for the current presentation.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apipresetcolor") %>">ApiPresetColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apipresetcolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apirgbcolor") %>">ApiRGBColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirgbcolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/addlinebreak") %>">AddLineBreak</a></td>
                        <td>Add a line break to the current run position and start the next element from a new line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/addtabstop") %>">AddTabStop</a></td>
                        <td>Add a tab stop to the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/addtext") %>">AddText</a></td>
                        <td>Add some text to this run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/clearcontent") %>">ClearContent</a></td>
                        <td>Remove all content from the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/gettextpr") %>">GetTextPr</a></td>
                        <td>Get the text properties of the current run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setbold") %>">SetBold</a></td>
                        <td>Set the bold property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setcaps") %>">SetCaps</a></td>
                        <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
                        <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setfill") %>">SetFill</a></td>
                        <td>Set the text color for the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setfontfamily") %>">SetFontFamily</a></td>
                        <td>Set all 4 font slots with the specified font family.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setfontsize") %>">SetFontSize</a></td>
                        <td>Set the font size for the characters of the current text run.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setitalic") %>">SetItalic</a></td>
                        <td>Set the italic property to the text character.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setsmallcaps") %>">SetSmallCaps</a></td>
                        <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setspacing") %>">SetSpacing</a></td>
                        <td>Set text spacing measured in twentieths of a point.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setstrikeout") %>">SetStrikeout</a></td>
                        <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setunderline") %>">SetUnderline</a></td>
                        <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apirun/setvertalign") %>">SetVertAlign</a></td>
                        <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apischemecolor") %>">ApiSchemeColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apischemecolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apishape") %>">ApiShape</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apishape/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apishape/getdoccontent") %>">GetDocContent</a></td>
                        <td>Get the shape inner contents where a paragraph or text runs can be inserted.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apishape/setverticaltextalign") %>">SetVerticalTextAlign</a></td>
                        <td>Set the vertical alignment for the shape content where a paragraph or text runs can be inserted.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apislide/addobject") %>">AddObject</a></td>
            <td>Add an object (image, shape or chart) to the current presentation slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apislide/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apislide/getheight") %>">GetHeight</a></td>
            <td>Get the slide height in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apislide/getwidth") %>">GetWidth</a></td>
            <td>Get the slide width in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apislide/removeallobjects") %>">RemoveAllObjects</a></td>
            <td>Remove all the objects from the current slide.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apislide/setbackground") %>">SetBackground</a></td>
            <td>Set the background to the current presentation slide.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apistroke") %>">ApiStroke</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apistroke/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>
    </h5>
    <table class="table table-classlist">
    <thead>
    <tr class="tablerow">
        <td class="table-classlist-name">Name</td>
        <td>Description</td>
    </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of this class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setbold") %>">SetBold</a></td>
            <td>Set the bold property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setcaps") %>">SetCaps</a></td>
            <td>Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a></td>
            <td>Specify that the contents of this run is displayed with two horizontal lines through each character displayed on the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setfill") %>">SetFill</a></td>
            <td>Set the text color for the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setfontfamily") %>">SetFontFamily</a></td>
            <td>Set all 4 font slots with the specified font family.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setfontsize") %>">SetFontSize</a></td>
            <td>Set the font size for the characters of the current text run.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setitalic") %>">SetItalic</a></td>
            <td>Set the italic property to the text character.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a></td>
            <td>Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setspacing") %>">SetSpacing</a></td>
            <td>Set text spacing measured in twentieths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setstrikeout") %>">SetStrikeout</a></td>
            <td>Specify that the contents of this run are displayed with a single horizontal line through the center of the line.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setunderline") %>">SetUnderline</a></td>
            <td>Specify that the contents of this run are displayed along with a line appearing directly below the character (less than all the spacing above and below the characters on the line).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("presentationapi/apitextpr/setvertalign") %>">SetVertAlign</a></td>
            <td>Specify the alignment which will be applied to the contents of this run in relation to the default appearance of the run text.</td>
        </tr>
    </tbody>
</table>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("presentationapi/apiunicolor") %>">ApiUniColor</a>
    </h5>
    <table class="table table-classlist">
                <thead>
                    <tr class="tablerow">
                        <td class="table-classlist-name">Name</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("presentationapi/apiunicolor/getclasstype") %>">GetClassType</a></td>
                        <td>Get the type of this class.</td>
                    </tr>
                </tbody>
            </table>

    <h5 class="builder_page_class"><a href="<%= Url.Action("global") %>">Global</a></h5>

    
</asp:Content>
