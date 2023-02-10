<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    转换和下载文件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">转换和下载文件</span>
    </h1>
    <p class="dscr">
        文档转换服务是 ONLYOFFICE 文档服务器的一部分。
        它允许用户将文件从一种格式转换为另一种格式，以便稍后在 <b>文档编辑器</b> 中打开它们或进行导出。
    </p>
    <p>需要进行文档转换的主要有两种情况。</p>
    <h2>文档编辑所需的临时转换</h2>
    <p>为了 <b>文档编辑器</b> 正确使用文档文件，建议在编辑之前将它们转换为 Office Open XML 格式：</p>
    <ul>
        <li><em>docx</em> 用于文本文档，</li>
        <li><em>xlsx</em> 用于电子表格的，</li>
        <li><em>pptx</em> 用于演示文稿。</li>
    </ul>
    <p>参考图和下面的步骤解释了文档转换的过程。</p>
    <img alt="文档编辑所需的临时转换" src="<%= Url.Content("~/content/img/editor/conversion.jpg") %>" />
    <ol>
        <li>用户在计算机硬盘驱动器上选择要上传到 <b>文档管理器</b>的文件。</li>
        <li><b>文档管理器</b> 将所选文件上传到 <b>文档存储服务</b>。</li>
        <li><b>文档存储服务</b> 将上传的文件发送到 ONLYOFFICE 文档服务器 <b>文档转换服务</b>，以便使用 <a href="<%= Url.Action("conversionapi") %>">conversion API</a>将它转换为 Office Open XML 格式。</li>
        <li><b>文档转换服务</b> 将所选文件转换为 Office Open XML 格式。</li>
        <li><b>文档存储服务</b> 下载转换后的文档文件。</li>
    </ol>
    <h2>文件导出</h2>
    <p>当用户需要下载与Office Open XML格式不同的文件时，ONLYOFFICE 文档服务器会将保存在 <b>文档存储服务</b> 中的文档文件转换为适当的格式，然后再导出。</p>
    <p>参考图和下面的步骤解释了文档导出的过程。</p>
    <img alt="文档导出" src="<%= Url.Content("~/content/img/editor/export.jpg") %>" />
    <ol>
        <li>用户在 <b>文档管理器</b> 中选择文件，以及下载文件必须采用的格式。</li>
        <li><b>文档管理器</b> 将此用户操作转换为对 <b>文档存储服务</b>的请求。</li>
        <li><b>文档存储服务</b> 将上传的文件发送到 ONLYOFFICE 文档服务器 <b>文档转换服务</b>，以便使用 <a href="<%= Url.Action("conversionapi") %>">conversion API</a>将它转换为适当的格式。</li>
        <li><b>文档转换服务</b> 将所选文件转换为适当的格式。</li>
        <li>转换完成后， <b>文档存储服务</b> 会下载转换后的文件。</li>
        <li><b>文档存储服务</b> 通知 <b>文档管理器</b> 转换成功。</li>
        <li><b>文档管理器</b> 下载转换后的文件。</li>
    </ol>
</asp:Content>
