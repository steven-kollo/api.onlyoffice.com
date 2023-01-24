<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Alfresco 模块包
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Alfresco 模块包</span>
    </h1>

    <p class="dscr">该 <a href="https://github.com/ONLYOFFICE/onlyoffice-alfresco" target="_blank">插件</a> 让用户能够从 <a href="https://www.alfresco.com/" target="_blank">Alfresco</a> Share 中用 ONLYOFFICE Docs编辑办公文档。</p>

    <p>该插件在官方 <a href="https://community.alfresco.com/docs/DOC-7918-onlyoffice-connector-for-alfresco" target="_blank">Alfresco Add-ons directory</a>中可用。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前可以使用此插件打开和编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>
            <p>该插件将在 Office 文档的文档库中创建一个新的菜单选项- <b>在ONLYOFFICE 中编辑</b>。</p>
            <img alt="在ONLYOFFICE 中编辑" src="<%= Url.Content("~/content/img/editor/alfresco.png") %>"/>
            <p>这允许多个用户实时协作并将这些更改保存到 Alfresco中。</p>
        </li>
        <li>要将 ODT、ODP、ODS、DOC、XLS、PPT 文件转换为其 OOXML 对应文件，请选择 <b>用 ONLYOFFICE 转换</b> 选项。生成的文件将放置在同一文件夹中。
            您还可以为文件夹配置规则，这将在上传或更改时自动转换文件。您可以在 <a href="https://docs.alfresco.com/content-services/latest/using/content/rules/" target="_blank">此处</a>找到详细信息。</li>
        <li>
            要创建新文档，请在文档库中选择上下文菜单 <b>新建...</b> 选项。
            <img alt="新建..." src="<%= Url.Content("~/content/img/editor/alfresco-create.png") %>"/>
        </li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您将需要一个 ONLYOFFICE Docs (文档服务器) 实例，该实例可从 Alfresco 和任何客户终端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 Alfresco上。</p>
    <p>
        启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装ONLYOFFICE Alfresco 模块包</h2>

    <p>要开始在 Alfresco 中使用 ONLYOFFICE Docs，必须在 Ubuntu 14.04 中执行以下步骤的操作：</p>
    <ol>
        <li>将已编译的 <b>*.jar</b> 包上传到相应的目录以供您安装 Alfresco：
            <ul>
                <li>对于Alfresco 存储库： 从 <em>onlyoffice-alfresco/repo/target/</em> 到 <em>/webapps/alfresco/WEB-INF/lib/</em>，</li>
                <li>对于Alfresco Share： 从 <em>onlyoffice-alfresco/share/target/</em> 到 <em>/webapps/share/WEB-INF/lib/</em>。</li>
            </ul>
            <div class="note">您可以在 <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-alfresco/releases">这里</a> 下载已经编译好的包文件并将它们放置到各自的目录中。</div>
        </li>
        <li>确保文档服务器能够 POST 到 Alfresco 中。
            <p>您可能需要在 <b>alfresco-global.properties</b> 中更改这些行，或者您可以使用 <a href="#configuration">配置页面</a>进行设置：</p>
            <span class="commandline">alfresco.host=&lt;hostname&gt;
alfresco.port=443
alfresco.protocol=https

share.host=&lt;hostname&gt;

share.port=443
share.protocol=https</span>
            <div class="note">大概位于这里 <em>/usr/local/tomcat/shared/classes/alfresco-global.properties</em></div>
        </li>
        <li>重启 Alfresco: <span class="commandline">sudo ./alfresco.sh stop
