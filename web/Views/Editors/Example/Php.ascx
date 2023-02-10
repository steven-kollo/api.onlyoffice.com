<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">如何用PHP将在线编辑器集成到您自己的网站中</span>
</h1>

<h2>概述</h2>
<p class="dscr">
    此示例将帮助您将 ONLYOFFICE 文档集成到用 PHP 编写的 Web 应用程序中。
</p>

<div class="note">
    集成示例用于演示文档编辑器功能以及将 <b>文档服务器</b> 与您自己的应用程序相连接的方法。
    <b>不要在没有正确修改代码</b> 的情况下在您自己的服务器上使用这些示例！
    如果您启用了任何测试示例，请在发布产品之前将其禁用。
</div>

<h2 id="security" class="copy-link">重要安全信息</h2>
<p>在使用测试示例时，请记住以下几方面的安全事项：</p>
<ul>
    <li>由于不需要授权，因此无法保护存储免受未经授权的访问。</li>
    <li>没有检查链接中的参数替换，因为参数是由代码根据预先安排的脚本生成的。</li>
    <li>在编辑后保存文件的请求中没有数据检查，因为每个测试示例仅适用于来自 ONLYOFFICE 文档服务器的请求。</li>
    <li>没有禁止使用来自其他站点的测试示例，因为它们用于与来自另一个域的 ONLYOFFICE 文档服务器进行交互。</li>
</ul>

<h2 id="Windows" class="copy-link">对于 Windows</h2>
<h2 id="win-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_php_example">Windows版文档服务器</a>。</p>

<h2 id="win-2" class="copy-link"><span class="style_step">步骤 2.</span>下载用于编辑器集成的 PHP 代码</h2>
<p>从我们的站点下载 <a href="<%= Url.Action("demopreview") %>">PHP 示例</a>。</p>
<p>要将编辑器连接到您的网站，请在 <em>config.php</em> 文件 中指定编辑器安装的路径和存储文件夹的路径：</p>
<pre>
$GLOBALS['STORAGE_PATH'] = "";
$GLOBALS['DOC_SERV_SITE_URL'] = "https://documentserver/";</pre>

<p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称，而 <b>STORAGE_PATH</b> 是创建和存储文件的路径。
您可以设置绝对路径。例如， <em>D:\\folder</em>。请注意，在 Windows 操作系统上，双反斜杠必须用作分隔符。</p>
<p>如果要试验编辑器配置，请修改 <em>doceditor.php</em> 文件中的 <a href="<%= Url.Action("advanced") %>">参数</a>。</p>

<h2 id="win-3" class="copy-link"><span class="style_step">步骤 3.</span>安装先决条件</h2>
<p>
    您可以使用任何能够运行 PHP 代码的 Web 服务器来运行示例。
    我们将演示如何使用 <b>Internet 信息服务 (IIS)</b> Web 服务器运行 PHP 示例。
    要在 IIS 上设置和配置 PHP，将使用 <b>PHP Manager for IIS</b>。
</p>

<ul>
    <li><b>IIS</b>：版本7或更高版本（参考 <a href="https://learn.microsoft.com/zh-cn/iis/application-frameworks/scenario-build-a-php-website-on-iis/configuring-step-1-install-iis-and-php">微软官网</a> 了解如何安装IIS）；</li>
    <li><b>PHP</b> （从 <a href="https://php.net/downloads.php">https://php.net</a> 站点下载）；</li>
    <li><b>PHP Manager for IIS</b> （从 <a href="https://phpmanager.codeplex.com/releases/view/69115">Microsoft 开源站点</a>下载）。</li>
</ul>

