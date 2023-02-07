<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Redmine ONLYOFFICE 集成插件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Redmine ONLYOFFICE 集成插件</span>
    </h1>

    <p class="dscr">该 <a href="https://github.com/ONLYOFFICE/onlyoffice-redmine" target="_blank">插件</a> 使用户能够从 <a href="https://www.redmine.org/" target="_blank">Redmine</a> 中用 ONLYOFFICE Docs编辑office文档。</p>

    <p>该插件可以在官方 <a href="https://www.redmine.org/plugins/onlyoffice_redmine" target="_blank">Redmine插件目录</a>中获得。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>目前，可以编辑以下文档格式：DOCX、XLSX、PPTX、DOCXF、OFORM。</li>
        <li>以下格式仅供查看：DOC、DOCM、DOT、DOTX、DOTM、ODT、FODT、OTT、RTF、TXT、HTML、HTM、MHT、XML、PDF、DJVU、FB2、EPUB、XPS、XLS、XLSM、XLT、XLTX、XLTM、ODS、FODS、OTS、CSV、PPS、PPSX、PPSM、PPT、PPTM、POT、POTX、POTM、ODP、FODP、OTP。</li>
        <li>该插件将在 Office 文档的文档库中创建一个新的菜单选项 <b>在ONLYOFFICE 中编辑</b>。这允许多个用户实时协作并将这些更改保存到Redmine中。</li>
    </ul>


    <h2 id="install-doc" class="copy-link">安装 ONLYOFFICE 文档</h2>
    <p>
        您需要一个可从 Redmine 和任何客户终端解析和连接的 ONLYOFFICE Docs（文档服务器）实例。
        如果不是这种情况，请使用官方 <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs 文档页面</a>。
        ONLYOFFICE Docs 还必须能够直接发布到 Redmine。
    </p>
    <p>启动 ONLYOFFICE Docs 实例的最简单方法是使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>。</p>


    <h2 id="install" class="copy-link">安装 Redmine ONLYOFFICE 集成插件</h2>
    <p>要开始使用带有 Redmine 的 ONLYOFFICE Docs，必须执行以下步骤：</p>
    <ol>
        <li>如果您是 Redmine 的新手，请按照 <a href="https://www.redmine.org/projects/redmine/wiki/RedmineInstall" target="_blank">这些说明</a>进行安装。</li>
        <li>
            <p>下载Redmine ONLYOFFICE 集成插件。您可以克隆主分支或下载最新的压缩版本。
            在安装之前，请确保 Redmine 实例已停止。</p>
            <pre>
git clone https://github.com/ONLYOFFICE/onlyoffice-redmine
</pre>
            <p>转到 Redmine ONLYOFFICE 集成插件文件夹并获取子模块：</p>
            <pre>
cd onlyoffice-redmine
git submodule update --init --recursive
</pre>
        </li>
        <li>将 <b>onlyoffice_redmine</b> 插件目录放入 plugins 中。plugins 子目录必须命名为 <b>onlyoffice_redmine</b>。
            如有必要，将 <b>onlyoffice_redmine-x.y.z</b> 重命名为 <b>onlyoffice_redmine</b>。</li>
        <li>
            <p>转到Redmine目录：</p>
            <pre>
cd redmine
</pre>
        </li>
        <li>
            <p>安装依赖项：</p>
            <pre>
bundle install
</pre>
        </li>
        <li>
            <p>初始化/更新数据库：</p>
            <pre>
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=onlyoffice_redmine
</pre>
        </li>
    </ol>


    <h2 id="configuration" class="copy-link">配置 Redmine ONLYOFFICE 集成插件</h2>
    <p>通过 Redmine 界面配置插件。转到 <b>管理 -> 插件 -> Onlyoffice Redmine 插件 -> 配置</b> 并指定以下参数：</p>
    <ul>
        <li>
            <p><b>文件编辑服务地址</b>: 要连接 ONLYOFFICE Docs，请输入以下地址：</p>
            <pre>
https://&lt;documentserver&gt;:&lt;port&gt;/
</pre>
            <p>其中 <b>documentserver</b> 是服务器的名称， <b>port</b> 是安装了 <b>ONLYOFFICE Docs</b> 的端口号。</p>
        </li>
        <li><b>密钥</b>：从7.2版本开始，默认启用JWT，并自动生成密钥以限制对ONLYOFFICE Docs的访问，这也是出于安全原因和数据完整性考虑。
            在 Redmine 配置页面上指定您自己的密钥。 在 ONLYOFFICE Docs <a href="/editors/signature/">配置文件</a>中，指定相同的密钥并启用验证。</li>
    </ul>
    <p>您还可以配置 <b>编辑器定制设置</b>：</p>
    <ul>
        <li>显示或隐藏 <b>聊天</b> 菜单按钮</li>
        <li>更紧凑显示标题</li>
        <li>显示或隐藏 <b>反馈和支持</b> 菜单按钮</li>
        <li>显示或隐藏 <b>帮助</b> 菜单按钮</li>
        <li>显示单色工具栏标题</li>
    </ul>


    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <p>遵循 <a href="<%= Url.Action("basic") %>">此处</a>的 API 文档集成ONLYOFFICE。</p>
    <p>Redmine ONLYOFFICE 集成插件允许打开上传到 <b>Issues</b>、 <b>Files</b>、 <b>Documents</b>、 <b>Wiki</b>或 <b>News</b> 模块的文件以进行查看和共同编辑。
        对于每个模块，查看/编辑文件的访问权限取决于用户角色的设置（权限）。</p>

    <ul>
        <li>
            <p><b>问题模块</b></p>
            <p>创建任务时添加的文件或任务注释中添加的文件是可供查看和编辑的。</p>
            <p>文件编辑适用于具有 <b>编辑问题</b> 权限的用户角色。</p>
            <p>具有 <b>查看问题</b> 权限的用户角色可以打开文件进行查看。</p>
        </li>
        <li>
            <p><b>文件模块</b></p>
            <p>文件仅供具有 <b>查看文件</b> 或 <b>管理文件</b> 权限的用户查看。</p>
        </li>
        <li>
            <p><b>文档模块</b></p>
            <p>此模块中上传的文件可供查看和编辑。</p>
            <p>文档编辑适用于具有 <b>编辑文档</b> 权限的用户角色。</p>
            <p>具有 <b>查看文档</b> 权限的用户角色可以打开文档进行查看。</p>
        </li>
        <li>
            <p><b>维基模块</b></p>
            <p>此模块中上传的文件可供查看和编辑。</p>
            <p>文件编辑适用于具有 <b>编辑 Wiki 页面</b> 权限的用户角色。</p>
            <p>具有 <b>查看 Wiki</b> 权限的用户角色可以打开文件进行查看。</p>
        </li>
        <li>
            <p><b>新闻模块</b></p>
            <p>此模块中上传的文件可供查看和编辑。</p>
            <p>文件编辑适用于具有 <b>编辑新闻</b> 权限的用户角色。</p>
            <p>具有 <b>查看新闻</b> 权限的用户角色可以打开文件进行查看。</p>
        </li>
        <li>
            <p><b>保存更改</b></p>
            <p>在文档中所做的所有更改都保存在原始文件中。</p>
        </li>
    </ul>

    <br />

    <p>在 <a href="https://github.com/ONLYOFFICE/onlyoffice-redmine" target="_blank">此处</a>下载 Redmine ONLYOFFICE 集成插件。</p>

</asp:Content>