sudo ./alfresco.sh start</span>
        </li>
    </ol>
    <p>可以在 <em>/share/page/console/admin-console/module-package</em> 的管理员工具中检查该模块。</p>

    <h2 id="configuration" class="copy-link">配置 ONLYOFFICE Alfresco 模块包</h2>
    <p>模块配置可以在 <b>Alfresco 管理控制台</b> 中找到，或者只需导航到 <em>http://&lt;alfrescohost&gt;/alfresco/s/onlyoffice/onlyoffice-config</em>即可。</p>
    <div class="note">
        您还可以将 <em>onlyoffice.url</em> 添加到 <b>alfresco-global.properties</b>。
        通过设置页面进行的配置将覆盖 <b>alfresco-global.properties</b>。
    </div>
    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> on the Alfresco configuration page or by adding <em>onlyoffice.jwtsecret</em> to <b>alfresco-global.properties</b>.
        In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>

    <h2 id="compile" class="copy-link">编译 ONLYOFFICE Alfresco 模块包</h2>

    <p>如果您打算自己编译 ONLYOFFICE Alfresco 模块包（例如编辑源代码并在之后编译），请按照以下步骤操作：</p>
    <ol>
        <li>
            成功构建需要最新的稳定 <b>Oracle Java</b> 版本。
            如果您没有安装它，请使用以下命令安装 Oracle Java 8：
            <span class="commandline">sudo apt-get update
sudo apt-get install openjdk-8-jdk</span>
        </li>
        <li>安装最新的 <b>Maven</b>。<a href="https://maven.apache.org/install.html">此处</a>描述了安装过程。
        </li>
        <li>下载ONLYOFFICE Alfresco模块包源代码：
            <span class="commandline">git clone https://github.com/ONLYOFFICE/onlyoffice-alfresco.git</span>
        </li>
        <li>获取子模块：
            <span class="commandline">git submodule update --init --recursive</span>
        </li>
        <li>在 <em>repo</em> 和 <em>share</em> 目录中编译包：
            <span class="commandline">cd onlyoffice-alfresco/
mvn clean install</span>
        </li>
    </ol>
    <p>另一种构建 ONLYOFFICE Alfresco 模块包的方法是使用 <b>docker-compose</b> 文件。</p>
    <p>在项目目录中使用此命令：</p>
    <span class="commandline">docker-compose up</span>

    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>
    <ol>
        <li>用户导航到 Alfresco Share 中的文档并选择 <b>在ONLYOFFICE中编辑</b> 菜单选项。</li>
        <li>Alfresco Share 向 repo 端发出请求（表单URL为：<em>/parashift/onlyoffice/prepare?nodeRef={nodeRef}</em>).</li>
        <li>
            <p>Alfresco Repo 端为具有以下属性的 Share 准备一个 JSON 对象：</p>
            <ul>
                <li><b>url</b> - ONLYOFFICE Docs 用于下载文档的 URL（包括当前用户的 <em>alf_ticket</em> ）；</li>
                <li><b>callbackUrl</b> - ONLYOFFICE Docs 通知文档编辑状态的 URL；</li>
                <li><b>onlyofficeUrl</b> - 客户端需要响应 ONLYOFFICE Docs 的 URL（由 <em>onlyoffice.url</em> 属性提供）；</li>
                <li><b>key</b> ： <em>UUID+Modified Timestamp</em> 指示 ONLYOFFICE Docs 是否再次下载文档；</li>
                <li><b>title</b> - 文档标题（名称）。</li>
            </ul>
        </li>
        <li>Alfresco Share 使用这个对象并从 freemarker 模板构建一个页面，填充所有这些值，以便客户端浏览器可以加载编辑器。</li>
        <li>客户端浏览器从 ONLYOFFICE Docs 向 JavaScript 库发出请求，并向 ONLYOFFICE Docs 发送包含上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE Docs 从 Alfresco 下载文档，用户开始编辑。</li>
        <li>ONLYOFFICE Docs 向 <em>回调</em> URL 发送 POST 请求，以通知 Alfresco 用户正在编辑文档。</li>
        <li>Alfresco 会锁定文档，但仍允许其他具有写入权限的用户通过保留 Action 与 ONLYOFFICE Docs 进行实时协作。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE Docs 向 <em>回调</em> URL 发送一个 POST，让 Alfresco 知道客户端已完成对文档的编辑并关闭它。</li>
        <li>Alfresco 下载文档的新版本，替换旧版本。</li>
    </ol>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-alfresco" target="_blank">此处</a>下载 ONLYOFFICE Alfresco 模块包。</p>

</asp:Content>
