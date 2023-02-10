<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Confluence ONLYOFFICE 集成应用
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Confluence ONLYOFFICE 集成应用</span>
    </h1>

    <p class="dscr">该
        <a href="https://github.com/ONLYOFFICE/onlyoffice-confluence" target="_blank">插件</a> 让用户能够从 <a href="https://www.atlassian.com/zh/software/confluence" target="_blank">Confluence</a> 中用 ONLYOFFICE 文档编辑办公文档。
    </p>

    <p>该连接器可在官方 <a href="https://marketplace.atlassian.com/1218214" target="_blank">Atlassian Marketplace</a>中获得。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑或查看以下格式的文档：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>
            该插件将在 Office 文档的文档库中创建一个新的菜单选项- <b>在ONLYOFFICE 中编辑</b>。
            这允许多个用户实时协作并将这些更改保存到 Confluence中。
        </li>
        <li>目前，可以将以下文档格式转换为OOXML：ODT、DOC、ODP、PPT、ODS、XLS。</li>
    </ul>
    
    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您将需要一个 ONLYOFFICE 文档 (文档服务器) 实例，该实例可从 Confluence 和任何客户终端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE 文档文档页面</a>。
        ONLYOFFICE 文档还必须能够直接发布到 Confluence上。
    </p>
    <p>启动 ONLYOFFICE 文档实例的最简单方法是使用 <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>。</p>

    <h2 id="get-connector" class="copy-link">安装 Confluence ONLYOFFICE 集成应用</h2>
    <p>将编译好的 <em>target/onlyoffice-confluence-plugin.jar</em> 上传到 Confluence 的 <b>Manage add-ons</b> 页面。</p>
    <p>最新的编译包文件可在 <a href="https://github.com/onlyoffice/onlyoffice-confluence/releases" target="_blank">此处</a>
        和 <a href="https://marketplace.atlassian.com/apps/1218214/onlyoffice-connector-for-confluence?tab=overview&hosting=datacenter" target="_blank">Atlassian Marketplace</a>上获得。</p>
    <p>您还可以从 Confluence 管理面板安装该应用程序：</p>
    <ol>
        <li>以管理员身份登录您的 Confluence 实例。</li>
        <li>导航到 <b>Manage add-ons</b> 页面。</li>
        <li>单击左侧面板上的 <b>Find new apps</b> 或 <b>Find new add-ons</b>。</li>
        <li>
            使用搜索找到 <b>ONLYOFFICE Connector for Confluence</b> 。
            结果将包括与您的 Confluence 实例兼容的附加组件版本。
        </li>
        <li>单击 <b>Install</b> 以下载并安装该应用程序。</li>
        <li>现在您可以在 <b>Installed and ready to go</b> 对话框中单击 <b>Close</b>。</li>
    </ol>

    <h2 id="configure" class="copy-link">安装 Confluence ONLYOFFICE 集成应用</h2>
    <p>在 <b>Manage add-ons</b> 页面上找到上传的 <b>Confluence ONLYOFFICE integration app</b>。
        单击 <b>Configure</b> 并输入安装了 ONLYOFFICE 文档的服务器的名称：</p>
    <span class="commandline">https://documentserver/</span>
    <p>
        其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE 文档</b> 的服务器的名称。
        该地址必须可从用户浏览器和 Confluence 服务器访问。
        为了正常工作，Confluence 服务器地址也必须可以从 <b>ONLYOFFICE 文档</b> 访问。
    </p>
    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE 文档的访问，这也是出于安全原因和数据完整性考虑。
        在 Confluence 管理页面上指定您自己的 <b>Secret key</b>。 在 ONLYOFFICE 文档 <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</p>

    <h2 id="compile" class="copy-link">编译 Confluence ONLYOFFICE 集成应用</h2>
    <p>如果您打算自己编译 Confluence ONLYOFFICE 集成应用程序（例如编辑源代码并在之后编译它），请按照以下步骤操作：</p>
    <ol>
        <li>
            <p>
                成功构建需要稳定的 Java 版本。
                如果您没有安装它，请使用以下命令安装 <b>Open JDK 8</b>：
            </p>
            <span class="commandline">
sudo apt-get update sudo apt-get install openjdk-8-jdk</span>
        </li>
        <li>安装 <b>Atlassian Plugin SDK</b>。<a href="https://developer.atlassian.com/docs/getting-started/set-up-the-atlassian-plugin-sdk-and-build-a-project" target="_blank">此处</a>描述了安装过程。</li>
        <li>获取子模块：
            <span class="commandline">git submodule update --init --recursive</span>
        </li>
        <li>编译包：
            <span class="commandline">atlas-package</span>
        </li>
    </ol>

    <h2 id="howitworks" class="copy-link">这是如何运作的</h2>
    <p>ONLYOFFICE 集成遵循<a href="<%= Url.Action("basic") %>">此处</a>的API文档。</p>
    <ol>
        <li>用户导航到 Confluence 附件并选择 <b>在ONLYOFFICE中编辑</b> 操作。</li>
        <li>Confluence 向 OnlyOfficeEditorServlet 发出请求（表单的 URL：<em>/plugins/servlet/onlyoffice/doceditor?attachmentId=$attachment.id</em>).</li>
        <li>Confluence 将文档发送到 ONLYOFFICE 文档存储服务并接收临时链接。</li>
        <li>
            <p>Confluence 准备一个具有以下属性的 JSON 对象：</p>
            <ul>
                <li><b>url</b> - ONLYOFFICE 文档用于下载文档的临时链接；</li>
                <li><b>callbackUrl</b> - ONLYOFFICE 文档通知文档编辑状态的 URL；</li>
                <li><b>docserviceApiUrl</b> - 客户端需要回复 ONLYOFFICE 文档的 URL（由 <em>files.docservice.url.api</em> 属性提供）；</li>
                <li><b>key</b> - 指示 ONLYOFFICE 文档是否再次下载文档的 UUID；</li>
                <li><b>title</b> - 文档标题（名称）。</li>
            </ul>
        <li>Confluence 使用这个对象并从 freemarker 模板构建一个页面，填充所有这些值，以便客户端浏览器可以加载编辑器。</li>
        <li>客户端浏览器从 ONLYOFFICE 文档向 JavaScript 库发出请求，并向 ONLYOFFICE 文档发送包含上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE 文档从 Confluence 下载文档，用户开始编辑。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE 文档会向 <em>回调</em> URL 发送一个 POST，让 Confluence 知道客户端已完成对文档的编辑并关闭它。</li>
        <li>Confluence 下载文档的新版本，替换旧版本。</li>
    </ol>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-confluence" target="_blank">此处</a>下载 Confluence ONLYOFFICE 集成应用程序。</p>

</asp:Content>
