<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SuiteCRM ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">SuiteCRM ONLYOFFICE 集成插件</span>
    </h1>

    <p class="dscr">此<a href="https://github.com/ONLYOFFICE/onlyoffice-suitecrm" target="_blank">插件</a>使用户能够从<a href="https://suitecrm.com/" target="_blank">SuiteCRM</a> 用 ONLYOFFICE 文档来编辑Office文档。</p>

    <h2 id="features" class="copy-link">功能</h2>
    <ul>
        <li>目前可以编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：PDF、ODT、ODS、ODP、DOC、XLS、PPT、PPS、EPUB、RTF、HTML、HTM、TXT、CSV。</li>
        <li>该插件允许用户编辑文本文档、电子表格、演示文稿以及创建和填写数字表单。</li>
        <li>该插件将在 Office 文档的文档库中创建一个新的菜单选项：<b>在 ONLYOFFICE 中打开</b>。
            这允许多个用户实时协作并将这些更改保存回 SuiteCRM。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装ONLYOFFICE文档</h2>
    <p>
        您需要一个可从 SuiteCRM 和任何最终客户端解析和连接的 ONLYOFFICE Docs（文档服务器）实例。
        如果情况并非如此，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接 POST 到 SuiteCRM。
    </p>
    <p>安装 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 SuiteCRM ONLYOFFICE 集成插件</h2>
    <p>ONLYOFFICE集成插件的最新编译包文件可以在<a href="https://github.com/ONLYOFFICE/onlyoffice-suitecrm/releases" target="_blank">此处</a>获取。</p>
    <p>要开始将ONLYOFFICE文档与SuiteCRM一起使用，请执行以下步骤：</p>
    <ol>
        <li>启动您的 SuiteCRM，切换到<b>Admin -> Admin Tools -> Module Loader</b>并上传 ONLYOFFICE 插件压缩文档。</li>
        <li>按<b>Install</b>按钮安装上传的模块。</li>
        <li>切换到<b>Admin -> Admin Tools -> Repair</b>并运行<b>Quick Repair and Rebuild</b>。</li>
    </ol>


    <h2 id="configuration" class="copy-link">配置 SuiteCRM ONLYOFFICE 集成插件</h2>
    <p>安装后可以看到插件设置页面： <b>Admin -> ONLYOFFICE -> ONLYOFFICE Settings</b>。</p>
    <ul>
        <li>
            <p><b>文档服务器地址</b>。 输入安装了 ONLYOFFICE Docs 的服务器的名称：</p>
            <span class="commandline">http://documentserver/</span>
            <p>
                其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE Docs</b> 的服务器的名称。
                该地址必须可从用户浏览器和 SuiteCRM 服务器访问。
                SuiteCRM 服务器地址还必须可从 <b>ONLYOFFICE Docs</b> 访问才能正常工作。
            </p>
        </li>
        <li> <b>文档服务器秘钥</b>。 从版本 7.2 开始，默认启用 JWT，并自动生成密钥以限制对 ONLYOFFICE Docs 的访问，这也是出于安全原因和数据完整性的考虑。
            在 SuiteCRM <b>ONLYOFFICE Settings</b> 页面上指定您自己的密钥。 在 ONLYOFFICE Docs <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</li>
    </ul>


    <h2 id="usage" class="copy-link">使用 SuiteCRM ONLYOFFICE 集成插件</h2>
    <p>安装并配置插件后，您可以在<b>Documents</b>模块中编辑和协作处理office文件：</p>
    <ol>
        <li>转到<b>Documents</b>模块。</li>
        <li>点击文件名打开<b>Detail View</b>页面。</li>
        <li>在<b>Detail View</b>页面上，点击<b>ACTIONS</b>下拉菜单中的<b>Open in ONLYOFFICE</b> - 文件将在新选项卡中打开。</li>
    </ol>


    <h2 id="howitworks" class="copy-link">工作原理</h2>
    <p>ONLYOFFICE 集成遵循<a href="<%= Url.Action("basic") %>">此处</a>的 API文档。</p>

    <br />
    <p><a href="https://github.com/ONLYOFFICE/onlyoffice-suitecrm" target="_blank">此处</a>下载 SuiteCRM ONLYOFFICE 集成插件。</p>

</asp:Content>
