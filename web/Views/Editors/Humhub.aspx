<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    HumHub ONLYOFFICE 连接器
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">HumHub ONLYOFFICE 连接器</span>
    </h1>

    <p>该 <a href="https://github.com/ONLYOFFICE/onlyoffice-humhub" target="_blank">插件</a> 使用户可以从 <a href="https://www.humhub.com/" target="_blank">HumHub</a> 中使用 ONLYOFFICE Docs编辑办公文档。</p>
    <p>该插件可以在官方 <a href="https://www.humhub.com/en/marketplace/onlyoffice/" target="_blank">HumHub Marketplace</a>中获得。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前可以使用此插件打开和编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：ODT、ODS、ODP、DOC、XLS、PPT、TXT、PDF。</li>
        <li>以下格式可以转换为OOXML：ODT、ODS、ODP、DOC、XLS、PPT、TXT、CSV。</li>
        <li>该插件将为 Office 文档创建一个新的 <b>编辑/查看</b> 菜单选项。
            这允许多个用户实时协作并将这些更改保存回 HumHub。</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">安装 ONLYOFFICE 文档
</h2>

    <p>
        您将需要一个 ONLYOFFICE Docs（文档服务器）实例，该实例可从 HumHub 和任何终端客户端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。ONLYOFFICE Docs 还必须能够直接发布到 HumHub。</p>

    <p>启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="installing-plugin" class="copy-link">安装 HumHub ONLYOFFICE 连接器</h2>

    <p>
        从 <a href="https://www.humhub.com/en/marketplace/onlyoffice/" target="_blank">HumHub Marketplace</a> 安装它，或者简单地将存储库克隆到 <em>moduleAutoloadPaths</em> 参数指定的文件夹之一中。
        请参阅 <a href="https://docs.humhub.org/docs/develop/environment#module-loader-path" target="_blank">HumHub 文档</a> 了解更多信息。
    </p>


    <h2 id="configuring" class="copy-link">配置 HumHub ONLYOFFICE 连接器</h2>

    <p>
        为了配置插件，您必须导航到 <b>Administation -> Modules</b>。
        找到 ONLYOFFICE 插件并点击 <b>配置</b>。
    </p>
    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE Docs 的访问，这也是出于安全原因和数据完整性考虑。
        在 HumHub 配置页面上指定您自己的 <b>JWT Secret</b>。 在 ONLYOFFICE Docs <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</p>


    <h2 id="how-it-works" class="copy-link">它是如何运作的</h2>

    <p>ONLYOFFICE 集成遵循<a href="<%= Url.Action("basic") %>">此处</a>的API文档。</p>
    <ol>
        <li>创建新文件时，将在 <b>创建文档 </b>菜单中为用户提供 <b>文档</b>、 <b>电子表格</b> 或 <b>演示文稿</b> 选项。</li>
        <li>浏览器调用 <em>/controllers/CreateController.php</em> 控制器中的 <em>index</em> 方法。</li>
        <li>或者，当打开现有文件时，将根据扩展名向用户提供 <b>查看文档</b> 或 <b>编辑文档</b>。</li>
        <li>打开一个弹出窗口并调用 <em>/controllers/OpenController.php</em> 控制器的 <em>index</em> 方法。</li>
        <li>
            <p>该应用程序准备一个具有以下属性的 JSON 对象：</p>
            <ul>
                <li><b>url</b> - ONLYOFFICE Docs 用于下载文档的 URL；</li>
                <li><b>callbackUrl</b> - ONLYOFFICE Docs 通知文档编辑状态的 URL；</li>
                <li><b>key</b> - 用于指示 ONLYOFFICE Docs 是否再次下载文档的随机 MD5 哈希值；</li>
                <li><b>title</b> - 文档标题（名称）；</li>
                <li><b>id</b> - 用户标识；</li>
                <li><b>name</b> - 用户名。</li>
            </ul>
        </li>
        <li>HumHub 接受这个对象并从 <em>views/open/index.php</em> 模板构建一个页面，填充所有这些值，以便客户端浏览器可以加载编辑器。</li>
        <li>客户端浏览器从 ONLYOFFICE Docs 向 JavaScript 库发出请求，并向 ONLYOFFICE Docs 发送具有上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE Docs 从 HumHub 下载文档，用户开始编辑。</li>
        <li>ONLYOFFICE Docs 向 <em>callbackUrl</em> 发送 POST 请求，通知 HumHub 用户正在编辑文档。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE Docs 向 <em>callbackUrl</em> 发送一个 POST，让 HumHub 知道客户端已完成对文档的编辑并关闭它。</li>
        <li>HumHub 下载文档的新版本，替换旧版本。</li>
    </ol>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-humhub" target="_blank">此处</a>下载 HumHub ONLYOFFICE 连接器。</p>

</asp:Content>
