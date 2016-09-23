<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Coediting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Coediting</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of co-editing the document in ONLYOFFICE™ Document Server.</p>
    <img alt="Co-editing" src="<%= Url.Content("~/content/img/editor/coedit.jpg") %>" />
    <ol>
        <li>User 1 and user 2 open one and the same document in <b>document editor</b>, i.e. when opening the file one and the same <a href="<%= Url.Action("config/document") %>#key" class="underline">key</a> has been used.</li>
        <li>User 1 makes changes to the opened document.</li>
        <li>The <b>document editor</b> sends changes made by user 1 to the <b>document editing service</b>.</li>
        <li>The <b>document editing service</b> sends the changes made by user 1 to the user 2 <b>document editor</b>.</li>
        <li>Now these changes become visible to user 2.</li>
    </ol>
    <img alt="Co-editing" src="<%= Url.Content("~/content/img/editor/coedit-view.png") %>" />

    <h2 id="apply">How this can be done in practice</h2>
    <ol>
        <li>Create an empty <em>html</em> file</li>
        <li>Add the <em>div</em> element as shown below.
            <pre>&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;</pre>
        </li>
        <li>Specify your ONLYOFFICE™ Document Server link with the JavaScript API that will be used for your website.
            <pre>&lt;script type=&quot;text/javascript&quot; src=&quot;http://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;</pre>
            Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE™ Document Server installed.
        </li>
        <li>Add the script initializing the <b>Document Editor</b> for the <em>div</em> element with the configuration for the document you want to open.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "documentType": "text",
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "http://example.com/url-to-example-document.docx",
    },
    "editorConfig": {
        "user": {
            "firstname": "John",
            "id": "78e1e841",
            "lastname": "Smith",
        },
    },
});
</pre>
        </li>
        <li>Open your <em>html</em> file in the browser.</li>
        <li>Now make a copy of your <em>html</em> file created above.</li>
        <li>Change the script initializing the <b>Document Editor</b> in the copied <em>html</em> file.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "documentType": "text",
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "http://example.com/url-to-example-document.docx",
    },
    "editorConfig": {
        "user": {
            "firstname": "Kate",
            "id": "F89d8069ba2b",
            "lastname": "Cage",
        },
    },
});
</pre>
        </li>
        <li>Open your copied and edited <em>html</em> file in the browser.</li>
    </ol>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