<h2 id="win-4" class="copy-link"><span class="style_step">步骤 4.</span>IIS 配置</h2>
<ol>
    <li>
        <p><b>IIS的PHP Manager</b> 配置。</p>
        <p>IIS 的 PHP Manager安装完成后，启动 <b>IIS 管理器：</b></p>
        <p><b>开始</b> -> <b>控制面板</b> -> <b>系统和安全</b> -> <b>管理工具</b> -> <b>Internet Information Services (IIS) Manager</b></p>
        <p>并在 IIS的 <b>功能视图</b> 中找到 <b>PHP Manager</b>。</p>
        <img src="<%= Url.Content("~/content/img/php/manager.png") %>" alt="">

        <p>您需要使用 PHP Manager 在 IIS 中注册已安装的 PHP 版本。</p>

        <p>
            双击 <b>PHP Manager</b> 将其打开，单击 <b>Register new PHP version</b> 任务并指定主 PHP 可执行文件位置的完整路径。
            例如：<em>C:\Program Files\PHP\php-cgi.exe</em>.
        </p>
        <img src="<%= Url.Content("~/content/img/php/php-version-1.jpg") %>" width="700" alt="" />

        <p>单击 <b>OK</b>后，新的 <b>PHP 版本</b> 将注册到 IIS 并激活。</p>
        <img src="<%= Url.Content("~/content/img/php/php-version-2.jpg") %>" width="650" alt="" />
    </li>
    <li>
        <p>配置 IIS 以处理 PHP 请求。</p>
        <p>要让 IIS 托管 PHP 应用程序，您必须添加处理程序映射，告诉 IIS 使用 <b>FastCGI</b> 协议将所有特定于 PHP 的请求传递到 PHP 应用程序框架。</p>
        <p>双击 <b>Handler Mappings</b> ：</p>
        <img src="<%= Url.Content("~/content/img/php/handlerclick.png") %>" alt="" />

        <p>
            在 <b>Action</b> 面板, 单击 <b>Add Module Mapping</b>。
            在 <b>Add Module Mapping</b> 对话框中，指定配置设置，如下所示：
        </p>
        <ul>
            <li><b>Request path</b>: *.php,</li>
            <li><b>Module</b>: FastCgiModule,</li>
            <li><b>Executable</b>: "C:\[PHP 安装路径]\php-cgi.exe",</li>
            <li><b>Name</b>: PHP via FastCGI.</li>
        </ul>
        <p>单击 <b>OK</b>.</p>
        <img src="<%= Url.Content("~/content/img/php/handler-add.png") %>" alt="" />
    </li>
</ol>
<p>IIS 管理器配置完成后，一切准备就绪，可以运行 PHP 示例。</p>

<h2 id="win-5" class="copy-link"><span class="style_step">步骤 5.</span>使用编辑器运行您的网站</h2>
<ol>
    <li>
        <p>在 IIS 管理器中添加您的网站。</p>
        <p>在 <b>Connections</b> 面板上，右键单击树中的 <b>Sites</b> 节点，然后单击 <b>Add Website</b>。</p>
        <img alt="" src="<%= Url.Content("~/content/img/csharp/add.png") %>" />
    </li>
    <li>
        <p>在 <b>Add Website</b> 对话框中，在 <b>Site name</b> 框中指定包含 PHP 项目的文件夹名称。</p>
        <p>在 <b>Physical path</b> 框中指定项目所在文件夹的路径。</p>
        <p>在 <b>Port</b> 框中指定仅用于此网站的唯一值。</p>
        <img alt="" src="<%= Url.Content("~/content/img/editor/php-add.png") %>" />
    </li>
    <li>
        <p>使用 IIS 管理器浏览您的网站：</p>
        <p>右键单击站点 -> <b>Manage Website</b> -> <b>Browse</b></p>
        <img alt="" src="<%= Url.Content("~/content/img/php/browse.png") %>" />
    </li>
</ol>

<h2 id="win-6" class="copy-link"><span class="style_step">步骤 6.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您指定的地址而不是配置文件中的 <b>example.com</b>。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>


<h2 id="Linux" class="copy-link">对于 Linux</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_php_example">Linux版文档服务器</a>。</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">步骤 2.</span>安装先决条件并使用编辑器运行网站</h2>
<ol>
    <li>安装 <b>Apache</b> 和 <b>PHP</b>：
        <div class="commandline">apt-get install -y apache2 php7.0 libapache2-mod-php7.0</div>
    </li>
    <li>下载包含 PHP 示例的存档并解压缩存档：
        <div class="commandline">cd /var/www/html</div>
        <div class="commandline">wget https://api.onlyoffice.com/app_data/editor/PHP%20Example.zip</div>
        <div class="commandline">unzip PHP\ Example.zip</div>
    </li>
    <li>将当前目录更改为项目目录：
        <div class="commandline">cd PHP\ Example/</div>
    </li>
    <li>编辑 <em>config.php</em> 配置文件。指定安装了 ONLYOFFICE 文档服务器的本地服务器的名称。
        <div class="commandline">nano config.php</div>
        <p>编辑以下行：</p>

        <pre>
$GLOBALS['STORAGE_PATH'] = "";
$GLOBALS['DOC_SERV_SITE_URL'] = "https://documentserver/";
</pre>

        <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称，而 <b>STORAGE_PATH</b> 是创建和存储文件的路径。
        您可以设置绝对路径。</p>
    </li>
    <li>设置站点权限：
        <div class="commandline">chown -R www-data:www-data /var/www/html</div>
    </li>
    <li>重启apache：
        <div class="commandline">service apache2 restart</div>
    </li>
    <li>使用下列地址在浏览器中查看结果：
        <div class="commandline">http://localhost/PHP%20Example/</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">步骤 3.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您指定的地址而不是配置文件中的 <b>example.com</b>。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>
