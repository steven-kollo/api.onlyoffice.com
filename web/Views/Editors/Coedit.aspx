<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    共同编辑
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">共同编辑</span>
    </h1>
    <p class="dscr">参考图和以下步骤说明了在 ONLYOFFICE 文档服务器中共同编辑文档的过程。
    </p>
    <img alt="共同编辑" src="<%= Url.Content("~/content/img/editor/coedit.jpg") %>" /><ol>
        <li>用户 1 和用户 2 在 <b>文档编辑器</b>中打开了一个相同的文档，即打开文件时使用了相同的 <a href="<%= Url.Action("config/document") %>#key">document.key</a>。</li>
        <li>用户 1 对打开的文档进行更改。</li>
        <li><b>文档编辑器</b> 将用户 1 所做的更改发送到 <b>文档编辑服务</b>。</li>
        <li><b>文档编辑服务</b> 将用户 1 所做的更改发送给用户 2 <b>文档编辑器</b>。</li>
        <li>现在这些更改对用户 2 可见。</li>
    </ol>
    <img class="screenshot max-width-832" alt="共同编辑" src="<%= Url.Content("~/content/img/editor/coedit-view.png") %>" />

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个空的 <em>html</em> 文件。</li>
        <li>添加 <em>div</em> 元素，如下所示。
            <pre>&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;</pre>
        </li>
        <li>使用将用于您的网站的 JavaScript API来指定您的 ONLYOFFICE 文档服务器链接。
            <pre>&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;</pre>
            其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称。
        </li>
        <li>添加脚本指定你想打开的文档，为 <em>div</em> 元素初始化 <b>文档编辑器</b>。
            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "user": {
            "id": "78e1e841",
            "name": "John Smith"
        }
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJ1c2VyIjp7ImlkIjoiNzhlMWU4NDEiLCJuYW1lIjoiSm9obiBTbWl0aCJ9fX0.6AcBUCbys9kQ7S982Qm4w1romVg86kZ4ECNsxDff5zU"
});
</pre>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        </li>
        <li>在浏览器中打开您的 <em>html</em> 文件。</li>
        <li>现在复制上面创建的 <em>html</em> 文件。</li>
        <li>在复制的 <em>html</em> 文件中更改初始化 <b>文档编辑器</b> 的脚本。
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "user": {
            "id": "F89d8069ba2b",
            "name": "Kate Cage"
        }
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJ1c2VyIjp7ImlkIjoiRjg5ZDgwNjliYTJiIiwibmFtZSI6IkthdGUgQ2FnZSJ9fX0.rdmhKLzXwXXVTABioKy3R2-HGMBY5u4pbZ_TVhW2rJs"
});
</pre>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        </li>
        <li>在浏览器中打开您复制和编辑的 <em>html</em> 文件。</li>
    </ol>

    <h2 id="key-coediting" class="copy-link">在共同编辑中使用key</h2>
    <p>
        为了打开文档进行编辑，配置初始化需要 <a href="<%= Url.Action("config/document") %>#key"><em>key</em></a> 参数，它允许用户从编辑器缓存中重新打开文档。
        key是一个文本字段，它具有有限长度和多个符号。
        它由软件集成商生成，并定义了唯一的文档标识符，服务用它来识别文档。
    </p>
    <div class="note">
        key可以使用的字符是：<b>0-9</b>, <b>a-z</b>, <b>A-Z</b>, <b>-._=</b>.
        key最大长度为<b>128</b>个 字符。
    </div>
    <p>
        因此，用户必须拥有相同的key才能打开文档进行共同编辑。
        <b>文档编辑服务</b> 识别试图打开文档的另一个用户（或 <a href="<%= Url.Action("inlineeditors") %>">内联编辑器</a>的另一个标签/编辑会话）的key，如果该key与文件的key匹配，则允许用户打开它。
        如果key不同，则打开一个与其他文件和文件版本无关的新文件。
    </p>
    <p>
        一旦发送保存文件的请求（ <em>status</em> 值等于 <em>2</em>）并且操作完成（响应值等于 <em>{"error":0}</em>），则无法使用该key打开文档用于编辑。
        编辑器加载了一条 <a href="<%= Url.Action("troubleshooting") %>#key">错误消息</a>。
        但是，它可以用于从缓存中查看文档（如果存在）。
    </p>
    <p>
        如果用户在编辑完成之前保存文档（ <em>status</em> 等于 <em>6</em>），则不能更改key。
        否则，共同编辑将停止。
        请注意，在强制保存过程之后，对于刚刚进入当前编辑会话的新用户，也无法更改key。
    </p>
    <div id="examples" class="header-gray copy-link">例子</div>
    <ol>
        <li>
            <p>
                添加脚本,用 <em>key 1</em>初始化<b>文档编辑器</b>。
                key未知，打开文件的 URL 已指定。
            </p>
            <p>Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.</p>
            <p>
                关闭<b>文档编辑器</b>。
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifX0.GcpcY8sLCUDqbgqCLvPs6Z0xfBtayOy-GHEXYiZCpfs",
    ...
});
</pre>
            <p>
                其中<b>example.com</b>是安装了<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                添加脚本,使用相同 <em>key 1</em>初始化 <b>文档编辑器</b>。
                未使用新 URL，因为key是已知的，并且文档已从编辑器缓存中重新打开。
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document 2.docx",
        "url": "https://example.com/url-to-example-document2.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IDIuZG9jeCIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQyLmRvY3gifX0.aegFVaZpkqc5bEYmF-PQYf3MMFg7QvAfWeOnfDJeuTg",
    ...
});
</pre>
            <p>
                其中<b>example.com</b>是安装了<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                添加脚本,使用 <em>key 2</em>初始化另一个 <b>文档编辑器</b> key未知，
                打开文件的 URL 已指定。
                即使这个 URL 和第一个场景中的 URL 相同，也有两个独立的编辑会话。
            </p>
            <p>
                关闭<b>文档编辑器</b>。
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Mgetl3dYUppf2",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJNZ2V0bDNkWVVwcGYyIiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCJ9.5YvlbNVbXFddzKBdz_qPpqgUX_JrUHBWCGRQ5YgVp_w",
    ...
});
</pre>
            <p>
                其中<b>example.com</b>是安装了<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                添加脚本,使用 <em>key 1</em>初始化另一个 <b>文档编辑器</b>。
