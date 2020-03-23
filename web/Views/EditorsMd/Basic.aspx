<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Basic concepts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Basic concepts</span>
    </h1>

    <p class="dscr">ONLYOFFICE Document Server API is used to let the developers integrate the ONLYOFFICE Document/Spreadsheet/Presentation Editors into their own web sites and setup and manage the editors.</p>

    <p>The API JavaScript file can normally be found in the following editors folder:</p>
    <p><b>https://documentserver/web-apps/apps/api/documents/api.js</b></p>
    <p>Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
    <div class="note">
        For <b>Document Server</b> versions prior to 4.0 the path to the API JavaScript file will look like this:
        <br />
        <b>https://documentserver/OfficeWeb/apps/api/documents/api.js</b>
    </div>

    <p>The target HTML file where the editors are to be embedded need to have a placeholder <em>div</em> tag, where all the information about the editor parameters will be passed:</p>

    <pre>
&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;
</pre>

    <p>The page code containing the changeable parameters looks the following way:</p>

    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", config);
</pre>

    <p>Where <em>config</em> is an object:</p>

    <pre>
config = {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "text",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    }
};
</pre>
    <p>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <p>From now the <i>docEditor</i> object can be used to call the <b>document editor</b> <a href="<%= Url.Action("methods") %>">Methods</a>.</p>

    <p>
        The example above includes all the parameters necessary for Document Server correct startup.
        There are additional non-obligatory parameters though which can be changed to achieve different goals with your document (change access rights for the document, display different information about the document, etc.).
        See the <a href="<%= Url.Action("advanced") %>">Advanced parameters</a> section to find out what these parameters are and how you can change them.
    </p>

    <h2>Support</h2>
    <p>
        You can ask our developers at <a href="http://dev.onlyoffice.org/viewforum.php?f=9" target="_blank">dev.onlyoffice.org</a> (registration required).
    </p>
</asp:Content>
