<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Jira ONLYOFFICE 集成应用
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Jira ONLYOFFICE 集成应用</span>
    </h1>

    <p>此 <a href="https://github.com/ONLYOFFICE/onlyoffice-jira" target="_blank">应用程序</a> 允许用户从 <a href="https://www.atlassian.com/zh/software/jira" target="_blank">Jira Software</a> 中使用 ONLYOFFICE Docs编辑办公文档。</p>

    <p>该连接器可在官方 <a href="https://marketplace.atlassian.com/apps/1226616/onlyoffice-connector-for-jira" target="_blank">Atlassian Marketplace</a>.中获得。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>以下格式可供查看：DOC、DOCM、DOC、DOTX、DOTM、ODT、FODT、OTT、RTF、TXT、HTML、HTM、MHT、PDF、DJVU、FB2、EPUB、XPS、XLS、XLSM、XLTZ、XLTX、XLTM、ODS、FODS、OTS、CSV、PPS、PPSX、PPSM、PPT、PPTM、POT、POTX、POTM、ODP、FODP、OTP。</li>
        <li>该插件将在 Office 文档的文档库中创建一个新的菜单选项- <b>在ONLYOFFICE 中编辑</b>。
            这允许多个用户实时协作并将更改保存回 Jira。</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">安装 ONLYOFFICE 文档</h2>

    <p>
        您将需要一个 ONLYOFFICE Docs（文档服务器）实例，该实例可从 Jira 和任何最终客户端解析和连接。
        如果不是这种情况，请使用官方 <a href="http://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 Jira。
    </p>

    <p>启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="installing" class="copy-link">安装 Jira ONLYOFFICE 集成应用</h2>

    <p>将编译好的 <em>target/onlyoffice-jira-app.jar</em> 上传到 <b>管理应用</b> 页面的 Jira。</p>
    <p>最新的编译包文件可在 <a href="https://github.com/ONLYOFFICE/onlyoffice-jira/releases" target="_blank">此处</a>
        和 <a href="https://marketplace.atlassian.com/???" target="_blank">Atlassian Marketplace</a>上获得。</p>
    <p>您还可以从 Jira 管理面板安装该应用程序：</p>
    <ol>
        <li>导航到 <b>管理应用程序</b> 页面。</li>
        <li>单击左侧面板上的 <b>查找新应用</b>。</li>
        <li>使用搜索找到 <b>适用于 Jira 的 ONLYOFFICE 连接器</b>。</li>
        <li>单击 <b>安装</b> 以下载并安装该应用程序。</li>
    </ol>


    <h2 id="configuring" class="copy-link">配置 Jira ONLYOFFICE 集成应用</h2>

    <p>在 <b>管理应用</b> 页面上找到上传的应用。单击 <b>配置</b> 并输入安装了 ONLYOFFICE Docs 的服务器的名称：</p>
    <span class="commandline">http://documentserver/</span>
    <p>
        其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE Docs</b> 的服务器的名称。
        该地址必须可供用户浏览器和 Jira 服务器访问。
        要正常工作,Jira 服务器地址也必须可以从 <b>ONLYOFFICE Docs</b> 访问。
    </p>
    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE Docs 的访问，这也是出于安全原因和数据完整性考虑。
        在 Jira 管理页面上指定您自己的<b>密钥</b>。 在 ONLYOFFICE Docs <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</p>

    <p>有时您的网络配置可能不允许使用公共地址在 Jira 和 ONLYOFFICE Docs 之间进行请求。
        <b>高级服务器设置</b>部分允许您为来自 Jira 的内部请求设置 ONLYOFFICE Docs 地址，
        以及为来自 ONLYOFFICE Docs 的内部请求设置返回的 Jira 地址。</p>

    <h2 id="compiling" class="copy-link">编译 Jira ONLYOFFICE 集成应用</h2>

    <p>如果您打算自己编译 Jira ONLYOFFICE 集成应用程序（例如编辑源代码并在之后编译它），请按照以下步骤操作：</p>
    <ol>
        <li>
            <p>
                需要稳定的 Java 版本才能成功构建。
                如果您没有安装它，请使用以下命令安装 <b>Open JDK 8</b>：
            </p>
            <span class="commandline">sudo apt-get update
sudo apt-get install openjdk-8-jdk</span>
        </li>
        <li>安装 <b>Atlassian Plugin SDK</b>。<a href="https://developer.atlassian.com/server/framework/atlassian-sdk/set-up-the-atlassian-plugin-sdk-and-build-a-project/" target="_blank">此处</a>描述了安装过程。</li>
        <li>编译包：
            <span class="commandline">atlas-package</span>
        </li>
    </ol>


    <h2 id="using" class="copy-link">使用 Jira ONLYOFFICE 集成应用</h2>

    <p>使用ONLYOFFICE集成应用程序，您可以在Jira仪表板内查看、编辑和合著附加到任务的office文件。</p>
    <p>要编辑文档，请单击附件名称旁边的 ONLYOFFICE 文档图标 - 相应的在线编辑器将在新选项卡中打开。</p>
    <p>编辑会话结束后，包含所有更改的文档将保存为新附件。
        您将通过带有后缀的相同名称识别它。如果您正在协作编辑附件，则仅在最后一个用户退出编辑器后才会保存更改。</p>


    <h2 id="how-it-works" class="copy-link">它是如何运作的</h2>

    <p>ONLYOFFICE 集成遵循<a href="<%= Url.Action("basic") %>">此处</a>的API文档。</p>
    <ol>
        <li>用户导航到 Jira 附件并选择 <b>在 ONLYOFFICE 中编辑</b> 操作。</li>
        <li>Jira 向 <b>OnlyOfficeEditorServlet</b> 发出请求（表单的 URL：<em>/plugins/servlet/onlyoffice/doceditor?attachmentId=$attachment.id</em>).</li>
        <li>Jira 将文档发送到 ONLYOFFICE 文档存储服务并接收临时链接。</li>
        <li>
            <p>Jira 准备一个具有以下属性的 JSON 对象：该应用程序准备一个具有以下属性的 JSON 对象：</p>
            <ul>
                <li><b>Url</b>：ONLYOFFICE Docs 用于下载文档的临时链接，</li>
                <li><b>callbackUrl</b>：ONLYOFFICE Docs 通知文档编辑状态的 URL，</li>
                <li><b>docserviceApiUrl</b>：客户端需要回复ONLYOFFICE Docs 的 URL（由 <em>files.docservice.url.api</em> 属性提供），</li>
                <li><b>key</b>：指示 ONLYOFFICE Docs 是否再次下载文档的 UUID，</li>
                <li><b>Title</b>：文档标题（名称）。</li>
            </ul>
        </li>
        <li>Jira 获取此对象并从 freemarker 模板构造一个页面，填充所有这些值，以便客户端浏览器可以加载编辑器。</li>
        <li>客户端浏览器从 ONLYOFFICE Docs 向 JavaScript 库发出请求，并向 ONLYOFFICE Docs 发送具有上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE Docs 从文档存储中下载文档，用户开始编辑。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE Docs 会向回调 URL 发送一个 POST，让 Jira 知道客户端已完成对文档的编辑并关闭它。</li>
        <li>包含所有更改的文档将保存为新附件，并在文件名中添加了后缀。</li>
    </ol>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-jira" target="_blank">此处</a>下载 Jira ONLYOFFICE 集成应用程序。</p>

</asp:Content>
