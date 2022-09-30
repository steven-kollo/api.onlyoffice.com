<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    故障排除
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">故障排除</span>
    </h1>
    <p class="dscr">编辑器集成最常见的问题以及解决方法。</p>

    <h2 id="download" class="copy-link">下载失败</h2>
    <img alt="下载失败" src="<%= Url.Content("~/content/img/editor/e-download.png") %>" />
    <p>在编辑器加载过程中会显示"下载失败"消息。</p>
    <p><b>文档编辑服务</b> 无法上传文件进行编辑。</p>
    <p>
        检查 <a href="<%= Url.Action("config/document") %>#url">document.url</a> 中指定的文件的链接是否正确。
        该链接必须可以从 <b>文档编辑服务</b>访问。
    </p>

    <h2 id="callbackurl" class="copy-link">没有变化</h2>
    <p>编辑后关闭编辑器时， <b>文档管理器</b>中的文件不变。</p>
    <p><b>文档编辑服务</b> 无法将数据发送到 <b>文档存储服务</b>。</p>
    <p>
        检查 <a href="<%= Url.Action("config/editor") %>#callbackUrl">editorConfig.callbackUrl</a> 链接是否正确。
        <b>文档管理器</b> 中的保存必须通过 <a href="<%= Url.Action("callback") %>#implement">回调处理程序</a>实现
    </p>

    <h2 id="error0" class="copy-link">无法保存</h2>
    <img alt="无法保存" src="<%= Url.Content("~/content/img/editor/e-error0.png") %>" />
    <p>编辑器加载了"无法保存文档"消息。</p>
    <p><b>文档编辑服务</b> 无法连接到 <a href="<%= Url.Action("config/editor") %>#callbackUrl">editorConfig.callbackUrl</a> 地址的 <b>文档存储服务</b>。</p>
    <p>
        检查 <a href="<%= Url.Action("callback") %>#implement">回调处理程序</a> 是否正常工作。
        <b>文档存储服务</b> 必须返回 <a href="<%= Url.Action("callback") %>#error-0">{"error": 0}</a> 作为响应。
    </p>

    <h2 id="key" class="copy-link">文件版本已更改</h2>
    <img alt="文件版本已更改" src="<%= Url.Content("~/content/img/editor/e-key.png") %>" />
    <p>
        编辑器加载了"文件版本已更改。
        将重新加载页面"消息。</p>
    <p>
    <b>文档编辑服务</b> 无法打开之前编辑和保存过的文件来进行编辑。</p>
    <p>不要忘记，每次编辑和保存文档时，都必须重新生成 <a href="<%= Url.Action("config/document") %>#key">document.key</a>。</p>

    <h2 id="changesUrl" class="copy-link">文件版本打不开</h2>
    <img width="832px" alt="文件版本打不开" src="<%= Url.Content("~/content/img/editor/changes-url.png") %>" />
    <p><b>文档编辑服务</b> 无法打开文件版本。</p>
    <p>检查 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法中的 <em>changesUrl</em> 链接是否与 <em>previous.url</em> 参数匹配。</p>

    <h2 id="coedit" class="copy-link">没有协作编辑</h2>
    <img width="832px" alt="没有协作编辑" src="<%= Url.Content("~/content/img/editor/e-coedit.png") %>" />
    <p>当不同用户打开文档进行编辑时，无法进行共同编辑。</p>
    <p><b>文档编辑服务</b> 打开 <b>两个不同</b> 的文件进行编辑。</p>
    <p>
        检查 <a href="<%= Url.Action("config/document") %>#key">document.key</a> 值是否一致以便能够共同编辑同一个文档。
        <em>key</em> 值在保存后必须改变，不同文档必须不同，并且在共同编辑同一个文档时必须相同。
    </p>

    <h2 id="token" class="copy-link">令牌无效</h2>
    <img alt="令牌无效" src="<%= Url.Content("~/content/img/editor/e-token.png") %>" />
    <p>
        编辑器加载了"文档安全令牌没有正确生成。
        请联系您的文档服务器管理员"消息。
    </p>
    <p><b>文档编辑服务</b> 请求加密过的 <b>签名</b>。</p>
    <p>
        检查 <a href="<%= Url.Action("config/") %>#token">令牌</a> 是否正确。
        令牌必须根据 <a href="<%= Url.Action("security") %>">JWT（JSON Web 令牌）标准</a> 生成并存在于 <b>ONLYOFFICE 文档服务器</b> 配置中。
    </p>
</asp:Content>
