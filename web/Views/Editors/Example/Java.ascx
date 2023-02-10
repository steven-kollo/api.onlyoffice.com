<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">如何将在线编辑器集成到您自己的 Java 网站中</span>
</h1>

<h2>概述</h2>
<p class="dscr">此示例将帮助您将 ONLYOFFICE 文档集成到用 Java 编写的 Web 应用程序中。</p>

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
    <li>没有禁止使用来自其他站点的测试示例，因为它们用于与来自另一个域的 ONLYOFFICE 文档服务器进行交互。</li>
</ul>

<h2 id="Windows" class="copy-link">对于 Windows</h2>
<h2 id="win-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_java_example">适用于Windows</a>的文档服务器。</p>

<h2 id="win-2" class="copy-link"><span class="style_step">步骤 2.</span>下载用于编辑器集成的 Java 代码</h2>
<p>从我们的站点下载 <a href="<%= Url.Action("demopreview") %>">Java 示例</a>。</p>
<p>要将编辑器连接到您的网站，请在 <em>\src\main\resources\settings.properties</em> 文件中指定编辑器安装的路径和存储文件夹的路径：</p>

<pre>
storage-folder = app_data
files.docservice.url.site=https://documentserver/</pre>

<p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称， <b>storage-folder</b> 是创建和存储文件的路径。您可以设置绝对路径。
    例如， <em>D:\\folder</em>。请注意，在 Windows 操作系统上，双反斜杠必须用作分隔符。</p>
<p>如果要试验编辑器配置，请修改 <em>\src\main\webapp\editor.jsp</em> 文件中的 <a href="<%= Url.Action("advanced") %>">参数</a>。</p>

<h2 id="win-3" class="copy-link"><span class="style_step">步骤 3.</span>安装的先决条件</h2>
<p>要运行 Java 示例代码，请安装适用于您的操作系统和 Web 服务器 <b>Apache Tomcat</b>的 Java 版本：</p>

<ul>
    <li><b>Java</b> （从 <a href="https://www.java.com/zh-CN/download/manual.jsp">Oracle官网</a>下载）；</li>
    <li><b>Apache Tomcat</b>：9.0.x 版（从 <a href="https://tomcat.apache.org/download-90.cgi">官网</a>下载）。</li>
</ul>

<h2 id="win-4" class="copy-link"><span class="style_step">步骤 4.</span>运行 Apache Tomcat</h2>
<ol>
    <li>
        <p>在 Windows 上安装 Java 后，将 <b>JAVA_HOME</b> 环境变量设置为指向 Java 安装目录。</p>
        <p>
            找出 Java 的安装位置。
            如果您在安装过程中没有更改路径，它将是这样的：
        </p>

        <pre>C:\Program Files\Java\jdk1.8.0_65</pre>
        <p>在 <b>Windows 7</b>中，右键单击 <b>我的电脑</b> 并选择 <b>属性</b>，然后单击 <b>高级</b>。</p>
        <p>在 <b>Windows 8</b>中，进入 <b>控制面板</b> 并选择 <b>系统</b>，然后单击 <b>高级系统设置</b>。</p>
        <p>单击 <b>环境变量</b> 按钮。</p>
        <p>在 <b>系统变量</b>下，单击 <b>新建</b>。</p>
        <p>在 <b>变量名称</b> 字段中，如果您安装了 <b>JDK</b> （Java 开发工具包），请输入 <b>JAVA_HOME</b>；如果您安装了 <b>JRE</b> （Java 运行时环境），请输入 <b>JRE_HOME</b> 。</p>
        <p>在 <b>变量值</b> 字段中，输入您的 <b>JDK</b> 或 <b>JRE</b> 安装路径，例如 <em>C:\Program Files\Java\jdk1.8.0_65</em>。</p>

        <img src="<%= Url.Content("~/content/img/java/make-var.png") %>" alt="" />

        <p>检查 <b>命令提示符</b> 中的 <b>echo</b>命令是否成功创建变量：</p>
        <pre>echo %JAVA_HOME%</pre>
    </li>
    <li>
        <p>
            运行 <b>命令提示符</b>。
            更改 <b>Apache Tomcat</b> 安装目录的当前目录：
        </p>
        <pre>cd /d C:\Apache Tomcat\apache-tomcat-7.0.67\bin</pre>
    </li>
    <li>
        <p>使用 <em>startup.bat</em> 脚本启动 Apache Tomcat：</p>
        <pre>startup.bat</pre>
        <p>您将看到显示的新 <b>Tomcat</b> 控制台窗口，其中提供有关 Tomcat 启动的信息和消息：</p>
        <img src="<%= Url.Content("~/content/img/java/tomcat-cmd.jpg") %>" width="800" alt="" />

        <p>使用 Web 浏览器中的地址测试 Tomcat 安装：</p>
        <div class="commandline">http://localhost:8080</div>
        <p>如果一切正确，您将在浏览器中看到 Tomcat 网页，如下所示。</p>
    </li>
</ol>

<h2 id="win-5" class="copy-link"><span class="style_step">步骤 5。</span>运行 Java 代码</h2>
<ol>
    <li>
        <p>通过单击 <b>Manager App:</b>打开 Tomcat Web Application Manager：</p>
        <img src="<%= Url.Content("~/content/img/java/manager.jpg") %>" width="700" alt="" />
    </li>
    <li>
        <p>Tomcat Web Application Manager 将请求 <b>username</b> 和 <b>password:</b></p>
        <img src="<%= Url.Content("~/content/img/java/author.jpg") %>" height="300" alt="" />

        <p>
            在 Apache Tomcat 安装文件夹中的 <em>tomcat-users.xml</em> 文件中指定用户数据。
            定义 <b>manager-gui</b> 用户角色，指定 <b>user name</b> 和 <b>password</b> 的值：
        </p>

        <pre>
