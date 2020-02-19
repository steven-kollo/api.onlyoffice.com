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
        <li>For viewing and editing: docx, xlsx, pptx.</li>
        <li>For converting to OOXML formats (docx, xlsx, pptx): doc, docm, dot, dotx, epub, htm, html, odp, odt, pot, potm, potx, pps, ppsm, ppsx, ppt, pptm, rtf, xls, xlsm, xlsx, xlt, xltm, xltx.</li>
    </ul>

    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Document Server</h2>

    <p>You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Plone and any end-clients. ONLYOFFICE Document Server must also be able to POST to Plone directly.</p>

    <p>You can install free Community version of ONLYOFFICE Document Server or scalable enterprise-level Integration Edition.</p>

    <p>To install free Community version, use <a target="_blank" href="https://github.com/onlyoffice/Docker-DocumentServer">Docker</a> (recommended) or follow <a target="_blank" href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx">these instructions</a> for Debian, Ubuntu, or derivatives.</p>

    <p>To install Integration Edition, follow instructions <a target="_blank" href="https://helpcenter.onlyoffice.com/server/integration-edition/index.aspx">here</a>.</p>

    <h2 id="install" class="copy-link">Installing Plone ONLYOFFICE integration plugin</h2>

    <p>Install plugin by adding it to your <em>buildout.cfg</em>:</p>

    <span class="commandline">
[buildout]

...

eggs =
onlyoffice.connector
    </span>

    <p>and then running <em>bin/buildout</em></p>

    <p>To enable plugin, go to <em>Site Setup</em> -> <em>Add-ons</em> and press the <em>Install</em> button.</p>

    <h2 id="configuration" class="copy-link">Configuring Plone ONLYOFFICE integration plugin</h2>

    <p>To configure plugin go to <em>Site Setup</em>. Scroll down to <em>Add-ons Configuration</em> section and press the <em>ONLYOFFICE Configuration</em> button.</p>

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

    <h2 id="developing" class="copy-link">Developing Plone ONLYOFFICE plugin</h2>

    <p>Clone repository and change directory</p>

    <span class="commandline">
git clone --branch deploy git@github.com:ONLYOFFICE/onlyoffice-plone.git
cd onlyoffice-plone
    </span>

    <p>Create a virtualenv in the package</p>
    <p>Install requirements with pip</p>
    <p>Run buildout</p>

    <span class="commandline">
virtualenv --clear .
./bin/pip install -r requirements.txt
./bin/buildout
    </span>

    <p>Start Plone in foreground</p>

    <span class="commandline">
./bin/instance fg
    </span>

    <p>Note that Plone is based on Zope server and will not run as <em>root</em> user. If you intend to run it as <em>root</em> user. You must supply <a target="_blank" href="https://zope.readthedocs.io/en/2.12/SETUID.html">effective-user directive</a>. In order to do so add <em>effective-user &lt;username&gt;</em> line to <em>./parts/instance/etc/zope.conf</em>.</p>
</asp:Content>
