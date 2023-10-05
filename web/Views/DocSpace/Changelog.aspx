<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Changelog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Changelog</span>
    </h1>

    <p class="dscr">The list of changes for ONLYOFFICE DocSpace API.</p>

    <h2 id="20" class="copy-link">Version 2.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("pluginssdk/") %>">Plugins SDK</a> section.</li>
    </ul>

</asp:Content>