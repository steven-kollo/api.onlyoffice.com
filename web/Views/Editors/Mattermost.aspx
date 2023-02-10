<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Mattermost ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Mattermost ONLYOFFICE 集成插件</span>
    </h1>

    <p class="dscr">该 <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">插件</a> 使用户能够从 <a href="https://mattermost.com/" target="_blank">Mattermost</a> 中使用 ONLYOFFICE 文档编辑办公文档。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX。</li>
        <li>以下格式可供查看：XLS、XLSX、CSV、XLSM、XLT、XLTM、ODS、FODS、OTS、PPS、PPSX、PPSM、PPT、PPTX、PPTM、POT、POTX、POTM、ODP、FODP、OTP、DOC、DOCX、DOCM、DOT、DOTX、DOTM、ODT、FODT、OTT、RTF。</li>
        <li>该插件将在文档库中为office文档创建一个新的 <b>在 ONLYOFFICE 中打开</b> 的菜单选项。
            这允许多个用户实时协作并将这些更改保存回 Mattermost。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您需要一个可从 Mattermost 和任何最终客户端解析和连接的 ONLYOFFICE 文档（文档服务器）实例。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE 文档文档页面</a>。
        ONLYOFFICE 文档还必须能够直接发布到 Mattermost。
    </p>
    <p>
        ONLYOFFICE 文档和 Mattermost 可以安装在不同的计算机上，也可以安装在同一台机器上。
        如果您使用一台机器，请为 文档服务器设置自定义端口。
    </p>
    <p>安装 ONLYOFFICE 文档实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 Mattermost ONLYOFFICE 集成插件</h2>
    <p>要开始将 ONLYOFFICE 文档与 Mattermost 一起使用，请执行以下步骤：</p>
    <ol>
        <li>克隆 <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">主分支</a>。</li>
        <li>转到项目根目录。</li>
        <li>
            <p>安装依赖：</p>
            <span class="commandline">npm install --legacy-peer-deps</span>
            <note>请注意，您需要在计算机上安装 Node.js v.15.14.0 才能构建插件。</note>
        </li>
        <li>
            <p>运行以下命令：</p>
            <span class="commandline">make dist</span>
        </li>
        <li>转到 <em>&lt;your_mattermost_host&gt;/admin_console/plugins/plugin_management</em>。</li>
        <li>从您的 <em>dist</em> 文件夹中选择已编译的插件，然后按 <b>Upload</b>。</li>
    </ol>


    <h2 id="configuration" class="copy-link">配置 Mattermost ONLYOFFICE 集成插件</h2>
    <img alt="最重要的设置" width="832px" src="<%= Url.Content("~/content/img/editor/mattermost-settings.png") %>"/>
    <ul>
        <li><b>启用插件。</b>通过将此参数设置为 <b>true</b>来启用 Mattermost ONLYOFFICE 集成插件。</li>
        <li>
            <p><b>文件编辑服务地址</b>。要连接 ONLYOFFICE 文档，请输入以下地址：</p>
            <span class="commandline">https://&lt;documentserver&gt;:&lt;port&gt;/</span>
            <p>
                其中 <b>documentserver</b> 是服务器的名称， <b>port</b> 是安装了 <b>ONLYOFFICE 文档</b> 的端口号。
                该地址必须可从用户浏览器和 Mattermost 服务器访问。
                也必须可以从 <b>ONLYOFFICE 文档</b> 访问 Mattermost 服务器地址才能正确工作。
            </p>
        </li>
        <li><b>密钥</b>。 从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE 文档的访问，这也是出于安全原因和数据完整性考虑。
            在 Mattermost 插件配置中指定您自己的密钥。 在 ONLYOFFICE 文档<a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</li>
        <li><b>JWT 头</b>。果启用了 JWT 保护，则必须指定自定义标头名称，因为 
            Mattermost 安全策略会阻止外部 <b>授权</b> 标头此标头也应在 ONLYOFFICE 文档签名设置中指定。
            更多关于签名的信息可以在 <a href="<%= Url.Action("signature/") %>">这里</a>找到。</li>
        <li><b>JWT 前缀</b>。指定 ONLYOFFICE 文档前缀。</li>
    </ul>


    <h2 id="usage" class="copy-link">使用 Mattermost ONLYOFFICE 集成插件</h2>
    <p>用户可以打开在个人和群组 Mattermost 聊天中发送的文件以进行查看和共同编辑。</p>
    <p>在聊天消息中发送文件时，单击 ⋮ 符号可在文件上下文菜单中执行以下操作：</p>
    <ul>
        <li><b>在 ONLYOFFICE 中打开文件</b> 并 <b>更改访问权限</b> - 适用于消息的作者。</li>
        <li><b>在 ONLYOFFICE 中打开文件</b> - 适用于消息的收件人。</li>
    </ul>
    <img alt="Mattermost 操作" src="<%= Url.Content("~/content/img/editor/mattermost-actions.png") %>"/>

    <p>单击 <b>在 ONLYOFFICE 中打开文件</b> 按钮时，相应的 ONLYOFFICE 编辑器将在同一窗口中打开。</p>
    <img alt="Mattermost 编辑器" width="832px" src="<%= Url.Content("~/content/img/editor/mattermost-editor.png") %>"/>

    <p>带有附件文档的消息的作者可以通过上下文菜单的 <b>更改访问权限</b> 选项更改对文件的访问权限。
        此操作在个人和群聊中都可用。</p>
    <img alt="Mattermost 共享" src="<%= Url.Content("~/content/img/editor/mattermost-share.png") %>"/>

    <p>ONLYOFFICE bot 发送有关文档更改的通知，指定进行这些更改的用户的名称。</p>
    <img alt="Mattermost 机器人" src="<%= Url.Content("~/content/img/editor/mattermost-bot.png") %>"/>


    <h2 id="howitworks" class="copy-link">这是如何运作的</h2>
    <p>ONLYOFFICE 集成遵循 <a href="<%= Url.Action("basic") %>">此处</a>。的 API文档。</p>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">此处</a>。下载 Mattermost ONLYOFFICE 集成插件。</p>

</asp:Content>
