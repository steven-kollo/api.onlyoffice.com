<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Overview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Overview</span>
    </h1>

    <span class="pvl_product">ONLYOFFICE Desktop Editors</span><span class="pvl_version">v<%= Products.Get("desktop").Version %></span>

    <p>
        <b>ONLYOFFICE Desktop Editors</b> is an open-source office suite for working with documents stored on your computer. 
        This application allows you to create, edit and view text documents, spreadsheets and presentations without constant connection to the Internet. 
        Most popular formats are supported: DOCX, ODT, XLSX, ODS, CVS, PPTX, ODP, etc.
    </p>
    <p>
        This documentation describes:
    </p>
    <ul>
        <li>How to enable <a href="<%= Url.Action("debugging") %>">debug mode</a> to detect and fix all the possible errors</li>
        <li>How to extend editor functionality with ready-to-use <a href="<%= Url.Action("plugins") %>">plugins</a> or creating your own ones</li>
        <li>How to integrate desktop editors into the <a href="<%= Url.Action("addingdms/") %>">document management systems (DMS) providers</a>, 
            <a href="<%= Url.Action("addingdms/opening") %>">open</a> and <a href="<%= Url.Action("addingdms/encryption") %>">encrypt</a> documents in them</li>
        <!--<li>What the <a href="<%= Url.Action("troubleshooting") %>">most common problems</a> are and how to avoid them</li>-->
    </ul>


    <h2>How to install</h2>

    <p>ONLYOFFICE Desktop Editors is available for Windows, Linux and Mac OS. Starting from version 6.1 this application is also supported by ARM-based Apple Silicon Macs.</p>
    <p>The simplest way to install this application on your local computer is to download it from our official website:</p>
    <a class="button" href="https://www.onlyoffice.com/download-desktop.aspx?from=api" target="_blank">Get Desktop Editors</a>
    <p>For some Linux distributions, like Zorin OS, Linux Mint, Linkat, Linspire, etc., the ONLYOFFICE Desktop Editors package is already pre-installed 
        or available on their official stores.</p>


    <h2>What&#8217;s new</h2>

    <p>ONLYOFFICE Desktop Editors Api is constantly updated. To stay up to date with our new features and enhancements, visit the <a href="<%= Url.Action("changelog") %>">Changelog</a> section.</p>


    <h2>Get help</h2>

    <p>If you have any questions about ONLYOFFICE Desktop Editors, try to find them in the <a href="<%= Url.Action("faq") %>">FAQ</a> section first.</p>
    <p>You can request a feature or report a bug by posting an issue on <a href="https://github.com/ONLYOFFICE/DesktopEditors/issues" target="_blank">GitHub</a>.</p>
    <p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/desktop-editors/35" target="_blank">ONLYOFFICE forum</a> (registration required).</p>

</asp:Content>
