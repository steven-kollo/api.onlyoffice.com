<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">如何在 Python 上将在线编辑器集成到您自己的网站中</span>
</h1>

<h2>概述</h2>
<p class="dscr">
    此示例将帮助您将 ONLYOFFICE 文档集成到用 Python 编写的 Web 应用程序中。
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

<h2 id="linux-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何为 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_python_example">Windows</a>、 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_python_example">Linux</a>或 <a href="https://helpcenter.onlyoffice.com/server/developer-edition/docker/docker-installation.aspx?from=api_python_example">Docker</a>安装文档服务器。</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">步骤 2.</span>安装先决条件并使用编辑器运行网站</h2>
<ol>
    <li>
        <b>Python</b> 预装在大多数 Linux 发行版上，并且在所有其他发行版上都以包的形式提供。需要 Python 3.9。
        如果您有任何问题， 请继续阅读 <a href="https://docs.python.org/zh-cn/3/using/unix.html" target="_blank">官方文档</a>。
    </li>
    <li>下载包含 Python 示例的存档并解压缩存档：
        <div class="commandline">wget "https://github.com/ONLYOFFICE/document-server-integration/releases/latest/download/Python.Example.zip"</div>
        <div class="commandline">unzip Python\ Example.zip</div>
    </li>
    <li>将当前目录更改为项目目录：
        <div class="commandline">cd Python\ Example</div>
    </li>
    <li>安装依赖项：
        <div class="commandline">pip install Django==3.1.3
pip install requests==2.25.0
pip install pyjwt==2.6.0
pip install python-magic</div>
    </li>
    <li>编辑 <em>config.py</em> 配置文件。
        指定安装了 ONLYOFFICE 文档服务器的本地服务器的名称。
        并指定安装示例的服务器的名称。
        <div class="commandline">nano config.py</div>
        <p>编辑以下行：</p>

        <pre>
STORAGE_PATH = "app_data"
DOC_SERV_SITE_URL = "https://documentserver/"
</pre>

        <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称，而 <b>STORAGE_PATH</b> 是创建和存储文件的路径。您可以设置绝对路径。
            例如， <em>D:\\folder</em>。请注意，在 Windows 操作系统上，双反斜杠必须用作分隔符。</p>
    </li>
    <li>运行 <b>Python</b> 服务器：
        <div class="commandline">python manage.py runserver 0.0.0.0:8000</div>
    </li>
    <li>使用下列地址在浏览器中查看结果：
        <div class="commandline">http://localhost:8000</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">步骤 3.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您指定的地址而不是配置文件中的 <b>exampleserver</b>。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>
