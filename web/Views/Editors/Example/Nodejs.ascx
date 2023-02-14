<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">如何用Node.js将在线编辑器集成到您自己的网站中</span>
</h1>

<h2>概述</h2>
<p class="dscr">
    此示例将帮助您将 ONLYOFFICE 文档集成到用Node.js编写的 Web 应用程序中。
</p>

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

<h2 id="Windows" class="copy-link">对于 Windows</h2>
<h2 id="win-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_nodejs_example">Windows版文档服务器</a>。</p>

<h2 id="win-2" class="copy-link"><span class="style_step">步骤 2.</span>下载用于编辑器集成的 Node.js 代码<span class="copy-link" title="点击获取链接"></span></h2>
<p>从我们的网站下载 <a href="<%= Url.Action("demopreview") %>">Node.js 示例</a>。</p>
<p>
    要将编辑器连接到您的网站，请在 <em>config/default.json</em> 文件中指定编辑器安装的路径和存储文件夹的路径：
</p>
<pre class="commandline">
"storageFolder": "./files"
"storagePath": "/files"
"siteUrl": "https://documentserver/"
</pre>

<p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称， <b>storageFolder</b> 和 <b>storagePath</b> 是创建和存储文件的路径。
您可以设置绝对路径。例如， <em>D:\\folder</em>。请注意，在 Windows 操作系统上，双反斜杠必须用作分隔符。</p>
<p>如果要试验编辑器配置，请修改 <em>\views\editor.ejs</em> 文件中的 <a href="<%= Url.Action("advanced") %>">参数</a>。</p>

<h2 id="win-3" class="copy-link"><span class="style_step">步骤 3.</span>安装 Node.js 环境</h2>
<p>
    安装将用于运行 Node.js 项目的 <b>node.js</b> 环境。
    请按照 <a href="https://nodejs.org/zh-cn/download/">官方网站</a> 上的链接为您的 Windows 操作系统（32 位或 64 位）选择正确的版本。
</p>

<h2 id="win-4" class="copy-link"><span class="style_step">步骤 4.</span>运行 Node.js 代码</h2>
<p>我们将在 Node.js runtime 环境中运行代码，并使用 <b>命令行界面 (cmd)</b>与之交互。</p>

<ol>
    <li>启动 <b>命令提示符</b> 并切换到包含 Node.js 项目代码的文件夹，例如：
        <div class="commandline">cd /d "C:\Node.js Example"</div>
    </li>
    <li>Node.js 带有一个包管理器， <b>node package manager (npm)</b>，它与 Node.js 一起自动安装。
        要运行 Node.js 代码，请使用以下 <em>npm</em> 命令安装项目模块：
        <div class="commandline">npm install</div>
        <p>将在项目文件夹中创建一个新的 <em>node_modules</em> 文件夹。</p>
    </li>
    <li>使用 <b>命令提示符</b>运行项目：
        <div class="commandline">node bin/www</div>
    </li>
    <li>使用下列地址在浏览器中查看结果：
        <div class="commandline">http://localhost:3000</div>
    </li>
</ol>

<h2 id="win-5" class="copy-link"><span class="style_step">步骤 5.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您指定的地址而不是配置文件中的 <b>example.com</b>。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>

<h2 id="Linux" class="copy-link">对于 Linux</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_nodejs_example">Linux版文档服务器</a>。</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">步骤 2.</span>安装先决条件并使用编辑器运行网站</h2>
<ol>
    <li>Install <b>Node.js</b>:
        <div class="commandline">curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -</div>
        <div class="commandline">sudo apt-get install -y nodejs</div>
    </li>
    <li>下载包含 Node.js 示例的存档并解压缩存档：
        <div class="commandline">wget https://api.onlyoffice.com/app_data/editor/Node.js%20Example.zip</div>
        <div class="commandline">unzip Node.js\ Example.zip</div>
    </li>
    <li>将当前目录更改为项目目录：
        <div class="commandline">cd Node.js\ Example/</div>
    </li>
    <li>安装依赖项：
        <div class="commandline">npm install</div>
    </li>
    <li>编辑 <em>default.json</em> 配置文件。
        指定安装了 ONLYOFFICE 文档服务器的本地服务器的名称。
        <div class="commandline">nano config/default.json</div>
        <p>编辑以下行：</p>

        <pre>
"storageFolder": "./files"
"storagePath": "/files"
"siteUrl": "https://documentserver/"
</pre>

        <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称， <b>storageFolder</b> 和 <b>storagePath</b> 是创建和存储文件的路径。
            请注意，您必须具有对该文件夹的读取和写入权限。如果您没有它们，请使用下一个命令：</p>
        <pre>
sudo chmod -R ugo+rw /{path}
</pre>
    </li>
    <li>使用 Node.js 运行项目：
        <div class="commandline">node bin/www</div>
    </li>
    <li>使用下列地址在浏览器中查看结果：
        <div class="commandline">http://localhost:3000</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">步骤 3.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您指定的地址而不是配置文件中的 <b>example.com</b>。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>
