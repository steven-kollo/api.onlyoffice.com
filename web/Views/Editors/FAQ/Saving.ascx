<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        保存问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="saving_1">
    <dt>编辑时如何将文档强制保存到我的存储中？</dt>
    <dd>
        <p>通常，一旦所有编辑它的用户关闭文档并且延迟时间（大约 10 秒）过去，最终文档版本就会编译。但是这种行为可以被覆盖。为此，可以使用 <b>强制保存</b> 选项。</p>
        <p>有几种方法可以启动强制保存：</p>
        <ul>
            <li>设置参数 <em>c</em> 为 <a href="<%= Url.Action("command/forcesave") %>">forcesave</a> 值，将请求发送到 <a href="<%= Url.Action("command") %>">文档命令服务</a>：
                <pre>{
    "c": "forcesave",
    "key": "Khirz6zTPdfd7",
    "userdata": "sample userdata"
}</pre>
            </li>
            <li>在编辑器初始化配置中启用 <a href="<%= Url.Action("config/editor/customization") %>#forcesave">editorConfig.customization.forcesave</a>，将其值设置为为 <b>true</b>：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "forcesave": false,
            ...
        },
        ...
    },
    ...
});</pre>
            </li>
            <li>在 <b>default.json</b> 文档服务器配置文件中启用重复强制保存启动：
                <pre>{
    "services": {
        "CoAuthoring": {
            "autoAssembly": {
                "enable": true,
                "interval": "5m"
            }
        }
    }
}</pre>
            </li>
        </ul>
        <p>根据您需要的强制保存类型，您可以选择正确的实施方式。有关这方面的更多信息，请访问 <a href="<%= Url.Action("save") %>#forcesave">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_2">
    <dt>如何保存创建的文档？</dt>
    <dd>
        <p>请参阅 <a href="<%= Url.Action("save") %>">保存文件</a> 部分以了解文件保存在文档服务器中是如何工作的，以及保存创建的文档需要什么。</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_3">
    <dt>如何将打开的文档保存为另一种文档文件类型？</dt>
    <dd>
        <p>如果打开了不同于 OOXML 格式的文档（.txt 或 .ods），则默认保存 OOXML 格式。</p>
        <p>要将打开的文档保存为不同于默认 Office Open XML 的格式，必须将 POST 请求发送到 <b>文档转换服务</b>。</p>
        <p>可以在 <a href="<%= Url.Action("conversion") %>">此章节</a>中找到有关转换如何工作以及为什么需要转换的详细信息。可以在 <a href="<%= Url.Action("conversionapi") %>">此处</a>找到 POST 请求参数和可用的响应。</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_4">
    <dt>如何启用或禁用'自动保存'选项？</dt>
    <dd>
        <p><b>自动保存</b> 选项默认启用。要禁用它，您需要将文档配置中的 <a href="<%= Url.Action("config/editor/customization") %>#autosave">editorConfig.customization.autosave</a> 参数设置为 <b>false</b>：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "autosave": false,
            ...
        },
        ...
    },
    ...
});</pre>
        <div class="note">请注意，禁用 <b>自动保存</b> 也会禁用 <b>快速</b> 共同编辑模式，该模式仅适用于启用自动文档保存。</div>
        <p>有关自动保存的更多信息，请参见 <a href="<%= Url.Action("config/editor/customization") %>#autosave">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_5">
    <dt>什么是转换开始延迟时间，如何更改？</dt>
    <dd>
        <p>通常，文档在编辑时不会以编译的形式物理保存到计算机硬盘驱动器中。完成编辑并且处理该文档的所有用户都将其关闭后，该文件将转换为 Office Open XML 格式并保存到磁盘。</p>
        <p>之后， <b>文档编辑服务</b> 通知 <b>文档存储服务</b> 文件已准备好并且可以下载。</p>
        <p>编辑结束和转换开始之间的时间在 <b>default.json</b> 配置文件中设置（默认为 5000 毫秒或 5 秒），并且可以更改：</p>
        <pre>{
    "services": {
        "CoAuthoring": {
            "server": {
                "savetimeoutdelay": 5000
            }
        }
    }
}</pre>
        <p>有关转换开始延迟的更多信息，请参见 <a href="<%= Url.Action("save") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="saving_6">
    <dt>从 csv 或 txt 格式转换时，如何指定编码类型？</dt>
    <dd>
        <p>为了保持 <b>txt</b> 或 <b>csv</b> 文件的可读性，您可能需要设置最初保存时使用的编码。如果文件中使用了与基本拉丁字母不同的字符（如ä、ö、ü、带重音符号的字母、西里尔字母等），这可能很有用。</p>
        <p>为此，将请求正文中设置好参数的 POST 请求发送到 <b>文档转换服务</b>：</p>
        <pre>{
    "codePage": 65001,
    "filetype": "txt",
    "key": "Khirz6zTPdfd7",
    "outputtype": "docx",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.txt"
}</pre>
        <p>有关在转换期间使用代码页的更多信息，请访问 <a href="<%= Url.Action("conversionapi") %>#codePage">此页面</a>。</p>
    </dd>
</dl>
