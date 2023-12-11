<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">如何用Ruby将在线编辑器集成到您自己的网站中</span>
</h1>

<h2>概述</h2>
<p class="dscr">
    此示例将帮助您将 ONLYOFFICE 文档集成到用Ruby编写的 Web 应用程序中。
</p>

<div class="note">
    它用于测试和演示编辑器的功能。
    如果没有适当的代码修改，<b>请不要</b>在自己的服务器上使用此集成示例。
    如果您启用了测试示例，请在投入产品之前将其禁用。
</div>

<h2 id="security" class="copy-link">重要安全信息</h2>
<p>在使用测试示例时，请记住以下几方面的安全事项：</p>
<ul>
    <li>由于不需要授权，因此无法保护存储免受未经授权的访问。</li>
    <li>没有检查链接中的参数替换，因为参数是由代码根据预先安排的脚本生成的。</li>
    <li>在编辑后保存文件的请求中没有数据检查，因为每个测试示例仅适用于来自 ONLYOFFICE 文档服务器的请求。</li>
    <li>没有禁止使用来自其他网站的测试示例，因为它们用于与来自另一个域的 ONLYOFFICE 文档服务器进行交互。</li>
</ul>

<h2 id="install" class="copy-link"><span class="style_step"><span class="style_step">步骤1. </span>安装必备组件并运行带编辑器的网站</h2>
<p>Python示例提供了各种安装选项，但我们强烈建议使用Docker。</p>
<p><b>选项1. 使用Docker</b></p>
<p>要使用 <a href="https://www.docker.com/" target="_blank">Docker</a> 运行示例，
您将需要 <a href="https://docs.docker.com/desktop/" target="_blank">Docker Desktop 4.17.0</a> 或 <a href="https://docs.docker.com/engine/" target="_blank">Docker Engine 20.10.23</a>
与 <a href="https://docs.docker.com/compose/" target="_blank">Docker Compose 2.15.1</a>。
此外，您可能需要考虑安装 <a href="https://www.gnu.org/software/make/" target="_blank">GNU Make 4.4.1</a>，尽管它是可选的。
这些是工具所需的最低版本。</p>
<p>安装完所有内容后，下载发布的压缩文件并将其解压：</p>
<pre>
curl --output Ruby.Example.zip --location https://github.com/ONLYOFFICE/document-server-integration/releases/latest/download/Ruby.Example.zip
unzip Ruby.Example.zip
</pre>
<p>然后打开示例目录和<a href="https://github.com/ONLYOFFICE/document-server-integration/blob/eaa06d1919ee92b72c945e14aa8d96871dd26879/web/documentserver-example/ruby/Makefile#L46" target="_blank">容器</a>:</p>
<pre>
cd "Ruby Example"
make compose-prod
</pre>
<p>>默认情况下，服务器从<em>localhost:80</em>启动。</p>
<p>要配置示例，您可以编辑<a href="https://github.com/ONLYOFFICE/document-server-integration/blob/eaa06d1919ee92b72c945e14aa8d96871dd26879/web/documentserver-example/ruby/compose-base.yml" target="_blank">compose-base.yml</a>。
有关环境变量的更多信息，请参阅<a href="#configure">下面</a>。</p>

<p><b>选项 2. 在本地计算机上</b></p>
<p>在深入研究示例之前，您需要安装 ONLYOFFICE Docs。
查看详细指南，了解如何在 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_ruby_example" target="_blank">Windows</a>，
<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_ruby_example" target="_blank">Linux</a>，
或 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api_ruby_example" target="_blank">Docker</a>上安装它。</p>
<p>要在本地计算机上运行该示例，您需要 <a href="https://www.ruby-lang.org/en/" target="_blank">Ruby 3.2.2</a>
和 <a href="https://bundler.io/" target="_blank">Bundler 2.4.10</a>.此外，您可能需要考虑安装 <a href="https://www.gnu.org/software/make/" target="_blank">GNU Make 4.4.1</a>，尽管它是可选的。
这些是工具所需的最低版本。</p>
<p>安装完所有内容后，下载发布的压缩文件并将其解压：</p>
<pre>
curl --output Ruby.Example.zip --location https://github.com/ONLYOFFICE/document-server-integration/releases/latest/download/Ruby.Example.zip
unzip Ruby.Example.zip
</pre>
<p>然后打开示例目录，<a href="https://github.com/ONLYOFFICE/document-server-integration/blob/eaa06d1919ee92b72c945e14aa8d96871dd26879/web/documentserver-example/ruby/Makefile#L33" target="_blank">安装依赖项</a>，
并 <a href="https://github.com/ONLYOFFICE/document-server-integration/blob/eaa06d1919ee92b72c945e14aa8d96871dd26879/web/documentserver-example/ruby/Makefile#L42" target="_blank">启动服务器</a>:</p>
<pre>
cd "Ruby Example"
make prod
make server-prod
</pre>
<p>默认情况下，服务器从 <em>0.0.0.0:3000</em>启动.</p>
<p>要配置该示例，您可以在启动服务器的命令之前传递环境变量。
有关环境变量的更多信息，请参阅<a href="#configure">下面</a>。</p>

<h2 id="accessibility" class="copy-link"><span class="style_step">步骤2. </span>检查访问权限</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
</p>
<p>确保文档服务器可以访问安装了示例的服务器，该示例的地址是您在配置文件中指定的地址，而不是 <b>example.com</b>。</p>

<h2 id="configure" class="copy-link"><span class="style_step">步骤3. </span>配置 Ruby 示例</h2>
<p>该示例是通过更改环境变量来配置的。</p>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>参数</td>
            <td>描述</td>
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td id="BINDING" class="copy-link">BINDING</td>
            <td>应启动服务器的地址</td>
            <td>0.0.0.0</td>
        </tr>
        <tr>
            <td id="DOCUMENT_SERVER_PRIVATE_URL" class="copy-link">DOCUMENT_SERVER_PRIVATE_URL</td>
            <td>服务器通过其与文档服务器进行通信的URL。	</td>
            <td>http://proxy:8080</td>
        </tr>
        <tr>
            <td id="DOCUMENT_SERVER_PUBLIC_URL" class="copy-link">DOCUMENT_SERVER_PUBLIC_URL</td>
            <td>用户通过其与文档服务器进行通信的URL。</td>
            <td>http://localhost:8080</td>
        </tr>
        <tr>
            <td id="EXAMPLE_URL" class="copy-link">EXAMPLE_URL</td>
            <td>文档服务器通过其与服务器进行通信的URL。</td>
            <td>http://proxy</td>
        </tr>
        <tr>
            <td id="JWT_SECRET" class="copy-link">JWT_SECRET</td>
            <td>JWT授权密钥。保留为空可禁用授权。</td>
            <td>your-256-bit-secret</td>
        </tr>
        <tr>
            <td id="PORT" class="copy-link">PORT</td>
            <td>服务器应运行的端口。</td>
            <td>80</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>
