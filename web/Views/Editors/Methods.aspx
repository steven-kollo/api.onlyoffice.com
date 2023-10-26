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

    <h1>
        <span class="hdr">方法</span>
    </h1>

    <p class="dscr">初始化 <b>文档编辑器</b> 后，您将获得可用于调用方法的对象。</p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", config);
</pre>

    <ul>
        <li><a href="#createConnector">createConnector</a> - 创建连接器以与外部的文本文档、电子表格、演示文稿和可填充表单交互。</li>
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
        <li><a href="#setReferenceData">setReferenceData</a> - 通过文件链接刷新数据。</li>
        <li><a href="#setReferenceSource">setReferenceSource</a> - 更改外部数据源。</li>
        <li><a href="#setRequestedDocument">setRequestedDocument</a> - 选择要比较或合并的文档。</li>
        <li><a href="#setRequestedSpreadsheet">setRequestedSpreadsheet</a> - 将邮件合并的收件人数据插入到文件中。</li>
        <li><a href="#setRevisedFile">setRevisedFile</a> - 选择一个文档进行比较。</li>
        <li><a href="#setSharingSettings">setSharingSettings</a> - 更新有关允许与其他用户共享文档的设置的 <em>信息</em>。</li>
        <li><a href="#setUsers">setUsers</a> - 设置要在评论中提及的用户列表或授予编辑特定工作表范围的访问权限。</li>
        <li><a href="#showMessage">showMessage</a> - 显示带有消息的工具提示。</li>
    </ul>

    <h2>方法及其描述：</h2>
    <ul>
        <li>
            <p>
                <b id="createConnector" class="copy-link">createConnector</b><a href="#requiredDescr" class="required">*</a> - 创建 <a href="<%= Url.Action("connector") %>">连接器</a>与外部的文本文档、电子表格、演示文稿和可填写表单进行交互。
            </p>
            <pre>
docEditor.createConnector();
</pre>
        </li>
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
    ],
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiYWRkIiwiaW1hZ2VzIjpbeyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UxLnBuZyJ9LHsiZmlsZVR5cGUiOiJwbmciLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWltYWdlMi5wbmcifV19.JfSa__qPeY3MjUgdkJDjdfJWBgvCmEdLfFzjd3WgeUA"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                            可以是：<em>Bmp</em>、 <em>gif</em>、 <em>jpe</em>、 <em>jpeg</em>、 <em>jpg</em>、 <em>png</em>。
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
                            可以是：<em>Bmp、</em>、 <em>gif</em>、 <em>jpe</em>、 <em>jpeg</em>、 <em>jpg</em>、 <em>png</em>。
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
                    <tr id="insertImage-token" class="tablerow">
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                        <td>history.serverVersion</td>
                        <td>
                            定义当前服务器版本号。
                            如果发送<em>changes</em>参数，则还需要发送<em>serverVersion</em>参数。
                        </td>
                        <td>integer</td>
                        <td>可选的</td>
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.iRcdHve235L5K1e29SmUBkuHcxb63WHRko51WMJlmS0",
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
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsiZmlsZVR5cGUiOiJkb2N4Iiwia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.ril3Ol3rvYne3g0dG8TdKCiwJ7-7kkYGc6-XWMvp8FU",
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <p>发送错误消息，说明文档版本无法显示的原因。</p>
            <pre>
docEditor.setHistoryData({
    "error": "Exception",
    "version": 2
});
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                    <tr id="setHistoryData-token" class="tablerow">
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
                自版本 7.5 起已弃用，请改用 <a href="#setRequestedSpreadsheet">setRequestedSpreadsheet</a>。
            </p>
            <pre>
