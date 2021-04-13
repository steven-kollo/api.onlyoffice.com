<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plone ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Plone ONLYOFFICE integration plugin</span>
    </h1>

    <p>This plugin allows users to edit office documents within <a target="_blank" href="https://plone.org/">Plone</a> using ONLYOFFICE Document Server - Community or Integration Edition.</p>

    <h2 id="features" class="copy-link">Features</h2>

    <p>The plugin allows to:</p>
    <ul>
        <li>Create and edit text documents, spreadsheets, and presentations.</li>
        <li>Share documents with other users.</li>
        <li>Co-edit documents in real-time: use two co-editing modes (Fast and Strict), Track Changes, comments, and built-in chat.</li>
    </ul>

    <p>Supported formats:</p>
    <ul>
        <li>For viewing and editing: DOCX, XLSX, PPTX.</li>
        <li>For viewing only: PDF, ODT, ODS, ODP, DOC, XLS, PPT.</li>
    </ul>

    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Document Server</h2>

    <p>
        You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Plone and any end-clients.
        ONLYOFFICE Document Server must also be able to POST to Plone directly.
    </p>

    <p>You can install free Community version of ONLYOFFICE Document Server or scalable enterprise-level Integration Edition.</p>

    <p>To install free Community version, use <a target="_blank" href="https://github.com/onlyoffice/Docker-DocumentServer">Docker</a> (recommended) or follow <a target="_blank" href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx">these instructions</a> for Debian, Ubuntu, or derivatives.</p>

    <p>To install Integration Edition, follow instructions <a target="_blank" href="https://helpcenter.onlyoffice.com/server/integration-edition/index.aspx">here</a>.</p>

    <h2 id="install" class="copy-link">Installing Plone ONLYOFFICE integration plugin</h2>

    <ol>
        <li>Install plugin by adding it to your <em>buildout.cfg</em>:
            <span class="commandline">
[buildout]

...

eggs =
    onlyoffice.connector
            </span>
        </li>

        <li>Run <em>bin/buildout</em>.</li>

        <li>Go to <em>Site Setup</em> -> <em>Add-ons</em> and press the <em>Install</em> button to enable plugin.</li>
    </ol>

    <p>You could also install plugin via Docker:</p>
    <span class="commandline">
docker run --rm -p 8080:8080 -e ADDONS="onlyoffice.connector" plone
    </span>

    <p>Both options will automatically install plugin from <a target="_blank" href="https://pypi.org/project/onlyoffice.connector/">PyPi</a>.</p>

    <h2 id="configuration" class="copy-link">Configuring Plone ONLYOFFICE integration plugin</h2>

    <p>
        To configure plugin go to <em>Site Setup</em>.
        Scroll down to <em>Add-ons Configuration</em> section and press the <em>ONLYOFFICE Configuration</em> button.
    </p>

    <h2 id="developing" class="copy-link">Developing Plone ONLYOFFICE plugin</h2>

    <ol>
        <li>Clone repository and change directory:

            <span class="commandline">
git clone --branch deploy git@github.com:ONLYOFFICE/onlyoffice-plone.git
cd onlyoffice-plone
            </span>
        </li>
        <li>Create a <em>virtualenv</em> in the package.</li>
        <li>Install requirements with pip.</li>
        <li>Run <em>buildout</em>:
            <span class="commandline">
virtualenv .
./bin/pip install -r requirements.txt
./bin/buildout
            </span>
        </li>
        <li>Start Plone in foreground:
            <span class="commandline">
./bin/instance fg
            </span>
        </li>
    </ol>

    <p>
        If you have a working Plone instance, you can install plugin by adding the project files to the <em>scr</em> directory:
    </p>
    <ol>
        <li>In the <em>scr</em> directory create the <em>onlyoffice.connector</em> directory.</li>
        <li>Put your project files received by git into the <em>onlyoffice.connector</em> directory.</li>
        <li>Edit the <em>buildout.cfg</em> file:
            <span class="commandline">
[buildout]

...

eggs =
    onlyoffice.connector
develop = 
    src/onlyoffice.connector
            </span>
        </li>
        <li>Rerun buildout for the changes to take effect:
            <span class="commandline">
.bin/buildout
            </span>
        </li>
        <li>Then start or restart your Plone instance.</li>
    </ol>
    <p>
        Note that Plone is based on Zope server and will not run as <em>root</em> user.
        If you intend to run it as <em>root</em> user. You must supply <a target="_blank" href="https://zope.readthedocs.io/en/2.12/SETUID.html">effective-user directive</a>. In order to do so add <em>effective-user &lt;username&gt;</em> line to <em>./parts/instance/etc/zope.conf</em>.
    </p>

    <h2 id="upgrade" class="copy-link">Upgrade Plone ONLYOFFICE integration plugin</h2>

    <ol>
        <li>If you specified a concrete plugin version in your <em>buildout.cfg</em> file (so-called <em>pinning</em>, and a recommended practice), like onlyoffice.connector = 1.0.0, update this reference to point to the newer version. 
            If the plugin version is not specified, then the latest version will be automatically loaded:
            <span class="commandline">
[versions]

...

onlyoffice.connector = 1.0.1
            </span>
        </li>
        <li>Run <em>bin/buildout</em>. Wait until the new version is downloaded and installed.</li>
        <li>Restart Plone - your site may look weird, or even be inaccessible until you have performed the next step.</li>
        <li>Navigate to the <b>Add-on</b> screen (add <em>/prefs_install_products_form</em> to your site URL) and in the <b>Upgrades</b> list select <em>onlyoffice.connector</em> and click <b>Upgrade onlyoffice.connector</b>.</li>
    </ol>


    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <p>The ONLYOFFICE integration follows the API documented <a target="_blank" href="https://api.onlyoffice.com/editors/basic">here</a>:</p>

    <ul>
        <li>User navigates to a document within Plone and selects the <em>ONLYOFFICE Edit</em> action.</li>
        <li>Plone prepares a JSON object for the Document Server with the following properties:
            <ul>
                <li><b>url</b>: the URL that ONLYOFFICE Document Server uses to download the document;</li>
                <li><b>callbackUrl</b>: the URL that ONLYOFFICE Document Server informs about status of the document editing;</li>
                <li><b>key</b>: the UUID+Modified Timestamp to instruct ONLYOFFICE Document Server whether to download the document again or not;</li>
                <li><b>title</b>: the document Title (name).</li>
            </ul>
        </li>
        <li>Plone constructs a page from a <em>.pt</em> template, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request for the javascript library from ONLYOFFICE Document Server and sends ONLYOFFICE Document Server the docEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Document Server downloads the document from Plone and the user begins editing.</li>
        <li>ONLYOFFICE Document Server sends a POST request to the <em>callback</em> URL to inform Plone that a user is editing the document.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After 10 seconds of inactivity, ONLYOFFICE Document Server sends a POST to the <em>callback</em> URL letting Plone know that the clients have finished editing the document and closed it.</li>
        <li>Plone downloads the new version of the document, replacing the old one.</li>
    </ul>

</asp:Content>
