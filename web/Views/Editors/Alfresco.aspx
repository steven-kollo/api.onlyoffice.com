<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Alfresco module package
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Alfresco module package</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-alfresco" target="_blank">plugin</a> enables users to edit office documents from <a href="https://www.alfresco.com/" target="_blank">Alfresco</a> Share using ONLYOFFICE Document Server.</p>

    <p>The plugin is available in the official <a href="https://community.alfresco.com/docs/DOC-7918-onlyoffice-connector-for-alfresco" target="_blank">Alfresco Add-ons directory</a>.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX.</li>
        <li>
            The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for Office documents.
            <img alt="Edit in OnlyOffice" src="<%= Url.Content("~/content/img/editor/alfresco.png") %>"/>
        </li>
        <li>This allows multiple users to collaborate in real time and to save back those changes to Alfresco.</li>
        <li>And a Convert using ONLYOFFICE option to quickly convert ODT, ODP, ODS, DOC, XLS, PPT files to their Office Open XML counterpart</li>
        <li>
            Context menu <em>Create new...</em> option within document library
            <img alt="Create new..." src="<%= Url.Content("~/content/img/editor/alfresco-create.png") %>"/>
        </li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Document Server</h2>
    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Alfresco and any end clients (version 3.0 and later are supported for use with the plugin).
        If that is not the case, use the official ONLYOFFICE Document Server documentation page: <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>.
        ONLYOFFICE Document Server must also be able to POST to Alfresco directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing ONLYOFFICE Alfresco module package</h2>
    <p>To start using ONLYOFFICE Document Server with Alfresco, the following steps must be performed for Ubuntu 14.04:</p>
    <div class="note">
        Steps <b>1</b> &mdash; <b>4</b> are only necessary if you for some reason plan to compile the ONLYOFFICE Alfresco module package yourself (e.g. edit the source code and compile it afterwards).
        If you do not want to do that and plan to use the already compiled module files, please skip to step <b>5</b> directly.
        The latest compiled package files are available <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-alfresco/releases">here</a>.
    </div>
    <ol>
        <li>
            The latest stable Oracle Java version is necessary for the successful build.
            If you do not have it installed, use the following commands to install Oracle Java 8:
            <span class="commandline">sudo apt-get update
sudo apt-get install openjdk-8-jdk</span>
        </li>
        <%--<li>Switch Java alternatives to Oracle Java:
            <span class="commandline">sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config javaws</span>
        </li>--%>
        <li>Install latest Maven: Installation process is described <a href="https://maven.apache.org/install.html">here</a>
        </li>
        <li>Download the ONLYOFFICE Alfresco module package source code:
            <span class="commandline">cd ..
git clone https://github.com/ONLYOFFICE/onlyoffice-alfresco.git</span>
        </li>
        <li>Compile packages in the <em>repo</em> and <em>share</em> directories:
            <span class="commandline">cd onlyoffice-alfresco/
mvn clean install</span>
        </li>
        <li>Upload the compiled <b>*.jar</b> packages to directories accordingly for your Alfresco installation:
            <ul>
                <li>from <em>onlyoffice-alfresco/repo/target/</em> to the <em>/webapps/alfresco/WEB-INF/lib/</em> for Alfresco repository,</li>
                <li>from <em>onlyoffice-alfresco/share/target/</em> to <em>/webapps/share/WEB-INF/lib/</em> for Share.</li>
            </ul>
            <div class="note">You can download the already compiled package files <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-alfresco/releases">here</a> and place them to the respective directories.</div>
        </li>
        <li>Make sure that Document Server will be able to POST to Alfresco
            <p>You may need to change these lines in <b>alfresco-global.properties</b></p>
            <span class="commandline">alfresco.host=&lt;hostname&gt;
alfresco.port=443
alfresco.protocol=https

share.host=&lt;hostname&gt;
share.port=443
share.protocol=https</span>
            <div class="note">Probably located here <em>/usr/local/tomcat/shared/classes/alfresco-global.properties</em></div>
        </li>
        <li>Restart Alfresco:
            <span class="commandline">sudo ./alfresco.sh stop
