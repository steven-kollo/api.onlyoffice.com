<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">如何用Java Spring将在线编辑器集成到您自己的网站中</span>
</h1>

<h2>概述</h2>
<p class="dscr">此示例将帮助您将 ONLYOFFICE 文档集成到用 Java with Spring Boot 编写的 Web 应用程序中。</p>
<p>Spring Boot 有很多功能，但它最重要的特性是：依赖管理、自动配置和内置的 servlet 容器。</p>

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
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器 ）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_java_example">Windows版文档服务器</a>。</p>

<h2 id="win-2" class="copy-link"><span class="style_step">步骤 2.</span>下载用于编辑器集成的 Java 代码</h2>
<p>从我们的网站下载 <a href="<%= Url.Action("demopreview") %>">Java-Spring 示例</a>。</p>
<p>要将编辑器连接到您的网站，请在 <em>\src\main\resources\application.properties</em> 文件中指定编辑器安装的路径和存储文件夹的路径：</p>

<pre>
files.storage=
server.port=port
files.docservice.url.site=https://documentserver/
</pre>

<p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档的服务器的名称， <b>port</b> 是任何可用的端口，而<b>files.storage</b> 是创建和存储文件的路径（默认在项目文件夹中）。
您可以设置绝对路径。例如， <em>D:\\folder</em>。请注意，在 Windows 操作系统上，双反斜杠必须用作分隔符。</p>
<p>如果要试验编辑器配置，请修改 <em>\src\main\webapp\editor.jsp</em> 文件中的 <a href="<%= Url.Action("advanced") %>">参数</a>。</p>

<h2 id="win-3" class="copy-link"><span class="style_step">步骤 3.</span>安装先决条件</h2>
<p>要运行 Java-Spring 示例代码，请安装适用于您的操作系统和框架 <b>Apache Maven</b>的 Java 版本 11：</p>

<ul>
    <li><b>Java</b> （从 <a href="https://www.oracle.com/java/technologies/downloads/#java11">Oracle官网</a>下载）；</li>
    <li><b>Apache Maven</b> （从 <a href="https://maven.apache.org/download.cgi">官网</a>下载）。</li>
</ul>

<h2 id="win-4" class="copy-link"><span class="style_step">步骤 4.</span>设置环境变量</h2>
<ol>
    <li>
        <p>在 Windows 上安装 Java 后，将 <b>JAVA_HOME</b> 环境变量设置为指向 Java 安装目录。</p>
        <p>
            找出 Java 的安装位置。
            如果您在安装过程中没有更改路径，它将是这样的：
        </p>

        <pre>C:\Program Files\Java\jdk11</pre>
        <p>在 <b>Windows 7</b>中，右键单击 <b>我的电脑</b> 并选择 <b>属性</b>，然后单击 <b>高级</b>。</p>
        <p>在 <b>Windows 8</b>中，进入 <b>控制面板</b> 并选择 <b>系统</b>，然后单击 <b>高级系统设置</b>。</p>
        <p>单击 <b>环境变量</b> 按钮。</p>
        <p>在 <b>系统变量</b>下，单击 <b>新建</b>。</p>
        <p>在 <b>变量名称</b> 字段中，如果您安装了 <b>JDK</b> （Java 开发工具包），请输入 <b>JAVA_HOME</b>；如果您安装了 <b>JRE</b> （Java 运行时环境），请输入 <b>JRE_HOME</b>。</p>
        <p>在 <b>变量值</b> 字段中，输入您的 <b>JDK</b> 或 <b>JRE</b> 安装路径，例如 <em>C:\Program Files\Java\jdk11</em>。</p>

        <p>检查 <b>命令提示符</b> 中的 <b>echo</b>命令是否成功创建变量：</p>
        <pre>echo %JAVA_HOME%</pre>
    </li>
    <li>
        <p>设置 <b>MAVEN_HOME</b> 环境变量：</p>
        <p>使用 Maven 将下载的压缩文件解压缩到任意目录。它会是这样的：</p>

        <pre>C:\apache-maven-3.8.1</pre>
        <p>在 <b>Windows 7</b>中，右键单击 <b>我的电脑</b> 并选择 <b>属性</b>，然后单击 <b>高级</b>。</p>
        <p>在 <b>Windows 8</b>中，进入 <b>控制面板</b> 并选择 <b>系统</b>，然后单击 <b>高级系统设置</b>。</p>
        <p>单击 <b>环境变量</b> 按钮。</p>
        <p>在 <b>系统变量</b>下，单击 <b>新建</b>。</p>
        <p>在 <b>变量名称</b> 字段中，输入 <b>MAVEN_HOME</b>。</p>
        <p>在 <b>变量值</b> 字段中，输入您的 <b>JDK</b> 或 <b>JRE</b> 安装路径，例如 <em>C:\apache-maven-3.8.1</em>。</p>
        <p>在系统变量中，找到 <b>PATH</b>，单击 <b>编辑...</b> 按钮。在 <b>编辑环境变量</b> 对话框中，单击 <b>新建</b>
            按钮并将 <em>C:\apache-maven-3.8.1\bin</em> 添加到 <b>PATH</b> 系统变量。</p>

        <p>检查 <b>命令提示符</b> 中的 <b>echo</b>命令是否成功创建变量：</p>
        <pre>echo %MAVEN_HOME%</pre>
    </li>
