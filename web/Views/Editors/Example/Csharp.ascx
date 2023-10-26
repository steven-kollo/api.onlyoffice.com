<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">如何在 .Net (C#) 上将在线编辑器集成到您自己的网站中</span>
</h1>

<h2>概述</h2>
<p class="dscr">此示例将帮助您将 ONLYOFFICE 文档集成到用 .Net (C#) 编写的 Web 应用程序中。</p>

<div class="note">
    集成示例用于演示文档编辑器功能以及将 <b>文档服务器</b> 与您自己的应用程序相连接的方法。
    <b>不要在没有正确修改代码</b> 的情况下在您自己的服务器上使用这些示例<b></b>！
    如果您启用了任何测试示例，请在发布产品之前将其禁用。
</div>

<h2 id="security" class="copy-link">重要安全信息</h2>
<p>在使用测试示例时，请记住以下几方面的安全事项：</p>
<ul>
    <li>由于不需要授权，因此无法保护存储免受未经授权的访问。</li>
    <li>没有检查链接中的参数替换，因为参数是由代码根据预先安排的脚本生成的。</li>
    <li>在编辑后保存文件的请求中没有数据检查，因为每个测试示例仅适用于来自 ONLYOFFICE 文档服务器的请求。</li>
    <li>没有禁止使用来自其他网站的测试示例，因为它们用于与来自另一个域的 ONLYOFFICE 文档服务器进行交互。</li>
</ul>

<h2 id="win-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何为 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_csharp_example">Windows</a>、 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_csharp_example">Linux</a>或 <a href="https://helpcenter.onlyoffice.com/server/developer-edition/docker/docker-installation.aspx?from=api_csharp_example">Docker</a>安装文档服务器。</p>

<h2 id="win-2" class="copy-link"><span class="style_step">步骤 2.</span>下载用于编辑器集成的.Net (C#) 代码</h2>
<p>从我们的网站下载 <a href="<%= Url.Action("demopreview") %>">Net (C#) / .Net (C# MVC) 示例</a>。</p>
<p>
    要将编辑器连接到您的网站，请在 <em>settings.config</em> 文件中指定编辑器安装的路径和存储文件夹的路径
    (或 MVC 版本的 <em>web.appsettings.config</em> 文件)：
</p>
<pre>
&lt;add key="storage-path" value=""/&gt;
&lt;add key="files.docservice.url.site" value="https://documentserver/" /&gt;</pre>

<p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称， <b>storage-path</b> 是创建和存储文件的路径。您可以设置绝对路径。</p>
<p>如果要试验编辑器配置，请修改 <em>DocEditor.aspx</em> 文件中的 <a href="<%= Url.Action("advanced") %>">参数</a>。</p>

<h2 id="win-3" class="copy-link"><span class="style_step">步骤 3.</span>安装先决条件</h2>
<p>检查您的系统是否满足要求：</p>
<ul>
    <li><b>Microsoft .NET Framework</b>：4.5版（从 <a href="https://www.microsoft.com/zh-cn/download/details.aspx?id=30653" target="_blank">微软官方网站</a>下载）；</li>
    <li><b>Internet Information Services</b>：版本 7 或更高版本。</li>
</ul>
<p>配置 IIS 组件以使服务器正常工作：</p>
<ol>
    <li>
        <p>打开 Windows 功能：</p>
        <p><b>开始</b> -> <b>控制面板</b> -> <b>程序</b> -> <b>程序和功能</b> -> <b>打开或关闭 Windows 功能</b></p>
    </li>
    <li>
        <p>在打开的窗口中，找到 <b>Internet Information Services</b> 并检查下图中选择的所有功能：</p>
        <img alt="" src="<%= Url.Content("~/content/img/csharp/server-components.png") %>" />
    </li>
</ol>

<h2 id="win-4" class="copy-link"><span class="style_step">步骤 4.</span>使用编辑器运行您的网站</h2>
<ol>
    <li>
        <p>运行 Internet 信息服务 (IIS) 管理器：</p>
        <p><b>开始</b> -> <b>控制面板</b> -> <b>系统和安全</b> -> <b>管理工具</b> -> <b>Internet Information Services (IIS) Manager</b></p>
    </li>
    <li>
        <p>在 IIS 管理器中添加您的网站。</p>
        <p>在 <b>Connections</b> 面板上，右键单击树中的 <b>Sites</b> 节点，然后单击 <b>Add Website</b>。</p>
        <img class="screenshot" alt="" src="<%= Url.Content("~/content/img/csharp/add.png") %>" />
    </li>
    <li>
        <p>在 <b>Add Website</b> 对话框中，在 <b>Site name</b> 框中指定带有 .Net (C#) / .Net (C# MVC) 项目的文件夹名称。</p>
        <p>在 <b>Physical Path</b> 框中指定项目所在文件夹的路径。</p>
        <p>在 <b>Port</b> 框中指定仅用于此网站的唯一端口值。</p>
        <img class="screenshot" alt="" src="<%= Url.Content("~/content/img/csharp/sitename.png") %>" />
    </li>
    <li>
        <p>
            检查 IIS 管理器中为您的网站指定的 .NET 平台版本。
            选择 <b>v4.0.</b> 版本。
        </p>
        <p><b>Application Pools</b> -> 右键单击​平台名称 -> <b>Set application Pool defaults</b> -> <b>.NET CLR version</b></p>
        <img class="screenshot" alt="" src="<%= Url.Content("~/content/img/csharp/platform.png") %>" />
    </li>
    <li>
        <p>使用 IIS 管理器浏览您的网站：</p>
        <p>右键单击网站 -> <b>Manage Website</b> -> <b>Browse</b></p>
        <img class="screenshot" alt="" src="<%= Url.Content("~/content/img/csharp/browse.png") %>" />
    </li>
</ol>

<h2 id="win-5" class="copy-link"><span class="style_step">步骤 5.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您在配置文件中指定的地址而不是 <b>example.com</b>。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>
