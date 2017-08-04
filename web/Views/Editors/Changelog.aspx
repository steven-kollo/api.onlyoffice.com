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

    <p class="dscr">The list of changes of ONLYOFFICE Document Server API.</p>

    <h2 id="45" class="copy-link">Version 4.5</h2>
    <ul>
        <li>Added support for DOCM, PPSM, PPTM and XLSM <a href="<%= Url.Action("conversionapi") %>#text-matrix">formats</a>.</li>
    </ul>

    <h2 id="44" class="copy-link">Version 4.4</h2>
    <ul>
        <li>Changed the <a href="<%= Url.Action("methods") %>#showMessage">showMessage</a> method.</li>
        <li>Conversion <a href="<%= Url.Action("conversionapi") %>#presentation-matrix">presentation</a> to <em>odp</em> format.</li>
        <li>The <a href="<%= Url.Action("config/editor/customization") %>#comments">editorConfig.customization.comments</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> field instead.</li>
    </ul>

    <h2 id="43" class="copy-link">Version 4.3</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("methods") %>#destroyEditor">destroyEditor</a> method.</li>
        <li>Removed the <a href="<%= Url.Action("config/editor/plugins") %>#url">url</a> field from the plugin connection pattern.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">commentAuthorOnly</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#forcesave">forcesave</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#showReviewChanges">showReviewChanges</a> field.</li>
        <li>Added the <a href="<%= Url.Action("callback") %>#forcesavetype">forcesavetype</a> field in the callback handler request when force saving the file.</li>
    </ul>

    <h2 id="42" class="copy-link">Version 4.2</h2>
    <ul>
        <li>Replaced the <em>firstname</em> and <em>lastname</em> fields with the <em>name</em> field in the <a href="<%= Url.Action("config/editor") %>#user">user</a> object.</li>
        <li>Added the possibility to specify the values for the <a href="<%= Url.Action("config/editor/customization") %>#chat">chat</a> and <a href="<%= Url.Action("config/editor/customization") %>#comments">comments</a> in the Open Source version.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#compactToolbar">compactToolbar</a> and <a href="<%= Url.Action("config/editor/customization") %>#zoom">zoom</a> fields.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#autosave">autosave</a> field.</li>
        <li>Replaced the <a href="<%= Url.Action("callback") %>#changeshistory">changeshistory</a> field with the <a href="<%= Url.Action("callback") %>#history">history</a> field in the callback handler request when saving the file.</li>
        <li>Changed the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method parameter.</li>
        <li>Added the possibility to convert files to <a href="<%= Url.Action("conversionapi") %>#sample-thumbnail">thumbnail</a> in the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>The POST requests are now used for the interaction with the <a href="<%= Url.Action("command") %>">document command service</a> and the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>Added the <a href="<%= Url.Action("command") %>#version">version</a> command.</li>
        <li>Added the <a href="<%= Url.Action("signature/") %>">signature</a> for the editor opening and for the incoming and outgoing requests.</li>
    </ul>

</asp:Content>
