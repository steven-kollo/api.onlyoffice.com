<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    安全
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">安全</span>
    </h1>
    <p class="dscr">为了防止在 ONLYOFFICE 文档服务器请求中替换重要参数，以 <b>令牌</b>的形式向其中添加了加密签名。</p>
    <p>在初始化 <b>文档编辑器</b> 时以及在 <b>文档存储服务</b> 和 <b>文档编辑服务</b>、 <b>文档命令服务</b>、 <b>文档转换服务</b>和 <b>文档构建器服务</b> 之间交换命令时，会在配置中添加 <b>令牌</b>。</p>

    <p>
        <b>令牌</b> 是使用 <em>JWT</em> （<a href="https://jwt.io/" target="_blank">JSON Web 令牌</a>）标准生成的。
        令牌由服务器的密钥签名，因此客户端能够验证令牌是否合法。
    </p>

    <p>
        <em>JSON Web 令牌</em> 由以点 (.) 分隔的三部分组成，它们是： <em>标头</em>、 <em>有效负载</em>、 <em>签名</em>。
        <em>标头</em> 由两部分组成：令牌类型 (<em>JWT</em>) 和散列算法 (<em>HMAC SHA256</em>)。
        令牌的第二部分是 <em>有效负载</em>，其中包含 JSON 格式的声明。
        要创建签名部分，您必须获取编码过的标头、编码过的有效负载、加密码、标头中指定的算法，并对其进行签名。
    </p>

    <p>
        <b>ONLYOFFICE 文档服务器</b> 验证 <b>令牌</b>。
        来自 <em>有效载荷</em> 的数据被认为是有效的，并且被用来代替来自主要参数的相应数据。
        如果 <b>令牌</b> 无效，则不执行命令。<p>

    <p>请参阅 <a href="<%= Url.Action("signature/") %>">签名</a> 配置部分以了解更多信息。</p>

    <note>
        <p>
            请注意，集成商使用 <b>本地链接</b>，需要配置中的 <em>JWT</em>。
            否则会出现错误。
        </p>
        <p>
            在以下方法中使用本地链接时一定要添加token: <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a>, 
            <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a>, <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a>,
            <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a>, <a href="<%= Url.Action("methods") %>#setReferenceSource">setReferenceSource</a>,
            <a href="<%= Url.Action("methods") %>#setRequestedDocument">setRequestedDocument</a>, <a href="<%= Url.Action("methods") %>#setRequestedSpreadsheet">setRequestedSpreadsheet</a>,
            <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a>.
            此外，当为<a href="<%= Url.Action("config/document") %>#url">打开</a> 或 <a href="<%= Url.Action("conversionapi") %>#url">转换</a>定义本地 url时，它 是有必要的。
        </p>
    </note>
</asp:Content>
