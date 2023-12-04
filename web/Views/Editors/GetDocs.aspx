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
        <b>ONLYOFFICE 文档</b> 适用于 Windows、Linux 和 Docker。
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

    <p>在使用 ONLYOFFICE 文档 API 文档之前，如有必要，建议进行以下设置：</p>
    <ul>
        <li>配置<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx" target="_blank">ONLYOFFICE 文档配置文件中的</a>ONLYOFFICE 文档服务器设置;</li>
        <li>将 ONLYOFFICE 文档切换到 HTTPS 协议以使用 <a href="https://helpcenter.onlyoffice.com/installation/docs-community-https-linux.aspx" target="_blank">SSL</a>证书进行安全连接；</li>
        <li>为 ONLYOFFICE 文档添加额外的 <a href="https://helpcenter.onlyoffice.com/installation/docs-community-install-fonts-linux.aspx" target="_blank">字体</a> 以增强编辑器的功能；</li>
        <li>为应用程序界面添加您自己的<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx" target="_blank">颜色主题</a></li>
    </ul>

    <h2 class="copy-link" id="healthcheck">Health check</h2>
    <p>To check if the editors are available, send the GET request to <em>/healthcheck</em>.
        This request checks the availability of the databases, message broker, Redis connection, and storage.</p>
    <p>The response must be <b>true</b>, which means that the editors are ready to use.</p>
    <p>If something went wrong, make sure that you have followed the installation instructions above.</p>

</asp:Content>
