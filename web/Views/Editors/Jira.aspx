<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Jira ONLYOFFICE integration app
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Jira ONLYOFFICE integration app</span>
    </h1>

    <p>This <a href="https://github.com/ONLYOFFICE/onlyoffice-jira" target="_blank">app</a> enables users to edit office documents from <a href="https://www.atlassian.com/software/jira" target="_blank">Jira Software</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing only: DOC, DOCX, DOCM, DOC, DOTX, DOTM, ODT, FODT, OTT, RTF, TXT, HTML, HTM, MHT, PDF, DJVU, FB2, EPUB, XPS, XLS, XLSX, XLSM, XLTZ , XLTX, XLTM, ODS, FODS, OTS, CSV, PPS, PPSX, PPSM, PPT, PPTX, PPTM, POT, POTX, POTM, ODP, FODP, OTP.</li>
        <li>The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to Jira.</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">Installing ONLYOFFICE Docs</h2>

    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Jira and any end clients.
        If that is not the case, use the official <a href="http://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to Jira directly.
    </p>

    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="installing" class="copy-link">Installing Jira ONLYOFFICE integration app</h2>

    <p>Upload the compiled <em>target/onlyoffice-jira-app.jar</em> to Jira on the <b>Manage apps</b> page.</p>
    <p>The latest compiled package files are available <a href="https://github.com/ONLYOFFICE/onlyoffice-jira/releases" target="_blank">here</a> 
        and on <a href="https://marketplace.atlassian.com/???" target="_blank">Atlassian Marketplace</a>.</p>
    <p>You can also install the app from Jira administration panel:</p>
    <ol>
        <li>Navigate to the <b>Manage apps</b> page.</li>
        <li>Click <b>Find new apps</b> on the left panel.</li>
        <li>Locate <b>ONLYOFFICE Connector for Jira</b> using search.</li>
        <li>Click <b>Install</b> to download and install the app.</li>
    </ol>


    <h2 id="configuring" class="copy-link">Configuring Jira ONLYOFFICE integration app</h2>

    <p>Find the uploaded app on the <b>Manage apps</b> page. Click <b>Configure</b> and enter the name of the server with ONLYOFFICE Docs installed:</p>
    <span class="commandline">http://documentserver/</span>
    <p>
        where the <b>documentserver</b> is the name of the server with the <b>ONLYOFFICE Docs</b> installed.
        The address must be accessible for the user browser and from the Jira server.
        The Jira server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
    </p>


    <h2 id="compiling" class="copy-link">Compiling Jira ONLYOFFICE integration app</h2>

    <p>If you plan to compile the Jira ONLYOFFICE integration app yourself (e.g. edit the source code and compile it afterwards), follow these steps:</p>
    <ol>
        <li>
            <p>
                The stable Java version is necessary for the successful build. 
                If you do not have it installed, use the following commands to install <b>Open JDK 8</b>:
            </p>
            <span class="commandline">sudo apt-get update
sudo apt-get install openjdk-8-jdk</span>
        </li>
        <li>Install <b>Atlassian Plugin SDK</b>. Installation process is described <a href="https://developer.atlassian.com/server/framework/atlassian-sdk/set-up-the-atlassian-plugin-sdk-and-build-a-project/" target="_blank">here</a>.</li>
        <li>Compile package:
            <span class="commandline">atlas-package</span>
        </li>
    </ol>


    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <ol>
        <li>User navigates to the Jira attachments and selects the <b>Edit in ONLYOFFICE</b> action.</li>
        <li>Jira makes a request to <b>OnlyOfficeEditorServlet</b> (URL of the form: <em>/plugins/servlet/onlyoffice/doceditor?attachmentId=$attachment.id</em>).</li>
        <li>Jira sends a document to ONLYOFFICE Document storage service and receive a temporary link.</li>
        <li>
            <p>Jira prepares a JSON object with the following properties:</p>
            <ul>
                <li><b>url</b>: the temporary link that ONLYOFFICE Docs uses to download the document,</li>
                <li><b>callbackUrl</b>: the URL that ONLYOFFICE Docs informs about status of the document editing,</li>
                <li><b>docserviceApiUrl</b>: the URL that the client needs to reply to ONLYOFFICE Docs (provided by the <em>files.docservice.url.api</em> property),</li>
                <li><b>key</b>: the UUID to instruct ONLYOFFICE Docs whether to download the document again or not,</li>
                <li><b>title</b>: the document title (name).</li>
            </ul>
        </li>
        <li>Jira takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from document storage and the user begins editing.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to the callback URL letting Jira know that the clients have finished editing the document and closed it.</li>
        <li>Jira downloads a new version of the document, replacing the old one.</li>
    </ol>

    <br />
    <p>Download the Jira ONLYOFFICE integration app <a href="https://github.com/ONLYOFFICE/onlyoffice-jira" target="_blank">here</a>.</p>

</asp:Content>
