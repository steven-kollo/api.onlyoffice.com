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

    <p class="dscr">此<a href="https://github.com/ONLYOFFICE/onlyoffice-redmine" target="_blank">插件</a>让用户能够用 ONLYOFFICE 文档编辑来自 <a href="https://www.redmine.org/" target="_blank">Redmine</a> 的附件。</p>

    <p>该插件可在官方 <a href="https://www.redmine.org/plugins/onlyoffice_redmine" target="_blank">Redmine 插件目录</a>中找到。</p>

    <h2 id="features" class="copy-link">特性</h2>
    <ul>
        <li>查看和编辑文本文档、电子表格、演示文稿和表单。</li>
        <li>使用两种协同编辑模式（快速和严格）实时协同编辑文档、跟踪更改、评论、内置聊天。</li>
        <li>设置页面，用于设置与服务器的连接和 JWT 身份验证，自定义编辑器的外观。</li>
        <li>授权编辑者可在移动设备上查看。</li>
        <li>使用考虑用户语言偏好的模板创建新附件。</li>
        <li>转换附件并保存或下载。</li>
    </ul>

    <h2 id="formats" class="copy-link">支持的格式</h2>
    <table class="table-formats">
        <tbody>
            <tr class="scroll-arrow" style="margin-top:247px;"></tr>
            <tr>
                <th rowspan="2"></th>
            </tr>
            <tr>
                <td>djvu</td>
                <td>doc</td>
                <td>docm</td>
                <td>docx</td>
                <td>docxf</td>
                <td>dot</td>
                <td>dotm</td>
                <td>dotx</td>
                <td>epub<span class="required">*</span></td>
                <td>fb2<span class="required">*</span></td>
                <td>fodt</td>
                <td>htm</td>
                <td>html<span class="required">*</span></td>
                <td>mht</td>
                <td>mhtml</td>
                <td>odt<span class="required">*</span></td>
                <td>oform</td>
                <td>ott<span class="required">*</span></td>
                <td>oxps</td>
                <td>pdf</td>
                <td>rtf<span class="required">*</span></td>
                <td>stw</td>
                <td>sxw</td>
                <td>txt<span class="required">*</span></td>
                <td>wps</td>
                <td>wpt</td>
                <td>xml</td>
                <td>xps</td>
                <td>csv<a href="#requiredDescr" class="required">*</a></td>
                <td>et</td>
                <td>ett</td>
                <td>fods</td>
                <td>ods<a href="#requiredDescr" class="required">*</a></td>
                <td>ots<a href="#requiredDescr" class="required">*</a></td>
                <td>sxc</td>
                <td>xls</td>
                <td>xlsb</td>
                <td>xlsm</td>
                <td>xlsx</td>
                <td>xlt</td>
                <td>xltm</td>
                <td>xltx</td>
                <td>dps</td>
                <td>dpt</td>
                <td>fodp</td>
                <td>odp<span class="required">*</span></td>
                <td>otp<span class="required">*</span></td>
                <td>pot</td>
                <td>potm</td>
                <td>potx</td>
                <td>pps</td>
                <td>ppsm</td>
                <td>ppsx</td>
                <td>ppt</td>
                <td>pptm</td>
                <td>pptx</td>
                <td>sxi</td>
            </tr>
            <tr>
                <td>查看</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>编辑</td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>创建</td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - 能够打开此格式的文件来进行编辑，
        在<a href="#formats-settings">格式设置</a>中检查它。
        由于某些格式限制，可能会发生数据丢失。</em></span>

    <h2 id="install-doc" class="copy-link">安装ONLYOFFICE文档</h2>
    <p>
        在继续安装插件之前，请确保您拥有一个可从 Redmine 和任何最终客户端解析和连接的
        ONLYOFFICE Docs（文档服务器）实例。
        此外，确保ONLYOFFICE Docs可以直接POST到Redmine。
    </p>
    <p>我们建议使用 <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a> 安装 ONLYOFFICE Docs。
        或者，对于 Debian、Ubuntu 或衍生版本，您也可以按照<a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">这些说明</a>进行操作。
 </p>


    <h2 id="install" class="copy-link">安装Redmine ONLYOFFICE集成插件</h2>
    <p>要安装该插件，您需要Redmine 4.2或更高版本，或者5.0或更高版本。
        还需要注意的是，该插件与 Ruby 版本 2.7.2 或更高版本、或者 3.0.0 或更高版本兼容。
        我们建议将Redmine 5 与Ruby 3 一起使用。</p>
    <ol>
        <li>如果您是 Redmine 新手，请按照<a href="https://www.redmine.org/projects/redmine/wiki/RedmineInstall" target="_blank">这些说明</a>安装它。</li>
        <li>
            <p>下载<a href="https://github.com/ONLYOFFICE/onlyoffice-redmine/releases" target="_blank">插件</a>：</p>
            <pre>
