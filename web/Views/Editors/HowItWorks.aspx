<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    它是如何运作的
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">它是如何运作的</span>
    </h1>

    <p class="dscr">
        在ONLYOFFICE document Server中处理文档文件是一个相当简单的过程，但当您单击文档链接在浏览器中打开文档、保存文档或将其从计算机上载到文档服务器时，需要了解发生了什么。
    </p>
    <p>在本节中，您将学习如何：</p>
    <ul class="columns-2">
        <li><a href="<%= Url.Action("open") %>">打开一个文件</a></li>
        <li><a href="<%= Url.Action("save") %>">保存文件</a></li>
        <li><a href="<%= Url.Action("coedit") %>">共同编辑文件</a></li>
        <li><a href="<%= Url.Action("history") %>">查看文档历史记录</a></li>
        <li><a href="<%= Url.Action("actionlink") %>">使用操作链接</a></li>
        <li><a href="<%= Url.Action("mentions") %>">提及用户</a></li>
        <li><a href="<%= Url.Action("rename") %>">重命名文件</a></li>
        <li><a href="<%= Url.Action("review") %>">查看文件</a></li>
        <li><a href="<%= Url.Action("inlineeditors") %>">使用内联编辑器</a></li>
        <li><a href="<%= Url.Action("conversion") %>">转换和下载文件</a></li>
        <li><a href="<%= Url.Action("security") %>">保护文档</a></li>
        <li><a href="<%= Url.Action("anonymoususers") %>">为匿名用户设置名称</a></li>
        <li><a href="<%= Url.Action("commenting") %>">对文档发表评论</a></li>
        <li><a href="<%= Url.Action("comparing") %>">比较文件</a></li>
        <li><a href="<%= Url.Action("viewing") %>">Viewing</a></li>
        <li><a href="<%= Url.Action("mobileintegration") %>">Mobile integration</a></li>
    </ul>
    
    <br />
    <h2>用户文档交互</h2>
    <p>用户文档交互在客户端和服务器端都完成。</p>
    <p>下面解释了整个当前文档中使用的主要概念。</p>
    <p class="list-header">客户端包括：</p>
    <ul>
        <li>
            <b>文档管理器</b> - 显示在用户浏览器中的文档列表，用户可以在其中选择必要的文档并对其执行一些操作（根据提供的权限，用户可以打开文档以查看或编辑，以及与其他用户共享文档）。
        </li>
        <li>
            <b>文档编辑器</b> - 文档查看和编辑界面，具有所有最常用的文档编辑功能，用作用户和 <b>文档编辑服务</b>之间的媒介。
        </li>
    </ul>

    <p class="list-header">服务器端包括：</p>
    <ul>
        <li>
            <b>文档存储服务</b> - 服务器服务，它存储具有适当访问权限的用户可用的所有文档。
            它将文档 ID 和指向这些文档的链接提供给用户在浏览器中看到 的 <b>文档管理器</b>。
        </li>
        <li>
            <b>文档编辑服务</b> - 服务器服务，它允许执行文档查看和编辑（如果用户具有执行此操作的适当权限）。
            <b>文档编辑器</b> 界面用于访问所有 <b>文档编辑服务</b> 功能。
        </li>
        <li>
            <b>文档命令服务</b> - 服务器服务，它允许使用 <b>文档编辑服务</b>执行附加命令。
        </li>
        <li>
            <b>文档转换服务</b> - 服务器服务，它允许将文档文件转换为适当的 Office Open XML 格式（文本文档为<em>docx</em> ，电子表格为 <em>xlsx</em> ，演示文稿为 <em>pptx</em> ），以供编辑或下载的。
        </li>
        <li>
            <b>文档生成器服务</b> - 服务器服务，它允许轻松构建文档而无需实际运行文档处理编辑器。
        </li>
    </ul>

    <p class="list-header">
        请注意，ONLYOFFICE 文档服务器包括 <b>文档编辑器</b>、 <b>文档编辑服务</b>、 <b>文档命令服务</b>、 <b>文档转换服务</b> 和 <b>文档生成器服务</b>。
        <b>文档管理器</b> 和 <b>文档存储服务</b> 要么包含在社区服务器中，要么必须由在自己的服务器上使用 ONLYOFFICE 文档服务器的软件集成商实施。
    </p>

</asp:Content>
