<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ownCloud ONLYOFFICE 集成应用
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ownCloud ONLYOFFICE 集成应用</span>
    </h1>

    <div class="video-link" title="播放视频">
        <img src="<%= Url.Content("~/content/img/video/owncloud_integration.png") %>" alt="播放视频" /><div class="popap-dialog">

            <div class="popap-container">
                <div class="popap-header">如何将ONLYOFFICE文档与ownCloud集成</div>
                <iframe src="https://www.youtube.com/embed/IAjhUxBWKkQ?wmode=transparent" class="video-frame" frameborder="0" allowfullscreen></iframe>
                <a class="button-close button">关闭</a>
            </div>
            <div class="button-close popap-close" title="关闭">&times;</div>
        </div>
    </div>

    <p>
        此 <a href="https://github.com/ONLYOFFICE/onlyoffice-owncloud" target="_blank">应用程序</a> 使用户可以从 <a href="https://owncloud.com" target="_blank">ownCloud</a> 中使用 ONLYOFFICE 文档编辑office文档。
    </p>
    <p>
        最新的连接器签名版本可在 <a target="_blank" href="https://marketplace.owncloud.com/apps/onlyoffice">ownCloud</a>的官方商店中获得。</p>
    
    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前可以使用此应用程序打开和编辑以下文档格式：DOCX、XLSX、PPTX、CSV、TXT、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：PDF、DJVU、XPS。</li>
        <li>以下格式可以转换为OOXML：DOC、DOCM、DOT、DOTX、EPUB、HTM、HTML、ODP、ODT、POT、POTM、POTX、PPS、PPSM、PPSX、PPT、PPTM、RTF、XLS、XLSM、XLT、XLTM、XLTX。
            ODT、ODS 和 ODP 也可用于即时转换。在管理设置中启用相应选项后，ODF 格式的文档会立即在编辑器中转换并在您单击后打开。
        </li>
        <li>
            该应用程序将在 <b>新建 (+)</b> 菜单中创建一个菜单项，这个菜单项用来创建 <b>文档</b>、 <b>电子表格</b>或 <b>演示文稿</b>。
            它还将在 Office 文档的文档库中创建一个新的 <b>在 ONLYOFFICE 中打开</b> 菜单选项。
            这允许多个用户实时协作并将这些更改保存到ownCloud中。
            在连接到一个文档服务器的多个联合 ownCloud 实例之间也可以进行共同编辑。
        </li>
        <li>可以使用不同的权限类型共享文件 - 查看/编辑、评论、审查、填写表单。也可以限制下载（在所有编辑器中）和修改过滤器（在电子表格中）。也可以通过公共链接分享。</li>
        <li>可以在 <b>ownCloud Web</b>中处理文档、电子表格和演示文稿。</li>
    </ul>

    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您将需要一个 ONLYOFFICE 文档（文档服务器）实例，该实例可从 ownCloud 和任何终端客户端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">
        ONLYOFFICE 文档文档页面</a>。
        ONLYOFFICE 文档还必须能够直接发布到 ownCloud。
    </p>
    <p>
        ONLYOFFICE 文档和 ownCloud 可以安装在不同的计算机上，也可以安装在同一台机器上。
        如果您选择后一种变体，您需要为文档服务器设置一个自定义端口，因为默认情况下 ONLYOFFICE 文档和 ownCloud 都在端口 80 上工作。
        或者您可以在代理后面使用文档服务器，请参阅 <a href="https://helpcenter.onlyoffice.com/server/document/document-server-proxy.aspx" target="_blank">此文</a> 了解如何配置它。
    </p>
    <p>您还可以使用我们的 <a target="_blank" href="https://github.com/ONLYOFFICE/docker-onlyoffice-owncloud">Docker 安装</a> 通过几个命令来安装和配置文档服务器和 ownCloud 安装。</p>


    <h2 id="install" class="copy-link">安装 ownCloud ONLYOFFICE 集成应用</h2>
    <p>
        ownCloud 管理员可以从内置应用程序市场安装集成应用程序。
        为此，单击左上角的汉堡菜单并选择 <b>商城</b>。
        之后在可用应用程序列表中找到 <b>ONLYOFFICE</b> 并安装它。
    </p>
    <p>
        如果安装了ownCloud的服务器不能上网，或者因为其他原因需要，管理员可以手动安装应用程序。
        要开始将 ONLYOFFICE 文档与 ownCloud 一起使用，必须执行以下步骤：
    </p>
    <ol>
        <li>转到 ownCloud 服务器的 <em>apps/</em> 目录（或其他一些 <a href="https://doc.owncloud.org/server/admin_manual/installation/apps_management_installation.html#using-custom-app-directories" target="_blank">用于</a> 连接应用程序的目录）：
            <span class="commandline">cd apps/</span>
        </li>
        <li>获取 ownCloud ONLYOFFICE 集成应用程序。
            有几种方法可以做到这一点：
            <ol style="list-style-type: lower-alpha;">
                <li>从 <a target="_blank" href="https://marketplace.owncloud.com/apps/onlyoffice">ownCloud</a>官方商店下载最新的签名版本。</li>
                <li>从GitHub 上的应用程序 <a target="_blank" href="https://github.com/ONLYOFFICE/onlyoffice-owncloud/releases">发布页面</a> 下载最新的签名版本。</li>
                <li>克隆应用程序源代码并自己编译：
                    <span class="commandline">git clone https://github.com/ONLYOFFICE/onlyoffice-owncloud.git onlyoffice
