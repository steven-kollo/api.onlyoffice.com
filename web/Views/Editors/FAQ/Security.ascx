<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        安全问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="security_1">
    <dt>如何限制对我的文档服务器的访问？</dt>
    <dd>
        <p>为了防止未经授权访问您的文档和替换 ONLYOFFICE 文档服务器请求中的重要参数，它使用 JSON Web Token (JWT) 兼容令牌来确保安全性。令牌由服务器密钥签名，因此客户端能够验证令牌是否合法。</p>
        <p>该 <b>令牌</b> 是在初始化文档服务器时以及在 <b>文档存储服务</b> 与 <b>文档编辑服务</b>、 <b>文档命令服务</b> 和 <b>文档转换服务</b>之间交换命令时添加到配置中的。</p>
        <p>文档服务器 验证令牌。如果有效，则使用来自 <em>有效负载</em> 的数据，而不是来自主要参数的相应数据。如果令牌无效，则不会执行命令，也不会使用或更改任何参数。</p>
        <p>令牌可以在请求 <a href="<%= Url.Action("signature/request") %>">标头</a> 或 <a href="<%= Url.Action("signature/body") %>">正文</a>中发送。</p>
    </dd>
</dl>
<dl class="faq_block" id="security_2">
    <dt>在标头和正文中发送令牌有什么区别？</dt>
    <dd>
        <p>从文档服务器5.2版开始，可以在请求标头和正文中发送令牌。这两种方法的主要区别在于长度限制：HTTP header 有长度限制，一些服务器（例如一些 NGINX 版本）不接受 header 长度超过 4 KB 的请求，而其他服务器将 header 长度限制为8&ndash;48 KB。如果标头长度超过这些值，服务器将返回 <em>413 Entity Too Large</em> 错误。</p>
        <p>为避免此限制，在请求正文中发送令牌应该是执行此操作的首选方法。从版本 7.1 开始，传入请求使用正文中的令牌（如果存在）。否则，将采用标头令牌。传出请求同时使用正文中的令牌和标头中的令牌。
        它们可以不同。例如，由于标头中令牌的大小限制，可以从标头令牌中删除有关版本历史的信息。</p>
        <p>有关更多详细信息，请参阅 <a href="<%= Url.Action("signature/request") %>">标头中带有令牌的请求</a> 或 <a href="<%= Url.Action("signature/body") %>">正文部分中带有令牌的请求</a>。</p>
    </dd>
</dl>