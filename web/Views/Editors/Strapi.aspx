<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Strapi ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Strapi ONLYOFFICE 集成插件</span>
    </h1>

    <p class="dscr">该 <a href="https://github.com/ONLYOFFICE/onlyoffice-strapi" target="_blank">插件</a> 让用户能够从 <a href="https://strapi.io/" target="_blank">Strapi</a> 使用 ONLYOFFICE Docs编辑office文档。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX。</li>
        <li>以下格式可供查看：DOC、DOCX、DOCM、DOT、DOTX、DOTM、ODT、FODT、OTT、RTF、TXT、HTML、HTM、MHT、XML、PDF、DJVU、FB2、EPUB、XPS、OXPS、XLS、XLSX、XLSM、XLT、XLTX、XLTM、ODS、FODS、OTS、CSV、PPS、PPSX、PPSM、PPT、PPTX、PPTM、POT、POTX、POTM、ODP、FODP、OTP。</li>
        <li>该插件将在office文档的文档库中创建一个新的<b>在ONLYOFFICE中编辑</b>菜单选项。
            这允许多个用户实时协作并将这些更改保存回 Strapi。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您需要一个 ONLYOFFICE Docs（文档服务器）实例，该实例可从 Strapi 和任何客户终端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 Strapi。
    </p>
    <p>安装 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 Strapi ONLYOFFICE 集成插件</h2>
    <p>要开始将 ONLYOFFICE Docs 与 Strapi 一起使用，请执行以下步骤：</p>
    <ol>
        <li>
            <p>更改 Strapi 中间件文件： <em>strapi/config/middlewares.js</em>。</p>
            <p>要允许使用编辑器插入框架并加载 <em>api.js</em>，请将此文件中的 <em>strapi::security</em> 行替换为以下内容：</p>
            <pre>
{
    name: "strapi::security",
    config: {
        contentSecurityPolicy: {
            useDefaults: true,
            directives: {
                "script-src": ["'self'", "https:", "http:"],
                "frame-src": ["'self'", "https:", "http:"],
            },
        },
    },
}
</pre>
            <p>如果这样的配置已经存在，您只需要添加 <em>指令</em>。</p>
        </li>
        <li>
            <p>在您的 Strapi 项目中安装插件：</p>
            <span class="commandline">npm install onlyoffice-stapi --save</span>
        </li>
        <li>
            <p>成功安装后，您必须重建管理 UI，以便包含此插件。要重建并重新启动 Strapi，请运行：</p>
            <span class="commandline"># using yarn
yarn build
yarn develop

# using npm
npm run build
npm run develop
</span>
        </li>
    </ol>


    <h2 id="configuration" class="copy-link">配置 Strapi ONLYOFFICE 集成插件</h2>
    <p>您可以通过 Strapi <b>面板 -> 设置 -> 全局设置 -> ONLYOFFICE</b>配置 ONLYOFFICE 应用程序。在设置页面，输入：</p>
    <ul>
        <li><b>文档服务器地址</b>。安装的 ONLYOFFICE 文档服务器的 URL。</li>
        <li><b>文档服务器 JWT 密钥</b>。 从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE Docs 的访问，这也是出于安全原因和数据完整性考虑。
            在 Strapi 设置页面上指定您自己的密钥。 在 ONLYOFFICE Docs <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</li>
    </ul>


    <h2 id="usage" class="copy-link">使用 Strapi ONLYOFFICE 集成插件</h2>
    <p>用户可以查看、编辑和共同创作添加到 Strapi 媒体库的文档。可供查看/编辑的文档可在Strapi的ONLYOFFICE文件页面上找到并被分类整理。通过单击文件名打开编辑器。</p>
    <p><b>访问权限</b></p>
    <ul>
        <li>打开文件进行编辑：具有 <b>更新（裁剪、详细信息、替换）+删除</b> 权限设置的角色。</li>
        <li>打开文件进行查看：具有 <b>访问媒体库</b> 权限设置的角色。</li>
    </ul>

    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <p>ONLYOFFICE 集成遵循 <a href="<%= Url.Action("basic") %>">此处</a>API文档 。

    </p><br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-strapi" target="_blank">此处</a>下载 Strapi ONLYOFFICE 集成插件。</p>

</asp:Content>
