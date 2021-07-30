<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Liferay ONLYOFFICE connector
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Liferay ONLYOFFICE connector</span>
    </h1>

    <p>This plugin enables users to edit office documents from <a href="https://www.liferay.com/" target="_blank">Liferay</a> using ONLYOFFICE Document Server.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for view only: ODT, ODS, ODP, DOC, XLS, PPT.</li>
        <li>The plugin will create a new <em>ONLYOFFICE Edit/View</em>  menu option within the <em>Documents and Media</em> section for Office documents.</li>
        <li>This allows multiple users to collaborate in real time and to save back those changes to Liferay.</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">Installing ONLYOFFICE Document Server</h2>

    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Liferay and any end clients.
        If that is not the case, use the official ONLYOFFICE Document Server documetnation page: <a href="http://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>.
        ONLYOFFICE Document Server must also be able to POST to Liferay directly.
    </p>

    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="compiling" class="copy-link">Compiling Liferay ONLYOFFICE connector</h2>

    <p>
        Simply run <i>gradle build</i>.
        Output .jar will be placed inside <i>build/libs</i> directory.
    </p>


    <h2 id="installing-plugin" class="copy-link">Installing Liferay ONLYOFFICE connector</h2>

    <p>
        Either install it from <a href="https://web.liferay.com/marketplace/-/mp/application/171169174">Liferay Marketplace</a> or if you're building the plugin by yourself simply put compiled .jar file from <i>build/libs</i> folder to <i>/opt/liferay/deploy</i>.
        Liferay will install the plugin automatically.
    </p>


    <h2 id="configuring" class="copy-link">Configuring Liferay ONLYOFFICE integration plugin</h2>

    <p>
        In order to configure plugin you must navigate to <em>System Settings</em> <i>(Control Panel -> Configuration -> System Settings)</i>.
        In <em>Platform</em> section click on <em>Connectors</em> category and select ONLYOFFICE.
    </p>


    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <p>The ONLYOFFICE integration follows the API documented <a href="https://api.onlyoffice.com/editors/basic" target="_blank">here</a>:</p>


    <p>User navigates to a <em>Documents and Media</em> section within Liferay and selects the <i>Edit in ONLYOFFICE</i> action.</p>
    <p>Liferay prepares a JSON object for the Document Server with the following properties:</p>
    <ul>
        <li><b>url</b>: the URL that ONLYOFFICE Document Server uses to download the document,</li>
        <li><b>callbackUrl</b>: the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>key</b>: the fileVersionId to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
        <li><b>title</b>: the document Title (name).</li>
    </ul>
    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the docEditor configuration with the above properties.</p>
    <p>Then ONLYOFFICE Document Server downloads the document from Liferay and the user begins editing.</p>
    <p>ONLYOFFICE Document Server sends a POST request to the <i>callback</i> URL to inform Liferay that a user is editing the document.</p>
    <p>Liferay locks the document, but still allows other users with write access the ability to collaborate in real time with ONLYOFFICE Document Server by leaving the Action present.</p>
    <p>When all users and client browsers are done with editing, they close the editing window.</p>
    <p>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Document Server sends a POST to the <i>callback</i> URL letting Liferay know that the clients have finished editing the document and closed it.</p>
    <p>Liferay downloads the new version of the document, replacing the old one.</p>


    <br />
    <p>Download the Liferay ONLYOFFICE connector <a href="https://github.com/ONLYOFFICE/onlyoffice-liferay" target="_blank">here</a>.</p>

</asp:Content>
