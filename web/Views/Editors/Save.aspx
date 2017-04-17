<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Saving File
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Saving file</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of saving the document in ONLYOFFICE Document Server.</p>
    <img alt="Opening File" src="<%= Url.Content("~/content/img/editor/saving.jpg") %>" />
    <ol>
        <li>The user edits the document in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> sends the changes to the <b>document editing service</b>.</li>
        <li>The user closes the <b>document editor</b>.</li>
        <li>The <b>document editing service</b> watches the end of work with the document and collects the changes send from the <b>document editor</b> into one document.</li>
        <li>The <b>document editing service</b> informs the <b>document storage service</b> about the end of the document editing using the <em>callbackUrl</em> from <a href="<%= Url.Action("basic") %>">JavaScript API</a> and returns the link to the modified document.</li>
        <li>The <b>document storage service</b> downloads the document file with all the saved changes from the <b>document editing service</b> and stores it.</li>
    </ol>

    <h2 id="apply">How this can be done in practice</h2>
    <ol>
        <li>Create a <a href="<%= Url.Action("callback") %>">callback handler</a> to save the document from <b>document editing service</b>.</li>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>In the configuration script for Document Editor initialization specify the URL to the file with the <em>Callback handler</em> in the <a href="<%= Url.Action("config/editor") %>#callbackUrl">parameter line</a>.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "http://example.com/url-to-example-document.docx"
    },
    "documentType": "text",
    "editorConfig": {
        "callbackUrl": "http://example.com/url-to-callback.ashx"
    }
});
</pre>
            Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed.
        </li>
        <li>Open your <em>html</em> file in the browser and edit your document.</li>
        <li>Close the <b>Document Editor</b>. Check out your document in about 10 seconds. All changes should be saved, meaning the configuration is correct.</li>
    </ol>

    <h2 id="tenseconds">Save delay</h2>
    <p>The <b>document editing service</b> informs the <b>document storage service</b> about the end of the document editing after 10 seconds of editing closure.
        The time is not precise and is calculated using the file conversion time and conversion start delay time.
        The duration of the edited file conversion into the Office Open XML format depends on the file structure complexity and can be performed rather a long time.
        The conversion start delay is necessary to allow to return to the file editing session without the file saving, e.g. when reloading the browser page with the file opened for editing.
        The conversion start delay time can be changed in <b>Document Server</b> configuration file, which can be found at the following path:</p>
    <div>For Linux - <em>/etc/onlyoffice/documentserver/<b>default.json</b></em>.</div>
    <div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>default.json</b></em>.</div>

<div class="header-gray">Parameters</div>

<table class="table">
    <colgroup>
        <col style="width: 300px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 100px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>services.CoAuthoring.server.savetimeoutdelay</td>
            <td>The conversion start delay time (in milliseconds) after the edited file is closed.</td>
            <td>integer</td>
            <td>5000</td>
        </tr>
    </tbody>
</table>
    
    <div class="header-gray">Sample default.json configuration</div>
    <pre>
{
    "services": {
        "CoAuthoring": {
            "server": {
                "savetimeoutdelay": 5000
            }
        }
    }
}
</pre>

</asp:Content>
