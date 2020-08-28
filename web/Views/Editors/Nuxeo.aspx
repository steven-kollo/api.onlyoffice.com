<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Nuxeo ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Nuxeo ONLYOFFICE integration plugin</span>
    </h1>

    <p>This plugin enables users to edit office documents from <a href="https://www.nuxeo.com/">Nuxeo</a> using ONLYOFFICE Document Server - <a href="#onlyoffice-document-server-editions">Community or Integration Edition</a>.</p>
    
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

    <h2 id="installing-onlyoffice-document-server" class="copy-link">Installing ONLYOFFICE Document Server</h2>

    <p>You will need an instance of ONLYOFFICE Document Server that is resolvable and connectable both from Nuxeo and any end-clients. ONLYOFFICE Document Server must also be able to POST to Nuxeo directly.</p>
    <p>You can install free Community version of ONLYOFFICE Document Server or scalable enterprise-level Integration Edition.</p>

    <p>To install free Community version, use <a href="https://github.com/onlyoffice/Docker-DocumentServer">Docker</a> (recommended) or follow <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx">these instructions</a> for Debian, Ubuntu, or derivatives.  </p>

    <p>To install Integration Edition, follow instructions <a href="https://helpcenter.onlyoffice.com/server/integration-edition/index.aspx">here</a>.</p>

    <p>Community Edition vs Integration Edition comparison can be found <a href="#onlyoffice-document-server-editions">here</a>.</p>

    <h2 id="installing-nuxeo-onlyoffice-integration-plugin" class="copy-link">Installing Nuxeo ONLYOFFICE integration plugin</h2>

    <p>Install it from <a href="https://connect.nuxeo.com/nuxeo/site/marketplace">marketplace</a>.</p>

    <p>You can also install it using <a href="https://doc.nuxeo.com/nxdoc/installing-a-new-package-on-your-instance/">nuxeoctl</a>.</p>

    <span class="commandline">nuxeoctl mp-install /path/to/onlyoffice-nuxeo-package-x.x.zip</span>

    <h2 id="configuring-nuxeo-onlyoffice-integration-plugin" class="copy-link">Configuring Nuxeo ONLYOFFICE integration plugin</h2>

    <p>Edit <a href="https://doc.nuxeo.com/nxdoc/configuration-parameters-index-nuxeoconf/">nuxeo.conf</a> and add following lines:</p>

    <pre>onlyoffice.docserv.url=http://documentserver/
onlyoffice.jwt.secret=</pre>

    <p>If you used Docker to install ONLYOFFICE Document Server, use information from <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer/#available-configuration-parameters">this repo</a> to configure JWT.</p>

    <p>If you used other installation options, check the <a href="https://api.onlyoffice.com/editors/signature/">API documentation</a> for configuring JWT on the Document Server side.  </p>

    <h2 id="compiling-nuxeo-onlyoffice-plugin" class="copy-link">Compiling Nuxeo ONLYOFFICE plugin</h2>

    <p>To build Nuxeo plugin, the following steps must be performed for Ubuntu:</p>
    <ol>
        <li>
            <p>The stable Java version is necessary for the successful build. If you do not have it installed, use the following commands to install Open JDK 8:</p>
            <pre>sudo apt-get update
sudo apt-get install openjdk-8-jdk</pre>
        </li>
        <li>
            <p>
                Install latest Maven:
Installation process is described <a href="https://maven.apache.org/install.html">here</a>
            </p>
        </li>
        <li>
            <p>Download the Nuxeo ONLYOFFICE integration plugin source code:</p>
            <pre>git clone https://github.com/onlyoffice/onlyoffice-nuxeo.git</pre>
        </li>
        <li>
            <p>Compile Nuxeo ONLYOFFICE integration plugin:</p>

            <pre>bash
cd onlyoffice-nuxeo/
mvn clean install</pre>
        </li>
        <li>
            <p>Built package is located here <b>./onlyoffice-nuxeo-package/target/onlyoffice-nuxeo-package-x.x.zip</b></p>
        </li>
    </ol>

    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <p>The ONLYOFFICE integration follows the API documented <a href="https://api.onlyoffice.com/editors/basic">here</a>. </p>

</asp:Content>
