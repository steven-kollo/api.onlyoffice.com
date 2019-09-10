<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Connector for Confluence
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Connector for Confluence</span>
    </h1>

    <p class="dscr">
        This <a href="https://github.com/ONLYOFFICE/onlyoffice-confluence" target="_blank">plugin</a> enables users to edit office documents from <a href="https://www.atlassian.com/software/confluence/" target="_blank">Confluence</a> using ONLYOFFICE Document Server.
        Currently the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX.
    </p>
    <p>
        The plugin will create a new <b>Edit in ONLYOFFICE</b> action within the document library for Office documents.
        This allows multiple users to collaborate in real time and to save back those changes to Confluence.
    </p>
    <p>The connector is available in the official <a href="https://marketplace.atlassian.com/1218214" target="_blank">Atlassian Marketplace</a>.</p>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Document Server</h2>
    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Confluence and any end clients (version 3.0 and later are supported for use with the plugin).
        If that is not the case, use the official ONLYOFFICE Document Server documentation page: <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>. ONLYOFFICE Document Server must also be able to POST to Confluence directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>

    <h2 id="get-connector" class="copy-link">Getting ONLYOFFICE Connector for Confluence from Atlassian Marketplace</h2>
    <p>You can download the latest connector version from the <a href="https://marketplace.atlassian.com/1218214" target="_blank">official Atlassian Marketplace</a>. This is done the following way:</p>
    <ul>
        <li>Log into your Confluence instance as an administrator.</li>
        <li>Click the admin drop-down box and choose <b>Add-ons</b>. The <b>Manage add-ons</b> screen will load.</li>
        <li>Click <b>Find new add-ons</b> from the left-hand side of the page.</li>
        <li>Locate <b>ONLYOFFICE Connector for Confluence</b> via search. Results will include the add-on versions compatible with your Confluence instance.</li>
        <li>Click <b>Install</b> to download and install your add-on.</li>
        <li>Now you can click <b>Close</b> in the <b>Installed and ready to go</b> dialog.</li>
    </ul>

    <h2 id="compile" class="copy-link">Compiling and installing ONLYOFFICE Connector for Confluence</h2>
    <p>If for some reason you want to compile ONLYOFFICE Connector for Confluence, then to start using ONLYOFFICE Document Server with Confluence, the following steps must be performed:</p>
    <ul>
        <li>1.8.X of the Oracle Java SE Development Kit 8,</li>
        <li>Atlassian Plugin SDK (<a href="https://developer.atlassian.com/docs/getting-started/set-up-the-atlassian-plugin-sdk-and-build-a-project" target="_blank">official instructions</a>),</li>
        <li>Compile package:
            <span class="commandline">atlas-package</span>
        </li>
    </ul>
    <p>Upload the compiled <b>target/onlyoffice-confluence-plugin-*.jar</b> to Confluence on the <em>Manage add-ons</em> page.</p>
    <p>The latest compiled package files are available <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-confluence/releases">here</a>.</p>


    <h2 id="configure" class="copy-link">Configuring ONLYOFFICE Connector for Confluence</h2>
    <p>Find the uploaded <b>ONLYOFFICE Connector for Confluence</b> on the <em>Manage add-ons</em> page.
        Click <em>Configure</em> and enter the name of the server with the ONLYOFFICE Document Server installed:</p>
    <span class="commandline">https://documentserver/</span>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>User navigates to a Confluence attachments and selects the <b>Edit in ONLYOFFICE</b> action.</p>
    <p>Confluence makes a request to OnlyOfficeEditorServlet (URL of the form: <em>/plugins/servlet/onlyoffice/doceditor?attachmentId=$attachment.id</em>).</p>
    <p>Confluence sends document to ONLYOFFICE Document storage service and receive a temporary link.</p>
    <p>Confluence prepares a JSON object with the following properties:</p>
    <ul>
        <li><b>url</b> - the temporary link that ONLYOFFICE Document Server uses to download the document;</li>
        <li><b>callbackUrl</b> - the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>key</b> - the UUID to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
        <li><b>title</b> - the document Title (name).</li>
    </ul>
    <p>Confluence takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.</p>
    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the DocEditor configuration with the above properties.</p>
    <p>Then ONLYOFFICE Document Server downloads the document from Confluence and the user begins editing.</p>
    <p>When all users and client browsers are done with editing, they close the editing window.</p>
    <p>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Document Server sends a POST to the <em>callback</em> URL letting Confluence know that the clients have finished editing the document and closed it.</p>
    <p>Confluence downloads the new version of the document, replacing the old one.</p>

    <br />
    <p>Download the ONLYOFFICE Connector for Confluence <a href="https://github.com/ONLYOFFICE/onlyoffice-confluence" target="_blank">here</a>.</p>

</asp:Content>
