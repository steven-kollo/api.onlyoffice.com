<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    C# Builder samples
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">C# library samples</span>
    </h1>

    <h2>Before you start</h2>
    <p class="dscr">For the samples to work correctly, make sure that two conditions are met:</p>
    <ol>
        <li>
            <p><a target="blank" href="https://www.onlyoffice.com/download-builder.aspx?utm_source=api">ONLYOFFICE Document Builder</a> is installed into default directory <b>"C:/Program Files/ONLYOFFICE/DocumentBuilder"</b> on your computer.</p>
        </li>
        <li><b>The directory</b> in which you are going to store the downloaded samples <b>has general editing access</b> to save files created by the Document Builder.</li>
    </ol>

    <h2>Download a sample</h2>

    <p>Download one of the Builder C# samples archive and unzip it into a folder with general editing access.</p>
    <ul>
        <li>
            <a href="<%= new System.UriBuilder(Request.Url.AbsoluteUri) { Path = "/app_data/docbuilder/csharp-samples/FillingSpreadsheet.zip" }.ToString() %>">Filling spreadsheet</a>
        </li>
        <li>
            <a href="<%= new System.UriBuilder(Request.Url.AbsoluteUri) { Path = "/app_data/docbuilder/csharp-samples/CommentingErrors.zip" }.ToString() %>">Commenting spreadsheet errors</a>
        </li>
        <li>
            <a href="<%= new System.UriBuilder(Request.Url.AbsoluteUri) { Path = "/app_data/docbuilder/csharp-samples/CreatingPresentation.zip" }.ToString() %>">Creating presentation</a>
        </li>
        <li>
            <a href="<%= new System.UriBuilder(Request.Url.AbsoluteUri) { Path = "/app_data/docbuilder/csharp-samples/CreatingChartPresentation.zip" }.ToString() %>">Creating chart presentation</a>
        </li>
        <li>
            <a href="<%= new System.UriBuilder(Request.Url.AbsoluteUri) { Path = "/app_data/docbuilder/csharp-samples/CreatingBasicForm.zip" }.ToString() %>">Creating basic form</a>
        </li>
        <li>
            <a href="<%= new System.UriBuilder(Request.Url.AbsoluteUri) { Path = "/app_data/docbuilder/csharp-samples/CreatingAdvancedForm.zip" }.ToString() %>">Creating advanced form</a>
        </li>
        <li>
            <a href="<%= new System.UriBuilder(Request.Url.AbsoluteUri) { Path = "/app_data/docbuilder/csharp-samples/FillingForm.zip" }.ToString() %>">Filling form</a>
        </li>
    </ul>

    <h2>Sample structure</h2>
    <img class="screenshot" alt="C# Builder sample structure" src="<%= Url.Content("~/content/img/docbuilder/csharp/sample_structure.png") %>" />
    <p>Each sample includes a <b>code folder</b>, an <b>sln file</b>, and a <b>template file</b> if the sample uses a template.<br />The code folder consists of two files: a <b>project file</b> and a <b>program file</b>.</p>
    <img class="screenshot" alt="C# Builder project file" src="<%= Url.Content("~/content/img/docbuilder/csharp/project_file.png") %>" />
    <p>Please note that the <b>path to the DocBuilder .dll file in the project file is set to default</b>. Here you can change the path if DocBuilder is located in a different directory on your computer.</p>

    <h2>Program structure</h2>
    <img class="screenshot" alt="C# Builder program file" src="<%= Url.Content("~/content/img/docbuilder/csharp/program_file.png") %>" />
    <ul>
        <li>
            <p>Include doctrenderer library <a href="<%= Url.Action("integrationapi/net") %>">.Net wrapper</a> classes.</p>
        </li>
        <li>
            <p>Specify the paths to the Document Builder <b>work directory</b>, the <b>result path</b> (where the generated file will be saved), and the optional <b>file path</b> (if a template file will be used).</p>
        </li>
        <li>
            <p>Add <b>.dll</b> files to the environment.</p>
        </li>
        <li>
            <p>Call the <b>builder function</b> (this function is created by user and calls the DocBuilder method to work with documents).</p>
        </li>
    </ul>

    <img class="screenshot" alt="C# Builder builder function" src="<%= Url.Content("~/content/img/docbuilder/csharp/builder_function.png") %>" />
    <ul>
        <li>
            <p><a href="<%= Url.Action("integrationapi/net/cdocbuilder/initialize") %>">Initialize</a> the <a href="<%= Url.Action("integrationapi/net/cdocbuilder") %>">DocBuilder</a> from the working directory. After that Builder opens or creates a file so that <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">Context</a>, <a href="<%= Url.Action("/integrationapi/net/cdocbuildercontext/createscope") %>">Scope</a> and <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/getglobal") %>">Global</a> classes can be accessed.</p>
        </li>
        <li>
            <p>Edit file using DocBuilder API methods. Use <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/call") %>">Call</a> method with the name and params of the API method you call as an arguments.</p>
        </li>
        <li>
            <p><a href="<%= Url.Action("integrationapi/net/cdocbuilder/savefile") %>">Save</a> and <a href="<%= Url.Action("integrationapi/net/cdocbuilder/closefile") %>">close</a> file after editing, then call the <a href="<%= Url.Action("integrationapi/net/cdocbuilder/destroy") %>">Destroy</a> method to destroy DocBuilder.</p>
        </li>
    </ul>

    <h2>Run the sample</h2>
    <p>Open .sln file inside the sample folder to build the project.<br />Run the program when the project is built.</p>
    <img class="screenshot" alt="Visual Studio build and run sample" src="<%= Url.Content("~/content/img/docbuilder/csharp/build_and_run.png") %>" />
    <h2>Check the result</h2>
    <p>After program execution the result file will be saved to the <b>result path</b>. It's sample folder root by default.</p>
    <img class="screenshot" alt="C# Builder sample structure result file" src="<%= Url.Content("~/content/img/docbuilder/csharp/sample_structure_after.png") %>" />
    <img class="screenshot" alt="C# Builder sample folder result file" src="<%= Url.Content("~/content/img/docbuilder/csharp/folder_root_after.png") %>" />
    <p>Open <b>result file</b> and check the result.</p>
    <img class="screenshot" alt="C# Builder result file" src="<%= Url.Content("~/content/img/docbuilder/csharp/result_file.png") %>" />

</asp:Content>