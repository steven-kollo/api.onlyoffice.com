<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        重命名问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="renaming_1">
    <dt>如何重命名创建的文档？</dt>
    <dd>
        <p>请参阅 <a href="<%= Url.Action("rename") %>">重命名文件部分</a>，了解文件重命名在Document Server中的工作方式，以及重命名创建的文档需要什么。</p>
    </dd>
</dl>
<dl class="faq_block" id="renaming_2">
    <dt>如何为所有协作编辑器更新文档的名称？</dt>
    <dd>
        <p>为此，可以使用 <a href="<%= Url.Action("command/meta") %>">元</a> 选项。必须使用 <em>c</em> 参数的 <em>元</em> 值将请求发送到 <a href="<%= Url.Action("command") %>">文档命令服务</a>：</p>
        <pre>
        {
    "c": "meta",
    "key": "Khirz6zTPdfd7",
    "meta": {
        "title": "Example Document Title.docx"
    }
}
</pre>
    </dd>
</dl>
