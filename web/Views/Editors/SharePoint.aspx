<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE SharePoint integration solution
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE SharePoint integration solution</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-sharepoint" target="_blank">solution</a> enables users to edit office documents from SharePoint using <b>ONLYOFFICE Document Server</b>. Currently the following document formats can be edited: DOCX, XLSX, PPTX, PPSX. The above mentioned formats are also available for viewing together with PDF, DJVU, TXT, CSV, ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM, MHT, XPS.</p>

    <p>The solution will create a new <b>Edit in ONLYOFFICE</b> menu option within the context menu of the file and the ribbon for Office documents. This allows multiple users to collaborate in real time and to save back those changes to SharePoint.</p>

    <h2>Installing ONLYOFFICE Document Server</h2>
    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from SharePoint and any end clients.
        If that is not the case, use the official ONLYOFFICE Document Server documentation page: <a href="http://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>.
        ONLYOFFICE Document Server must also be able to POST to SharePoint directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2>Installing ONLYOFFICE SharePoint integration solution</h2>
    <p>To start using ONLYOFFICE Document Server with ONLYOFFICE SharePoint solution, the following steps must be performed:</p>
    <div class="note">Steps <b>1</b> &mdash; <b>4</b> are only necessary if you for some reason plan to compile the ONLYOFFICE SharePoint solution yourself (e.g. edit the source code and compile it afterwards). If you do not want to do that and plan to use the already compiled solution package, please skip to step <b>5</b> directly. The latest compiled package files are available <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-sharepoint/releases">here</a>.</div>
    <ol>
        <li>Enter the SharePoint server and open this project in Visual Studio.</li>
        <li>In Solution Explorer, open the shortcut menu for the project and then choose <b>Publish</b>.</li>
        <li>In the <b>Publish</b> dialog box, choose the <b>Publish to File System</b> option button.</li>
        <li>In the <b>Target Location</b> text box, enter the path where <em>Install.ps1</em> is located, and then choose the <b>Publish</b> button; when the publishing process is finished, the solution <em>(.wsp)</em> file will appear.</li>
        <li>Click <b>Start</b>, point to <b>All Programs</b>, point to <b>Administrative Tools</b>, and then click <b>Services</b>, and make sure that <b>SharePoint Administration</b> service is started.</li>
        <li>Click <b>Start</b>, click <b>SharePoint Management Shell</b>, go to the directory with the <em>.wsp</em> file.</li>
        <li>Run the <em>Install.ps1</em> script:
            <span class="commandline">PS> .\Install.ps1</span>
        </li>
        <li>Enter your SharePoint site address:
            <span class="commandline">https://&lt;yoursharepointsite&gt;</span>
        </li>
    </ol>
    <div class="note">Alternatively to steps <b>7</b> and <b>8</b> you can type the following command:
        <span class="commandline">Add-SPSolution -LiteralPath&lt;solutionpath&gt;/onlyoffice.wsp</span>
        On the <b>SharePoint Central Administration</b> home page, click <b>System Settings > Farm Management > Manage farm solutions</b>.
On the <b>Solution Management</b> page, click <em>onlyoffice.wsp</em>, then click <b>Deploy Solution</b>.
    </div>
    <ol start="9">
        <li>On the <b>SharePoint Central Administration</b> home page, under <b>Application Management</b>, click <b>Manage web applications</b>.</li>
        <li>Make sure you select your site and click the <b>Authentication Providers</b> icon.</li>
        <li>In the <b>Authentication Providers</b> pop-up window click <b>Default zone</b>.</li>
        <li>Under <b>Edit Authentication</b>, check <b>Enable anonymous access</b> and click <b>Save</b>.</li>
        <li>Going back to <b>Web Application Management</b> click on the <b>Anonymous Policy</b> icon.</li>
        <li>Under <b>Anonymous Access Restrictions</b> select your <b>Zone</b> and set the <b>Permissions to None – No</b> policy and click <b>Save</b>.</li>
    </ol>

    <h2>Configuring SharePoint ONLYOFFICE integration solution</h2>
    <p>In SharePoint open the <em>~/_layouts/15/Onlyoffice/Settings.aspx</em> page with administrative settings. Enter the following address to connect <b>ONLYOFFICE Document Server</b>:</p>

    <span class="commandline">https://&lt;documentserver&gt;/</span>

    <p>Where the <b>documentserver</b> is the name of the server with the <b>ONLYOFFICE Document Server</b> installed. The address must be accessible for the user browser and from the SharePoint server. The SharePoint server address must also be accessible from <b>ONLYOFFICE Document Server</b> for correct work.</p>

    <h2>How it works</h2>
    <p>User navigates to a document within SharePoint and selects the <b>Edit in ONLYOFFICE</b> action on context menu or ribbon.</p>
    <p>SharePoint ONLYOFFICE solution makes a request to the editor page (URL of the form: <em>/_layouts/15/Onlyoffice/editorPage.aspx?SPListItemId={SelectedItemId}&SPListId={SelectedListId}&SPSource={Source}&SPListURLDir={ListUrlDir}</em>).</p>
    <p>SharePoint ONLYOFFICE solution prepares a JSON object with the following properties:</p>
    <ul>
        <li><b>url</b> - the URL that ONLYOFFICE Document Server uses to download the document;</li>
        <li><b>callback</b> - the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>documentServerUrl</b> - the URL that the client needs to reply to ONLYOFFICE Document Server (can be set at the settings page);</li>
        <li><b>key</b> - the file identifier from SharePoint;</li>
        <li><b>fileName</b> - the document Title (name);</li>
        <li><b>userId</b> - the user identifier;</li>
        <li><b>userName</b> - the name of the user.</li>
    </ul>
    <p>SharePoint ONLYOFFICE solution constructs a page, filling in all of those values so that the client browser can load up the editor.</p>
    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the DocEditor configuration with the above properties.</p>
    <p>Then ONLYOFFICE Document Server downloads the document from SharePoint and the user begins editing.</p>
    <p>When all users and client browsers are done with editing, they close the editing window.</p>
    <p>After <a href="<%= Url.Action("save") %>#tenseconds">10 seconds</a> of inactivity, ONLYOFFICE Document Server sends a POST to the callback URL letting SharePoint ONLYOFFICE solution know that the clients have finished editing the document and closed it.</p>
    <p>SharePoint ONLYOFFICE solution downloads the new version of the document, replacing the old one.</p>

    <br />
    <p>Download the ONLYOFFICE SharePoint module package <a href="https://github.com/ONLYOFFICE/onlyoffice-sharepoint" target="_blank">here</a>.</p>

</asp:Content>
