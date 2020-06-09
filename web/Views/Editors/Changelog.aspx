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

    <h2 id="56" class="copy-link">Version 5.6</h2>
    <ul>
        <li>Added the type of insertion in <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">events.onRequestInsertImage</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#templates">editorConfig.templates</a> field.</li>
    </ul>

    <h2 id="55" class="copy-link">Version 5.5</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#spellcheck">editorConfig.customization.spellcheck</a> field.</li>
        <li>Conversion <a href="<%= Url.Action("conversionapi") %>#text-matrix">document</a>, <a href="<%= Url.Action("conversionapi") %>#spreadsheet-matrix">spreadsheet</a>, <a href="<%= Url.Action("conversionapi") %>#presentation-matrix">presentation</a> to <em>pdfa</em> format.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">events.onRequestCompareFile</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> method.</li>
        <li>Token in <a href="<%= Url.Action("signature/browser") %>#methods">methods</a> parameters.</li>
        <li>The <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> field is deprecated, please add the <a href="<%= Url.Action("config/events") %>#onRequestRestore">events.onRequestRestore</a> field instead.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#goback">editorConfig.customization.goback.requestClose</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">events.onRequestSharingSettings</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#unit">editorConfig.customization.unit</a> field.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#region">region</a> field.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#spreadsheetLayout">spreadsheetLayout</a> field.</li>
        <li>Added <a href="<%= Url.Action("conversionapi") %>#error">input error</a> for conversion.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">events.onRequestSendNotify</a> event and the <a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> event can be set independently.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#mentionShare">editorConfig.customization.mentionShare</a> field.</li>
        <li>The callbackUrl is selected based on <a href="<%= Url.Action("callback") %>#used-callbackUrl">status</a>.</li>
    </ul>

    <h2 id="54" class="copy-link">Version 5.4</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#region">editorConfig.region</a> field.</li>
        <li>The <a href="<%= Url.Action("config/document/info") %>#created">document.info.created</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/info") %>#uploaded">document.info.uploaded</a> field instead.</li>
        <li>The <a href="<%= Url.Action("config/document/info") %>#author">document.info.author</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/info") %>#owner">document.info.owner</a> field instead.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> event is removed.</li>
        <li>The <em>firstname</em> and <em>lastname</em> fields in the <a href="<%= Url.Action("config/editor") %>#user">editorConfig.user</a> object is removed.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">events.onRequestSaveAs</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">events.onRequestInsertImage</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">events.onRequestMailMergeRecipients</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> method.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setSharingSettings">setSharingSettings</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">events.onRequestSendNotify</a> event.</li>
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
        <li>Added the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">events.onMakeActionLink</a> event.</li>
    </ul>

    <h2 id="52" class="copy-link">Version 5.2</h2>
    <ul>
        <li>Token in request <a href="<%= Url.Action("signature/body") %>">body</a> parameters.</li>
        <li><a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> is available in all types of editors.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#fillForms">document.permissions.fillForms</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#help">editorConfig.customization.help</a> field.</li>
        <li>Added the possibility to make the <a href="<%= Url.Action("config/editor/customization") %>#logo">editorConfig.customization.logo</a> not clickable.</li>
        <li>Added for the <a href="<%= Url.Action("conversionapi") %>#thumbnail-aspect">aspect</a> field value <em>2</em> for the conversion.</li>
    </ul>

    <h2 id="51" class="copy-link">Version 5.1</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">document.permissions.modifyContentControl</a> field.</li>
        <li>Added support for OpenDocument Template <a href="<%= Url.Action("conversionapi") %>#text-matrix">formats</a>.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestClose">events.onRequestClose</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#goback">editorConfig.customization.goback.blank</a> field.</li>
    </ul>

    <h2 id="50" class="copy-link">Version 5.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">document.permissions.modifyFilter</a> field.</li>
        <li>Added support for macro-enabled document, document template and flat document <a href="<%= Url.Action("conversionapi") %>#text-matrix">formats</a>.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> event is deprecated, please use the <a href="<%= Url.Action("config/events") %>#onAppReady">events.onAppReady</a> events instead.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onDocumentReady">events.onDocumentReady</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/plugins") %>#autostart">editorConfig.plugins.autostart</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onWarning">events.onWarning</a> event.</li>
        <li>Added the <a href="<%= Url.Action("documentbuilderapi") %>">Document Builder service</a>.</li>
    </ul>

    <h2 id="44" class="copy-link">Version 4.4</h2>
    <ul>
        <li>Changed the <a href="<%= Url.Action("methods") %>#showMessage">showMessage</a> method.</li>
        <li>Conversion <a href="<%= Url.Action("conversionapi") %>#presentation-matrix">presentation</a> to <em>odp</em> format.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestRestore">events.onRequestRestore</a> event.</li>
        <li>Added the <a href="<%= Url.Action("command") %>#meta">meta</a> command.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onMetaChange">events.onMetaChange</a> event.</li>
        <li>Changed the use of callbackUrl from the <a href="<%= Url.Action("callback") %>#used-callbackUrl">last user</a> who joined the co-editing.</li>
    </ul>

    <h2 id="43" class="copy-link">Version 4.3</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("methods") %>#destroyEditor">destroyEditor</a> method.</li>
        <li>Removed the <a href="<%= Url.Action("config/editor/plugins") %>#url">editorConfig.plugins.url</a> field from the plugin connection pattern.</li>
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
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#compactToolbar">editorConfig.customization.compactToolbar</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#zoom">editorConfig.customization.zoom</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#autosave">editorConfig.customization.autosave</a> field.</li>
        <li>The <a href="<%= Url.Action("callback") %>#changeshistory">changeshistory</a> field is removed, please use the <a href="<%= Url.Action("callback") %>#history">history</a> field instead.</li>
        <li>Changed the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.</li>
        <li>Added the possibility to convert files to <a href="<%= Url.Action("conversionapi") %>#sample-thumbnail">thumbnail</a> in the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>The POST requests are now used for the interaction with the <a href="<%= Url.Action("command") %>">document command service</a> and the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>Added the <a href="<%= Url.Action("command") %>#version">version</a> command.</li>
        <li>Added the <a href="<%= Url.Action("signature/") %>">signature</a> for the editor opening and for the incoming and outgoing requests.</li>
    </ul>

</asp:Content>
