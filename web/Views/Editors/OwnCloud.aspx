<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ownCloud/Nextcloud ONLYOFFICE integration app
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ownCloud/Nextcloud ONLYOFFICE integration app</span>
    </h1>

    <div class="video-link" title="Show video">
        <img src="/content/img/video/owncloud_integration.png" alt="Show video" />

        <div class="popap-dialog">
            <div class="popap-container">
                <div class="popap-header">How to integrate ONLYOFFICE Document Server with ownCloud</div>
                <iframe src="https://www.youtube.com/embed/IAjhUxBWKkQ?wmode=transparent" class="video-frame" frameborder="0" allowfullscreen></iframe>
                <a class="button-close button">Close</a>
            </div>
            <div class="button-close popap-close" title="Close">&times;</div>
        </div>
    </div>

    <p>
        This <a href="https://github.com/ONLYOFFICE/onlyoffice-owncloud" target="_blank">app</a> enables users to edit office documents from <a href="https://owncloud.com" target="_blank">ownCloud</a>/<a href="https://nextcloud.com" target="_blank">Nextcloud</a> using ONLYOFFICE Document Server.
        Currently the following document formats can be edited with this app: DOCX, XLSX, PPTX, TXT.
        The above mentioned formats are also available for viewing together with PDF and CSV.
        The edited files of the corresponding type can be converted into the Office Open XML formats: ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM.
    </p>
    <p>
        The app will create an item in the <em>new</em> (+) menu to create <b>Document</b>, <b>Spreadsheet</b>, <b>Presentation</b>.
        It will also create a new <b>Open in ONLYOFFICE</b> menu option within the document library for Office documents.
        This allows multiple users to collaborate in real time and to save back those changes to ownCloud/Nextcloud.
    </p>
    <p>Tested with ownCloud 9.0.3 and 9.1.3, Nextcloud 11.0.2</p>


    <h2>Installing ONLYOFFICE Document Server</h2>
    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from ownCloud/Nextcloud and any end clients (version 4.2 and later are supported for use with the app).
        If that is not the case, use the official ONLYOFFICE Document Server documentation page: <a href="http://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>.
        ONLYOFFICE Document Server must also be able to POST to ownCloud/Nextcloud directly.
    </p>
    <div class="note note-important">
        <div class="note-important-label">Please note</div>
        ONLYOFFICE Document Builder and ownCloud/Nextcloud <b>must</b> be installed on <b>different</b> computers, otherwise problems might occur and no correct connector work can be guaranteed.
    </div>
    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2>Installing ownCloud/Nextcloud ONLYOFFICE integration app</h2>
    <p>To start using ONLYOFFICE Document Server with ownCloud/Nextcloud, the following steps must be performed:</p>
    <ol>
        <li>Place ownCloud/Nextcloud ONLYOFFICE integration app to your ownCloud/Nextcloud server into the <em>/apps</em> (or some other) directory, <a href="https://doc.owncloud.org/server/9.0/admin_manual/installation/apps_management_installation.html#using-custom-app-directories" target="_blank">used</a> to connect applications:
            <span class="commandline">cd apps/
git clone https://github.com/ONLYOFFICE/onlyoffice-owncloud.git onlyoffice</span>
        </li>
        <li>In ownCloud/Nextcloud open the <span class="fakelink">~/index.php/settings/apps?category=disabled</span> page with <em>Not enabled</em> apps by administrator and click <em>Enable</em> for the <b>ONLYOFFICE</b> application.</li>
    </ol>


    <h2>Configuring ownCloud/Nextcloud ONLYOFFICE integration app</h2>
    <p>
        In ownCloud/Nextcloud open the <span class="fakelink">~/index.php/settings/admin#onlyoffice</span> page with administrative settings for <b>ONLYOFFICE</b> section and enter the address
    </p>
    <span class="commandline">https://&lt;documentserver&gt;</span>
    <p>
        Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
    </p>


    <h2>How it works</h2>
    <p>When creating a new file, the user navigates to a document folder within ownCloud/Nextcloud and clicks the <b>Document</b>, <b>Spreadsheet</b> or <b>Presentation</b> item in the <em>new</em> (+) menu.</p>
    <p>The browser invokes the <em>create</em> method in the <em>/lib/Controller/EditorController.php</em> controller. This method adds the copy of the file from the <em>assets</em> folder to the folder the user is currently in.</p>
    <p>Or, when opening an existing file, the user navigates to it within ownCloud/Nextcloud and selects the <b>Open in ONLYOFFICE</b> menu option.</p>
    <p>A new browser tab is opened and the <em>index</em> method of the <em>/lib/Controller/EditorController.php</em> controller is invoked.</p>
    <p>The app prepares a JSON object with the following properties:</p>
    <ul>
        <li><b>url</b> - the URL that ONLYOFFICE Document Server uses to download the document;</li>
        <li><b>callback</b> - the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>documentServerUrl</b> - the URL that the client needs to reply to ONLYOFFICE Document Server (can be set at the administrative settings page);</li>
        <li><b>key</b> - the UUID+Modified Timestamp to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
        <li><b>fileName</b> - the document Title (name);</li>
        <li><b>userId</b> - the identification of the user;</li>
        <li><b>userName</b> - the name of the user.</li>
    </ul>
    <p>ownCloud/Nextcloud takes this object and constructs a page from <em>templates/editor.php</em> template, filling in all of those values so that the client browser can load up the editor.</p>
    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the DocEditor configuration with the above properties.</p>
    <p>Then ONLYOFFICE Document Server downloads the document from ownCloud/Nextcloud and the user begins editing.</p>
    <p>ONLYOFFICE Document Server sends a POST request to the <em>callback</em> URL to inform ownCloud/Nextcloud that a user is editing the document.</p>
    <p>When all users and client browsers are done with editing, they close the editing window.</p>
    <p>After 10 seconds of inactivity, ONLYOFFICE Document Server sends a POST to the <em>callback</em> URL letting ownCloud/Nextcloud know that the clients have finished editing the document and closed it.</p>
    <p>ownCloud/Nextcloud downloads the new version of the document, replacing the old one.</p>

    <br />
    <p>Download the ownCloud/Nextcloud ONLYOFFICE integration app <a href="https://github.com/ONLYOFFICE/onlyoffice-owncloud" target="_blank">here</a>.</p>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
