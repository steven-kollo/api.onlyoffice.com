<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Connector for HumHub
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Connector for HumHub</span>
    </h1>

    <p>This plugin enables users to edit office documents from <a href="https://www.humhub.com/" target="_blank">HumHub</a> using ONLYOFFICE Document Server.</p>
    <p>The plugin is available in the official <a href="https://www.humhub.com/en/marketplace/onlyoffice/" target="_blank">HumHub Marketplace</a>.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for view only: ODT, ODS, ODP, DOC, XLS, PPT, TXT, PDF.</li>
        <li>The plugin will create a new <em>Edit/View</em>  menu option for Office documents.</li>
        <li>This allows multiple users to collaborate in real time and to save back those changes to HumHub.</li>
        <li>The following formats can be converted to Office Open XML: ODT, ODS, ODP, DOC, XLS, PPT, TXT, CSV.</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">Installing ONLYOFFICE Document Server</h2>

    <p>You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from HumHub and any end clients. If that is not the case, use the official ONLYOFFICE Document Server documetnation page: <a href="http://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>. ONLYOFFICE Document Server must also be able to POST to HumHub directly.</p>

    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="installing-plugin" class="copy-link">Installing ONLYOFFICE Connector for HumHub</h2>

    <p>Either install it from HumHub Marketplace or simply clone the repository inside one of the folder specified by <em>moduleAutoloadPaths</em> parameter. Please see <a href="http://docs.humhub.org/dev-environment.html#external-modules-directory" target="_blank">HumHub Documentation</a> for more information.</p>


    <h2 id="configuring" class="copy-link">Configuring ONLYOFFICE Connector for HumHub</h2>

    <p>In order to configure plugin you must navigate to <em>Administation -> Modules</em>. Find ONLYOFFICE plugin and click <em>Configure</em>.</p>


    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <p>The ONLYOFFICE integration follows the API documented <a href="https://api.onlyoffice.com/editors/basic" target="_blank">here</a>:</p>

    <p>When creating a new file, the user will be provided with Document, Spreadsheet or Presentation options in the <em>Create document</em> menu.</p>

    <p>The browser invokes the <em>index</em> method in the <em>/controllers/CreateController.php</em> controller.</p>

    <p>Or, when opening an existing file, the user will be provided with <em>View document</em> or <em>Edit document</em> depending on an extension.</p>

    <p>A popup is opened and the <em>index</em> method of the <em>/controllers/OpenController.php</em> controller is invoked.</p>

    <p>The app prepares a JSON object with the following properties:</p>
    <ul>
        <li><b>url</b> - the URL that ONLYOFFICE Document Server uses to download the document;</li>
        <li><b>callbackUrl</b> - the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>key</b> - the random MD5 hash to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
        <li><b>title</b> - the document Title (name);</li>
        <li><b>id</b> - the identification of the user;</li>
        <li><b>name</b> - the name of the user.</li>
    </ul>
    <p>HumHub takes this object and constructs a page from <em>views/open/index.php</em> template, filling in all of those values so that the client browser can load up the editor.</p>

    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the DocEditor configuration with the above properties.</p>

    <p>Then ONLYOFFICE Document Server downloads the document from HumHub and the user begins editing.</p>

    <p>ONLYOFFICE Document Server sends a POST request to the <em>callbackUrl</em> to inform HumHub that a user is editing the document.</p>

    <p>When all users and client browsers are done with editing, they close the editing window.</p>

    <p>After <a href="https://api.onlyoffice.com/editors/save#savedelay" target="_blank">10 seconds</a> of inactivity, ONLYOFFICE Document Server sends a POST to the <em>callbackUrl</em> letting HumHub know that the clients have finished editing the document and closed it.</p>

    <p>HumHub downloads the new version of the document, replacing the old one.</p>


    <br />
    <p>Download the ONLYOFFICE Connector for HumHub <a href="https://github.com/ONLYOFFICE/onlyoffice-humhub" target="_blank">here</a>.</p>

</asp:Content>
