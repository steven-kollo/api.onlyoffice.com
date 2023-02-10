<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Drupal ONLYOFFICE连接器模块
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Drupal ONLYOFFICE连接器模块</span>
    </h1>

    <p class="dscr">ONLYOFFICE <a href="https://github.com/ONLYOFFICE/onlyoffice-drupal" target="_blank">模块</a> 允许用户用ONLYOfficeDocs编辑 <a href="https://www.drupal.org/" target="_blank">Drupal</a> 媒体模块中的文件。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX。</li>
        <li>以下格式可供查看：DJVU、DOC、DOCM、DOCX、DOT、DOTM、DOTX、EPUB、FB2、FODT、HTML、MHT、ODT、OTT、OXPS、PDF、PPTX、RTF、TXT、XPS、XML、CSV、FODS、ODS、OTS、XLS、XLSM、XLSX、XLT、XLTM、XLTX、FODP、ODP、OTP、POT、POTM、POTX、PPS、PPSM、PPSX、PPT、PPTM。</li>
        <li>该模块还允许在公共页面上预览文件。</li>
        <li>该模块将在office文档的文档库中创建一个新的 <b>在ONLYOFFICE中编辑</b> 菜单选项。
            这允许多个用户实时协作，并将这些更改保存回Drupal。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您需要一个ONLYOFFICE 文档（文档服务器）实例，该实例可以从Drupal和任何终端客户机进行解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE 文档文档页面</a>。
        ONLYOFFICE文档还必须能够直接发布到Drupal。
    </p>
    <p>安装 ONLYOFFICE 文档实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装Drupal ONLYOFFICE连接器模块</h2>
    <p>要开始在Drupal中使用ONLYOFFICE文档，请执行以下步骤：</p>
    <p><b>第1步：添加模块</b></p>
    <p>添加Drupal模块有两个选项。</p>
    <p><b>选项1</b>：使用 <a href="https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-using-drupals-user-interface-easy" target="_blank">Drupal的用户界面</a>添加模块。</p>
    <ol>
        <li>在 <a href="https://www.drupal.org/download" target="_blank">drupal.org</a>的 <b>管理</b> 工具栏项目页面上，滚动到页面底部的 <b>下载</b> 部分。</li>
        <li>复制 <em>tar.gz</em> 链接的地址。根据您的设备和浏览器，您可以通过右键单击并选择 <b>复制链接地址</b>来完成此操作。</li>
        <li>在 <b>管理</b> 管理菜单中，导航至 <b>扩展</b> （管理/模块）。此时会出现 <b>扩展</b> 页面。</li>
        <li>单击 <b>安装新模块</b>。出现 <b>安装新模块</b> 页面。</li>
        <li>在 <b>从URL安装</b>字段中，粘贴复制的下载链接。</li>
        <li>单击 <b>安装</b>,在服务器上上传和解压缩新模块。正在将文件下载到模块目录。</li>
    </ol>

    <p><b>选项2</b>：使用 <a href="https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-with-composer" target="_blank">Composer</a>添加模块。</p>
    <p>在站点的根目录下输入以下命令：</p>
    <pre>
composer require drupal/onlyoffice
</pre>

    <p><b>第2步：启用模块</b></p>
    <p>有两个选项可以启用Drupal模块。</p>
    <p><b>选项1</b>。使用 <a href="https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-using-drupals-user-interface-easy" target="_blank">Drupal的用户界面</a>。</p>
    <ol>
        <li>通过 <b>管理</b> 管理菜单导航到 <b>扩展</b> 页面（管理/模块）。</li>
        <li>找到ONLYOFFICE连接器模块并选中该框。</li>
        <li>单击 <b>安装</b> 以启用。</li>
    </ol>

    <p><b>选项2</b>：使用命令行。</p>
    <ol>
        <li>
            <p>运行以下 <b>Drush</b> 命令，将项目名称作为参数：</p>
            <pre>
drush pm:enable onlyoffice
</pre>
        </li>
        <li>按照屏幕上的说明进行操作。</li>
    </ol>

    <h2 id="configuration" class="copy-link">配置Drupal ONLYOFFICE连接器模块</h2>
    <p>在Drupal中，打开 <em>~/config/system/onlyoffice-settings</em> 页面，其中包含 <b>onlyoffice</b> 部分的管理设置。
        输入连接ONLYOFFICE文档服务器的地址：</p>
    <pre>
https://&lt;documentserver&gt;/
</pre>
    <p>其中 <b>documentserver</b> 是安装了ONLYOFFICE 文档服务器的服务器的名称。必须可以从用户浏览器和Drupal服务器访问该地址。
        为了正确运行，Drupal服务器地址还必须可以从ONLYOFFICE 文档服务器访问。</p>
    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE 文档的访问，这也是出于安全原因和数据完整性考虑。
        在Drupal管理配置中指定 <b>密钥</b>。在ONLYOFFICE 文档服务器 <a href="<%= Url.Action("signature") %>">配置文件</a> 中，指定相同的密钥并启用验证。</p>

    <h2 id="usage" class="copy-link">使用Drupal ONLYOFFICE连接器模块</h2>
    <p><b>编辑已上传到Drupal的文件</b></p>
    <p>可以打开添加到媒体中的所有office文件进行编辑。在最后一个表列中，调用下拉列表并选择 <b>在ONLYOFFICE中编辑</b> 操作。
        编辑器将在同一选项卡中打开。具有管理员权限的用户可以使用ONLYOFFICE文档共同编辑文件。所有更改都保存在同一文件中。</p>

    <p><b>创建新帖子</b></p>
    <p>创建帖子时，可以添加新的ONLYOFFICE元素：</p>
    <ol>
        <li>转到 <b>结构->内容类型->管理字段</b>。在打开的页面上，单击 <b>添加字段</b>。添加新字段：<b>文件</b> 或 <b>媒体</b>。设置标签并保存。</li>
        <li>对于添加的 <b>文件</b> 字段，指定文件扩展名。转到 <b>结构->内容类型->管理字段</b>。
            在 <b>允许的文件扩展名</b> 字段中，指定将在编辑器中显示的文件格式（docx、xlsx、pptx）。</li>
        <li>对于添加的 <b>媒体</b> 字段，单击 <b>文档</b> 复选框。</li>
        <li>转到 <b>结构->媒体类型->文档->管理显示</b>。</li>
        <li>对于 <b>文档</b> 字段，指定 <em>ONLYOFFICE预览</em> 格式。通过单击齿轮符号，可以指定嵌入式编辑器窗口的尺寸。</li>
    </ol>
    <p>完成预设后，可以在 <b>内容</b> 选项卡上创建帖子。单击 <b>添加内容</b> 按钮并选择创建的内容。</p>
    <p>指定标题并选择文件（如果内容包含 <b>文件</b> 字段）。</p>
    <p>对于 <b>媒体</b> 部分，指定以前上传的文件的名称。</p>
    <p>您的网站访问者还可以查看创建的页面（<b>人员->权限->查看发布的内容</b>）。</p>

    <h2 id="howitworks" class="copy-link">它是如何工作的</h2>
    <p>ONLYOFFICE集成遵循 <a href="<%= Url.Action("basic") %>">此处</a>API文档。</p>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-drupal" target="_blank">此处</a>下载Drupal ONLYOFFICE连接器模块。</p>

</asp:Content>
