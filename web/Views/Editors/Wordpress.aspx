<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    WordPress ONLYOFFICE集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">WordPress ONLYOFFICE集成插件</span>
    </h1>

    <p class="dscr">此 <a href="https://github.com/ONLYOFFICE/onlyoffice-wordpress" target="_blank">插件</a> 允许用户使用ONLYOFFICE文档在 <a href="https://wordpress.org/" target="_blank">WordPress</a> 站点和管理面板的页面上编辑和查看office文档。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX, XLSX, PPTX。</li>
        <li>以下格式可供查看：DOC, DOCX, DOCM, DOT, DOTX, DOTM, ODT, FODT, OTT, RTF, TXT, HTML, HTM, MHT, XML, PDF, DJVU, FB2, EPUB, XPS, XLS, XLSX, XLSM, XLT, XLTX, XLTM, ODS, FODS, OTS, CSV, PPS, PPSX, PPSM, PPT, PPTX, PPTM, POT, POTX, POTM, ODP, FODP, OTP.</li>
        <li>该插件允许多个用户实时协作，并将这些更改保存回WordPress。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您需要一个ONLYOFFICE Docs（文档服务器）实例，该实例可以从WordPress和任何终端客户端进行解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE文档还必须能够直接发布到Wordpress。
    </p>
    <p>安装 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装WordPress ONLYOFFICE集成插件</h2>
    <p>要开始在WordPress中使用ONLYOFFICE文档，请执行以下步骤：</p>
    <ol>
        <li>下载压缩插件。</li>
        <li>导航到WordPress管理仪表板中的 <b>插件</b> 部分。</li>
        <li>单击页面顶部的 <b>添加新内容</b>。</li>
        <li>单击页面顶部的 <b>上传插件</b>。</li>
        <li>单击 <b>选择文件</b> 并选择下载的压缩插件。</li>
        <li>安装插件后，单击 <b>激活</b>。</li>
    </ol>
    <p>或者，您可以克隆主分支（然后从WordPress管理仪表板激活插件）：</p>
    <pre>
cd wp-content/plugins
git clone https://github.com/ONLYOFFICE/onlyoffice-wordpress
</pre>


    <h2 id="configuration" class="copy-link">配置WordPress ONLYOFFICE集成插件</h2>
    <p>通过WordPress界面配置插件。转到 <b>WordPress管理仪表板->ONLYOFFICE->设置</b>，并指定以下参数：</p>
    <ul>
        <li><b>文件编辑服务地址</b>。安装的 ONLYOFFICE 文档服务器的 URL。</li>
        <li><b>文档服务器 JWT 密钥</b>。使JWT能够保护您的文档免受未经授权的访问（更多信息可在 <a href="<%= Url.Action("signature/") %>">此处</a>找到）。</li>
    </ul>


    <h2 id="usage" class="copy-link">使用WordPress ONLYOFFICE集成插件</h2>
    <p>ONLYOFFICE集成插件允许WordPress管理员使用ONLYOfficeDocs（在线文档编辑器）打开文件进行协作编辑。
        在已发布的帖子中，编辑器仅在 <b>嵌入式</b> 模式下对所有WordPress网站访问者（包括授权和未授权的访问者）可见。</p>
    <p><b>编辑上传到WordPress的文件</b></p>
    <p>所有从 <b>媒体</b> 部分上传的文件都将出现在<b>ONLYOFFICE -> Files</b>页面上。
        通过单击文件名，编辑器将在同一选项卡中打开。具有管理员权限的用户可以共同编辑文档。所有更改都保存在同一文件中。</p>

    <p><b>创建帖子</b></p>
    <p>创建帖子时，可以添加ONLYOFFICE元素（块），然后上传新文件或从 <b>媒体库</b>中选择一个。
        添加的文件将显示为ONLYOFFICE徽标，并在当前编辑的帖子中显示文件名。
        发布文章后（当您按下 <b>发布</b> 或 <b>更新</b> 按钮时），WordPress网站访问者将可以访问此文件，以便在 <b>嵌入式</b> 模式下查看。</p>

    <h2 id="howitworks" class="copy-link">它是如何工作的</h2>
    <p>ONLYOFFICE集成遵循 <a href="<%= Url.Action("basic") %>">此处</a>API文档。</p>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-wordpress" target="_blank">此处</a>下载WordPress ONLYOFFICE集成插件。</p>

</asp:Content>