curl --location https://github.com/ONLYOFFICE/onlyoffice-redmine/releases/latest/download/onlyoffice_redmine.tar.zst --output onlyoffice_redmine.tar.zst
</pre>
        </li>
        <li>
            <p>解压到插件目录：</p>
            <pre>
tar --extract --file onlyoffice_redmine.tar.zst --directory plugins
</pre>
        </li>
        <li>
            <p>如果Redmine没有自动安装插件的依赖项，请安装：</p>
            <pre>
bundle install
</pre>
        </li>
        <li>
            <p>执行迁移：</p>
            <pre>
RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=onlyoffice_redmine
</pre>
        </li>
        <li>重新启动Redmine。</li>
    </ol>
    <p>在 Redmine <a href="https://www.redmine.org/projects/redmine/wiki/Plugins#Installing-a-plugin" target="_blank">Wiki 页面</a>上了解有关插件安装的更多信息。</p>


    <h2 id="configuration" class="copy-link">配置Redmine ONLYOFFICE集成插件</h2>
    <p>通过Redmine界面配置插件。 转到<b>管理->插件</b>，找到Redmine的ONLYOFFICE集成插件，然后点击<b>配置</b>：</p>
    <img alt="Redmine settings" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/redmine-settings.png") %>"  />

    <p id="general-settings" class="copy-link"><b>通用设置</b></p>
    <ul>
        <li>
            <p><b>文档编辑服务地址</b>。 已安装的ONLYOFFICE Docs（文档服务器）的URL。 留空以禁用插件。</p>
        </li>
    </ul>

    <p id="advanced-settings" class="copy-link"><b>高级服务器设置</b></p>
    <ul>
        <li>ONLYOFFICE Docs 来自服务器的内部请求的地址。</li>
        <li>来自 ONLYOFFICE Docs 的内部请求的服务器地址。</li>
        <li>连接到演示版 ONLYOFFICE Docs 服务器。</li>
    </ul>

    <p id="security-settings" class="copy-link"><b>安全</b></p>
    <ul>
        <li><b>密钥</b>。 从版本 7.2 开始，默认启用 JWT，并自动生成密钥，用以限制对 ONLYOFFICE Docs 的访问，
            并出于安全原因和数据完整性考虑。 在 ONLYOFFICE Docs
            <a href="/editors/signature/">配置文件</a>中指定您的密钥，然后在插件的设置页面中指定相同的密钥。 留空以禁用身份验证。</li>
        <li>授权标头。</li>
        <li>禁用证书验证（不安全）。</li>
    </ul>

    <p id="editor-customization-settings" class="copy-link"><b>编辑器自定义设置</b></p>
    <ul>
        <li>显示聊天菜单按钮。</li>
        <li>将标题显示得更紧凑。</li>
        <li>显示反馈和支持菜单按钮。</li>
        <li>显示“帮助”菜单按钮。</li>
        <li>显示单色工具栏标题。</li>
    </ul>

    <p id="formats-settings" class="copy-link"><b>格式</b></p>
    <ul>
        <li>指定允许直接打开进行编辑的格式列表。</li>
    </ul>


    <h2 id="howitworks" class="copy-link">它是如何运作的</h2>
    <p>该插件使用<a href="<%= Url.Action("basic") %>">ONLYOFFICE Docs API</a>，并集成到各种Redmine页面中，
        包括<a href="#documents">文档 </a>、<a href="#attachments">附件</a>、<a href="#files">文件</a>、
        <a href="#issues">问题</a>、 <a href="#news">新闻</a>、<a href="#wiki">维基</a>和<a href="#forums">论坛</a>。
        此外，该插件还添加了常规页面，
        例如<a href="#create-page">“在 ONLYOFFICE 中创建”</a> 和 <a href="#convert">“使用 ONLYOFFICE 进行转换”</a>。</p>

    <ul>
        <li>
            <p id="documents" class="copy-link"><b>文档</b></p>
            <img alt="Documents page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/documents-page.png") %>"  />
            <p>在<b>文档</b>页面上，用户可以打开附件进行查看、编辑、创建或转换。
                根据用户权限的不同，界面中显示的选项可能会有所不同。</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>选项</td>
                        <td>权限</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">查看</td>
                        <td>查看文档</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">编辑</td>
                        <td>查看文档、编辑文档</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="create" class="copy-link">创建</td>
                        <td>查看文档、编辑文档</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">转换：保存</td>
                        <td>查看文档、编辑文档</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">转换：下载</td>
                        <td>查看文档</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="attachments" class="copy-link"><b>附件</b></p>
            <img alt="Attachment page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/attachment-page.png") %>"  />
            <p>在<b>附件</b>页面上，用户可以打开附件进行查看、编辑或转换。
                根据用户对附件所在模块的权限，界面中显示的选项可能会有所不同。</p>
        </li>
        <li>
            <p id="files" class="copy-link"><b>文件</b></p>
            <img alt="Files page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/files-page.png") %>"  />
            <p>在<b>文件</b>页面上，用户可以打开附件进行查看、编辑或转换。
                界面中显示的选项可能会根据用户的权限而有所不同。</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>选项</td>
                        <td>权限</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">查看</td>
                        <td>查看文件</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">编辑</td>
                        <td>查看文件、管理文件</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">转换：保存</td>
                        <td>查看文件、管理文件</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">转换：下载</td>
                        <td>查看文件</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="issues" class="copy-link"><b>问题</b></p>
            <img alt="Issues page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/issues-page.png") %>"  />
            <p>在<b>问题</b>页面上，用户可以打开附件进行查看、编辑或转换。
                界面中显示的选项可能会根据用户的权限而有所不同。</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>选项</td>
                        <td>权限</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">查看</td>
                        <td>查看问题</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">编辑</td>
                        <td>查看问题、编辑自己的问题</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">转换：保存</td>
                        <td>查看问题、编辑自己的问题</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">转换：下载</td>
                        <td>查看问题</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="news" class="copy-link"><b>新闻</b></p>
            <img alt="News page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/news-page.png") %>"  />
            <p>在<b>新闻</b>页面上，用户可以打开附件进行查看、编辑或转换。
                界面中显示的选项可能会根据用户的权限而有所不同。</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>选项</td>
                        <td>权限</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">查看</td>
                        <td>查看新闻</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">编辑</td>
                        <td>查看新闻、管理新闻</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">转换：保存</td>
                        <td>查看新闻、管理新闻</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">转换：下载</td>
                        <td>查看新闻</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="wiki" class="copy-link"><b>Wiki（维基）</b></p>
            <img alt="Wiki page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/wiki-page.png") %>"  />
            <p>在<b>Wiki</b>页面上，用户可以打开附件进行查看、编辑或转换。
                界面中显示的选项可能会根据用户的权限而有所不同。</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>选项/td>
                        <td>权限</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">查看</td>
                        <td>查看 wiki</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">编辑</td>
                        <td>查看 wiki、编辑 wiki 页面</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">转换：保存</td>
                        <td>查看 wiki、编辑 wiki 页面</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">转换：下载</td>
                        <td>查看 wiki</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="forums" class="copy-link"><b>论坛</b></p>
            <img alt="Forums page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/forums-page.png") %>"  />
            <p>在<b>论坛</b>页面上，用户可以打开附件进行查看、编辑或转换。
                界面中显示的选项可能会根据用户的权限而有所不同。</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>选项</td>
                        <td>权限</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">查看</td>
                        <td>查看消息</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">编辑</td>
                        <td>查看消息、编辑消息</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">转换：保存</td>
                        <td>查看消息、编辑消息</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">转换：下载</td>
                        <td>查看消息</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="view-or-edit" class="copy-link"><b>在 ONLYOFFICE 中查看或编辑</b></p>
            <img alt="View Or Edit In ONLYOFFICE" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/view-or-edit.png") %>"  />
            <p>在<b>在ONLYOFFICE中查看或编辑</b>页面上，用户可以查看或编辑附件。
                该页面的可见性取决于用户对附件所在模块的权限。</p>
        </li>
        <li>
            <p id="create-page" class="copy-link"><b>在 ONLYOFFICE 中创建</b></p>
            <img alt="Create in ONLYOFFICE" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/create-page.png") %>"  />
            <p>在<b>在 ONLYOFFICE 中创建</b>页面上，用户可以使用考虑用户语言首选项的模板创建附件。
                查看<a href="#formats">支持的格式</a>。 该页面的可见性取决于用户对该模块的权限。</p>
        </li>
        <li>
            <p id="convert" class="copy-link"><b>使用 ONLYOFFICE 进行转换</b></p>
            <img alt="Convert with ONLYOFFICE" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/convert-page.png") %>"  />
            <p>在<b>使用ONLYOFFICE转换</b>页面上，用户可以转换附件。
                该页面的可见性取决于用户对附件所在模块的权限。</p>
        </li>
    </ul>

</asp:Content>