cd onlyoffice
git submodule update --init --recursive</span>
                </li>
            </ol>
            <div class="note">ownCloud 不适用于发出警报的未签名应用程序，因此您需要使用选项 <b>a</b> 或 <b>b</b> 来获取应用程序。</div>
        </li>
        <li>更改所有者以从 ownCloud Web 界面更新应用程序：
            <span class="commandline">chown -R www-data:www-data onlyoffice</span>
        </li>
        <li>在 ownCloud 中打开 <em>~/settings/admin?sectionid=apps&category=disabled</em> 页面，其中管理员 <b>未启用</b> 应用程序，然后单击 <b>ONLYOFFICE</b> 应用程序的<b>启用</b>。</li>
    </ol>


    <h2 id="settings" class="copy-link">配置 ownCloud ONLYOFFICE 集成应用</h2>
    <p>
        在 ownCloud 中打开 <em>~/settings/admin?sectionid=additional#onlyoffice</em> 页面，其中包含 <b>ONLYOFFICE</b> 部分的管理设置。
        输入以下地址连接ONLYOFFICE 文档：
    </p>
    <span class="commandline">https://&lt;documentserver&gt;/</span>

    <p>
        其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE 文档</b> 的服务器的名称。
        用户浏览器和 ownCloud 服务器必须可以访问该地址。
        ownCloud 服务器地址也必须可以从 <b>ONLYOFFICE 文档</b> 访问才能正常工作。
    </p>
    <img alt="本地网络" src="<%= Url.Content("~/content/img/editor/owncloud-local.jpg") %>" />

    <p id="internalUrl">
        有时您的网络配置可能不允许使用公共地址在已安装的 ownCloud 和 ONLYOFFICE 文档之间进行请求。
        <b>高级服务器设置</b> 允许为来自ownCloud服务器的内部请求设置ONLYOFFICE 文档地址，为来自ONLYOFFICE 文档的内部请求设置返回的ownCloud地址。
        您需要在相应的字段中输入它们。
    </p>
    <img alt="公共网络" src="<%= Url.Content("~/content/img/editor/owncloud-public.jpg") %>" />

    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE 文档的访问，这也是出于安全原因和数据完整性考虑。
        在 ownCloud 管理配置中指定您自己的<b>密钥</b>。 在 ONLYOFFICE 文档 <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</p>

    <p>启用或禁用 <b>在同一选项卡中打开文件</b> 设置。</p>

    <p>
        在 <b>ONLYOFFICE 中打开</b> 操作将被添加到文件上下文菜单中。
        您可以将此操作指定为默认操作，当单击所选文件类型的文件名时将使用该操作。
    </p>

    <h2 id="check-connection" class="copy-link">检查连接</h2>
    <p>您可以使用以下 occ 命令检查与 ONLYOFFICE 文档的连接：</p>
    <span class="commandline">occ onlyoffice:documentserver --check</span>
    <p>您将看到一条文本，其中包含有关成功连接或错误原因的信息。</p>


    <h2 id="ownCloud-web" class="copy-link">为 ownCloud Web 启用编辑</h2>
    <p>要在 <b>ownCloud Web</b>中启用工作，请在 ownCloud Web <em>config.json</em>中注册连接器：</p>
    <ul>
        <li>如果您从 <a target="_blank" href="https://marketplace.owncloud.com/apps/onlyoffice">官方商城安装 ownCloud Web</a>，则路径为 <em>&lt;owncloud-root-catalog&gt;/config/config.json</em>。</li>
        <li>如果您使用 <a href="#install">这条指令</a>自己从源代码编译它，则路径为 <em>&lt;owncloud-web-root-catalog&gt;/config/config.json</em>。</li>
    </ul>
    <p>要注册连接器，请使用以下行：</p>
    <pre>
