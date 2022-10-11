<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    方法
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% var connector = !string.IsNullOrEmpty(Page.Request["connector"]); %>

    <h1>
        <span class="hdr">方法</span>
    </h1>

    <p class="dscr">初始化 <b>文档编辑器</b> 后，您将获得可用于调用方法的对象。</p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", config);
</pre>

    <ul>
        <% if (connector)
           { %>
        <li><a href="#createConnector">createConnector</a> - 创建连接器以与外部的文本文档、电子表格、演示文稿和可填充表单交互。</li>
        <% } %>
        <li><a href="#denyEditingRights">denyEditingRights</a> - 拒绝编辑。</li>
        <li><a href="#destroyEditor">destroyEditor</a> - 销毁 <em>docEditor</em> 对象。</li>
        <li><a href="#downloadAs">downloadAs</a> - 下载编辑后的文件。</li>
        <li><a href="#insertImage">insertImage</a> - 将图像插入文件中。</li>
        <li><a href="#refreshHistory">refreshHistory</a> - 显示文档版本历史。</li>
        <li><a href="#requestClose">requestClose</a> - 请求关闭编辑器。</li>
        <li><a href="#setActionLink">setActionLink</a> - 设置包含书签的文档的链接。</li>
        <li><a href="#setFavorite">setFavorite</a> - 更改 <em>收藏</em> 图标状态。</li>
        <li><a href="#setHistoryData">setHistoryData</a> - 发送文档链接以查看版本历史。</li>
        <li><a href="#setMailMergeRecipients">setMailMergeRecipients</a> - 将邮件合并的收件人数据插入文件中。</li>
        <li><a href="#setRevisedFile">setRevisedFile</a> - 选择一个文档进行比较。</li>
        <li><a href="#setSharingSettings">setSharingSettings</a> - 更新有关允许与其他用户共享文档的设置的 <em>信息</em>。</li>
        <li><a href="#setUsers">setUsers</a> - 设置要在评论中提及的用户列表。</li>
        <li><a href="#showMessage">showMessage</a> - 显示带有消息的工具提示。</li>
    </ul>

    <h2>方法及其描述：</h2>
    <ul>
        <% if (connector)
           { %>
        <li>
            <p>
                <b id="createConnector" class="copy-link">createConnector</b><span class="required">*</span> - 创建 <a href="<%= Url.Action("connector") %>">连接器</a>与外部的文本文档、电子表格、演示文稿和可填写表单进行交互。
            </p>
            <pre>
docEditor.createConnector();
</pre>
        </li>
        <% } %>
        <li>
            <p>
                <b id="denyEditingRights" class="copy-link">denyEditingRights</b> - 拒绝编辑。
                当您想让文档编辑不可用时，可以调用此方法。
            </p>
            <pre>
docEditor.denyEditingRights(message);
</pre>

            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>message</td>
                        <td>定义对话的文本消息。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p>
                <b id="destroyEditor" class="copy-link">destroyEditor</b> - 销毁 <em>docEditor</em> 对象。
                当您想使用其他配置重新启动文档编辑器时，可以调用此方法。
                从 4.3 版开始使用。
            </p>
            <pre>
docEditor.destroyEditor();
</pre>
        </li>

        <li>
            <p>
                <b id="downloadAs" class="copy-link">downloadAs</b> - 下载编辑后的文件。
                只有在存在 <a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a> 事件 时才能调用该方法。
                <b>文档编辑服务</b> 异步创建文档并使用参数中的链接触发 <b>onDownloadAs</b> 事件。
            </p>
            <pre>
docEditor.downloadAs(format);
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>format</td>
                        <td>
                            定义下载文件的格式。
                            您可以在 <a href="<%= Url.Action("conversionapi") %>#text-matrix">转换表</a>中找到所有可能的格式。
                            但是您不能下载 <em>bmp</em>、 <em>gif</em>、 <em>jpg</em>、 <em>png</em>等图像格式的文件。
                            如果未定义该参数，则根据文件类型以OOXML格式下载文件。
                        </td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <note>
                请注意从 <em>djvu</em>、 <em>pdf</em>、 <em>xps</em> 格式的转换不可用。
                将下载原始格式。
            </note>
        </li>

        <li>
            <p>
                <b id="insertImage" class="copy-link">insertImage</b> - 将图像插入文件中。
                从版本 7.0 开始，此方法允许用户插入多个图像。
                <em>图像</em> 数组用于执行此操作。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">onRequestInsertImage</a> 事件之后调用。
            </p>
            <pre>
