<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">常见问题：文档服务器</span>
</h1>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/general") %>">一般问题</a></h5>
<p class="dscr">如果您不知道选择下面的哪个类别，只需从本节开始。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/general") %>#general_1">我是文档服务器 API 的新手。我应该从哪里开始？</a></li>
    <li><a href="<%= Url.Action("faq/general") %>#general_2">如何查看文档服务器的当前版本号？</a></li>
    <li><a href="<%= Url.Action("faq/general") %>#general_3">我想从 default.json 配置文件中更改一些文档服务器参数。我该怎么做才能使我的更改在更新后不会丢失？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/security") %>">安全问题</a></h5>
<p class="dscr">本节中有关文档服务器安全事项的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/security") %>#security_1">如何限制对我的文档服务器的访问？</a></li>
    <li><a href="<%= Url.Action("faq/security") %>#security_2">在标头和正文中发送令牌有什么区别？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/sharing") %>">共享问题</a></h5>
<p class="dscr">本节中不同权限的文档共享的相关问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_1">如何打开启用了"跟踪更改"模式的文档？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_2">如何打开启用"评论"模式的文档？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_3">如何使用'fillForms'参数？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_4">如何同时启用文档的编辑和评论模式？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_5">权限参数是否相互影响？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_6">如何在没有编辑选项的情况下在查看器中打开文档？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_7">如何禁用/启用下载文件的可能性？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_8">如何防止文档被打印？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_9">如何查看和更改某个文档的共享设置？</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_10">如何限制评论？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/embedding") %>">嵌入问题</a></h5>
<p class="dscr">本节中有关将文档插入网页（嵌入）的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/embedding") %>#embedding_1">如何将文档嵌入到网站？</a></li>
    <li><a href="<%= Url.Action("faq/embedding") %>#embedding_2">如何更改嵌入模式下按钮的行为？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/coediting") %>">共同编辑问题</a></h5>
<p class="dscr">本节中有关与其他用户共同编辑文档的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/coediting") %>#coediting_1">如何检查我需要多少个连接？</a></li>
    <li><a href="<%= Url.Action("faq/coediting") %>#coediting_2">如何找到当前正在编辑文档的用户的信息？</a></li>
    <li><a href="<%= Url.Action("faq/coediting") %>#coediting_3">如何在保存文档之前断开当前正在编辑文档的用户？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/customizing") %>">定制问题</a></h5>
<p class="dscr">本节中有关定制文档服务器外观的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_1">如何对 ONLYOFFICE 文档服务器进行白标？</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_2">如何更改文档服务器界面的默认语言？</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_3">如何启用或禁用编辑器中的聊天和/或评论面板？</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_4">如何自定义编辑器界面，例如调整顶部工具栏视图？</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_5">如何查看和更改文档的附加参数，例如其所有者或上传日期？</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_6">如何优化桌面计算机、移动设备或嵌入网页的编辑器的外观？</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_7">如何将插件连接到文档服务器以便所有编辑器用户都可以看到它们？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/integrating") %>">整合问题</a></h5>
<p class="dscr">本节中有关将文档服务器与您自己的网站和其他一些流行服务（ownCloud、Nextcloud、SharePoint 等）集成的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/integrating") %>#integrating_1">在哪里可以找到 ONLYOFFICE 文档服务器的集成示例？</a></li>
    <li><a href="<%= Url.Action("faq/integrating") %>#integrating_2">在将文档服务器与我的网站集成时，我应该指定哪些路径？</a></li>
    <li><a href="<%= Url.Action("faq/integrating") %>#integrating_3">通过本地和公共网络将 ONLYOFFICE 连接到 ownClowd/Nextcloud 时应该使用哪些设置？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/editing") %>">编辑问题</a></h5>
<p class="dscr">本节中有关使用文档服务器编辑文档的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/editing") %>#editing_1">什么是'回调处理程序'，我为什么需要它？</a></li>
    <li><a href="<%= Url.Action("faq/editing") %>#editing_2">什么是'document.key'参数？</a></li>
    <li><a href="<%= Url.Action("faq/editing") %>#editing_3">如何定义打开文件的模式（查看或编辑）？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/managingversions") %>">管理版本问题</a></h5>
<p class="dscr">本节中有关使用文档版本的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/managingversions") %>#versions_1">处理文档历史事件时可以使用哪些方法？</a></li>
    <li><a href="<%= Url.Action("faq/managingversions") %>#versions_2">如何显示具有突出显示更改的文档？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/saving") %>">保存问题</a></h5>
<p class="dscr">本节中有关保存文档的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/saving") %>#saving_1">编辑时如何将文档强制保存到我的存储中？</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_2">如何保存创建的文档？</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_3">如何将打开的文档保存为另一种文档文件类型？</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_4">如何启用或禁用'自动保存'选项？</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_5">什么是转换开始延迟时间，如何更改？</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_6">从 csv 或 txt 格式转换时,如何指定编码类型？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/renaming") %>">重命名问题</a></h5>
<p class="dscr">本节中有关重命名文件的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/renaming") %>#renaming_1">如何重命名创建的文档？</a></li>
    <li><a href="<%= Url.Action("faq/renaming") %>#renaming_2">如何为所有协作编辑器更新文档的名称？</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/usingwopi") %>">使用WOPI</a></h5>
<p class="dscr">本节中有关使用 WOPI 的问题。</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_1">如何启用WOPI？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_2">如何将文档服务器配置为仅接受来自受信任的集成商的WOPI请求？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_3">为什么我需要发现 XML 以及如何获取它？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_4">如何通过 WOPI 自定义编辑器行为？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_5">如何在应用程序中创建在线办公会话？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_6">如何通过 WOPI 限制公众对数据的访问？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_7">我在哪里可以找到可能的 WOPI 错误代码及其描述？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_8">ONLYOFFICE Docs 支持哪些 WOPI REST API 操作？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_9">如何通过WOPI限制访问ONLYOFFICE服务器的使用？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_10">如何通过 WOPI 获取有关文件属性、访问权限和编辑器设置的信息？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_11">WOPI 支持哪些操作？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_12">我可以通过 WOPI 对文档设置哪些访问权限？</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_13">ONLYOFFICE Docs API 和 WOPI 有什么区别？</a></li>
</ul>
