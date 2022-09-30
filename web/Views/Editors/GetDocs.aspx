<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Styles.Render("~/content/get-docs") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    获取 ONLYOFFICE 文档
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">获取 ONLYOFFICE 文档</span>
    </h1>

    <p class="dscr">
        <b>ONLYOFFICE Docs</b> 适用于 Windows、Linux 和 Docker。
    </p>

    <p>要将其安装在本地服务器上，请按照 <b>ONLYOFFICE 帮助中心</b>中的说明进行操作：</p>
    <ul class="get-docs-block">
        <li class="get-docs-option">
            <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx" target="_blank"><div class="get-docs-img windows"></div></a>
            <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx" target="_blank">获取适用于 Windows 的 ONLYOFFICE 文档</a></p>
        </li>
        <li class="get-docs-option">
            <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx" target="_blank"><div class="get-docs-img linux"></div></a>
            <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx" target="_blank">获取适用于 Linux 的 ONLYOFFICE 文档</a></p>
        </li>
        <li class="get-docs-option">
            <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx" target="_blank"><div class="get-docs-img docker"></div></a>
            <p class="get-docs-link"><a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx" target="_blank">获取 Docker 的 ONLYOFFICE 文档</a></p>
        </li>
    </ul>

    <p>在使用 ONLYOFFICE Docs API 文档之前，如有必要，建议进行以下设置：</p>
    <ul>
        <li>将 ONLYOFFICE Docs 切换到 HTTPS 协议以使用 <a href="https://helpcenter.onlyoffice.com/installation/docs-community-https-linux.aspx" target="_blank">SSL</a>证书进行安全连接；</li>
        <li>为 ONLYOFFICE Docs添加额外的 <a href="https://helpcenter.onlyoffice.com/installation/docs-community-install-fonts-linux.aspx" target="_blank">字体</a> 以增强编辑器的功能；</li>
        <li>下载应用程序界面的 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx" target="_blank">外部主题</a>。</li>
    </ul>

</asp:Content>