docEditor.insertImage({
    "c": "add",
    "images": [
        {
            "fileType": "png",
            "url": "https://example.com/url-to-example-image1.png"
        },
        {
            "fileType": "png",
            "url": "https://example.com/url-to-example-image2.png"
        },
        ...
    ]
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>c</td>
                        <td>
                            从事件中定义一种图像插入类型。
                            可以是：<em>添加</em>、 <em>更改</em>、 <em>填充</em>、 <em>水印</em>、 <em>幻灯片</em>。
                            默认值为"<em>添加</em>"。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            定义要插入文件的图像类型。
                            可以是：<em>Bmp、</em>、 <em>gif</em>、 <em>jpeg</em>、 <em>jpg</em>、 <em>png</em>。
                            自 7.0 版起已弃用，请改用 <em>images.fileType</em> 参数。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>images</td>
                        <td>
                            定义要插入的图像数组。
                        </td>
                        <td>对象数组</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>images.fileType</td>
                        <td>
                            定义要插入文件的图像类型。
                            可以是：<em>Bmp、</em>、 <em>gif</em>、 <em>jpeg</em>、 <em>jpg</em>、 <em>png</em>。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>images.url</td>
                        <td>
                            定义存储源图像的绝对 URL。
                            使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>token</td>
                        <td>定义以 <a href="<%= Url.Action("signature/browser") %>#insertImage">令牌</a>形式添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>
                            定义存储源图像的绝对 URL。
                            使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。
                            否则会出现错误。
                            自 7.0 版起已弃用，请改用 <em>images.url</em> 参数。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <note>
                <p>在 7.0 版本之前，此方法只允许插入一张图片，并具有以下参数：</p>
                <pre>
docEditor.insertImage({
    "c": "add",
    "fileType": "png",
    "url": "https://example.com/url-to-example-image.png"
});
</pre>
                <p>
                    请注意，此结构已弃用，下一个编辑器版本将不支持此结构。
                    请使用新的。
                </p>
            </note>
        </li>

        <li>
            <p>
                <b id="refreshHistory" class="copy-link">refreshHistory</b> - 显示文档版本历史。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a> 事件之后调用。
            </p>
            <pre>
docEditor.refreshHistory({
    "currentVersion": 2,
    "history": [
        {
            "created": "2010-07-06 10:13 AM",
            "key": "af86C7e71Ca8",
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            "version": 1
        },
        {
            "created": "2010-07-07 3:46 PM",
            "key": "Khirz6zTPdfd7",
            "user": {
                "id": "78e1e841",
                "name": "John Smith"
            },
            "version": 2
        },
        ...
    ],
});
</pre>
            <p>
                如果在编辑和保存文档后返回带有对象更改和 serverVersion的 <em>历史记录</em> ，则在serverVersion参数 中发送 <em>更改</em> 和 <em>serverVersion</em> 中的对象更改。
            </p>
            <pre>
docEditor.refreshHistory({
    "currentVersion": 2,
    "history": [
        {
            "changes": changes,
            "created": "2010-07-06 10:13 AM",
            "key": "af86C7e71Ca8",
            "serverVersion": serverVersion,
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            "version": 1
        },
        {
            "changes": changes,
            "created": "2010-07-07 3:46 PM",
            "key": "Khirz6zTPdfd7",
            "serverVersion": serverVersion,
            "user": {
                "id": "78e1e841",
                "name": "John Smith"
            },
            "version": 2
        },
        ...
    ],
});
</pre>
            <p>其中 <b>changes</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 的 <em>更改</em> 。</p>
            <p>其中 <b>serverVersion</b> 是保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a> 中的 <em>serverVersion</em>。</p>
            <p>显示错误消息，解释为什么无法显示版本历史记录。</p>
            <pre>
docEditor.refreshHistory({
    "error": "Exception",
});
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>currentVersion</td>
                        <td>定义当前文档版本号。</td>
                        <td>integer</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>定义错误消息文本。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history</td>
                        <td>使用文档版本定义数组。</td>
                        <td>array</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.changes</td>
                        <td>定义保存文档后返回的 <a href="<%= Url.Action("callback") %>#history">历史对象</a>的 <em>更改</em>。</td>
                        <td>对象</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.created</td>
                        <td>定义文档版本创建日期。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.key</td>
                        <td>定义服务用来识别文档的唯一文档标识符。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user</td>
                        <td>定义作为文档版本作者的用户。</td>
                        <td>对象</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user.id</td>
                        <td>定义作为文档版本作者的用户的标识符。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.user.name</td>
                        <td>定义作为文档版本作者的用户的名称。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>history.version</td>
                        <td>定义文档版本号。</td>
                        <td>integer</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="requestClose" class="copy-link">requestClose</b> - 请求关闭编辑器。
                建议在 <a href="#destroyEditor">destroyEditor</a> 方法之前调用该方法来检查编辑器中是否有一些未保存的数据。
                如果存在未保存的数据，则会显示对话框询问用户是否要继续编辑或关闭编辑器，丢失所有未保存的数据。
                如果选择 <em>关闭</em> 选项，则将调用 <a href="<%= Url.Action("config/events") %>#onRequestClose">onRequestClose</a> 事件。
            </p>
            <pre>
docEditor.requestClose();
</pre>
        </li>

        <li>
            <p>
                <b id="setActionLink" class="copy-link">setActionLink</b> - 设置包含书签的文档的链接。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> 事件之后调用。
                软件集成商必须处理从 <b>文档编辑服务</b> 接收到的 <em>ACTION_DATA</em> 以设置链接。
                该链接由软件集成商创建，他们在 <b>文档管理器</b>中使用 ONLYOFFICE 文档服务器
            </p>
            <pre>
docEditor.setActionLink(link);
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>link</td>
                        <td>定义允许滚动到文档中书签位置的链接。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setFavorite" class="copy-link">setFavorite</b> - 更改 <em>收藏</em> 图标状态。
                此方法必须在<a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a>事件之后调用。
            </p>
            <pre>
docEditor.setFavorite(favorite);
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>favorite</td>
                        <td>定义 <em>收藏夹</em> 图标是否突出显示 (<b>true</b>) 或不突出显示 (<b>false</b>)。</td>
                        <td>boolean</td>
                        <td>true</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setHistoryData" class="copy-link">setHistoryData</b> - 发送文档链接以查看版本历史。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a> 事件之后调用。
            </p>
            <pre>
docEditor.setHistoryData({
    "fileType": "docx",
    "key": "Khirz6zTPdfd7",
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <p>
                如果在编辑和保存文档后，返回到包含更改数据的文件的 <em>changesurl</em> 链接，请通过此链接下载文件，并在 <em>changesurl</em> 参数中发送文件URL。
                文档上一版本的绝对 URL 地址必须在 <em>previous.url</em> 参数中发送。
            </p>
            <pre>
docEditor.setHistoryData({
    "changesUrl": "https://example.com/url-to-changes.zip",
    "fileType": "docx",
    "key": "Khirz6zTPdfd7",
    "previous": {
        "fileType": "docx",
        "key": "af86C7e71Ca8",
        "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
    },
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <p>发送错误消息，说明文档版本无法显示的原因。</p>
            <pre>d
docEditor.setHistoryData({
    "error": "Exception",
    "version": 2
});
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>changesUrl</td>
                        <td>
                            定义带有文档更改数据的文件的url地址，可以通过 <em>changesurl</em> 链接从保存文档后返回的 <a href="<%= Url.Action("callback") %>#changesurl">JSON对象</a> 中下载。
                            文件请求使用由文档服务器检查的令牌进行签名。
                        </td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>error</td>
                        <td>定义错误消息文本。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>定义使用 <em>url</em> 参数指定的文档的扩展名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>key</td>
                        <td>定义文档标识符，用于明确标识文档文件。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous</td>
                        <td>如果在保存文档后返回 <em>changesUrl</em> 地址，则定义上一版本文档的对象。</td>
                        <td>对象</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.fileType</td>
                        <td>定义使用 <em>previous.url</em> 参数指定的文档的扩展。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.key</td>
                        <td>定义文档先前版本的文档标识符。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>previous.url</td>
                        <td>定义上一版本文档的 url 地址。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>token</td>
                        <td>定义以 <a href="<%= Url.Action("signature/browser") %>#setHistoryData">令牌</a>形式添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>
                            定义当前文档版本的 url 地址。
                            可以从保存文档后返回的 <a href="<%= Url.Action("callback") %>#url">JSON</a> 对象中的 <em>url</em> 链接下载。
                            使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。
                            否则会出现错误。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>version</td>
                        <td>定义文档版本号。</td>
                        <td>integer</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setMailMergeRecipients" class="copy-link">setMailMergeRecipients</b> - 将邮件合并的收件人数据插入文件中。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">onRequestMailMergeRecipients</a> 事件之后调用。
            </p>
            <pre>
docEditor.setMailMergeRecipients({
    "fileType": "xlsx",
    "url": "https://example.com/url-to-example-recipients.xlsx"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            定义文件中邮件合并的电子表格类型。
                            可以是：xlsx。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>token</td>
                        <td>定义以 <a href="<%= Url.Action("signature/browser") %>#setMailMergeRecipients">令牌</a>形式添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>定义存储源数据的绝对 URL。
                            使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。否则会出现错误。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setRevisedFile" class="copy-link">setRevisedFile<span class="required">*</span></b> - 选择一个文档进行比较。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">onRequestCompareFile</a> 事件之后调用。
                <span class="required-descr"><span class="required">*</span><em> - 仅适用于 ONLYOFFICE 企业版和 ONLYOFFICE 开发者版</em></span>
            </p>
            <pre>
docEditor.setRevisedFile({
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>定义要比较的文档类型。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>token</td>
                        <td>定义以 <a href="<%= Url.Action("signature/browser") %>#setRevisedFile">令牌</a>形式添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>定义存储源文档的绝对 URL。
                            使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。否则会出现错误。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setSharingSettings" class="copy-link">setSharingSettings</b> - 更新有关允许与其他用户共享文档的设置的 <a href="<%= Url.Action("config/document/info") %>#sharingSettings">信息</a>。
                该方法可以在 <a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">onRequestSharingSettings</a> 事件之后调用。
            </p>
            <pre>
docEditor.setSharingSettings({
    "sharingSettings": [
        {
            "permissions": "Full Access",
            "user": "John Smith"
        },
        {
            "isLink": true,
            "permissions": "Read Only",
            "user": "External link"
        }
    ]
});
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>sharingSettings</td>
                        <td>定义允许与其他用户共享文档的设置。</td>
                        <td>对象数组</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sharingSettings.permissions</td>
                        <td>定义具有上述名称的用户的访问权限。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sharingSettings.user</td>
                        <td>定义将与之共享文档的用户的名称。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setUsers" class="copy-link">setUsers</b> - 设置要在评论中提及的用户列表。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> 事件之后调用。
            </p>
            <pre>
docEditor.setUsers({
    "users": [
        {
            "email": "john@example.com",
            "name": "John Smith"
        },
        {
            "email": "kate@example.com",
            "name": "Kate Cage"
        },
        ...
    ]
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>users</td>
                        <td>定义用户列表。</td>
                        <td>字符串数组</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.email</td>
                        <td>定义用户的电子邮件地址。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>users.name</td>
                        <td>定义用户的全名。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="showMessage" class="copy-link">showMessage</b> - 显示带有消息的工具提示。
                该方法只能在 <a href="<%= Url.Action("config/events") %>#onAppReady">onAppReady</a> 事件之后调用。
            </p>
            <pre>
docEditor.showMessage(message);
</pre>
            <table class="table">
                <colgroup>
                    <col style="width: 100px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 150px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>出现</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>message</td>
                        <td>定义消息文本。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <note>
                请注意，嵌入式平台 <a href="<%= Url.Action("config") %>#type">类型</a>不支持显示带有消息的工具提示。
            </note>
        </li>
    </ul>
    <% if (connector)
       { %>
    <span class="required-descr"><span class="required">*</span><em> - 仅对ONLYOFFICE 开发者版本可编辑。</em></span>
    <% } %>

</asp:Content>
