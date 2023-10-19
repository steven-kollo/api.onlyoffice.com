﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    插入外部数据
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">插入外部数据</span>
    </h1>
    <p class="dscr">下面的参考图和步骤解释了在 ONLYOFFICE 文档服务器中通过外部链接将数据插入电子表格的过程。</p>
    <img alt="插入外部数据" src="<%= Url.Content("~/content/img/editor/inserting-external-data.png") %>" />
    <ol>
        <li>用户将单元格值从源电子表格的 <b>文档编辑器</b> 复制到剪贴板。同时，特殊数据也被复制。</li>
        <li>用户将复制的数据插入到目标电子表格的 <b>文档编辑器</b> 中。</li>
        <li><b>文档编辑器</b> 通过将数据发送到 <b>文档管理器</b>来请求到源文件的链接。</li>
        <li><b>文档管理器</b> 将源电子表格链接发送给 <b>文档编辑器</b>。</li>
        <li><b>文档编辑器</b> 向 <b>文档编辑服务</b> 发送电子表格下载请求。</li>
        <li><b>文档编辑服务</b> 从 <b>文档存储服务</b>下载源电子表格。</li>
        <li><b>文档编辑服务</b> 发送所有必要的数据以显示在目标电子表格的 <b>文档编辑器</b> 中。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建将从中复制数据的源电子表格。</li>
        <li>
            <p>在源电子表格的初始化配置中指定 <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 参数：</p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com",
            "key": "Khirz6zTPdfd7"
        },
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>当用户从源电子表格中复制数据时，剪贴板会收到以下值的列表：</p>
            <ul>
                <li>工作表名称和复制数据的范围，稍后将用于刷新复制的数据；</li>
                <li><a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 对象，用于检查通过外部链接将数据插入目标电子表格的可用性；</li>
                <li>将用于在编辑器中显示公式的文件名。</li>
            </ul>
        </li>
        <li>创建将插入外部数据的目标电子表格。</li>
        <li>
            <p>在要显示的 <em>“粘贴链接”</em> 和 <em>“更新值”</em> 按钮的目标电子表格的初始化配置中指定 <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a>
                事件处理程序：
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceData": onRequestReferenceData,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>如果剪贴板具有在步骤 3 中指定的源电子表格数据，并且目标电子表格在初始化配置中具有 <em>onRequestReferenceData</em> 事件处理程序，
                则 <em>“粘贴链接”</em> 按钮将显示在对话框中。</p>
            <img class="screenshot max-width-550" alt="粘贴链接" src="<%= Url.Content("~/content/img/editor/paste-link.png") %>" />
        </li>
        <li>
            <p>当用户单击 <em>“粘贴链接”</em> 按钮时，公式将插入到当前单元格中，并将 <em>referenceData</em> 对象保存到目标文件中。
                插入的公式显示如下：</p>
            <pre>
='[fileName]sheetName'!cell
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
                        <td>示例</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>cell</td>
                        <td>从中复制数据的单元格。</td>
                        <td>string</td>
                        <td>E5</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileName</td>
                        <td>从中复制数据的文件名。</td>
                        <td>string</td>
                        <td>new.xlsx</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sheetName</td>
                        <td>从中复制数据的工作表名称。</td>
                        <td>string</td>
                        <td>Sheet1</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <p>对文件的数据更新请求将发送到文件URL。</p>
            <note>请注意，您可以在单元格中输入指定格式的公式，来自外部文件的数据也会被插入。
                但在这种情况下， <em>onRequestReferenceData</em> 事件将仅使用 <em>path</em> 参数执行。</note>
        </li>
        <li>
            <p>当用户试图通过在<em>数据</em>选项卡的<em>外部链接</em>对话框中单击<em>更新值</em>按钮来刷新源文件中的数据时，
                调用 <a href="<%=Url.Action("config/events") %>#onRequestReferenceData">onRequestReferencesData</a> 事件。
                在<em>data</em>参数中发送包含从源文件接收的唯一文件数据、文件路径或名称以及文件URL的对象</p>
            <note>要将数据发送到<em>setReferenceData</em>方法，建议先通过<em>referenceData</em>参数搜索文件。
                如果没有这样的字段或找不到文件，则使用<em>path</em>或<em>link</em>参数</note>
            <pre>
