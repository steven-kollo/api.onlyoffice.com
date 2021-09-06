<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Mattermost ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Mattermost ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">plugin</a> enables users to edit office documents from <a href="https://mattermost.com/" target="_blank">Mattermost</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing only: XLS, XLSX, CSV, XLSM, XLT, XLTM, ODS, FODS, OTS, PPS, PPSX, PPSM, PPT, PPTX, PPTM, POT, POTX, POTM, ODP, FODP, OTP, DOC, DOCX, DOCM, DOT, DOTX, DOTM, ODT, FODT, OTT, RTF.</li>
        <li>The plugin will create a new <b>Open in ONLYOFFICE</b> menu option within the document library for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to Mattermost.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Mattermost and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Mattermost directly.
    </p>
    <p>
        ONLYOFFICE Docs and Mattermost can be installed either on different computers, or on the same machine.
        If you use one machine, set up a custom port for Document Server.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Mattermost ONLYOFFICE integration plugin</h2>
    <p>To start using ONLYOFFICE Docs with Mattermost, the following steps must be performed:</p>
    <ol>
        <li>Clone the <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">master branch</a>.</li>
        <li>Go to the project root.</li>
        <li>
            <p>Run the following command:</p>
            <span class="commandline">make dist</span>
        </li>
        <li>Go to <em>&lt;your_mattermost_host&gt;/admin_console/plugins/plugin_management</em>.</li>
        <li>Choose the compiled plugin from your <em>dist</em> folder and press <b>Upload</b>.</li>
    </ol>


    <h2 id="configuration" class="copy-link">Configuring Mattermost ONLYOFFICE integration plugin</h2>
    <p>To connect ONLYOFFICE Docs, enter the following address:</p>
    <span class="commandline">https://&lt;documentserver&gt;/</span>
    <p>
        where the <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.
        The address must be accessible from the user browser and from the Mattermost server.
        The Mattermost server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
    </p>
    <p>To protect your documents from unauthorized access, enable JWT by specifying the secret key. If JWT protection is enabled, it is necessary to specify a custom header name 
        since the Mattermost security policy blocks external <b>Authorization</b> headers. This header should be specified in the ONLYOFFICE Docs signature settings as well. 
        To specify the ONLYOFFICE Docs prefix, use JWT prefix. Further information about signature can be found <a href="<%= Url.Action("signature/") %>">here</a>.</p>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>

    <br />
    <p>Download the Mattermost ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">here</a>.</p>

</asp:Content>