docEditor.setMailMergeRecipients({
    "fileType": "xlsx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
    "url": "https://example.com/url-to-example-recipients.xlsx"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                            可以是：<em>csv</em>、 <em>fods</em>、 <em>ods</em>、 <em>ots</em>、 <em>xls</em>、 <em>xlsm</em>、 <em>xlsx</em>、 <em>xlt</em>、 <em>xltm</em>、 <em>xltx</em>。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr id="setMailMergeRecipients-token" class="tablerow">
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
                <b id="setReferenceData" class="copy-link">setReferenceData</b> - 通过指向由 <em>referenceData</em> 或 <em>path</em> 参数指定的文件链接来刷新数据。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> 事件之后调用。
            </p>
            <note>请注意，仅当用户有权访问要从中获取数据的文件时，才会执行此方法。</note>
            <pre>
docEditor.setReferenceData({
    "fileType": "xlsx",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com",
        "key": "Khirz6zTPdfd7"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
    "url": "https://example.com/url-to-example-document.xlsx"
});
</pre>
            <p>
                其中，<b>example.com</b> 是安装了<b>文档管理器</b> 和<b>文档存储服务</b> 的服务器的名称。
                 请参阅<a href="<%= Url.Action("howitworks") %>">它是如何工作的</a>部分以了解有关文档服务器服务的客户端-服务器交互的更多信息。
            </p>
            <p>显示错误消息，说明是否有错误发生：</p>
            <pre>
docEditor.setReferenceData({
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
                        <td>error</td>
                        <td>定义错误消息文本。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>定义用 <em>url</em> 参数指定的文档的扩展名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>path</td>
                        <td>定义公式编辑器的文件名或相对路径。
                            它用于在执行<a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> 事件时识别文件。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>referenceData</td>
                        <td>
                            定义由集成商生成的对象，用于唯一标识其系统中的文件。
                             此数据必须与 <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 配置参数中的相同：
                            <ul>
                                <li>
                                    <b>fileKey</b> - 服务用来获取文件链接的唯一文档标识符。
                                    在编辑和保存文档时不得更改它（即它不等于 <a href="<%= Url.Action("config/document") %>#key">document.key</a > 参数）,
                                    <br />
                                    <b>类型</b>: string,
                                    <br />
                                    <b>示例</b>:  "BCFA2CED";
                                </li>
                                <li>
                                    <b>instanceId</b> - 唯一的系统标识符。 如果数据是从一个系统上的文件复制的，然后插入到另一个系统上的文件中，
                                    那么通过链接粘贴将不可用，并且上下文菜单中将没有相应的按钮，
                                    <br />
                                    <b>类型</b>: string,
                                    <br />
                                    <b>示例</b>:  "https://example.com";
                                </li>
                                <li>
                                    <b>key</b> - 定义服务用于从共同编辑会话获取数据的唯一文档标识符。
                                    如果发送已知密钥，将从缓存中获取文档。
                                    每次编辑并保存文档时，都必须重新生成密钥。
                                    文档 url 可以用作<b>key</b>，但不能包含特殊字符，且长度限制为 128 个符号。
                                    <br />
                                    <b>类型</b>: string,
                                    <br />
                                    <b>示例</b>:  "Khirz6zTPdfd7".
                                </li>
                            </ul>
                        </td>
                        <td>object</td>
                        <td>可选的</td>
                    </tr>
                    <tr id="setReferenceData-token" class="tablerow">
                        <td>token</td>
                        <td>定义以 <a href="<%= Url.Action("signature/browser") %>#setReferenceData">token</a> 形式添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>定义下载当前文件的 URL 地址。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setReferenceSource" class="copy-link">setReferenceSource</b> - 更改外部数据源。
                该方法可以在 <a href="<%= Url.Action("config/events") %>#onRequestReferenceSource">onRequestReferenceSource</a> 事件之后调用。
            </p>
            <note>请注意，仅当用户对要从中获取数据的文件具有权限时才会执行此方法。</note>
            <pre>
docEditor.setReferenceSource({
    "fileType": "xlsx",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com",
        "key": "Khirz6zTPdfd7"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
    "url": "https://example.com/url-to-example-document.xlsx"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
                请参阅 <a href="<%= Url.Action("howitworks") %>">工作原理</a> 部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
            </p>
            <p>显示一条错误消息，解释是否发生任何错误：</p>
            <pre>
docEditor.setReferenceSource({
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
                        <td>存在</td>
                    </tr>
                </thead>
                <tbody>
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
                        <td>path</td>
                        <td>定义公式编辑器的文件名或相对路径。
                            用于在执行 <a href="<%= Url.Action("config/events") %>#onRequestReferenceSource">onRequestReferenceSource</a> 事件时识别文件。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>referenceData</td>
                        <td>
                            定义由集成器生成的对象，用于唯一标识其系统中的文件。
                            此数据必须与 <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 配置参数中的数据相同：
                            <ul>
                                <li>
                                    <b>fileKey</b> - 服务用于获取文件链接的唯一文档标识符。
                                    编辑和保存文档时不得更改它（即它不等于 <a href="<%= Url.Action("config/document") %>#key">document.key</a> 参数）,
                                    <br />
                                    <b>类型</b>: string,
                                    <br />
                                    <b>示例</b>:  "BCFA2CED";
                                </li>
                                <li>
                                    <b>instanceId</b> - 唯一的系统标识符。 如果数据是从一个系统上的文件复制并插入到另一个系统上的文件中，
                                    那么通过链接粘贴将不可用，并且上下文菜单中将没有相应的按钮，
                                    <br />
                                    <b>类型</b>: string,
                                    <br />
                                    <b>示例</b>:  "https://example.com";
                                </li>
                                <li>
                                    <b>key</b> - 定义服务用于从共同编辑会话获取数据的唯一文档标识符。
                                    如果发送已知密钥，将从缓存中获取文档。
                                    每次编辑并保存文档时，都必须重新生成密钥。
                                    文档 url 可以用作<b>key</b>，但不能包含特殊字符，且长度限制为 128 个符号。
                                    <br />
                                    <b>类型</b>: string,
                                    <br />
                                    <b>示例</b>:  "Khirz6zTPdfd7".
                                </li>
                            </ul>
                        </td>
                        <td>object</td>
                        <td>可选的</td>
                    </tr>
                    <tr id="setReferenceSource-token" class="tablerow">
                        <td>token</td>
                        <td>以 <a href="<%= Url.Action("signature/browser") %>#setReferenceSource">令牌</a> 的形式定义添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>定义下载当前文件的 URL 地址。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setRequestedDocument" class="copy-link">setRequestedDocument<a href="#requiredDescr2" class="required">**</a></b> - 选择要比较或合并的文档。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestSelectDocument">onRequestSelectDocument</a> 事件之后调用。
            </p>
            <pre>
docEditor.setRequestedDocument({
    "c": "compare",
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
                请参阅 <a href="<%= Url.Action("howitworks") %>">工作原理</a> 部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>存在</td>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr class="tablerow">
                        <td>c</td>
                        <td>
                            定义从事件中选择的文档类型。 可以是：<em>compare</em>、<em>combine</em>。 默认值为"compare"。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr><tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            您定义要选择的文档的类型。
                            可以是：<em>doc</em>、<em>docm</em>、<em>docx</em>、<em>dot</em>、<em>dotm</em>、<em>dotx</em>、<em>epub</em>、<em>fodt</em>、<em>odt</em>、<em>ott</em>、<em>rtf</em>，<em>wps</em>。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr id="setRequestedDocument-token" class="tablerow">
                        <td>token</td>
                        <td>以 <a href="<%= Url.Action("signature/browser") %>#setRequestedDocument">令牌</a> 的形式定义添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>定义存储源文档的绝对 URL。 使用本地链接时，请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。
                            否则会出现错误。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setRequestedSpreadsheet" class="copy-link">setRequestedSpreadsheet</b> - 将邮件合并的收件人数据插入到文件中。
                必须在 <a href="<%= Url.Action("config/events") %>#onRequestSelectSpreadsheet">onRequestSelectSpreadsheet</a> 事件之后调用此方法。
            </p>
            <pre>
docEditor.setRequestedSpreadsheet({
    "c": "mailmerge";
    "fileType": "xlsx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
    "url": "https://example.com/url-to-example-recipients.xlsx"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
                请参阅 <a href="<%= Url.Action("howitworks") %>">工作原理</a> 部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>存在</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>c</td>
                        <td>
                           定义从事件中选择的电子表格类型。 可以是<em>mailmerge</em>。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileType</td>
                        <td>
                            定义文件中邮件合并的电子表格类型。
                            可以是：<em>csv</em>、<em>fods</em>、<em>ods</em>、<em>ots</em>、<em>xls</em>、<em>xlsm</em>、<em>xlsx</em>、<em>xlt</em>、<em>xltm</em>、<em>xltx</em>。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr id="setRequestedSpreadsheet-token" class="tablerow">
                        <td>token</td>
                        <td>定义以 <a href="<%= Url.Action("signature/browser") %>#setRequestedSpreadsheet">令牌</a> 形式添加到参数的加密签名。</td>
                        <td>string</td>
                        <td>可选的</td>
                    </tr>
                    <tr class="tablerow">
                        <td>url</td>
                        <td>定义存储源数据的绝对 URL。 使用本地链接时，请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。
                            否则会出现错误。</td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>

        <li>
            <p>
                <b id="setRevisedFile" class="copy-link">setRevisedFile<a href="#requiredDescr2" class="required">**</a></b> - 选择一个文档进行比较。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">onRequestCompareFile</a> 事件之后调用。
                自版本 7.5 起已弃用，请改用 <a href="#setRequestedDocument">setRequestedDocument</a>。
            </p>
            <pre>
docEditor.setRevisedFile({
    "fileType": "docx",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
    "url": "https://example.com/url-to-example-document.docx"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
            </p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                            定义要比较的文档类型。
                            可以是：<em>doc</em>、 <em>docm</em>、 <em>docx</em>、 <em>dot</em>、 <em>dotm</em>、 <em>dotx</em>、 <em>epub</em>、 <em>fodt</em>、 <em>odt</em>、 <em>ott</em>、 <em>rtf</em>、 <em>wps</em>.
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
                    <tr id="setRevisedFile-token" class="tablerow">
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                <b id="setUsers" class="copy-link">setUsers</b> - 设置要在评论中提及的用户列表或授予编辑特定工作表范围的访问权限。
                此方法必须在 <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> 事件之后调用。
            </p>
            <pre>
docEditor.setUsers({
    "c": "protect",
    "users": [
        {
            "email": "john@example.com",
            "id": "78e1e841",
            "name": "John Smith"
        },
        {
            "email": "kate@example.com",
            "id": "F89d8069ba2b",
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
                           定义 <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> 事件的操作类型。
                             它可以采用以下值之一 - <em>mention</em>或<em>protect</em>。
                             默认值为<em>mention</em>。
                        </td>
                        <td>string</td>
                        <td>必需的</td>
                    </tr>
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
                        <td>users.id</td>
                        <td>定义用户的身份。 该字段仅用于在向指定用户授予编辑权限时保护工作表范围。</td>
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
                    <col class="table-name" />
					<col />
					<col class="table-type" />
					<col class="table-example" />
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
    <span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - 仅对ONLYOFFICE 开发者版本可编辑。</em></span>
    <span id="requiredDescr2" class="required-descr"><span class="required">**</span><em> - 仅适用于ONLYOFFICE企业版和ONLYOFFICE开发者版</em></span>

</asp:Content>
