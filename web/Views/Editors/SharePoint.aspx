<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
        ONLYOFFICE SharePoint 集成解决方案
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE SharePoint 集成解决方案</span>
    </h1>

    <p class="dscr">
        该 <a href="https://github.com/ONLYOFFICE/onlyoffice-sharepoint" target="_blank">解决方案</a> 让用户能够从 SharePoint 中用 ONLYOFFICE Docs 编辑office文档。
    </p>

    <h2 id="features" class="copy-link">特性</h2>

    <ul>
        <li>目前，可以编辑以下文档格式：DOCX, XLSX, PPTX。</li>
        <li>以下格式仅供查看：PDF、DJVU、TXT、CSV、ODT、ODS、ODP、DOC、XLS、PPT、PPS、EPUB、RTF、HTML、HTM、MHT、XPS。</li>
        <li>该插件将在文件的上下文菜单和 Office 文档的功能区中创建一个新的菜单选项 <b>在 ONLYOFFICE 中编辑</b>。
            这允许多个用户实时协作并将这些更改保存回 SharePoint。</li>
    </ul>

    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您将需要一个 ONLYOFFICE Docs（文档服务器）实例，该实例可从 SharePoint 和任何客户终端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 SharePoint。
    </p>
    <p>启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2>安装 ONLYOFFICE SharePoint 集成解决方案</h2>
    <p>要开始将 ONLYOFFICE Docs 与 SharePoint 一起使用，必须执行以下步骤：</p>
    <ol>
        <li>单击 <b>开始</b>，指向 <b>所有程序</b>，然后选择 <b>管理工具</b> 并单击 <b>服务</b>。确保 <b>SharePoint 管理</b> 服务已启动。</li>
        <li>单击 <b>开始 -> SharePoint 命令行管理程序</b>，转到包含 <em>.wsp</em> 文件的目录。</li>
        <li>运行 <em>Install.ps1</em> 脚本：
            <span class="commandline">PS> .\Install.ps1</span>
        </li>
        <li>
            <p>输入您的 SharePoint 网站地址：</p>
            <span class="commandline">https://&lt;yoursharepointsite&gt;</span>
            <div class="note">除了步骤 <b>3</b> 和 <b>4</b>，您还可以键入以下命令：
                <span class="commandline">Add-SPSolution -LiteralPath&lt;SolutionPath&gt;/onlyoffice.wsp</span>
                在 <b>SharePoint 管理中心</b> 主页上，单击 <b>系统设置 -> 场管理 -> 管理场解决方案</b>。
                在 <b>解决方案管理</b> 页面上，单击 <b>onlyoffice.wsp -> 部署解决方案</b>。
            </div>
        </li>
        <li>在 <b>SharePoint 管理中心</b> 主页的 <b>应用程序管理</b>下，单击 <b>管理 Web 应用程序</b>。</li>
        <li>确保选择您的站点并单击 <b>身份验证提供程序</b> 图标。</li>
        <li>在 <b>身份验证提供程序</b> 弹出窗口中，单击 <b>默认区域</b>。</li>
        <li>在 <b>编辑身份验证</b>下，选中 <b>启用匿名访问</b> 并单击 <b>保存</b>。</li>
        <li>返回 <b>Web 应用程序管理</b> 并单击 <b>匿名策略</b> 图标。</li>
        <li>在 <b>匿名访问限制下</b>，选择您的 <b>区域</b>，将 <b>权限</b> 设置为 <em>无 – 无策略</em>，然后单击 <b>保存</b>。</li>
    </ol>

    <h2 id="configure" class="copy-link">配置 SharePoint ONLYOFFICE 集成解决方案</h2>
    <p>
        在 SharePoint 中，打开带有管理设置的 <em>/_layouts/15/Onlyoffice/Settings.aspx</em> 页面。
        输入以下地址连接ONLYOFFICE Docs：
    </p>

    <span class="commandline">https://&lt;documentserver&gt;/</span>

    <p>
        其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE Docs</b> 的服务器的名称。
        用户浏览器和 SharePoint 服务器必须可以访问该地址。
        SharePoint 服务器地址也必须可以从 <b>ONLYOFFICE Docs</b> 访问才能正常工作。
    </p>

    <div class="note">
        请注意，如果您有使用 SharePoint 设置的子网站，则需要额外配置与每个子网站的 ONLYOFFICE Docs 连接，以使其正常工作。
        转到每个子站点设置并在正确的字段中输入文档服务器地址。
    </div>

    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> in the SharePoint administrative settings. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>

    <p>If JWT protection is enabled, it is necessary to specify a custom header name 
        since the SharePoint security policy blocks external <b>Authorization</b> headers. This header should be specified in the ONLYOFFICE Docs signature settings as well. 
        Further information about signature can be found <a href="<%= Url.Action("signature/") %>">here</a>.</p>

    <h2>编译 ONLYOFFICE SharePoint 集成解决方案</h2>
    <p>ONLYOFFICE SharePoint 集成解决方案有两种编译方式：</p>
    <ol style="list-style-type: lower-alpha;">
        <li>使用 <b>MS Visual Studio</b>：
            <ol>
                <li>进入 SharePoint 服务器并在 Visual Studio 中打开此项目。</li>
                <li>在 <b>解决方案资源管理器</b>中，打开项目的快捷菜单，然后选择 <b>发布</b>。</li>
                <li>在 <b>发布</b> 对话框中，选择 <b>发布到文件系统</b> 选项按钮。</li>
                <li>
                    单击 <b>发布</b> 按钮。
                    发布过程完成后，将创建解决方案 <em>.wsp</em> 文件。
                </li>
                <li>将生成的文件复制到包含 <em>Install.ps1</em> 文件的文件夹（默认为<b>BuildAndInstall</b> 文件夹）。</li>
            </ol>
        </li>
        <li>在提供的 <em>build.bat</em> 文件的帮助下：
            <ol>
                <li>转到 <b>BuildAndInstall</b> 文件夹。</li>
                <li>运行 <em>build.bat</em> 文件。</li>
                <li>生成的解决方案 <em>.wsp</em> 文件将被创建并放置到 <b>BuildAndInstall</b> 文件夹中。</li>
            </ol>
        </li>
    </ol>


    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>
    <ol>
        <li>用户导航到 SharePoint 中的文档并在上下文菜单或功能区上选择 <b>在 ONLYOFFICE 中编辑</b> 操作。</li>
        <li>SharePoint 向编辑器页面发出请求（表单的 URL：<em>/_layouts/15/Onlyoffice/editorPage.aspx?SPListItemId={SelectedItemId}&SPListId={ItemId}&SPListURLDir={ListUrlDir}&action=track</em>).</li>
        <li>
            <p>SharePoint 准备一个具有以下属性的 JSON 对象：</p>
            <ul>
                <li><b>url</b> - ONLYOFFICE Docs 用于下载文档的 URL；</li>
                <li><b>callbackUrl</b> - ONLYOFFICE Docs 通知文档编辑状态的 URL；</li>
                <li><b>DocumentSeverHost</b> - the URL that the client needs to reply to ONLYOFFICE Document Server (can be set at the settings page);</li>
                <li><b>Key</b> - 来自 SharePoint 的文件标识符；</li>
                <li><b>FileName</b> - 文档标题（名称）；</li>
                <li><b>CurrentUserId</b> - 用户标识；</li>
                <li><b>CurrentUserName</b> - 用户名。</li>
            </ul>
        </li>
        <li>SharePoint 构造一个页面，填充所有这些值，以便客户端浏览器可以加载编辑器。</li>
        <li>客户端浏览器从 ONLYOFFICE Docs 向 JavaScript 库发出请求，并向 ONLYOFFICE Docs 发送包含上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE Docs 从 SharePoint 下载文档，用户开始编辑。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE Docs 向回调 URL 发送一个 POST，让 SharePoint ONLYOFFICE 解决方案知道客户端已完成对文档的编辑并关闭它。</li>
        <li>SharePoint 下载文档的新版本，替换旧版本。</li>
    </ol>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-sharepoint" target="_blank">此处</a>下载 ONLYOFFICE SharePoint 集成解决方案。</p>

</asp:Content>
