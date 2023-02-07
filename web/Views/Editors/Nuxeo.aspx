<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Nuxeo ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Nuxeo ONLYOFFICE 集成插件</span>
    </h1>

    <p>该 <a href="https://github.com/ONLYOFFICE/onlyoffice-nuxeo" target="_blank">插件</a> 使用户能够从 <a href="https://www.nuxeo.com/">Nuxeo</a> 中用 ONLYOFFICE Docs编辑办公文档。</p>
    
    <h2 id="features" class="copy-link">特性</h2>

    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：PDF、ODT、ODS、ODP、DOC、XLS、PPT。</li>
        <li>该插件允许多个用户实时协作并将这些更改保存到 Nuxeo。</li>
    </ul>

    <h2 id="installing-onlyoffice-document-server" class="copy-link">安装 ONLYOFFICE 文档</h2>

    <p>
        您将需要一个 ONLYOFFICE Docs（文档服务器）实例，该实例可从 Nuxeo 和任何终端客户端解析和连接。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 Nuxeo中。
    </p>
    <p>启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>

    <h2 id="installing-nuxeo-onlyoffice-integration-plugin" class="copy-link">安装 Nuxeo ONLYOFFICE 集成插件</h2>

    <p>从 <a href="https://connect.nuxeo.com/nuxeo/site/marketplace" target="_blank">市场</a>安装它。</p>

    <p>您也可以使用 <a href="https://doc.nuxeo.com/nxdoc/installing-a-new-package-on-your-instance/" target="_blank">nuxeoctl</a>安装它。</p>

    <span class="commandline">nuxeoctl mp-install /path/to/onlyoffice-nuxeo-package-x.x.zip</span>

    <h2 id="configuring-nuxeo-onlyoffice-integration-plugin" class="copy-link">配置 Nuxeo ONLYOFFICE 集成插件</h2>

    <p>编辑 <a href="https://doc.nuxeo.com/nxdoc/configuration-parameters-index-nuxeoconf/" target="_blank">nuxeo.conf</a> 并添加以下行：</p>

    <pre>onlyoffice.docserv.url=http://documentserver/</pre>

    <p>
        其中 <b>documentserver</b> 是安装了 <b>ONLYOFFICE Docs</b> 的服务器的名称。
         该地址必须可以从用户浏览器和 Nuxeo 服务器访问。
         为了正常工作，Nuxeo 服务器地址也必须可以从 <b>ONLYOFFICE Docs</b> 访问。
    </p>

    <p>从 7.2 版开始，默认情况下启用 JWT，并自动生成密钥以限制对 ONLYOFFICE Docs 的访问，这也是出于安全原因和数据完整性考虑。
        通过将 <b>onlyoffice.jwt.secret=yoursecret</b> 行添加到 <em>nuxeo.conf</em> 文件来指定您自己的密钥。
        在 ONLYOFFICE Docs <a href="/editors/signature/" target="_blank">配置文件</a>中，指定相同的密钥并启用验证。</p>

    <h2 id="compiling-nuxeo-onlyoffice-plugin" class="copy-link">编译 Nuxeo ONLYOFFICE 插件</h2>

    <p>要构建 Nuxeo 插件，必须为 Ubuntu 执行以下步骤：</p>
    <ol>
        <li>
            <p>
                成功构建需要稳定的 Java 版本。
                如果您没有安装它，请使用以下命令安装 <b>Open JDK 8</b>：
            </p>
            <pre>sudo apt-get update
sudo apt-get install openjdk-8-jdk</pre>
        </li>
        <li>
            <p>
                安装最新的 <b>Maven</b>。<a href="https://maven.apache.org/install.html" target="_blank">此处</a>描述了安装过程。
            </p>
        </li>
        <li>
            <p>下载 Nuxeo ONLYOFFICE 集成插件源代码：</p>
            <pre>git clone https://github.com/onlyoffice/onlyoffice-nuxeo.git</pre>
        </li>
        <li>
            <p>编译 Nuxeo ONLYOFFICE 集成插件：</p>

            <pre>
cd onlyoffice-nuxeo/
mvn clean install</pre>
        </li>
        <li>
            <p>内置包位于此处 <em>./onlyoffice-nuxeo-package/target/onlyoffice-nuxeo-package-xxzip</em>。</p>
        </li>
    </ol>

    <h2 id="how-it-works" class="copy-link">这是如何运作的</h2>

    <p>ONLYOFFICE 集成遵循 <a href="https://api.onlyoffice.com/editors/basic">此处</a>的 API 文档。</p>


    <br />
    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-nuxeo" target="_blank">此处</a>下载 Nuxeo ONLYOFFICE 集成插件。</p>

</asp:Content>