&lt;tomcat-users&gt;
    &lt;role rolename="manager-gui"/&gt;
    &lt;user username="tomcat" password="tomcat" roles="manager-gui"/&gt;
&lt;/tomcat-users&gt;
</pre>

    </li>
    <li>
        <p>在 Tomcat Web Application Manager中上传 Java 项目。为此，单击 <b>WAR file to deploy</b> 部分中的 <b>Choose File</b> 并在 Java 项目文件夹中找到 <em>.war</em> 文件，然后单击 <b>Deploy</b>。</p>
        <img src="<%= Url.Content("~/content/img/java/upload-app.jpg") %>" width="800" alt="" />
        <img src="<%= Url.Content("~/content/img/java/war-file.jpg") %>" width="600" alt="" />
    </li>
    <li>
        <p>您将在 <b>Applications 列表</b>中看到该项目：</p>
        <img src="<%= Url.Content("~/content/img/java/manager-app.jpg") %>" width="800" alt="" />
    </li>
    <li>
        <p>单击应用程序名来运行它。</p>
    </li>
</ol>

<h2 id="win-6" class="copy-link"><span class="style_step">步骤 6.</span>检查可访问性</h2>
<p>
    如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
    确保文档服务器能够访问安装了示例的服务器，该示例使用您在配置文件中 指定的地址而不是 <b>example.com</b> 安装。
</p>

<p>如果您成功集成了编辑器，结果应该类似于我们网站上的 <a href="<%= Url.Action("demopreview") %>#DemoPreview">演示预览</a>。</p>


<h2 id="Linux" class="copy-link">对于 Linux</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">步骤 1.</span>安装 ONLYOFFICE 文档</h2>
<p>下载并安装 <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE 文档</a> （打包为文档服务器）。</p>
<p>请参阅详细指南以了解如何安装 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_java_example">适用于Linux</a>的文档服务器。</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">步骤 2.</span>安装的先决条件及使用编辑器运行网站</h2>
<ol>
    <li>安装 <b>Java</b>：
        <span class="commandline">sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer</span>
    </li>
    <li>下载包含 Java 示例的存档并解压缩存档：
        <span class="commandline">wget https://api.onlyoffice.com/app_data/editor/Java%20Example.zip</span>
        <span class="commandline">unzip Java\ Example.zip</span>
    </li>
    <li>将当前目录更改为项目目录：
        <div class="commandline">cd Java\ Example/</div>
    </li>
    <li>编辑 <em>settings.properties</em> 配置文件。
        指定安装了 ONLYOFFICE 文档服务器的本地服务器的名称。
        <div class="commandline">nano src/main/resources/settings.properties</div>
        <p>编辑以下行：</p>

        <pre>
storage-folder = app_data
files.docservice.url.site=https://documentserver/
</pre>

        <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称， <b>storage-folder</b> 是创建和存储文件的路径。
            请注意，您必须具有对该文件夹的读取和写入权限。如果您没有它们，请使用下一个命令：</p>
        <pre>
sudo chmod -R ugo+rw /{path}
</pre>
    </li>
    <li>安装 <b>Maven</b>：
        <div class="commandline">sudo apt-get install maven</div>
    </li>
    <li>构建：
        <div class="commandline">mvn package</div>
    </li>
    <li>使用管理页面安装 <b>Tomcat</b>：
        <div class="commandline">sudo apt-get install tomcat8 tomcat8-admin</div>
    </li>
    <li>在 Tomcat 上配置管理员用户：
        <div class="commandline">sudo nano /var/lib/tomcat8/conf/tomcat-users.xml</div>
        插入以下行：
        <pre>&lt;role rolename="manager-gui"/&gt;
&lt;user username="USERNAME" password="PASSWORD" roles="manager-gui"/&gt;</pre>
        <p>其中 <b>USERNAME</b> 和 <b>PASSWORD</b> 是您自己的凭据数据。
        </p>重启Tomcat：
        <div class="commandline">systemctl restart tomcat8</div>
    </li>
    <li>使用管理员用户凭据在浏览器中打开 Tomcat 管理页面：
        <div class="commandline">http://localhost:8080/manager/html</div>
    </li>
    <li>从 <em>target/OnlineEditorsExampleJava-1.0.war</em>选择要上传的 WAR 文件。</li>
    <li>使用地址在浏览器中查看结果：
        <div class="commandline">http://localhost:8080/OnlineEditorsExampleJava-1.0/</div>
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
    <li>编辑 <em>settings.properties</em> 配置文件。
        指定 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx">安装</a>了 ONLYOFFICE 文档服务器的本地服务器的名称。
        <div class="commandline">nano src/main/resources/settings.properties</div>
        <p>编辑以下行：</p>

        <pre>
storage-folder = app_data
files.docservice.url.site=https://documentserver/
</pre>

        <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称， <b>storage-folder</b> 是创建和存储文件的路径。</p>
    </li>
    <li>在 Java 示例目录中运行下一个命令：
        <div class="commandline">docker-compose up</div>
    </li>
    <li>之后，所有的 <em>bin</em> 文件将被传递到 <em>./target</em> 文件夹。</li>
