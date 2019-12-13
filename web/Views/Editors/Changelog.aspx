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

    <h2 id="54" class="copy-link">Version 5.4</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#region">editorConfig.region</a> field.</li>
        <li>The <a href="<%= Url.Action("config/document/info") %>#created">document.info.created</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/info") %>#uploaded">document.info.uploaded</a> field instead.</li>
        <li>The <a href="<%= Url.Action("config/document/info") %>#author">document.info.author</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/info") %>#owner">document.info.owner</a> field instead.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> event is removed.</li>
        <li>The <em>firstname</em> and <em>lastname</em> fields in the <a href="<%= Url.Action("config/editor") %>#user">editorConfig.user</a> object is removed.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">onRequestSaveAs</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">onRequestInsertImage</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">onRequestMailMergeRecipients</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> method.</li>
    </ul>

    <h2 id="53" class="copy-link">Version 5.3</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">editorConfig.customization.reviewDisplay</a> field.</li>
        <li>The <a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> field is now used to restrict comment deletion as well.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">editorConfig.customization.compactHeader</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#hideRightMenu">editorConfig.customization.hideRightMenu</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">editorConfig.customization.toolbarNoTabs</a> field.</li>
        <li>Added <a href="<%= Url.Action("conversionapi") %>#error">conversion error</a> for password protected documents.</li>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> field.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> event.</li>
    </ul>

    <h2 id="52" class="copy-link">Version 5.2</h2>
    <ul>
        <li>Token in request <a href="<%= Url.Action("signature/body") %>">body</a> parameters.</li>
        <li><a href="<%= Url.Action("config/document/permissions") %>#comment">Commenting only</a> is available in all types of editors.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#fillForms">document.permissions.fillForms</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#help">editorConfig.customization.help</a> field.</li>
        <li>Added the possibility to make the <a href="<%= Url.Action("config/editor/customization") %>#logo">logo</a> not clickable.</li>
    </ul>

    <h2 id="51" class="copy-link">Version 5.1</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">document.permissions.modifyContentControl</a> field.</li>
        <li>Added support for OpenDocument Template <a href="<%= Url.Action("conversionapi") %>#text-matrix">formats</a>.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestClose">onRequestClose</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#goback">editorConfig.customization.goback.blank</a> field.</li>
    </ul>

    <h2 id="50" class="copy-link">Version 5.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">document.permissions.modifyFilter</a> field.</li>
        <li>Added support for macro-enabled document, document template and flat document <a href="<%= Url.Action("conversionapi") %>#text-matrix">formats</a>.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> event is deprecated, please use the <a href="<%= Url.Action("config/events") %>#onAppReady">events.onAppReady</a> events instead.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onDocumentReady">onDocumentReady</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/plugins") %>#autostart">editorConfig.plugins.autostart</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onWarning">onWarning</a> event.</li>
    </ul>

    <h2 id="44" class="copy-link">Version 4.4</h2>
    <ul>
        <li>Changed the <a href="<%= Url.Action("methods") %>#showMessage">showMessage</a> method.</li>
        <li>Conversion <a href="<%= Url.Action("conversionapi") %>#presentation-matrix">presentation</a> to <em>odp</em> format.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#comment">comment</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> field and the <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> event.</li>
        <li>Added the <a href="<%= Url.Action("command") %>#meta">meta</a> command.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onMetaChange">events.onMetaChange</a> event.</li>
    </ul>

    <h2 id="43" class="copy-link">Version 4.3</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("methods") %>#destroyEditor">destroyEditor</a> method.</li>
        <li>Removed the <a href="<%= Url.Action("config/editor/plugins") %>#url">url</a> field from the plugin connection pattern.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#forcesave">editorConfig.customization.forcesave</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#showReviewChanges">editorConfig.customization.showReviewChanges</a> field.</li>
        <li>Added the <a href="<%= Url.Action("callback") %>#forcesavetype">forcesavetype</a> field in the callback handler request when force saving the file.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#response">JSON format for response</a> from document conversion service.</li>
    </ul>

    <h2 id="42" class="copy-link">Version 4.2</h2>
    <ul>
        <li>The <a href="<%= Url.Action("config/editor") %>#user">firstname</a> and <a href="<%= Url.Action("config/editor") %>#user">lastname</a> fields is deprecated, please use the <a href="<%= Url.Action("config/editor") %>#user">name</a> field instead.</li>
        <li>Added the possibility to specify the values for the <a href="<%= Url.Action("config/editor/customization") %>#chat">editorConfig.customization.chat</a> and <a href="<%= Url.Action("config/editor/customization") %>#comments">editorConfig.customization.comments</a> in the Open Source version.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#compactToolbar">editorConfig.customization.compactToolbar</a> and <a href="<%= Url.Action("config/editor/customization") %>#zoom">editorConfig.customization.zoom</a> fields.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#autosave">editorConfig.customization.autosave</a> field.</li>
        <li>The <a href="<%= Url.Action("callback") %>#changeshistory">changeshistory</a> field is removed, please use the <a href="<%= Url.Action("callback") %>#history">history</a> field instead.</li>
        <li>Changed the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.</li>
        <li>Added the possibility to convert files to <a href="<%= Url.Action("conversionapi") %>#sample-thumbnail">thumbnail</a> in the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>The POST requests are now used for the interaction with the <a href="<%= Url.Action("command") %>">document command service</a> and the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>Added the <a href="<%= Url.Action("command") %>#version">version</a> command.</li>
        <li>Added the <a href="<%= Url.Action("signature/") %>">signature</a> for the editor opening and for the incoming and outgoing requests.</li>
    </ul>

</asp:Content>