这个key是已知的，文档从编辑器缓存中重新打开。
由于这个key与第二个场景中的key相同，因此以共同编辑模式打开文档。
            </p>
            <p>
                在不关闭文档的情况下获取当前文档状态。
                <a href="<%= Url.Action("config/editor/customization") %>#forcesave">forcesave</a> 参数允许您在编辑器初始化的自定义部分中执行此操作。
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "customization": {
            "forcesave": true 
        }
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJjdXN0b21pemF0aW9uIjp7ImZvcmNlc2F2ZSI6dHJ1ZX19fQ.dlIJqq6tH9ncQmXQV-gCi4Zc7sqYhGS5RwvpiIZGZXA",
    ...
});
</pre>
            <p>
                其中<b>example.com</b>是安装了<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                添加脚本，初始化另一个 <b>文档编辑器</b>。
<a href="<%= Url.Action("save") %>#forcesave">force saving</a>成功后，当前编辑会话的新用户不会更改key。
因此， 必须使用 <em>key 1</em>，以便和来自第二和第四个场景的用户进入相同的共同编辑会话。
            </p>
            <p>
                使用 <em>key 1</em>关闭所有三个编辑会话。
                所有更改均已成功保存。
                保存文档后，必须重新生成key。
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWNhbGxiYWNrLmFzaHgifX0.L53bCRlJyvIf-C7bcKYM2WMfmk4FeZIoeDaEpc5IxXA",
    ...
});
</pre>
            <p>
                其中<b>example.com</b>是安装了<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                添加脚本，初始化 <b>文档编辑器</b>，以便查看已经创建的文档。
                可以使用<em>Key 1</em>。
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "mode": "view"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJtb2RlIjoidmlldyJ9fQ.wpEk-zrrGq5hKHCm6sAhl_tb51n56th-q-K52Oeq1a4",
    ...
});
</pre>
            <p>
                其中<b>example.com</b>是安装了<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            </p>
        </li>
        <li>
            <p>
                添加脚本，初始化 <b>文档编辑器</b>，以便编辑已经创建的文档。
                <em>Key 1</em> 无法使用，因为它在文件保存后已更改。
                发生 <a href="<%= Url.Action("troubleshooting") %>#key">错误</a>。
            </p>
            <p>
                关闭<b>文档编辑器</b>。
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "mode": "edit"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJtb2RlIjoiZWRpdCJ9fQ.rSc0yYe3_2u7N_uaxZcDQ6vC_d5ZWU5LFkkGSow5UDY",
    ...
});
</pre>
            <p>
                其中<b>example.com</b>是安装了<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            </p>
        </li>
    </ol>

    <h2 id="modes" class="copy-link">协同编辑模式</h2>
    <p>有两种模式可以实时协作文档 — <b>自动</b>和<b>手动</b></p>
    <p>您可以使用<a href="<%= Url.Action("config/editor") %>#coEditing">editorConfig.coEditing参数更改协同编辑模式</a>：</p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "coEditing": {
            "mode": "fast",
            "change": true
        },
        ...
    },
    ...
});
</pre>
    <h3 id="fast"class="copy-link">自动模式</h3>
    <p>默认情况下使用<b>自动</b>模式，并定义实时协同编辑。所有更改都会自动保存，无法重做上次撤消的操作。此模式在用户编辑文本时显示用户光标和工具提示及其名称</p>
    <img class="screenshot max-width-832" alt="自动模式" src="<%= Url.Content("~/content/img/editor/fast-mode.png") %>" />

    <p></p>
    <h3 id="strict"class="copy-link">手动模式</h3>
    <p>在<b>手动</b>模式下，您需要使用<b>保存</b>按钮来同步您和其他用户所做的更改。在您单击此按钮之前，其他人所做的更改将被隐藏。当多个用户同时编辑一个文档时，编辑的文本用不同颜色的虚线标记。</p>
    <p>当用户通过单击<b>保存</b>按钮保存更改时，其他用户将收到有关更新的注释。
        要接受它们并保存您自己的更改以显示给其他用户，请单击<img alt="保存更新" title="保存更新" src="<%= Url.Content("~/content/img/editor/save-updates.png") %>" />。按钮
        位于顶部工具栏的左上角。更新将突出显示。</p>
    <img class="screenshot max-width-832" alt="手动模式" src="<%= Url.Content("~/content/img/editor/strict-mode.png") %>" />

</asp:Content>
