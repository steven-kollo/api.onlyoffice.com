<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">External access to the document editing</span>
</h1>

<p class="dscr">The following examples will show you how to edit text documents, spreadsheets, presentations, and fillable forms from an external source.
要实现这一点，请使用我们的 <a href="<%= Url.Action("connector") %>">Automation API</a>。</p>

<ul class="connector-block">
    <li class="connector-example">
        <div class="connector-info"><a href="<%= Url.Action("interactingoutside/comments") %>"><div class="example-img comments"></div></a>
        <p class="name-example-connector"><a href="<%= Url.Action("interactingoutside/comments") %>">处理评论</a></p>
        <p>从文档中收集所有评论，并将其显示在自定义界面中。</p></div>
        <p class="block_more"><a href="<%= Url.Action("interactingoutside/comments") %>">更多</a></p>
    </li>
    <li class="connector-example">
        <div class="connector-info"><a href="<%= Url.Action("interactingoutside/reviewwork") %>"><div class="example-img review-work"></div></a>
        <p class="name-example-connector"><a href="<%= Url.Action("interactingoutside/reviewwork") %>">处理评审更改</a></p>
        <p>从外部管理评审过程。</p></div>
        <p class="block_more"><a href="<%= Url.Action("interactingoutside/reviewwork") %>">更多</a></p>
    </li>
    <li class="connector-example">
        <div class="connector-info"><a href="<%= Url.Action("interactingoutside/fillingform") %>"><div class="example-img filling-form"></div></a>
        <p class="name-example-connector"><a href="<%= Url.Action("interactingoutside/fillingform") %>">填写表单</a></p>
        <p>填充表单中的空单元格。</p></div>
        <p class="block_more"><a href="<%= Url.Action("interactingoutside/fillingform") %>">更多</a></p>
    </li>
</ul>
