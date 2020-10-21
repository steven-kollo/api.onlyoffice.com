<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Nextcloud ONLYOFFICE integration app
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Nextcloud ONLYOFFICE integration app</span>
    </h1>

    <div class="video-link" title="Show video">
        <img src="<%= Url.Content("~/content/img/video/nextcloud_integration.png") %>" alt="Show video" />

        <div class="popap-dialog">
            <div class="popap-container">
                <div class="popap-header">How to integrate ONLYOFFICE Document Server with Nextcloud</div>
                <iframe src="https://www.youtube.com/embed/vN9v9sJ0HVw?wmode=transparent" class="video-frame" frameborder="0" allowfullscreen></iframe>
                <a class="button-close button">Close</a>
            </div>
            <div class="button-close popap-close" title="Close">&times;</div>
        </div>
    </div>

    <p>
        This <a href="https://github.com/ONLYOFFICE/onlyoffice-nextcloud" target="_blank">app</a> enables users to edit office documents from <a href="https://nextcloud.com" target="_blank">Nextcloud</a> using ONLYOFFICE Document Server.
        Currently the following document formats can be edited with this app: csv, docx, pptx, txt, xlsx.
        The above mentioned formats are also available for viewing together with pdf.
        The edited files of the corresponding type can be converted into the Office Open XML formats: doc, docm, dot, dotx, epub, htm, html, odp, odt, pot, potm, potx, pps, ppsm, ppsx, ppt, pptm, rtf, xls, xlsm, xlsx, xlt, xltm, xltx.
    </p>
    <p>
        The app will create an item in the <em>new</em> (+) menu to create <b>Document</b>, <b>Spreadsheet</b>, <b>Presentation</b>.
        It will also create a new <b>Open in ONLYOFFICE</b> menu option within the document library for Office documents.
        This allows multiple users to collaborate in real time and to save back those changes to Nextcloud.
    </p>
    <p>You can also use our <a target="_blank" href="https://github.com/ONLYOFFICE/docker-onlyoffice-nextcloud">Docker installation</a> to get installed and configured Document Server and Nextcloud installation with a couple of commands.</p>
    <p>The latest connector signed versions are available in the official store for <a target="_blank" href="https://apps.nextcloud.com/apps/onlyoffice">Nextcloud</a>.</p>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Document Server</h2>
    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Nextcloud and any end clients.
        If that is not the case, use the official ONLYOFFICE Document Server documentation page: <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>.
        ONLYOFFICE Document Server must also be able to POST to Nextcloud directly.
    </p>
    <p>
        ONLYOFFICE Document Server and Nextcloud can be installed either on different computers, or on the same machine.
        In case you select the latter variant, you will need to set up a custom port for Document Server as by default both ONLYOFFICE Document Server and Nextcloud work on port 80.
        Or you can use Document Server behind a proxy, please refer to <a href="https://helpcenter.onlyoffice.com/server/document/document-server-proxy.aspx">this article</a> to learn how you can configure it.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Nextcloud ONLYOFFICE integration app</h2>
    <p>
        The Nextcloud administrator can install the integration app from the in-built application market.
        For that go to the user name and select <b>Apps</b>.
        After that find <b>ONLYOFFICE</b> in the list of available applications and install it.
    </p>
    <p>
        If the server with the Nextcloud installed does not have an Internet access, or if you need it for some other reason, the administrator can install the application manually.
        To start using ONLYOFFICE Document Server with Nextcloud, the following steps must be performed:
    </p>
    <ol>
        <li>
            Go to the Nextcloud server <em>apps/</em> directory (or some other directory <a href="https://docs.nextcloud.com/server/stable/admin_manual/apps_management.html#using-custom-app-directories" target="_blank">used</a> to connect applications):
            <span class="commandline">cd apps/</span>
        </li>
        <li>
            Get the Nextcloud ONLYOFFICE integration app.
            There are several ways to do that:
            <ol style="list-style-type: lower-alpha;">
                <li>Download the latest signed version from the official store for <a target="_blank" href="https://apps.nextcloud.com/apps/onlyoffice">Nextcloud</a>.</li>
                <li>Or you can download the latest signed version from the application <a target="_blank" href="https://github.com/ONLYOFFICE/onlyoffice-nextcloud/releases">release page</a> on GitHub.</li>
                <li>Or you can clone the application source code and compile it yourself:
                    <span class="commandline">git clone https://github.com/ONLYOFFICE/onlyoffice-nextcloud.git onlyoffice</span>
                </li>
            </ol>
        </li>
        <li>Change the owner to update the application right from Nextcloud web interface:
            <span class="commandline">chown -R www-data:www-data onlyoffice</span>
        </li>
        <li>In Nextcloud open the <span class="fakelink">~/settings/apps/disabled</span> page with <em>Not enabled</em> apps by administrator and click <em>Enable</em> for the <b>ONLYOFFICE</b> application.</li>
    </ol>


    <h2 id="settings" class="copy-link">Configuring Nextcloud ONLYOFFICE integration app</h2>
    <p>
        In Nextcloud open the <span class="fakelink">~/settings/admin/onlyoffice</span> page with administrative settings for <b>ONLYOFFICE</b> section.
        Enter the following address to connect ONLYOFFICE Document Server:
    </p>
    <span class="commandline">https://&lt;documentserver&gt;/</span>

    <p>
        Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
        The address must be accessible for the user browser and from the Nextcloud server.
        The Nextcloud server address must also be accessible from ONLYOFFICE Document Server for correct work.
    </p>
    <img alt="Local" src="<%= Url.Content("~/content/img/editor/nextcloud-local.jpg") %>" />

    <p id="internalUrl">
        Sometimes your network configuration might not allow the requests between installed Nextcloud and ONLYOFFICE Document Server using the public addresses.
        The <em>Advanced server settings</em> allows to set the ONLYOFFICE Document Server address for internal requests from Nextcloud server and the returning Nextcloud address for the internal requests from ONLYOFFICE Document Server.
        You need to enter them in the appropriate fields.
    </p>
    <img alt="Public" src="<%= Url.Content("~/content/img/editor/nextcloud-public.jpg") %>" />

    <p>
        To restrict the access to ONLYOFFICE Document Server and for security reasons and data integrity the encrypted signature is used.
        Specify the <em>Secret key</em> in the Nextcloud administrative configuration.
        In the ONLYOFFICE Document Server <a href="<%= Url.Action("signature") %>">config file</a> specify the same secret key and enable the validation.
    </p>

    <p>Enable or disable the <em>Open file in the same tab</em> setting.</p>

    <p>
        The <b>Open in ONLYOFFICE</b> action will be added to the file context menu.
        You can specify this action as default and it will be used when the file name is clicked for the selected file types.
    </p>

    <p id="editable">
        ONLYOFFICE Document Server uses Office Open XML format as a basis when opening and editing files.
        If the file format is different from OOXML, it will still be converted to the corresponding OOXML for the document server proper work and faster performance.
        After that you can edit the file, making any changes available for the base OOXML format and save the file to this base OOXML format.
    </p>

    <p>
        In case the source Nextcloud file format was different from the base one, and you still want to save it to the original format, the file will be converted to this format from OOXML.
        As the formats are fundamentally different, some data (such as charts, tables, autoshapes or images) and formatting can be lost due to the simple reason that some formats (<em>csv</em>, <em>txt</em>, etc.) do not support them or treat them differently than OOXML standard does.
        That is why all the non-OOXML files by default are opened for viewing only, although there is an option to convert the file in the context menu.
        If you realise the data/formatting loss risks after the conversion, but still want to open non-OOXML files for editing, you can check them in the list in the settings.
        Editing for <em>csv</em> and <em>txt</em> files is available by default.
    </p>


    <h2 id="connection" class="copy-link">Checking the connection</h2>
    <p>
        You can check the connection to ONLYOFFICE Document Server by using the following occ command:
    </p>
    <span class="commandline">occ onlyoffice:documentserver --check</span>
    
    <p>
        You will see a text either with information about the successful connection or the cause of the error.
    </p>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>When creating a new file, the user navigates to a document folder within Nextcloud and clicks the <b>Document</b>, <b>Spreadsheet</b> or <b>Presentation</b> item in the <em>new</em> (+) menu.</p>
    <p>
        The browser invokes the <em>create</em> method in the <em>/lib/Controller/EditorController.php</em> controller.
        This method adds the copy of the file from the <em>assets</em> folder to the folder the user is currently in.
    </p>
    <p>Or, when opening an existing file, the user navigates to it within Nextcloud and selects the <b>Open in ONLYOFFICE</b> menu option.</p>
    <p>A new browser tab is opened and the <em>index</em> method of the <em>/lib/Controller/EditorController.php</em> controller is invoked.</p>
    <p>The app prepares a JSON object with the following properties:</p>
    <ul>
        <li><b>url</b> - the URL that ONLYOFFICE Document Server uses to download the document;</li>
        <li><b>callbackUrl</b> - the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>key</b> - the UUID+Modified Timestamp to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
        <li><b>title</b> - the document Title (name);</li>
        <li><b>id</b> - the identification of the user;</li>
        <li><b>name</b> - the name of the user.</li>
    </ul>
    <p>Nextcloud takes this object and constructs a page from <em>templates/editor.php</em> template, filling in all of those values so that the client browser can load up the editor.</p>
    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the DocEditor configuration with the above properties.</p>
    <p>Then ONLYOFFICE Document Server downloads the document from Nextcloud and the user begins editing.</p>
    <p>ONLYOFFICE Document Server sends a POST request to the <em>callback</em> URL to inform Nextcloud that a user is editing the document.</p>
    <p>When all users and client browsers are done with editing, they close the editing window.</p>
    <p>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Document Server sends a POST to the <em>callback</em> URL letting Nextcloud know that the clients have finished editing the document and closed it.</p>
    <p>Nextcloud downloads the new version of the document, replacing the old one.</p>

    <h2 id="issue" class="copy-link">Known issues</h2>
    <ul>
        <li id="externalStorage">
            Adding the storage using the <b>External storages</b> app has issues with the co-editing in some cases.
            If the connection is made using the same authorization keys (the <em>Username and password</em> or <em>Global credentials</em> authentication type is selected), then the co-editing is available for the users.
            If different authorization keys are used (<em>Log-in credentials, save in database</em> or <em>User entered, store in database</em> authentication options), the co-editing is not available.
            When the <em>Log-in credentials, save in session</em> authentication type is used, the files cannot be opened in the editor.
        </li>
        <li id="masterKey">
            Nextcloud provides an option to encrypt the file storage.
            But if the encryption with the <em>per-user encryption keys</em> (used by default in Nextcloud <b>Default encryption module</b> app) is enabled, ONLYOFFICE Document Server cannot open the encrypted files for editing and save them after the editing.
            The ONLYOFFICE section of the administrative settings page will display a notification about it.
            However if you set the encryption with the <em>master key</em>, ONLYOFFICE application will work as intended.
            The instruction on enabling <em>master key</em> based encryption is available in the official documentation on <a href="https://docs.nextcloud.com/server/latest/admin_manual/configuration_files/encryption_configuration.html#occ-encryption-commands" target="_blank">Nextcloud</a> websites.
            <div class="note note-important">
                <div class="note-important-label">Please note</div>
                Nextcloud recommends using <em>master encryption key</em> only on fresh installations with no existing data, or on systems where encryption has not already been enabled, as your files previously encrypted with the use of per-user encryption keys <b>might be lost forever</b> after you enable <em>master key</em> based encryption on them.
            </div>
        </li>
        <li id="verify_peer_off">
            If you are using a self-signed certificate for your <b>Document Server</b>, Nextcloud will not validate such a certificate and will not allow connection to/from <b>Document Server</b>.
            This issue can be solved the following way: locate the Nextcloud config file (<em>/nextcloud/config/config.php</em>) and open it.
            Insert the following section to it:
        <pre>
'onlyoffice' => array (
    'verify_peer_off' => true
)
</pre>
            This will disable the certificate verification and allow Nextcloud to establish connection with <b>Document Server</b>, but you must remember that this is a temporary insecure solution and we strongly recommend that you replace the certificate with the one issued by some CA.
            Once you do that, do not forget to remove the above section from Nextcloud config file.
        </li>
        <li id="federated">
            If the document is shared using the Federated Cloud Sharing app, the co-editing between the Nextcloud instances connected to different ONLYOFFICE servers will not be avaialble.
            The users from one and the same Document Server can edit the document in the co-editing mode, but the users from two (or more) different Document Servers will not be able to collaborate on the same document in real time.
        </li>
    </ul>


    <br />
    <p>Download the Nextcloud ONLYOFFICE integration app <a href="https://github.com/ONLYOFFICE/onlyoffice-nextcloud" target="_blank">here</a>.</p>

</asp:Content>