sudo ./alfresco.sh start</span>
        </li>
    </ol>
    <p>The module can be checked in administrator tools at <em>/share/page/console/admin-console/module-package</em> in Alfresco.</p>

    <h2 id="build-docker" class="copy-link">Building from docker-compose</h2>
    <p>Other way to build ONLYOFFICE Alfresco module package is using docker-compose file.</p>
    <p>Use this command from project directory:</p>
    <span class="commandline">docker-compose up</span>

    <h2 id="configuration" class="copy-link">Configuration</h2>
    <p>Module configuration can be found inside <b>Alfresco Administration Console</b> or by simply navigating to <b>http://&lt;alfrescohost&gt;/alfresco/s/onlyoffice/onlyoffice-config</b></p>
    <div class="note">
        You can also add <b>onlyoffice.url</b> in <b>alfresco-global.properties</b>.
        Configuration made via settings page will override <b>alfresco-global.properties</b>.
    </div>

    <h2 id="jwt" class="copy-link">JWT</h2>
    <p>JWT can be configured via <a href="#configuration">configuration page</a> or by adding <b>onlyoffice.jwtsecret</b> in <b>alfresco-global.properties</b>.</p>
    <p>The JWT configuration on the Document Server side can be found <a href="/editors/signature/">here</a>.</p>

    <h2 id="convertation" class="copy-link">Convertation</h2>
    <p>File types that can be converted</p>
    <ul>
        <li><b>.doc</b>, <b>.odt</b> -> <b>.docx</b></li>
        <li><b>.xls</b>, <b>.ods</b> -> <b>.xlsx</b></li>
        <li><b>.ppt</b>, <b>.odp</b> -> <b>.pptx</b></li>
    </ul>
    <p>
        To convert one specific file you can simply select <b>Convert using ONLYOFFICE</b> action.
        Resulting file will be placed in the same folder.
        You can also configure rules for a folder, that will automatically convert files on upload or on change. You can read how such rules can be configured <a href="https://docs.alfresco.com/5.1/tasks/library-folder-rules-define-create.html">here</a>.
    </p>

    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>User navigates to a document within Alfresco Share and selects the <b>Edit in ONLYOFFICE</b> menu option.</p>
    <p>Alfresco Share makes a request to the repo end (URL of the form: <em>/parashift/onlyoffice/prepare?nodeRef={nodeRef}</em>).</p>
    <p>Alfresco Repo end prepares a JSON object for the Share with the following properties:</p>
    <ul>
        <li><b>url</b> - the URL that ONLYOFFICE Document Server uses to download the document (includes the <em>alf_ticket</em> of the current user);</li>
        <li><b>callbackUrl</b> - the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>onlyofficeUrl</b> - the URL that the client needs to respond to ONLYOFFICE Document Server (provided by the onlyoffice.url property);</li>
        <li><b>key</b> - the UUID+Modified Timestamp to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
        <li><b>title</b> - the document Title (name).</li>
    </ul>
    <p>Alfresco Share takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.</p>
    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the DocEditor configuration with the above properties.</p>
    <p>Then ONLYOFFICE Document Server downloads the document from Alfresco and the user begins editing.</p>
    <p>ONLYOFFICE Document Server sends a POST request to the <em>callback</em> URL to inform Alfresco that a user is editing the document.</p>
    <p>Alfresco locks the document, but still allows other users with write access the ability to collaborate in real time with ONLYOFFICE Document Server by leaving the Action present.</p>
    <p>When all users and client browsers are done with editing, they close the editing window.</p>
    <p>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Document Server sends a POST to the <em>callback</em> URL letting Alfresco know that the clients have finished editing the document and closed it.</p>
    <p>Alfresco downloads the new version of the document, replacing the old one.</p>

    <br />
    <p>Download the ONLYOFFICE Alfresco module package <a href="https://github.com/ONLYOFFICE/onlyoffice-alfresco" target="_blank">here</a>.</p>

</asp:Content>
