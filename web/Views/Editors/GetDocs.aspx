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
    Get ONLYOFFICE Docs
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Get ONLYOFFICE Docs</span>
    </h1>

    <p class="dscr">
        <a href="https://www.onlyoffice.com/download-docs.aspx?from=api#docs-developer" target="_blank">ONLYOFFICE Docs</a> is available for Windows, Linux and Docker.
    </p>

    <p>To install it on your local server, follow the instructions in <b>ONLYOFFICE Help Center</b>:</p>
    <ul class="get-docs-block">
        <li class="get-docs-option">
            <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api" target="_blank"><div class="get-docs-img windows"></div></a>
            <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api" target="_blank">Get ONLYOFFICE Docs for Windows</a></p>
        </li>
        <li class="get-docs-option">
            <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api" target="_blank"><div class="get-docs-img linux"></div></a>
            <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api" target="_blank">Get ONLYOFFICE Docs for Linux</a></p>
        </li>
        <li class="get-docs-option">
            <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api" target="_blank"><div class="get-docs-img docker"></div></a>
            <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api" target="_blank">Get ONLYOFFICE Docs for Docker</a></p>
        </li>
    </ul>

    <p>Before working with ONLYOFFICE Docs API documentation, it is recommended to make the following settings if necessary:</p>
    <ul>
        <li>configure <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx?from=api" target="_blank">ONLYOFFICE Docs server settings</a> in ONLYOFFICE Docs configuration file;</li>
        <li>switch ONLYOFFICE Docs to the HTTPS protocol for secure connection using <a href="https://helpcenter.onlyoffice.com/installation/docs-community-https-linux.aspx?from=api" target="_blank">SSL Certificates</a>;</li>
        <li>add additional <a href="https://helpcenter.onlyoffice.com/installation/docs-community-install-fonts-linux.aspx?from=api" target="_blank">fonts</a> to ONLYOFFICE Docs to enhance the work with the editors;</li>
        <li>add your own <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx?from=api" target="_blank">color themes</a> for the application interface.</li>
    </ul>

    <h2 class="copy-link" id="healthcheck">Health check</h2>
    <p>To check if the editors are available, send the GET request to <em>/healthcheck</em>.
        This request checks the availability of the databases, message broker, Redis connection, and storage.</p>
    <p>The response must be <b>true</b>, which means that the editors are ready to use.</p>
    <p>If something went wrong, make sure that you have followed the installation instructions above.</p>

</asp:Content>
