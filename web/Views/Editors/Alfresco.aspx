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

    <p>Tested with Alfresco 5.*</p>

    <h2>Features</h2>
    <ul>
        <li>Currently the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX.</li>
        <li>
            The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for Office documents.
            <img alt="Edit in OnlyOffice" src="<%= Url.Content("~/content/img/editor/alfresco.png") %>"/>
        </li>
        <li>This allows multiple users to collaborate in real time and to save back those changes to Alfresco.</li>
    </ul>


    <h2>Installing ONLYOFFICE Document Server</h2>
    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Alfresco and any end clients (version 3.0 and later are supported for use with the plugin).
        If that is not the case, use the official ONLYOFFICE Document Server documentation page: <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">Document Server for Linux</a>.
        ONLYOFFICE Document Server must also be able to POST to Alfresco directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Document Server is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2>Installing ONLYOFFICE Alfresco module package</h2>
    <p>To start using ONLYOFFICE Document Server with Alfresco, the following steps must be performed for Ubuntu 14.04:</p>
    <div class="note">Steps <b>1</b> &mdash; <b>6</b> are only necessary if you for some reason plan to compile the ONLYOFFICE Alfresco module package yourself (e.g. edit the source code and compile it afterwards).
        If you do not want to do that and plan to use the already compiled module files, please skip to step <b>7</b> directly.
        The latest compiled package files are available <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-alfresco/releases">here</a>.</div>
    <ol>
        <li>Remove gradle in case it has already been installed (it is needed to install the latest available version later at the next step):
            <span class="commandline">sudo apt-get remove gradle</span>
        </li>
        <li>Add the repository and install the latest version:
            <span class="commandline">sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update
sudo apt-get install gradle</span>
        </li>
        <li>The latest stable Oracle Java version is necessary for the successful build. If you do not have it installed, use the following commands to install Oracle Java 8:
            <span class="commandline">sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer</span>
        </li>
        <%--<li>Switch Java alternatives to Oracle Java:
            <span class="commandline">sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config javaws</span>
        </li>--%>
        <li><a href="https://bitbucket.org/parashift/alfresco-amp-plugin" target="_blank">Build</a> the necessary dependencies:
            <span class="commandline">git clone https://github.com/yeyan/alfresco-amp-plugin.git
cd alfresco-amp-plugin
gradle publish</span>
        </li>
        <li>Download the ONLYOFFICE Alfresco module package source code:
            <span class="commandline">cd ..
git clone https://github.com/ONLYOFFICE/onlyoffice-alfresco.git</span>
        </li>
        <li>Compile packages in the <em>repo</em> and <em>share</em> directories:
            <span class="commandline">cd onlyoffice-alfresco/repo/
gradle amp
cd ../share/
gradle amp</span>
        </li>
        <li>Upload the compiled <b>*.amp</b> packages to directories accordingly for your Alfresco installation:
            <ul>
                <li>from <em>onlyoffice-alfresco/repo/build/amp</em> to the <em>amps/</em> for Alfresco repository,</li>
                <li>from <em>onlyoffice-alfresco/share/build/amp</em> to <em>amps_share/</em> for Share.</li>
            </ul>
            <div class="note">You can download the already compiled package files <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-alfresco/releases">here</a> and place them to the respective directories.</div>
        </li>
        <li>
            Installing an <a href="https://docs.alfresco.com/5.2/tasks/amp-install.html" target="_blank">Alfresco Module Package</a> to Alfresco.
            <span class="commandline">sudo bin/apply_amps.sh</span>
            You will see the two new modules being installed during the installation process. Press Enter to continue the installation.
        </li>
        <li>Add the <b>onlyoffice.url</b> property to <em>alfresco-global.properties</em>:
            <span class="commandline">onlyoffice.url=https://documentserver/</span>
            Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
        </li>
        <li>Restart Alfresco:
            <span class="commandline">sudo ./alfresco.sh stop
sudo ./alfresco.sh start</span>
        </li>
    </ol>
    <p>The module can be checked in administrator tools at <em>/share/page/console/admin-console/module-package</em> in Alfresco.</p>


    <h2>How it works</h2>
    <p>User navigates to a document within Alfresco Share and selects the <b>Edit in ONLYOFFICE</b> menu option.</p>
    <p>Alfresco Share makes a request to the repo end (URL of the form: <em>/parashift/onlyoffice/prepare?nodeRef={nodeRef}</em>).</p>
    <p>Alfresco Repo end prepares a JSON object for the Share with the following properties:</p>
    <ul>
        <li><b>docUrl</b> - the URL that ONLYOFFICE Document Server uses to download the document (includes the <em>alf_ticket</em> of the current user);</li>
        <li><b>callbackUrl</b> - the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
        <li><b>onlyofficeUrl</b> - the URL that the client needs to reply to ONLYOFFICE Document Server (provided by the onlyoffice.url property);</li>
        <li><b>key</b> - the UUID+Modified Timestamp to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
        <li><b>docTitle</b> - the document Title (name).</li>
    </ul>
    <p>Alfresco Share takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.</p>
    <p>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the DocEditor configuration with the above properties.</p>
    <p>Then ONLYOFFICE Document Server downloads the document from Alfresco and the user begins editing.</p>
    <p>ONLYOFFICE Document Server sends a POST request to the <em>callback</em> URL to inform Alfresco that a user is editing the document.</p>
    <p>Alfresco locks the document, but still allows other users with write access the ability to collaborate in real time with ONLYOFFICE Document Server by leaving the Action present.</p>
    <p>When all users and client browsers are done with editing, they close the editing window.</p>
    <p>After <a href="<%= Url.Action("save") %>#tenseconds">10 seconds</a> of inactivity, ONLYOFFICE Document Server sends a POST to the <em>callback</em> URL letting Alfresco know that the clients have finished editing the document and closed it.</p>
    <p>Alfresco downloads the new version of the document, replacing the old one.</p>

    <br />
    <p>Download the ONLYOFFICE Alfresco module package <a href="https://github.com/ONLYOFFICE/onlyoffice-alfresco" target="_blank">here</a>.</p>

</asp:Content>
