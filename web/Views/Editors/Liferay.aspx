<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Liferay ONLYOFFICE 连接器
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Liferay ONLYOFFICE 连接器</span>
    </h1>

    <p>该 <a href="https://github.com/ONLYOFFICE/onlyoffice-liferay" target="_blank">插件</a> 使用户可以从 <a href="https://www.liferay.com/" target="_blank">Liferay</a> 中使用 ONLYOFFICE Docs编辑办公文档。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前可以使用此插件打开和编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：ODT、ODS、ODP、DOC、XLS、PPT。</li>
        <li>该插件将在 Office 文档的 <b>文档和媒体</b> 部分中创建一个新的 <b>ONLYOFFICE 编辑/查看</b> 菜单选项。
            这允许多个用户实时协作并将这些更改保存到 Liferay。</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">安装 ONLYOFFICE 文档</h2>

    <p>
        您将需要一个可从 Liferay 和任何终端客户端解析和连接的 ONLYOFFICE Docs（文档服务器）实例。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 Liferay。
    </p>

    <p>启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="installing-plugin" class="copy-link">安装 Liferay ONLYOFFICE 连接器</h2>

    <p>
        从 <a href="https://web.liferay.com/marketplace/-/mp/application/171169174" target="_blank">Liferay Marketplace</a>
        安装它， 或者如果您自己构建连接器，只需将编译的 <b>.jar</b> 文件从 <em>build\libs</em> 文件夹放入 <em>/opt/liferay/deploy</em>。
        Liferay 会自动安装它。
    </p>


    <h2 id="configuring" class="copy-link">配置 Liferay ONLYOFFICE 连接器</h2>

    <p>
        为了配置连接器，您必须导航到 <b>系统设置</b> （<b>控制面板 -> 配置 -> 系统设置</b>）。
        在 <b>平台</b> 部分单击 <b>连接器</b> 类别并选择 <b>ONLYOFFICE</b>。
    </p>
    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE Docs 的访问，这也是出于安全原因和数据完整性考虑。
        在 Liferay <b>系统设置</b> 页面上指定您自己的<b>密钥</b>。 在 ONLYOFFICE Docs <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</p>


    <h2 id="compiling" class="copy-link">编译 Liferay ONLYOFFICE 连接器</h2>

    <p>
        只需运行 <i>gradle build</i>。
        输出 <b>.jar</b> 将放置在 <i>build/libs</i> 目录中。
    </p>


    <h2 id="how-it-works" class="copy-link">这个怎么运作</h2>

    <p>ONLYOFFICE 集成遵循<a href="<%= Url.Action("basic") %>">此处</a>的 API文档。</p>
    <ol>
        <li>用户导航到 Liferay 中的 <b>文档和媒体</b> 部分并选择 <b>在 ONLYOFFICE 中编辑</b> 操作。</li>
        <li>
            <p>Liferay 为文档服务器准备了一个 JSON 对象，具有以下属性：</p>
            <ul>
                <li><b>url</b>: ONLYOFFICE Docs 用于下载文档的 URL，</li>
                <li><b>callbackUrl</b>: ONLYOFFICE Docs 通知文档编辑状态的 URL；</li>
                <li><b>key</b>: <em>fileVersionId</em> 指示ONLYOFFICE Docs是否重新下载文档；</li>
                <li><b>title</b>：文档标题（名称）。</li>
            </ul>
        </li>
        <li>客户端浏览器从 ONLYOFFICE Docs 向 JavaScript 库发出请求，并向 ONLYOFFICE Docs 发送具有上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE Docs 从 Liferay 下载文档，用户开始编辑。然后 ONLYOFFICE Docs 从 HumHub 下载文档，用户开始编辑。</li>
        <li>ONLYOFFICE Docs 向 <i>callbackUrl</i> 发送 POST 请求，通知 HumHub 用户正在编辑文档。</li>
        <li>ONLYOFFICE Docs 向回调URL 发送 POST 请求，以通知 Liferay 用户正在编辑文档。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE Docs 向回调URL 发送一个 POST，让 Liferay 知道客户端已完成对文档的编辑并关闭它。</li>
        <li>Liferay 下载文档的新版本，替换旧版本。</li>
    </ol>


    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-liferay" target="_blank">此处</a>下载 Liferay ONLYOFFICE 连接器。</p>

</asp:Content>