"external_apps": [
    {
        "id": "onlyoffice",
        "path": "http(s)://&lt;owncloud-10-server-address&gt;/custom/onlyoffice/js/web/onlyoffice.js",
    }
]
</pre>
    <p>根据您的网络服务器配置，您可以从 URL 路径中删除 <em>index.php</em> 部分。</p>
    
    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <p>ONLYOFFICE 集成遵循<a href="https://api.onlyoffice.com/editors/basic">此处</a>的 API文檔。</p>
    <ol>
        <li>创建新文件时，用户导航到 ownCloud 中的文档文件夹，然后单击 <b>新建 (+)</b>菜单中的 <b>文档</b>、 <b>电子表格</b> 或 <b>演示文稿</b> 菜单项。</li>
        <li>
            浏览器调用 <em>/lib/Controller/EditorController.php</em> 控制器中的 <em>create</em> 方法。
            此方法将 <em>assets</em> 文件夹中的文件副本添加到用户当前所在的文件夹中。</li>
        <li>打开现有文件时，用户在 ownCloud 中导航到该文件并选择 <b>在 ONLYOFFICE 中打开</b> 菜单选项。
        </li>
        <li>打开一个新的浏览器选项卡并调用 <em>/lib/Controller/EditorController.php</em> 控制器的 <em>index</em> 方法。</li>
        <li>
            <p>该应用程序准备一个具有以下属性的 JSON 对象：</p>
            <ul>
                <li><b>url</b> - ONLYOFFICE 文档用于下载文档的 URL；</li>
                <li><b>callbackUrl</b> - ONLYOFFICE 文档通知文档编辑状态的 URL；</li>
                <li><b>documentServerUrl</b> - 客户端需要响应ONLYOFFICE文档服务器的URL（可以在管理设置页面设置）；</li>
                <li><b>key</b> ： <em>UUID+Modified Timestamp</em> 指示 ONLYOFFICE 文档是否再次下载文档；</li>
            </ul>
        </li>
        <li>ownCloud获取这个对象并从 <em>templates/editor.php</em> 模板构建一个页面，填充所有这些值，以便客户端浏览器可以加载编辑器。</li>
        <li>客户端浏览器从 ONLYOFFICE 文档向 JavaScript 库发出请求，并向 ONLYOFFICE 文档发送包含上述属性的 DocEditor 配置。</li>
        <li>然后 ONLYOFFICE 文档从 ownCloud 下载文档，用户开始编辑。</li>
        <li>ONLYOFFICE 文档向 <em>回调</em> URL 发送 POST 请求，目的是通知 ownCloud ：用户正在编辑文档。</li>
        <li>当所有用户和客户端浏览器都完成编辑后，他们会关闭编辑窗口。</li>
        <li>在 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 不活动后，ONLYOFFICE 文档向 <em>回调</em> URL 发送一个 POST，让 ownCloud 知道客户端已完成对文档的编辑并关闭它。</li>
        <li>ownCloud 下载文档的新版本，替换旧版本。</li>
    </ol>


    <h2 id="issue" class="copy-link">已知的问题</h2>
    <ul>
        <li>
            <b>连接外部存储</b>。在某些情况下，使用 <b>外部存储</b> 应用程序添加存储会令共同编辑出现问题。
            如果使用相同的授权密钥进行连接（选择了 <em>用户名和密码</em> 或 <em>全局凭据</em> 身份验证类型），则用户可以进行共同编辑。
            如果使用不同的授权密钥（保存在数据库中的<em>登录凭据</em> 或存储在数据库身份验证选项中的 <em>用户输入</em> ），则无法进行共同编辑。
            当使用 <em>登录凭据，保存在会话</em> 身份验证类型时，无法在编辑器中打开文件。
        </li>
        <li>
            <b>加密文件存储</b>。ownCloud 提供了加密文件存储的选项。
            但是如果启用了使用 <em>每用户加密密钥</em> （默认在ownCloud <b>默认加密模块</b> 应用程序中使用）来加密，ONLYOFFICE 文档将无法打开加密文件进行编辑并在编辑后保存它们。
            管理设置页面的 ONLYOFFICE 部分将显示有关它的通知。
            但是，如果您使用 <em>主密钥</em>设置加密，ONLYOFFICE 应用程序将按预期工作。
            关于启用基于 <em>主密钥</em> 加密的说明可以在 <a href="https://doc.owncloud.org/server/admin_manual/configuration/files/encryption/encryption_configuration.html#enabling-master-key-based-encryption-from-the-command-line" target="_blank">ownCloud</a> 网站的官方文档中找到。
            <div class="note note-important">
                <div class="note-important-label">请注意</div>
                ownCloud 建议仅在没有数据的全新安装或尚未启用加密的系统上使用 <em>主加密密钥</em>，因为您之前使用 <em>每用户加密密钥</em> 加密的文件可能会在对它们启用基于 <em>主密钥</em> 进行加密后 <b>永远丢失</b>。
            </div>
        </li>
        <li>
            <p><b>验证证书</b>。如果您为您的文档服务器使用自签名证书，ownCloud 将不会验证此类证书，并且不允许与文档服务器进行连接。
            这个问题可以通过两种方式解决：</p>
            <ol>
                <li>选中ownCloud 中 ONLYOFFICE 管理页面的服务器设置部分的 <b>禁用证书验证（不安全）</b> 框。</li>
                <li>手动更改 ownCloud 配置文件。找到 ownCloud 配置文件 (<em>/owncloud/config/config.php</em>) 并打开它。在其中插入以下部分：</li>
            </ol>
            <pre>