var onRequestReferenceData = function (event) {
    var link = event.data.link;
    var referenceData = event.data.referenceData;
    var path = event.data.path;
    ...
 };
</pre>
            <img class="screenshot max-width-700" alt="更新值" src="<%= Url.Content("~/content/img/editor/update-values.png") %>" />
        </li>
        <li>
            <p>为了刷新源文件中的数据，必须调用 <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> 方法。
                When calling this method, the token must be added to validate the parameters.</p>
            <note>请注意，仅当用户对源文件具有权限时才会执行此方法。</note>
            <pre>
docEditor.setReferenceData({
    "fileType": "xlsx",
    "link": "https://example.com/url-to-file-editor.xlsx",
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
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务“客户端-服务器交互”的更多信息，请参阅 “<a href="<%= Url.Action("howitworks") %>">它是如何工作的</a>” 部分。
            </p>
        </li>
    </ol>

    <h2 id="external-links" class="copy-link">Working with external links</h2>
    <ol>
        <li>
            <p>Specify the event handler for the <em>Open source</em> button to be displayed in the configuration script for Document Editor initialization.
            When the user is trying to open an external link by clicking the <em>Open source</em> button, the <a href="<%= Url.Action("config/events") %>#onRequestOpen">onRequestOpen</a> event is called.</p>
            <p>To open the editor with the external file referenced by the <em>path</em> or <em>referenceData</em> parameters in a new tab,
                you must pass a link to this tab by calling the <a href="https://developer.mozilla.org/en-US/docs/Web/API/Window/open" target="_blank">window.open</a> method with the <em>path</em> and <em>windowName</em> parameters.</p>
            <p>An object with the unique file data, the file path, and a new browser tab name are sent in the <em>data</em> parameter.</p>
            <img class="screenshot" alt="open-source" src="<%= Url.Content("~/content/img/editor/open-source.png") %>"/>
            <div class="header-gray">Example</div>
            <pre>
var onRequestOpen = function (event) {
    var path  = event.data.path;
    var referenceData = event.data.referenceData;
    var windowName  = event.data.windowName;
    window.open({
        "path": "https://example.com/external-url.docx",
        "windowName": event.data.windowName
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestOpen": onRequestOpen,
        ...
    },
    ...
});
</pre>
            <p>Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>
        </li>
        <li>
            <p>Specify the event handler for the <em>Change source</em> button to be displayed in the configuration script for Document Editor initialization.
            When the user is trying to change an external link by clicking the <em>Change source</em> button, the <a href="<%= Url.Action("config/events") %>#onRequestReferenceSource">onRequestReferenceSource</a> event is called.</p>
            <p>An object with the unique file data and the file path or name are sent in the <em>data</em> parameter.</p>
            <p>When the button is clicked, you must call the <a href="<%= Url.Action("methods") %>#setReferenceSource">setReferenceSource</a> method to change a source of the external data.
                When calling this method, the token must be added to validate the parameters.
                If the event is not declared, the <em>Change source</em> button will not be displayed.</p>
            <note>To send the data to the <em>setReferenceSource</em> method, it is recommended to search for the file by the <em>referenceData</em> parameter first.
            If there is no such a field or a file cannot be found, then the <em>path</em> parameter is used.</note>
            <img alt="Change source" class="screenshot" src="<%= Url.Content("~/content/img/editor/change-source.png") %>" />
            <div class="header-gray">Example</div>
            <pre>
var onRequestReferenceSource = function () {
    var referenceData =  event.data.referenceData;
    var path = event.data.path;
    ...

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
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceSource": onRequestReferenceSource,
        ...
    },
    ...
});
</pre>
        </li>
    </ol>

</asp:Content>