</ol>


<h2 id="win-5" class="copy-link"><span class="style_step">步骤 5.</span>使用 Maven 启动应用程序</h2>
<ol>
    <li>
        <p>打开控制台并使用 <b>cd</b> 命令转到 <em>java-spring</em> 文件夹：</p>
        <pre>
cd C:\Program Files\document-server-integration\web\documentserver-example\java-spring
</pre>
    </li>
    <li>
        <p>在打开的控制台中，输入以下命令：</p>
        <pre>
mvn clean
mvn package
mvn spring-boot:run
</pre>
    </li>
    <li>
        <p>使用 <b>server.address</b> 和 <b>server.port</b>打开浏览器：</p>
        <pre>
http://server.address:server.port/
</pre>
    </li>


<h2 id="win-6" class="copy-link"><span class="style_step">步骤 6.</span>检查可访问性</h2>

<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您指定的地址而不是配置文件中的 <b>example.com</b>。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>


<h2 id="Linux" class="copy-link">对于 Linux</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器 ）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_java_example">Linux版文档服务器</a>。</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">步骤 2.</span>安装先决条件并使用编辑器运行网站</h2>
<ol>
    <li>安装 <b>Java</b>：
        <span class="commandline">sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java11-installer</span>
    </li>
    <li>
        <p>获取 Java-Spring 示例的方法有两种：</p>
        <ul>
            <li>
                <p>下载包含 Java-Spring 示例的压缩文件并解压缩：</p>
                <span class="commandline">wget https://api.onlyoffice.com/app_data/editor/Java%20Spring%20Example.zip</span>
                <span class="commandline">unzip Java\ Spring\ Example.zip</span>
            </li>
            <li>
                <p>克隆 git 存储库：</p>
                <span class="commandline">git clone https://github.com/ONLYOFFICE/document-server-integration.git</span>
            </li>
        </ul>
    </li>
    <li>
        <p>将当前目录更改为项目目录：</p>
        <ul>
            <li>
                <p>在归档中：</p>
                <div class="commandline">cd Java\ Spring\ Example</div>
            </li>
            <li>
                <p>在 git 存储库中：</p>
                <div class="commandline">cd document-server-integration/web/documentserver-example/java-spring</div>
            </li>
        </ul>
    </li>
    <li>编辑 <em>application.properties</em> 配置文件。
        指定安装了 ONLYOFFICE 文档的本地服务器的名称。
        <div class="commandline">nano src/main/resources/application.properties</div>
        <p>编辑以下行：</p>

        <pre>
files.storage=
server.port=port
files.docservice.url.site=https://documentserver/
</pre>

        <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档的服务器的名称， <b>port</b> 是任何可用的端口，而 <b>files.storage</b> 是创建和存储文件的路径（默认在项目文件夹中）。您可以设置绝对路径。</p>
    </li>
    <li>安装 <b>Maven</b>：
        <div class="commandline">sudo apt-get install maven</div>
    </li>
    <li>构建：
        <div class="commandline">mvn package</div>
    </li>
    <li>
        <p>启动 Java-Spring 示例：</p>
        <div class="commandline">./mvnw spring-boot:run</div>
    </li>
    <li>
        <p>使用 <b>server.address</b> 和 <b>server.port</b>打开浏览器：</p>
        <div class="commandline">http://server.address:server.port/</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">步骤 3.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您在配置文件中 指定的地址而不是 <b>example.com</b> 安装。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>


<h2 id="Docker" class="copy-link">对于 Docker</h2>

<ol>
    <li>编辑 <em>application.properties</em> 配置文件。
        指定 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx">安装</a>了 ONLYOFFICE 文档的本地服务器的名称。
        <div class="commandline">nano src/main/resources/application.properties</div>
        <p>编辑以下行：</p>

        <pre>
files.storage=
server.port=port
files.docservice.url.site=https://documentserver/ 
</pre>

        <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档的服务器的名称， <b>port</b> 是任何可用的端口，而 <b>files.storage</b> 是创建和存储文件的路径（默认在项目文件夹中）。
您可以设置绝对路径。</p>
    </li>
    <li>在 Java-Spring 示例目录中运行下一个命令：
        <div class="commandline">docker-compose up</div>
    </li>
    <li>
        <p>使用 <b>server.address</b> 和 <b>server.port</b>打开浏览器：</p>
        <div class="commandline">http://server.address:server.port/</div>
    </li>
</ol>