'onlyoffice' => array (
    'verify_peer_off' => true
)
</pre>
            <p>这将禁用证书验证并允许 ownCloud 与文档服务器建立连接。</p>
            <note>请记住，这是一种临时的不安全解决方案，我们强烈建议您将证书替换为某个 CA 颁发的证书。完成此操作后，不要忘记取消选中相应的设置框或从 ownCloud 配置文件中删除上述部分。</note>
        </li>
        <li>
            <b>联合云共享</b>。如果使用 <b>联合云共享</b> 应用程序共享文档，则连接到不同 ONLYOFFICE 服务器的 ownCloud 实例之间的共同编辑将不可用。
            来自同一个文档服务器的用户可以在共同编辑模式下编辑文档，但来自两个（或多个）不同文档服务器的用户将无法实时协作处理同一个文档。
        </li>
        <li>
            <p>
                <b>转换文件</b>。ONLYOFFICE 文档在打开和编辑文件时使用 Office Open XML 格式作为基础。
                如果文件格式与 OOXML 不同，它仍将转换为相应的 OOXML，以便文档服务器正常工作和性能更快。
                之后，您可以编辑文件，对基本 OOXML 格式进行任何更改，并将文件保存为这个基本 OOXML 格式。
            </p>
            <p>
                如果源 ownCloud 文件格式与基本格式不同，并且您仍想将其保存为原始格式，则文件将从 OOXML 转换为这种格式。
                由于格式根本不同，某些数据（例如图表、表格、自选图形或图像）和格式可能会丢失，原因很简单，某些格式（<em>csv</em>、 <em>txt</em>等）不支持它们或以不同于 OOXML 标准的方式对待它们。
                这就是为什么默认打开所有非 OOXML 文件仅供查看的原因，尽管在上下文菜单中有转换文件的选项。
                如果您意识到转换后的数据/格式丢失风险，但仍想打开非OOXML文件进行编辑，您可以在设置中的列表中进行检查。
                默认情况下可以 编辑 <em>csv</em> 和 <em>txt</em> 文件。
            </p>
        </li>
        <li>访问没有下载权限的文档时，无法进行文件打印和使用系统剪贴板。
            通过编辑器工具栏和上下文菜单中的按钮可以在编辑器中进行复制和粘贴。</li>
    </ul>


    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-owncloud" target="_blank">此处</a>下载 ownCloud ONLYOFFICE 集成应用程序。</p>

</asp:Content>
