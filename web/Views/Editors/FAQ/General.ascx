<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        一般问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="general_1">
    <dt>我是文档服务器 API 的新手。我应该从哪里开始？</dt>
    <dd>
        <p>如果您不知道从哪里开始使用文档服务器API，我们建议您先阅读 <a href="<%= Url.Action("basic") %>">基本概念</a> 和 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分，以便更好地了解文档服务器API的构建方式。熟悉主要概念后，您可以访问 <a href="<%= Url.Action("try") %>">立即尝试</a> 部分，查看实际使用的文档服务器主要功能示例。</p>
        <p>如果您对特定的编程语言示例感兴趣，请参阅 <a href="<%= Url.Action("demopreview") %>">特定于语言的示例</a>，它们是以多种编程语言编写，解释了如何安装文档服务器、从何处获取示例源文件以及如何安装它们和连接文档服务器。</p>
        <p>对于使用某些文档管理系统（Nextcloud、ownCloud、SharePoint 等）、并且只是想知道如何将文档服务器连接到这些系统的用户，应该访问 <a href="<%= Url.Action("plugins") %>">即用型连接器</a> 部分，在那里所有与文档服务器一起使用的主要插件都有解释。</p>
        <p>每个API方法的详细描述可在更大的 <b>文档</b> 模块中找到。所有方法都在相应的部分中描述，它们的列表在 <a href="<%= Url.Action("advanced") %>">高级参数</a>部分中可以找到。</p>
    </dd>
</dl>
<dl class="faq_block" id="general_2">
    <dt>如何查看文档服务器的当前版本号？</dt>
    <dd>
        <p>当前的文档服务器版本号可在文档编辑器、演示文稿编辑器或电子表格编辑器的 <b>关于</b> 页面上找到，位于徽标和编辑器名称的正下方。</p>
        <p>您可以使用 API 向 <b><b>文档命令服务</b></b>发送 POST 请求。将 <em>c</em> 参数的值设为 <a href="<%= Url.Action("command/version") %>">"version"</a> ，在请求正文中作为 JSON 对象发送：</p>
        <pre>{
    "c": "version"
}
</pre>
        <p>版本的请求结果以 JSON 形式返回，如下所示：</p>
        <pre>{
    "error": 0,
    "version": "4.3.1.4"
}</pre>
        <p>有关与 <b>文档命令服务</b> 交互以及使用各种命令执行此操作的更多详细信息，请访问 <a href="<%= Url.Action("command") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="general_3">
    <dt>我想从 default.json 配置文件中更改一些文档服务器参数。我该怎么做才能使我的更改在更新后不会丢失？</dt>
    <dd>
        <p>文档服务器的所有主要设置都存储在 <em>default.json</em> 配置文件中，该文件位于 <em>/etc/onlyoffice/documentserver</em> /文件夹（适用于 Linux）或 <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\</em> （适用于 Windows）中。在同一文件夹中还有特定于平台的 <em>production.json</em> 文件，其中存储了与 Linux 或 Windows 相关的设置。</p>
        <p>文档服务器使用 <a target="_blank" href="https://www.npmjs.com/package/config">Node.js 配置模块</a> 来组织和构造配置文件，因此这些文件的层次结构如下所示：</p>
        <pre>default.json
production.json
local.json</pre>
        <p>所有主要设置都存储在 <em>default.json</em> 文件中，其中一些设置被 <em>production.json</em> 文件中的设置添加或覆盖，任何用户/开发人员设置被 <em>local.json</em> 配置文件中的设置覆盖。</p>
        <div class="note">如果您更改 <em>default.json</em> 或 <em>production.json</em> 文件中的参数，所有更改将在 文档服务器更新或 Docker 容器重启后丢失（如果您使用 Docker 安装了 文档服务器）。</div>
        <p>因此，我们强烈建议您 <b>不要</b> 更改 <em>default.json</em> 或 <em>production.json</em> 文件中的参数，而是使用 <em>local.json</em> 配置文件。此文件必须与 <em>default.json</em> 文件在同一文件夹中创建，并且 <b>必须保留</b> 必要参数的 <b>整个对象结构</b>。</p>
        <p><em>local.json</em> 的使用示例可以在以下部分中找到：</p>
        <ul>
            <li><a href="<%= Url.Action("save") %>#savedelay">保存延迟</a></li>
            <li><a href="<%= Url.Action("save") %>#forcesave">强制保存</a></li>
            <li><a href="<%= Url.Action("signature/body") %>">请求正文中的令牌</a></li>
            <li><a href="<%= Url.Action("wopi/") %>#enable">启用 WOPI</a></li>
            <li><a href="<%= Url.Action("wopi/") %>#ip-filter">IP过滤器</a></li>
        </ul>
    </dd>
</dl>