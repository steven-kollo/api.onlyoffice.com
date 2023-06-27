<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Odoo ONLYOFFICE 集成应用
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr"> Odoo ONLYOFFICE 集成应用</span>
    </h1>

    <p class="dscr">此<a href="https://github.com/ONLYOFFICE/onlyoffice-odoo" target="_blank">应用</a>使用户能够在 < a href="https://www.odoo.com/" target="_blank">Odoo</a> 使用 ONLYOFFICE 文档的文档。</p>
    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前可以编辑以下文档格式：DOCX、DOCXF、XLSX、PPTX。</li>
         <li>以下格式仅供查看：DJVU、DOC、DOCM、DOT、DOTM、DOTX、EPUB、FB2、FODT、HTML、MHT、ODT、OFORM、OTT、OXPS、PDF、RTF、TXT、XPS、 XML、CSV、FODS、ODS、OTS、XLS、XLSB、XLSM、XLT、XLTM、XLTX、FODP、ODP、OTP、POT、POTM、POTX、PPS、PPSM、PPSX、PPT、PPTM。</li>
         <li>该应用将在 Office 文档的文档库中创建一个新的<b>"在 ONLYOFFICE 中打开"</b>菜单选项。
             这允许多个用户实时协作并将这些更改保存回 Odoo。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
     <p>
         您需要一个可从 Odoo 和任何最终客户端解析和连接的 ONLYOFFICE Docs（文档服务器）实例。
         如果情况并非如此，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
         ONLYOFFICE Docs 还必须能够直接 POST 到 Odoo。
     </p>
     <p>启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 Odoo ONLYOFFICE 集成应用</h2>
     <p>要开始将 ONLYOFFICE Docs 与 Odoo 结合使用，必须执行以下步骤：</p>
     <p><b>选项 1</b>。 从管理面板安装</p>
     <ol>
         <li><a href="https://www.odoo.com/web/login" target="_blank">登录</a>您现有的 Odoo 帐户或 <a href="https://www.odoo.com/web/signup" target="_blank">注册</a>新帐户。</li>
         <li>转至 Odoo 管理面板，然后点击顶部菜单栏上的<b>Apps</b>。</li>
         <li>在<b>Apps</b>目录中搜索 ONLYOFFICE。</li>
         <li>点击<b>安装</b>按钮。</li>
     </ol>

    
    <p><b>选项 2</b>。 手动安装</p>
     <ol>
         <li>导航至 <a href="https://apps.odoo.com/apps" target="_blank">Odoo 应用目录</a>，然后选择您已安装的 Odoo 版本。</li>
         <li>搜索 ONLYOFFICE 并下载。 您还可以从官方 <a href="https://github.com/ONLYOFFICE/onlyoffice-odoo/releases" target="_blank">GitHub 存储库</a>下载最新的应用版本。</li>
         <li>
             <p>将 ONLYOFFICE 连接器放入 <em>/path/to/odoo/addons</em>。 确保 ONLYOFFICE 文件夹命名为 <em>onlyoffice_odoo</em>。</p>
             <p>或者，您可以在 <em>/path/to/odoo/config/odoo.conf</em> 文件中添加以下行，指定 <em>apps/addons</em> 文件夹的路径 ：</p>
             <pre>
                [options]
                addons_path = /mnt/extra-addons
             </pre>
         </li>
         <li>
             <p>安装<em>pyjwt</em>包：</p>
             <pre>
                pip install pyjwt
             </pre>
         </li>
         <li>将您的 Odoo 切换到开发者模式，然后点击<b>应用 -> 更新应用列表</b>或重新启动您的 Odoo 实例。</li>
     </ol>


  
    <h2 id="configuration" class="copy-link">配置 Odoo ONLYOFFICE 集成应用</h2>
    <p>要配置应用，请转至<b>设置</b>。 在左侧边栏找到<b>ONLYOFFICE</b>并按下。 指定已安装的ONLYOFFICE文档服务器的URL：</p>
    <span class="commandline">https://<documentserver>/</span>
    <p>
        其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE Docs</b> 的服务器的名称。
        该地址必须可从用户浏览器和 Odoo 服务器访问。
        Odoo 服务器地址还必须可以从 <b>ONLYOFFICE Docs</b> 访问才能正常工作。
    </p>
    <p>从版本 7.2 开始，默认启用 JWT，并自动生成密钥，以限制对 ONLYOFFICE Docs 的访问，这也出于安全原因和数据完整性考虑。
        在 Odoo 配置页面上指定您自己的<b>密钥</b>。 在 ONLYOFFICE Docs <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</p>

        <h2 id="how-it-works" class="copy-link">它是如何工作的</h2>

        <p>ONLYOFFICE 集成遵循<a href="https://api.onlyoffice.com/editors/basic">此处</a>的 API文档。</p>
   
   
        <br/>
        <p>在<a href="https://github.com/ONLYOFFICE/onlyoffice-odoo/tree/develop" target="_blank">此处</a>下载 Odoo ONLYOFFICE 集成应用。</p>

</asp:Content>
