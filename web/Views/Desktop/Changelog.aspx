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

    <p class="dscr">The list of changes of ONLYOFFICE Desktop Editors API.</p>

    <h2 id="63" class="copy-link">Version 6.3</h2>
    <ul>
    </ul>

    <h2 id="62" class="copy-link">Version 6.2</h2>
    <ul>
        <li>Added <a href="<%= Url.Action("addingdms/") %>">config</a> with DMS integration parameters.</li>
        <li>Added <a href="<%= Url.Action("addingdms/loginlogout") %>">execCommand</a> method.</li>
        <li>Added commands for <a href="<%= Url.Action("addingdms/opening") %>#open-command">document opening</a>.</li>
    </ul>

    <h2 id="61" class="copy-link">Version 6.1</h2>
    <ul>
        <li>Added <a href="<%= Url.Action("addingdms/configuring") %>#recognize">AscDesktopEditor</a> label to userAgent.</li>
    </ul>

    <h2 id="56" class="copy-link">Version 5.6</h2>
    <ul>
        <li>Added <a href="<%= Url.Action("addingdms/encryption") %>">encryption</a>.</li>
    </ul>

</asp:Content>