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

    <p class="dscr">The list of changes for ONLYOFFICE Plugins and Macros API.</p>

    <h2 id="73" class="copy-link">Version 7.3</h2>
    <ul>
        <li>Added the <em>sign</em> type to the <a href="<%= Url.Action("config") %>#initDataType">initDataType</a> config parameter.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getvbamacros") %>">GetVBAMacros</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/ondropevent") %>">OnDropEvent</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/cell") %>">Spreadsheet Api</a> methods to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide") %>">Presentation Api</a> methods to <em>window.Asc.plugin.executeMethod</em>.</li>
    </ul>

    <h2 id="72" class="copy-link">Version 7.2</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("events/onAddComment") %>">onAddComment</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onChangeCommentData") %>">onChangeCommentData</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onRemoveComment") %>">onRemoveComment</a> event.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/acceptreviewchanges") %>">AcceptReviewChanges</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/movetonextreviewchange") %>">MoveToNextReviewChange</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/rejectreviewchanges") %>">RejectReviewChanges</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Changed the plugin <a href="<%= Url.Action("localization") %>">localization</a> scheme.</li>
        <li>Added the <a href="<%= Url.Action("installation/onpremises") %>#plugin-manager">ONLYOFFICE Plugin Marketplace</a>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/changeoleobject") %>">ChangeOleObject</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/getallforms") %>">GetAllForms</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getfiletodownload") %>">GetFileToDownload</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/getformsbytag") %>">GetFormsByTag</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/getformvalue") %>">GetFormValue</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getimagedatafromselection") %>">GetImageDataFromSelection</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getinstalledplugins") %>">GetInstalledPlugins</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/installplugin") %>">InstallPlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/putimagedatatoselection") %>">PutImageDataToSelection</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/removeplugin") %>">RemovePlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/setformvalue") %>">SetFormValue</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/showbutton") %>">ShowButton</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/updateplugin") %>">UpdatePlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("events/onBlurContentControl") %>">onBlurContentControl</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onChangeContentControl") %>">onChangeContentControl</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onFocusContentControl") %>">onFocusContentControl</a> event.</li>
    </ul>

</asp:Content>
