<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    变更日志
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">变更日志</span>
    </h1>

    <p class="dscr">ONLYOFFICE文档服务器API的更改列表。</p>
    <h2 id="75" class="copy-link">版本 7.5</h2>
    <ul>
        <li>为回调处理程序的<a href="<%= Url.Action("callback") %>#forcesavetype">forcesavetype</a>参数添加了类型<b>3</b>。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#submitForm">editorConfig.customization.submitForm</a> 参数。</li>
        <li><a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">events.onRequestMailMergeRecipients</a> 事件已弃用，请使用 <a href="<%= Url.Action("config/events") %>#onRequestSelectSpreadsheet">events.onRequestSelectSpreadsheet</a> 事件。</li>
        <li><a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> 方法已弃用，请使用 <a href="<%= Url.Action("methods") %>#setRequestedSpreadsheet">setRequestedSpreadsheet</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#setReferenceSource">setReferenceSource</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestReferenceSource">events.onRequestReferenceSource</a> 事件。</li>
        <li>向 Conversion API 添加了 <a href="<%= Url.Action("conversionapi") %>#error-codes">-9 错误代码</a>。</li>
        <li>在 <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 参数中添加了<em>key</em>字段。</li>
        <li><a href="<%= Url.Action("config/events") %>#onRequestCompareFile">events.onRequestCompareFile</a> 事件已弃用，请使用 <a href="<%= Url.Action("config/events") %>#onRequestSelectDocument">events.onRequestSelectDocument</a> 事件。</li>
        <li><a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> 方法已弃用，请使用 <a href="<%= Url.Action("methods") %>#setRequestedDocument">setRequestedDocument</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestOpen">events.onRequestOpen</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("command/deleteForgotten") %>">deleteForgotten</a>、 <a href="<%= Url.Action("command/getForgotten") %>">getForgotten</a> 和 <a href="<%= Url.Action("command/getForgottenlist") %>">getForgottenList</a> 命令。</li>
    </ul>

    <p class="dscr">ONLYOFFICE 文档服务器 API 的更改列表。</p>
    <h2 id="74" class="copy-link">版本 7.4</h2>
     <ul>
         <li>添加了打开 <a href="<%= Url.Action("config/") %>#documentType">dps、dpt、et、ett、mhtml、stw、sxc、sxi、sxw、wps、wpt </a> 格式的功能。</li>
         <li>在 <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> 方法中添加了 <em>users.id</em> 字段。</li >
         <li>在 <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> 方法和<a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> 事件中添加了 <em>c</em> 参数。</li>
     </ul>

    <h2 id="73" class="copy-link">7.3 版</h2>
     <ul>
         <li>添加了 WOPI <a href="<%= Url.Action("wopi/conversionapi") %>">转换 API</a>。</li>
         <li>添加了 <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> 方法。</li>
         <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">events.onRequestReferenceData</a> 事件。</li>
         <li>添加了 <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 参数。</li>
         <li>向 <em>CheckFileInfo</em> WOPI 操作添加了 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanNotWriteRelative">UserCanNotWriteRelative</a> 属性。</li>
         <li>添加了<a href="<%= Url.Action("wopi/editingbinary") %>">编辑二进制文档格式</a>的方案。</li>
         <li>向 WOPI 发现添加了<a href="<%= Url.Action("wopi/discovery") %>#convert">convert</a> 操作。</li>
         <li>添加了 <a href="<%= Url.Action("wopi/restapi/putrelativefile") %>">PutRelativeFile</a> WOPI 操作。</li>
     </ul>

    <h2 id="72" class="copy-link">7.2 版</h2>
    <ul>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#integrationMode">editorConfig.customization.integrationMode</a> 参数。</li>
        <%--<li>添加了<a href="<%=Url.Action("connector") %>">连接器</a> 类，以与外部的文本文档、电子表格、演示文稿和可填写表单进行交互。</li>--%>
        <li>将<em>theme-contrast-dark</em>主题id添加到<a href="<%= Url.Action("config/editor/customization") %>#uiTheme">editorConfig.customization.uiTheme</a>参数中。</li>
        <li>将<em>phone</em>字段添加到<a href="<%= Url.Action("config/editor/customization") %>#customer">editorConfig.customization.customer</a>参数中。</li>
        <li>向许可证响应添加<a href="<%= Url.Action("command/license") %>#license">connections_view</a>、<a href="<%= Url.Action("command/license") %>#license">users_view_count</a>和<a href="<%= Url.Action("command/license") %>#quota">users_view</a>。</li>
        <li>在文本文档、电子表格和演示文稿编辑器中添加了<a href="<%= Url.Action("viewing") %>">实时查看器</a>模式。</li>
        <li>将<a href="<%= Url.Action("wopi/discovery") %>#embedview">embedview</a>操作添加到wopi发现中。</li>
        <li>The <a href="<%= Url.Action("signature/") %>#services.CoAuthoring.secret.browser.string">services.CoAuthoring.secret.browser.string</a> parameter is deprecated, please use the <a href="<%= Url.Action("signature/") %>#services.CoAuthoring.secret.inbox.string">services.CoAuthoring.secret.inbox.string</a> parameter instead.</li>
    </ul>

    <h2 id="71" class="copy-link">7.1 版</h2>
    <ul>
        <li>用于启用 <a href="<%= Url.Action("signature/body") %>">正文中令牌</a> 的 <em>services.CoAuthoring.token.inbox.inBody</em> 和 <em>services.CoAuthoring.token.outbox.inBody</em> 参数已经弃用。</li>
        <li>在 <a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a> WOPI 操作中添加了 <em>X-LOOL-WOPI-IsModifiedByUser</em>、 <em>X-LOOL-WOPI-IsAutosave</em> 和 <em>X-LOOL-WOPI-IsExitSave</em> 请求标头，以区分文档保存的类型。</li>
        <li><a href="<%= Url.Action("config/editor/customization") %>#chat">editorConfig.customization.chat</a> 参数已弃用，请改用 <a href="<%= Url.Action("config/document/permissions") %>#chat">document.permissions.chat</a> 参数。</li>
        <li>添加了从 <a href="<%= Url.Action("conversionapi") %>#text-matrix">dps, dpt, et, ett, htm, mhtml, stw, sxc, sxi, sxw, wps, wpt, xlsb, xml</a> 格式转换的功能。</li>
        <li>添加了打开 <a href="<%= Url.Action("config/") %>#documentType">xlsb</a> 格式的功能。</li>
        <li>初始化配置 <a href="<%= Url.Action("signature/browser") %>#open">signature</a> 中的参数列表已得到严格规范。</li>
        <li><a href="<%= Url.Action("config/editor/customization") %>#spellcheck">editorConfig.customization.spellcheck</a> 字段已弃用，请改用 <a href="<%= Url.Action("config/editor/customization") %>#features">editorConfig.customization.features.spellcheck</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#features">editorConfig.customization.features</a> 参数部分。</li>
        <li>在转换请求中添加了 <a href="<%= Url.Action("conversionapi") %>#documentLayout">documentLayout</a> 参数。</li>
        <li>在转换请求中添加了 <a href="<%= Url.Action("conversionapi") %>#documentRenderer">documentRenderer</a> 参数。</li>
        <li>添加了从 <a href="<%= Url.Action("conversionapi") %>#text-matrix">pdf/xps/oxps</a> 格式到 <em>docx</em>的转换。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#userInfoGroups">document.permissions.userInfoGroups</a> 参数。</li>
        <li>添加了从 <a href="<%= Url.Action("conversionapi") %>#text-matrix">djvu</a> 格式到 <em>pdf</em> 的转换。</li>
        <li>添加了对 <a href="<%=Url.Action("conversionapi") %>#presentation-matrix">ppsm、ppsx</a>格式的转换。</li>
    </ul>

    <h2 id="70" class="copy-link">7.0 版</h2>
    <ul>
        <li>添加了 <em>.docxf</em> 和 <em>.oform</em> <a href="<%= Url.Action("config/") %>#documentType">文档格式</a>。</li>
        <li>添加了与 <a href="<%= Url.Action("conversionapi") %>#text-matrix">docxf</a> 格式的双向转换。</li>
        <li>使用来自同一用户的最后一个标签的 <a href="<%= Url.Action("callback") %>#used-callbackUrl">callbackUrl</a>。</li>
        <li>在 <a href="<%= Url.Action("config/editor/customization") %>#customer">editorConfig.customization.customer</a> 参数中添加了 <em>logoDark</em> 字段。</li>
        <li>在 <a href="<%= Url.Action("config/editor/customization") %>#logo">editorConfig.customization.logo</a> 参数中添加了 <em>imageDark</em> 字段。</li>
        <li><a href="<%= Url.Action("config/editor/customization") %>#logo">editorConfig.customization.logo</a> 参数的 <em>imageEmbedded</em> 字段已弃用，请改用 <em>image</em> 字段。</li>
        <li>为 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法的 <em>changesUrl</em> 参数指定的文件更改请求添加了签名。</a>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#protect">document.permissions.protect</a> 字段。</li>
        <li>在 <a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a>, <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> 和 <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">onRequestSaveAs</a> 事件中添加了 <em>fileType</em> 参数。</li>
        <li>添加了通过 <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> 方法插入多个图像的可能性。</li>
        <li><a href="<%= Url.Action("save") %>#assemblyFormatAsOrigin">assemblyFormatAsOrigin</a> 服务器设置默认启用。</li>
        <li>在转换请求的 <a href="<%= Url.Action("conversionapi") %>#outputtype">outputtype</a> 参数中添加了 <em>ooxml</em> 和 <em>odf</em> 值。</li>
        <li>向 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法添加了 <em>fileType</em> 和 <em>previous.fileType</em> 参数。</li>
        <li>将 <a href="<%= Url.Action("callback") %>#filetype">filetype</a> 参数添加到 <em>回调处理程序</em>。</li>
        <li>在转换响应中添加了 <a href="<%= Url.Action("conversionapi") %>#fileType">fileType</a> 字段。</li>
        <li>添加了到 <a href="<%= Url.Action("conversionapi") %>#text-matrix">docm, dotm, xlsm, xltm, pptm, potm</a> 格式的转换。</li>
        <li><a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">editorConfig.customization.reviewDisplay</a>, <a href="<%= Url.Action("config/editor/customization") %>#showReviewChanges">editorConfig.customization.showReviewChanges</a>, <a href="<%= Url.Action("config/editor/customization") %>#trackChanges">editorConfig.customization.trackChanges</a> 参数已弃用，请改用 <a href="<%= Url.Action("config/editor/customization") %>#review">editorConfig.customization.review</a> 参数。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#review">editorConfig.customization.review.hideReviewDisplay</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#review">editorConfig.customization.review.hoverMode</a> 字段。</li>
        <li>添加了查看电子表格文件的 <a href="<%= Url.Action("history") %>">文档历史记录</a> 的可能性。</li>
        <li>为 PostMessage WOPI 协议添加了 <a href="<%= Url.Action("wopi/postmessage") %>#UI_InsertGraphic">UI_InsertGraphic</a> 消息。</li>
    </ul>

    <h2 id="64" class="copy-link">6.4 版</h2>
    <ul>
        <li>增加了打开 <a href="<%= Url.Action("config/") %>#documentType">oxps</a> 格式的功能。</li>
        <li>增加了对 <a href="<%= Url.Action("wopi/") %>">WOPI 协议</a>的支持。</li>
        <li>将 <em>simple</em> 值添加到 <a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">editorConfig.customization.reviewDisplay</a> 参数中。</li>
        <li>添加了保存在电子表格文件中的 <a href="<%= Url.Action("commenting") %>#threaded-comments">线程评论</a>。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#uiTheme">editorConfig.customization.uiTheme</a> 字段。</li>
        <li>添加了查看演示文件的 <a href="<%= Url.Action("history") %>">文档历史记录</a> 的可能性。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#hideNotes">editorConfig.customization.hideNotes</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor") %>#coEditing">editorConfig.coEditing</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#requestClose">requestClose</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#commentGroups">document.permissions.commentGroups</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onPluginsReady">events.onPluginsReady</a> 事件。</li>
    </ul>

    <h2 id="63" class="copy-link">6.3 版</h2>
    <ul>
        <li>添加了 <a href="<%= Url.Action("command/license") %>">license</a> 命令。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#hideRulers">editorConfig.customization.hideRulers</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#anonymous">editorConfig.customization.anonymous</a> 字段。</li>
        <li><a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> 字段已弃用，请使用 <a href="<%= Url.Action("config/document/permissions") %>#editCommentAuthorOnly">document.permissions.editCommentAuthorOnly</a> 和 <a href="<%= Url.Action("config/document/permissions") %>#deleteCommentAuthorOnly">document.permissions.deleteCommentAuthorOnly</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#setFavorite">setFavorite</a> 方法。</li>
        <li>将 <em>data.favorite</em> 参数添加到 <a href="<%= Url.Action("config/events") %>#onMetaChange">events.onMetaChange</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/info") %>#favorite">document.info.favorite</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#reviewGroups">document.permissions.reviewGroups</a> 字段。</li>
        <li>添加了转换为 <a href="<%= Url.Action("conversionapi") %>#text-matrix">epub, fb2, html</a> 格式的功能。</li>
        <li>添加了从 <a href="<%= Url.Action("conversionapi") %>#text-matrix">xml</a> 格式转换的功能</li>
    </ul>

    <h2 id="62" class="copy-link">6.2 版</h2>
    <ul>
        <li>添加了一个新的 <a href="<%= Url.Action("callback") %>#actions">actions.type</a> 字段值（<em>actions.type = 2</em>）。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#trackChanges">editorConfig.customization.trackChanges</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#toolbarHideFileName">editorConfig.customization.toolbarHideFileName</a> 字段。</li>
        <li>根据 <a href="<%= Url.Action("callback") %>#used-callbackUrl">forcesavetype</a>选择 <em>status</em> <b>6</b> 的 <em>callbackUrl</em>。</li>
        <li>增加了打开 <a href="<%= Url.Action("config/") %>#documentType">fb2</a> 格式的功能。</li>
    </ul>

    <h2 id="61" class="copy-link">6.1 版</h2>
    <ul>
        <li><a href="<%= Url.Action("config/") %>#documentType">documentType</a> 参数的 <em>text</em>, <em>spreadsheet</em> 和 <em>presentation</em> 值已弃用，请改用 <em>word</em>, <em>cell</em> 和 <em>slide</em> 值。</li>
        <li>将 <em>group</em> 字段添加到 <a href="<%= Url.Action("config/editor") %>#user">editorConfig.user</a>。</li>
        <li>添加了从 <a href="<%= Url.Action("conversionapi") %>#text-matrix">fb2</a> 格式的转换的功能。</li>
    </ul>

    <h2 id="60" class="copy-link">6.0 版</h2>
    <ul>
        <li>在 <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">events.onRequestInsertImage</a> 事件中添加了插入类型。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor") %>#templates">editorConfig.templates</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#plugins">editorConfig.customization.plugins</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#macros">editorConfig.customization.macros</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#macrosMode">editorConfig.customization.macrosMode</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestCreateNew">events.onRequestCreateNew</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#copy">document.permissions.copy</a> 字段。</li>
        <li><a href="<%= Url.Action("config/document/permissions") %>#rename">document.permissions.rename</a> 字段已弃用，请添加 <a href="<%= Url.Action("config/events") %>#onRequestRename">events.onRequestRename</a> 字段。</li>
    </ul>

    <h2 id="55" class="copy-link">5.5 版</h2>
    <ul>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#spellcheck">editorConfig.customization.spellcheck</a> 字段。</li>
        <li>添加了转换到 <a href="<%= Url.Action("conversionapi") %>#text-matrix">pdfa</a> 格式的功能。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">events.onRequestCompareFile</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> 方法。</li>
        <li><a href="<%= Url.Action("signature/browser") %>#methods">methods</a> 参数中的Token。</li>
        <li><a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> 字段已弃用，请添加 <a href="<%= Url.Action("config/events") %>#onRequestRestore">events.onRequestRestore</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#goback">editorConfig.customization.goback.requestClose</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">events.onRequestSharingSettings</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#unit">editorConfig.customization.unit</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("conversionapi") %>#region">region</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("conversionapi") %>#spreadsheetLayout">spreadsheetLayout</a> 字段。</li>
        <li>添加了转换的 <a href="<%= Url.Action("conversionapi") %>#error-codes">输入错误</a>。</li>
        <li><a href="<%= Url.Action("config/events") %>#onRequestSendNotify">events.onRequestSendNotify</a> 事件和 <a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> 事件可以独立设置。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#mentionShare">editorConfig.customization.mentionShare</a> 字段。</li>
        <li>根据 <a href="<%= Url.Action("callback") %>#used-callbackUrl">status</a>选择 <em>callbackUrl</em>。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#compatibleFeatures">editorConfig.customization.compatibleFeatures</a> 字段。</li>
    </ul>

    <h2 id="54" class="copy-link">5.4 版</h2>
    <ul>
        <li>添加了 <a href="<%= Url.Action("config/editor") %>#region">editorConfig.region</a> 字段。</li>
        <li><a href="<%= Url.Action("config/document/info") %>#created">document.info.created</a> 字段已弃用，请改用 <a href="<%= Url.Action("config/document/info") %>#uploaded">document.info.uploaded</a> 字段。</li>
        <li><a href="<%= Url.Action("config/document/info") %>#author">document.info.author</a> 字段已弃用，请改用 <a href="<%= Url.Action("config/document/info") %>#owner">document.info.owner</a> 字段。</li>
        <li><a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> 事件被移除。</li>
        <li><a href="<%= Url.Action("config/editor") %>#user">editorConfig.user</a> 对象中的 <em>firstname</em> 和 <em>lastname</em> 字段被删除。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">events.onRequestSaveAs</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">events.onRequestInsertImage</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">events.onRequestMailMergeRecipients</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#setSharingSettings">setSharingSettings</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">events.onRequestSendNotify</a> 事件。</li>
    </ul>

    <h2 id="53" class="copy-link">5.3 版</h2>
    <ul>
        <li>添加了 <a href="<%= Url.Action("conversionapi") %>#text-matrix">转换</a> 到OOXML（dotx、 xltx、potx）和 ODF（ott、ots、otp）模板的功能</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">editorConfig.customization.reviewDisplay</a> 字段。</li>
        <li><a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> 字段现在也用于限制评论删除。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">editorConfig.customization.compactHeader</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#hideRightMenu">editorConfig.customization.hideRightMenu</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">editorConfig.customization.toolbarNoTabs</a> 字段。</li>
        <li>为受密码保护的文档添加了 <a href="<%= Url.Action("conversionapi") %>#error-codes">转换错误</a>。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> 方法。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onMakeActionLink">events.onMakeActionLink</a> 事件。</li>
    </ul>

    <h2 id="52" class="copy-link">5.2 版</h2>
    <ul>
        <li>请求 <a href="<%= Url.Action("signature/body") %>">正文</a> 参数中的令牌。</li>
        <li><a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> 适用于所有类型的编辑器。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#fillForms">document.permissions.fillForms</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#help">editorConfig.customization.help</a> 字段。</li>
        <li>添加了使 <a href="<%= Url.Action("config/editor/customization") %>#logo">editorConfig.customization.logo</a> 不可点击的可能性。</li>
        <li>为转换的 <a href="<%= Url.Action("conversionapi") %>#thumbnail-aspect">aspect</a> 字段添加值 <em>2</em>。</li>
    </ul>

    <h2 id="51" class="copy-link">5.1 版</h2>
    <ul>
        <li>在 <a href="<%= Url.Action("methods") %>#downloadAs">downloadAs</a> 方法中添加了 <em>format</em> 参数。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">document.permissions.modifyContentControl</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("conversionapi") %>#text-matrix">OpenDocument Template</a> 格式的转换。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestClose">events.onRequestClose</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#goback">editorConfig.customization.goback.blank</a> 字段。</li>
    </ul>

    <h2 id="50" class="copy-link">5.0 版</h2>
    <ul>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">document.permissions.modifyFilter</a> 字段。</li>
        <li>添加了启用宏的文档、文档模板和平面文档 <a href="<%= Url.Action("conversionapi") %>#text-matrix">格式</a>的转换。</li>
        <li><a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> 事件已弃用，请改用 <a href="<%= Url.Action("config/events") %>#onAppReady">events.onAppReady</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onDocumentReady">events.onDocumentReady</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/plugins") %>#autostart">editorConfig.plugins.autostart</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onWarning">events.onWarning</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("documentbuilderapi") %>">文档生成器服务</a>。</li>
    </ul>

    <h2 id="44" class="copy-link">4.4 版</h2>
    <ul>
        <li>更改了 <a href="<%= Url.Action("methods") %>#showMessage">showMessage</a> 方法。</li>
        <li>添加了转换到 <a href="<%= Url.Action("conversionapi") %>#presentation-matrix">odp</a> 格式的功能。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestRestore">events.onRequestRestore</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("config/document/permissions") %>#rename">document.permissions.rename</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onRequestRename">events.onRequestRename</a> 事件。</li>
        <li>添加了 <a href="<%= Url.Action("command/meta") %>">meta</a> 命令。</li>
        <li>添加了 <a href="<%= Url.Action("config/events") %>#onMetaChange">events.onMetaChange</a> 事件。</li>
        <li>更改了 <a href="<%= Url.Action("callback") %>#used-callbackUrl">最后一个加入共同编辑的用户</a> 对 <em>callbackUrl</em> 的使用。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor") %>#location">editorConfig.location</a> 字段。</li>
    </ul>

    <h2 id="43" class="copy-link">4.3 版</h2>
    <ul>
        <li>添加了 <a href="<%= Url.Action("methods") %>#destroyEditor">destroyEditor</a> 方法。</li>
        <li>从插件连接模式中删除了 <a href="<%= Url.Action("config/editor/plugins") %>#url">editorConfig.plugins.url</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#forcesave">editorConfig.customization.forcesave</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#showReviewChanges">editorConfig.customization.showReviewChanges</a> 字段。</li>
        <li>强制保存文件时，在回调处理程序请求中添加了 <a href="<%= Url.Action("callback") %>#forcesavetype">forcesavetype</a> 字段。</li>
        <li>为文档转换服务的添加了 <a href="<%= Url.Action("conversionapi") %>#response">JSON 格式响应</a>。</li>
    </ul>

    <h2 id="42" class="copy-link">4.2 版</h2>
    <ul>
        <li><a href="<%= Url.Action("config/editor") %>#user">firstname</a> 和 <a href="<%= Url.Action("config/editor") %>#user">lastname</a> 字段已弃用，请改用 <a href="<%= Url.Action("config/editor") %>#user">name</a> 字段。</li>
        <li>添加了在开源版本中为 <a href="<%= Url.Action("config/editor/customization") %>#chat">editorConfig.customization.chat</a> 和 <a href="<%= Url.Action("config/editor/customization") %>#comments">editorConfig.customization.comments</a> 指定值的可能性。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#compactToolbar">editorConfig.customization.compactToolbar</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#zoom">editorConfig.customization.zoom</a> 字段。</li>
        <li>添加了 <a href="<%= Url.Action("config/editor/customization") %>#autosave">editorConfig.customization.autosave</a> 字段。</li>
        <li><a href="<%= Url.Action("callback") %>#changeshistory">changeshistory</a> 字段已删除，请改用 <a href="<%= Url.Action("callback") %>#history">history</a> 字段。</li>
        <li>更改了 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法。</li>
        <li>在 <a href="<%= Url.Action("conversionapi") %>">文档转换服务</a>中添加了将文件转换为 <a href="<%= Url.Action("conversionapi") %>#sample-thumbnail">缩略图</a> 的可能性。</li>
        <li>POST 请求现在用于与 <a href="<%= Url.Action("command") %>">文档命令服务</a> 和 <a href="<%= Url.Action("conversionapi") %>">文档转换服务</a>的交互。</li>
        <li>添加了 <a href="<%= Url.Action("command/version") %>">version</a> 命令。</li>
        <li>添加了编辑器打开和传入传出请求的 <a href="<%= Url.Action("signature/") %>">signature</a>。</li>
    </ul>

</asp:Content>
