<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Chamilo ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Chamilo ONLYOFFICE 集成插件</span>
    </h1>

    <p class="dscr">该 <a href="https://github.com/ONLYOFFICE/onlyoffice-chamilo" target="_blank">插件</a> 让用户能够 <a href="https://chamilo.org/en/" target="_blank">在Chamilo</a> 中使用 ONLYOFFICE Docs编辑办公文档。</p>

    <p>该应用程序与 Chamilo v1.11.14 或更高版本兼容。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX、PPSX、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：PDF、DJVU、TXT、CSV、ODT、ODS、ODP、DOC、XLS、PPT、PPS、EPUB、RTF、HTML、HTM、MHT、XPS。</li>
        <li>该插件将在 Office 文档的文档库中创建一个新的菜单选项 <b>用 ONLYOFFICE 打开</b>。
            这允许多个用户实时协作并将这些更改保存回 Chamilo。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您需要一个ONLYOFFICE Docs（文档服务器）实例，它可从 Chamilo 和任何客户终端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 Chamilo。
    </p>
    <p>
        ONLYOFFICE Docs 和 Chamilo 可以安装在不同的计算机上，也可以安装在同一台机器上。
        如果您使用一台机器，请为文档服务器设置自定义端口，因为默认情况下 ONLYOFFICE Docs 和 Chamilo 都在端口 80 上工作。</p>
    <p>
        启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 Chamilo ONLYOFFICE 集成插件</h2>
    <p>要开始将 ONLYOFFICE Docs 与 Chamilo 一起使用，必须执行以下步骤：</p>
    <ol>
        <li>转到 Chamilo <b>Administration</b>，选择 <b>Plugins</b> 并单击 <b>Upload plugin</b> 按钮。</li>
        <li>上传 <em>onlyoffice.zip</em> （您可以在 <a href="https://github.com/ONLYOFFICE/onlyoffice-chamilo/releases" target="_blank">此处</a>找到它）。您将看到插件列表。</li>
        <li>从 Chamilo 根文件夹运行 <em>composer install</em>。</li>
        <li>返回插件列表，选择 ONLYOFFICE 插件，然后单击 <b>Enable the selected plugins</b>。</li>
    </ol>


    <h2 id="configuration" class="copy-link">配置 Chamilo ONLYOFFICE 集成插件</h2>
    <p>在 <b>Plugins</b> 页面上，找到 ONLYOFFICE 并单击 <b>Configure</b>。您将看到 <b>Settings</b> 页面。启用插件并指定文档服务器地址：</p>
    <span class="commandline">https://&lt;documentserver&gt;/</span>
    <p>
        其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE Docs</b> 的服务器的名称。
        该地址必须可从用户浏览器和 Chamilo 服务器访问。
        为了正常工作，Chamilo 服务器地址也必须可以从 <b>ONLYOFFICE Docs</b> 访问。
    </p>


    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <ol>
        <li>要创建新文件，用户打开必要的文件夹并单击ONLYOFFICE 图标 <b>新建</b>。</li>
        <li>用户被重定向到文件创建页面，在这里需要输入文件名和格式（文本文档、电子表格或演示文稿）。
            浏览器调用 <em>/plugin/onlyoffice/create.php</em> 方法。它将空文件的副本添加到用户文件夹。</li>
        <li>要打开现有文件，用户选择 <b>用 ONLYOFFICE打开</b> 图标。</li>
        <li>
            <p>请求被发送到 <em>/plugin/onlyoffice/editor.php?docId="document identificator"</em>。
            服务器处理请求，生成具有以下属性的编辑器初始化配置：</p>
            <ul>
                <li><b>url</b> - ONLYOFFICE Docs 用于下载文档的 URL；</li>
                <li><b>callbackUrl</b> - ONLYOFFICE Docs 用于通知文档编辑状态的 URL；</li>
                <li><b>documentServerUrl</b> - 客户端需要响应 ONLYOFFICE Docs 的 URL（可以在管理设置页面设​置）；</li>
                <li><b>key</b> - 指示 ONLYOFFICE Docs 是否再次下载文档的电子标签。</li>
            </ul>
        </li>
        <li>服务器返回一个带有打开编辑器脚本的页面。</li>
        <li>浏览器打开此页面并加载编辑器。</li>
        <li>浏览器向 ONLYOFFICE Docs 发出请求并将文档配置传递给它。</li>
        <li>ONLYOFFICE Docs 加载文档，用户开始编辑。</li>
        <li>ONLYOFFICE Docs 向 <em>callbackUrl</em> 发送 POST 请求，通知 Chamilo：用户正在编辑文档。</li>
        <li>当所有用户都完成编辑后，他们会关闭编辑器窗口。</li>
        <li><a href="<%= Url.Action("save") %>#savedelay">10 seconds</a>秒后，ONLYOFFICE Docs 向 <em>callbackUrl</em> 发出 POST 请求，其中包含编辑已结束的信息，并发送新文档版本的链接。</li>
        <li>Chamilo 加载文档的新版本并覆盖该文件。</li>
    </ol>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-chamilo/tree/master" target="_blank">此处</a>下载 Chamilo ONLYOFFICE 集成插件。</p>

</asp:Content>
