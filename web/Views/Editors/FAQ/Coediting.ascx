<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        共同编辑问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="coediting_1">
    <dt>如何检查我需要多少个连接？</dt>
    <dd>
        <p>您可能需要的最小连接数应该等于将使用您的文档服务器的用户数。但是您应该记住，在大多数情况下，一个用户 <span class="strikethrough">=</span> 一个连接，因为一个用户可以在多个浏览器中打开多个文档。</p>
        <p>因此，如果您确定您的所有用户都将同时使用文档服务器，则连接数的盈余至少等于您的用户数的两倍，否则缺少连接的用户将只能以仅查看模式打开文档。</p>
        <p><a target="_blank" href="https://www.onlyoffice.com/zh/integration-edition-prices.aspx">此页面</a>上提供了所有可用的连接定价计划。</p>
    </dd>
</dl>
<dl class="faq_block" id="coediting_2">
    <dt>如何找到当前正在编辑文档的用户的信息？</dt>
    <dd>
        <p>您可以使用API向 <b>文档命令服务</b>发送 POST 请求。将 <em>c</em> 参数设置为 <a href="<%= Url.Action("command/info") %>">info</a>，与 <em>key</em> 参数一起使用，以标识您要查找有关信息的文档。参数作为请求正文中JSON对象的一部分发送：</p>
        <pre>{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}</pre>
        <p>如果文档正在被两个用户编辑， <b>文档编辑服务</b> 将使用 <a href="<%= Url.Action("callback") %>">回调处理程序</a> 通知 <b>文档存储服务</b>，并提供以下信息：</p>
        <pre>{
    "key": "Khirz6zTPdfd7",
    "status": 1,
    "users": ["6d5a81d0", "78e1e841"]
}</pre>
        <ul>
            <li><em>key</em> 是文档的标识符（与上面的 POST 请求相同）；</li>
            <li><em>Status</em> 值为 <b>1</b> 表示当前正在编辑文档；</li>
            <li><em>users</em> 是参与共同编辑的用户的ID数组。</li>
        </ul>
        <p>有关 <b>文档编辑服务</b> 响应的更多信息，请参见 <a href="<%= Url.Action("callback") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="coediting_3">
    <dt>如何在保存文档之前断开当前正在编辑文档的用户？</dt>
    <dd>
        <p>要在保存文档之前强制断开用户与文档的连接，请使用 API 向 <b>文档命令服务</b>发送 POST 请求。将 <em>c</em> 参数设置为 <a href="<%= Url.Action("command/drop") %>">drop</a>，与标识文档的 <em>key</em> 参数、以及要断开连接的用户ID数组一起使用。参数作为请求正文中 JSON 对象的一部分发送：</p>
        <pre>{
    "c": "drop",
    "key": "Khirz6zTPdfd7",
    "users": [ "6d5a81d0", "78e1e841" ]
}</pre>
        <p>因此，具有上述请求中 ID 的两个用户（"6d5a81d0"和"78e1e841"）将无法使用 <b>Khirz6zTPdfd7</b> 键编辑文档。</p>
        <p>有关使用来自 <b>文档命令服务</b> 的请求的更多信息，请参见 <a href="<%= Url.Action("command") %>">此页面</a>。</p>
    </dd>
</dl>