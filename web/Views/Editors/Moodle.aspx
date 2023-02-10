<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Moodle ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Moodle ONLYOFFICE 集成插件</span>
    </h1>

    <p class="dscr">该 <a href="https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor" target="_blank">插件</a> 让用户可以在 <a href="https://moodle.org/?lang=zh_cn" target="_blank">从 Moodle</a> 中用 ONLYOFFICE 文档编辑office文档。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX、TXT、CSV。</li>
        <li>以下格式仅供查看：PDF.</li>
        <li>目前，可以将以下文档格式转换为OOXML：ODT、ODS、ODP、DOC、XLS、PPT、PPS、EPUB、RTF、HTML、HTM。</li>
        <li>该插件将创建一个新的 <b>ONLYOFFICE 文档</b> 活动，作为必要课程页面的编辑模式之一。
            这允许多个用户实时协作并将这些更改保存到 Moodle。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您需要一个 ONLYOFFICE 文档 (文档服务器) 实例，该实例可从 Moodle 和任何终端客户端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE 文档文档页面</a>。
        ONLYOFFICE 文档还必须能够直接发布到 Moodle。
    </p>
    <p>安装 ONLYOFFICE 文档实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 Moodle ONLYOFFICE 集成插件</h2>
    <p>这个插件是一个 <b>活动模块</b>。</p>
    <p>按照通常的 Moodle 插件安装步骤将此插件安装到您的 <em>mod/onlyoffice</em> 目录中。请参阅 <a href="https://docs.moodle.org/311/en/Installing_plugins" target="_blank">Moodle</a> 文档了解更多信息。</p>
    <p>最新的编译包文件可在 <a href="https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor/releases" target="_blank">此处</a>获得。</p>


    <h2 id="configuration" class="copy-link">配置 Moodle ONLYOFFICE 集成插件</h2>
    <p>安装插件后，将打开插件设置页面。或者，您可以在 <b>插件概览</b> 页面上找到上传的应用程序，然后单击 <b>设置</b>。</p>
    <ul>
        <li>
            <p>在 <b>文档编辑服务地址</b> 字段中输入安装了 ONLYOFFICE 文档的服务器名称：</p>
            <span class="commandline">http://documentserver/</span>
            <p>
                其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE 文档</b> 的服务器的名称。
                该地址必须可以从用户浏览器和 Moodle 服务器访问。
                Moodle 服务器地址也必须可以从 <b>ONLYOFFICE 文档</b> 访问才能正常工作。
            </p>
        </li>
        <li>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE 文档的访问，这也是出于安全原因和数据完整性考虑。
            在 Moodle <b>设置</b> 页面上指定您自己的 <b>文档服务器密钥</b>。 在 ONLYOFFICE 文档 <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</li>
    </ul>


    <h2 id="usage" class="copy-link">使用 Moodle ONLYOFFICE 集成插件</h2>
    <p>安装和配置插件后，您可以按照通常的 Moodle 实践将 ONLYOFFICE 活动实例添加到您的课程页面：</p>
    <ol>
        <li>打开必要的课程页面。</li>
        <li>使用右上角的切换器激活 <b>编辑模式</b>。</li>
        <li>单击 <b>添加活动或资源</b>。</li>
        <li>在弹出窗口中选择 <b>ONLYOFFICE 文档</b> 活动。</li>
        <li>输入活动名称，从您的 PC 上传或拖放必要的文档，然后单击 <b>保存并显示</b> 按钮。</li>
    </ol>
    <p>管理员/教师可以选择是否可以从 ONLYOFFICE 编辑器中下载或打印文档。这可以在 <b>文档权限</b> 部分中完成。</p>
    <p>单击课程页面中的活动名称/链接会在用户浏览器中打开 <em>ONLYOFFICE 编辑器</em>，以便进行协作编辑。</p>


    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <p>遵循 <a href="<%= Url.Action("basic") %>">此处</a>的 API 文档集成ONLYOFFICE。</p>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor" target="_blank">此处</a>下载 Moodle ONLYOFFICE 集成插件。</p>

</asp:Content>
