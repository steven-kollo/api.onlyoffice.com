<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Styles.Render("~/content/get-docs") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Get ONLYOFFICE Document Builder
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Get ONLYOFFICE Document Builder</span>
    </h1>

    <p class="dscr">
        <b>ONLYOFFICE Document Builder</b> is available for Windows and Linux.
    </p>

    <p>You can download it from our website or compile from source codes and deploy the solution on your local server using the specially designed <b>build_tools</b>.</p>
    <ul class="get-docbuilder-block">
        <li class="get-docbuilder-option">
            <a class="get-docbuilder-link get-docbuilder-link-start" href="https://www.onlyoffice.com/download-builder.aspx?from=api" target="_blank">Get ONLYOFFICE Document Builder</a>
        </li>
        <li class="get-docbuilder-option">
            <a class="get-docbuilder-link get-docbuilder-link-info" href="https://helpcenter.onlyoffice.com/installation/docs-community-compile-document-builder.aspx?from=api" target="_blank">Compile ONLYOFFICE Document Builder</a>
        </li>
    </ul>

    <p>The Linux OS versions of <b>ONLYOFFICE Document Builder</b> require the following dependencies to be installed:
        <p><b>Debian/Ubuntu:</b></p>
        <pre>sudo apt-get install libstdc++6 libcurl3-gnutls libc6 libxml2 libcurl3 fonts-dejavu fonts-opensymbol
sudo apt-get install fonts-liberation ttf-mscorefonts-installer fonts-crosextra-carlito</pre>
        <p><b>RedHat/CentOS:</b></p>
        <pre>sudo yum install glibc libcurl libxml2 dejavu-lgc-sans-fonts dejavu-lgc-sans-mono-fonts dejavu-lgc-serif-fonts dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts libreoffice-opensymbol-fonts</pre>
    </p>

</asp:Content>
