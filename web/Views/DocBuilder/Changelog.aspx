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

    <p class="dscr">The list of changes of ONLYOFFICE Document Builder API.</p>
    <h2 id="63" class="copy-link">Version 6.4</h2>
    <ul>
        <li>Added parameters to the <a href="<%= Url.Action("spreadsheetapi/api/getrange") %>">Api/GetRange</a> method of Spreadsheet API.</li>
    </ul>

</asp:Content>
