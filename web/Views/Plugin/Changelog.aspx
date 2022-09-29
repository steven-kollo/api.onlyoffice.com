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

    <h2 id="72" class="copy-link">Version 7.2</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("executemethod/acceptreviewchanges") %>">AcceptReviewChanges</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/movetonextreviewchange") %>">MoveToNextReviewChange</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/rejectreviewchanges") %>">RejectReviewChanges</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Changed the plugin <a href="<%= Url.Action("localization") %>">localization</a> scheme.</li>
        <li>Added the <a href="<%= Url.Action("installation/onpremises") %>#plugin-manager">ONLYOFFICE Plugin Marketplace</a>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/changeoleobject") %>">ChangeOleObject</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/getallforms") %>">GetAllForms</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/getfiletodownload") %>">GetFileToDownload</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/getformsbytag") %>">GetFormsByTag</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/getformvalue") %>">GetFormValue</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/getimagedatafromselection") %>">GetImageDataFromSelection</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/getinstalledplugins") %>">GetInstalledPlugins</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/installplugin") %>">InstallPlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/putimagedatatoselection") %>">PutImageDataToSelection</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/removeplugin") %>">RemovePlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/setformvalue") %>">SetFormValue</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/showbutton") %>">ShowButton</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/updateplugin") %>">UpdatePlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("events") %>#onBlurContentControl">onBlurContentControl</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events") %>#onChangeContentControl">onChangeContentControl</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events") %>#onFocusContentControl">onFocusContentControl</a> event.</li>
    </ul>

</asp:Content>
