<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plone ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Plone ONLYOFFICE 集成插件</span>
    </h1>

    <p>该 <a target="_blank" href="https://github.com/ONLYOFFICE/onlyoffice-plone">插件</a> 使用户能够从 <a target="_blank" href="https://plone.org/">Plone</a> 中用 ONLYOFFICE 文档编辑office文档。</p>

    <h2 id="features" class="copy-link">特性</h2>

    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：PDF、ODT、ODS、ODP、DOC、XLS、PPT。</li>
        <li>该插件将在 Office 文档的文档库中创建一个新的菜单选项 <b>ONLYOFFICE 编辑</b>。
            这允许多个用户实时协作并将这些更改保存到Plone中。</li>
    </ul>

    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>

    <p>
        您将需要一个 ONLYOFFICE 文档（文档服务器）实例，该实例可从 Plone 和任何客户终端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE 文档文档页面</a>。
        ONLYOFFICE 文档还必须能够直接发布到 Plone。
    </p>

    <p>启动 ONLYOFFICE 文档实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 Plone ONLYOFFICE 集成插件</h2>

    <p>要开始使用带有 Plone 的 ONLYOFFICE 文档，必须执行以下步骤：</p>
    <ol>
        <li>通过将插件添加到您的 <em>buildout.cfg</em>来安装插件：
            <span class="commandline">[buildout]

...

eggs =
    onlyoffice.plone
            </span>
        </li>

        <li>Run <em>bin/buildout</em>.</li>

        <li>转到 <b>站点设置 -> 附加组件</b>，然后按 <b>安装</b> 按钮启用插件。</li>
    </ol>

    <p>你也可以通过 Docker 安装插件：</p>
    <span class="commandline">
docker run --rm -p 8080:8080 -e ADDONS="onlyoffice.plone" plone
    </span>

    <p>这两个选项都会自动从 <a target="_blank" href="https://pypi.org/project/onlyoffice.plone/">PyPi</a>安装插件。</p>
    <note>请注意，如果您安装了以前的插件版本（以前名称为 <em>onlyoffice.connector</em> 的早期插件版本），请在安装新版本之前将其删除。</note>

    <h2 id="configuration" class="copy-link">配置 Plone ONLYOFFICE 集成插件</h2>

    <p>
        要配置插件，请转到 <b>站点设置</b>。
        向下滚动到 <b>附加组件配置</b> 部分，然后按 <b>ONLYOFFICE 配置</b> 按钮。
    </p>

    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE 文档的访问，这也是出于安全原因和数据完整性考虑。
        在 Plone 配置页面上指定您自己的 <b>密钥</b>。 在 ONLYOFFICE 文档 <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</p>

    <h2 id="developing" class="copy-link">开发 Plone ONLYOFFICE 插件</h2>

    <ol>
        <li>克隆存储库并更改目录：

            <span class="commandline">
git clone --branch deploy git@github.com:ONLYOFFICE/onlyoffice-plone.git
cd onlyoffice-plone
            </span>
        </li>
        <li>在包中创建一个 <em>virtualenv</em>。</li>
        <li>使用 pip 安装所需文件。</li>
        <li>运行 <em>buildout</em>：
            <span class="commandline">
virtualenv .
./bin/pip install -r requirements.txt
./bin/buildout
            </span>
        </li>
        <li>在前台启动 Plone：
            <span class="commandline">
./bin/instance fg
            </span>
        </li>
    </ol>

    <p>
        如果你有一个工作的 Plone 实例，你可以通过将项目文件添加到 <em>scr</em> 目录来安装插件：
    </p>
    <ol>
        <li>在 <em>scr</em> 目录中创建 <em>onlyoffice.plone</em> 目录。</li>
        <li>将 Git 收到的项目文件放入 <em>onlyoffice.plone</em> 目录。</li>
        <li>编辑 <em>buildout.cfg</em> 文件：
            <span class="commandline">[buildout]

...

eggs =
    onlyoffice.plone
develop = 
    src/onlyoffice.plone
            </span>
        </li>
        <li>重新运行 buildout 以使更改生效：
            <span class="commandline">
.bin/buildout
            </span>
        </li>
        <li>然后启动或重新启动您的 Plone 实例。</li>
    </ol>
    <note>
        Plone 基于 <b>Zope 服务器</b>，不会以 <em>root</em> 用户身份运行。
        如果您打算以 <em>root</em> 用户身份运行它，则必须提供 <a target="_blank" href="https://zope.readthedocs.io/en/2.12/SETUID.html">有效用户指令</a>。为此，请将 <em>effective-user &lt;username&gt;</em> 行添加到 <em>./parts/instance/etc/zope.conf</em>。
    </note>

    <h2 id="upgrade" class="copy-link">升级 Plone ONLYOFFICE 集成插件</h2>

    <ol>
        <li>如果您在 <em>buildout.cfg</em> 文件中指定了具体的插件版本（所谓的pinning，及推荐的做法），例如 <em>onlyoffice.plone = 1.0.0</em>，请更新此引用以指向较新的版本。
            如果未指定插件版本，则将自动加载最新版本：
            <span class="commandline">[versions]

...

onlyoffice.plone = 1.0.1
            </span>
        </li>
        <li>运行 <em>bin/buildout</em>。等到下载并安装新版本。</li>
        <li>重新启动克隆。在您执行下一步之前，您的网站可能看起来很奇怪，甚至无法访问。</li>
        <li>导航到 <b>附加组件</b> 屏幕（将 <em>/prefs_install_products_form</em> 添加到您的站点 URL）并在 <b>升级</b> 列表中选择 <b>onlyoffice.plone</b> 并单击 <b>升级 onlyoffice.plone</b>。</li>
    </ol>


    <h2 id="how-it-works" class="copy-link">它是如何运作的</h2>
    <p>ONLYOFFICE 集成遵循<a href="https://api.onlyoffice.com/editors/basic">此处</a>的 API文档。</p>
    <ol>
        <li>用户导航到 Plone 中的文档并选择 <b>ONLYOFFICE 编辑</b> 操作。</li>
        <li>
            <p>Plone 为文档服务器准备一个 JSON 对象，具有以下属性：</p>
            <ul>
                <li><b>url</b>: ONLYOFFICE 文档用于下载文档的 URL；</li>
                <li><b>callbackUrl</b>: ONLYOFFICE 文档通知文档编辑状态的 URL；</li>
                <li><b>key</b>: <em>UUID+Modified Timestamp</em> 指示ONLYOFFICE 文档是否重新下载文档；</li>
                <li><b>Title:</b>: 文档标题（名称）。</li>
            </ul>
        </li>
        <li>Plone 从 <em>.pt</em> 模板构造一个页面，填充所有这些值，以便客户端浏览器可以加载编辑器。</li>
        <li>客户端浏览器从 ONLYOFFICE 文档向 JavaScript 库发出请求，并向 ONLYOFFICE 文档发送包含上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE 文档从 Plone 下载文档，用户开始编辑。</li>
        <li>ONLYOFFICE 文档向 <em>回调</em> URL 发送 POST 请求，通知 Plone 用户正在编辑文档。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE 文档向 <em>回调</em> URL 发送一个 POST，让 Plone 知道客户端已完成对文档的编辑并关闭它。</li>
        <li>Plone 下载文档的新版本，替换旧版本。</li>
    </ol>

    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-plone" target="_blank">此处</a>下载 Plone ONLYOFFICE 集成插件。</p>

</asp:Content>
