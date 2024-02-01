<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Redmine ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Redmine ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-redmine" target="_blank">plugin</a> enables users to edit attachments from <a href="https://www.redmine.org/" target="_blank">Redmine</a> using ONLYOFFICE Docs.</p>

    <p>The plugin is available in the official <a href="https://www.redmine.org/plugins/onlyoffice_redmine" target="_blank">Redmine Plugins Directory</a>.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Viewing and editing text documents, spreadsheets, presentations, and forms.</li>
        <li>Co-editing documents in real time using two co-editing modes (Fast and Strict), Track Changes, comments, built-in chat.</li>
        <li>Settings page to set up connection to the server and JWT authentication, customize the editor's appearance.</li>
        <li>Mobile view for licensed editors.</li>
        <li>Creating new attachments using templates that consider the user's language preference.</li>
        <li>Converting attachments and saving or downloading them.</li>
    </ul>

    <h2 id="formats" class="copy-link">Supported formats</h2>
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
                <td>View</td>
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
                <td>Edit</td>
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
                <td>Create</td>
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
    <span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - to be able to open the format for editing,
        check it in the <a href="#formats-settings">formats settings</a>.
        Due to some format restrictions, data loss may occur.</em></span>

    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        Before you proceed to the plugin installation, make sure you have an instance of ONLYOFFICE Docs (Document Server)
        that is resolvable and connectable both from Redmine and any end clients.
        Additionally, ensure that ONLYOFFICE Docs can directly POST to Redmine.
    </p>
    <p>We recommend using <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a> to install ONLYOFFICE Docs.
        Alternatively, you can follow <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">these instructions</a>
        for Debian, Ubuntu, or derivatives.</p>


    <h2 id="install" class="copy-link">Installing Redmine ONLYOFFICE integration plugin</h2>
    <p>To install the plugin, you will need Redmine version 4.2 or higher, or version 5.0 or higher.
        It is also important to note that the plugin is compatible with Ruby version 2.7.2 or higher, or 3.0.0 or higher.
        We recommend using Redmine 5 along with Ruby 3.</p>
    <ol>
        <li>If you are new to Redmine, install it by following <a href="https://www.redmine.org/projects/redmine/wiki/RedmineInstall" target="_blank">these instructions</a>.</li>
        <li>
            <p>Download the <a href="https://github.com/ONLYOFFICE/onlyoffice-redmine/releases" target="_blank">plugin</a>:</p>
            <pre>
curl --location https://github.com/ONLYOFFICE/onlyoffice-redmine/releases/latest/download/onlyoffice_redmine.tar.zst --output onlyoffice_redmine.tar.zst
</pre>
        </li>
        <li>
            <p>Unzip it into the plugins directory:</p>
            <pre>
tar --extract --file onlyoffice_redmine.tar.zst --directory plugins
</pre>
        </li>
        <li>
            <p>Install the dependencies of the plugin if Redmine did not do it automatically:</p>
            <pre>
bundle install
</pre>
        </li>
        <li>
            <p>Perform the migration:</p>
            <pre>
RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=onlyoffice_redmine
</pre>
        </li>
        <li>Restart Redmine.</li>
    </ol>
    <p>Read more about the plugin installation on the Redmine <a href="https://www.redmine.org/projects/redmine/wiki/Plugins#Installing-a-plugin" target="_blank">Wiki page</a>.</p>


    <h2 id="configuration" class="copy-link">Configuring Redmine ONLYOFFICE integration plugin</h2>
    <p>Configure the plugin via the Redmine interface. Go to <b>Administration -> Plugins</b>, find the ONLYOFFICE integration plugin for Redmine and click <b>Configure</b>:</p>
    <img alt="Redmine settings" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/redmine-settings.png") %>"  />

    <p id="general-settings" class="copy-link"><b>General Settings</b></p>
    <ul>
        <li>
            <p><b>Document Editing Service address</b>. The URL of the installed ONLYOFFICE Docs (Document Server). Leave blank to disable the plugin.</p>
        </li>
    </ul>

    <p id="advanced-settings" class="copy-link"><b>Advanced Server Settings</b></p>
    <ul>
        <li>ONLYOFFICE Docs address for internal requests from the server.</li>
        <li>Server address for internal requests from ONLYOFFICE Docs.</li>
        <li>Connect to the demo ONLYOFFICE Docs server.</li>
    </ul>

    <p id="security-settings" class="copy-link"><b>Security</b></p>
    <ul>
        <li><b>Secret key</b>. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs
            and for security reasons and data integrity. Specify your secret key in the ONLYOFFICE Docs
            <a href="/editors/signature/">config file</a>, then specify the same key in the settings page of the plugin. Leave blank to disable authentication.</li>
        <li>Authorization header.</li>
        <li>Disable certificate verification (insecure).</li>
    </ul>

    <p id="editor-customization-settings" class="copy-link"><b>Editor customization settings</b></p>
    <ul>
        <li>Display Chat menu button.</li>
        <li>Display the header more compact.</li>
        <li>Display Feedback & Support menu button.</li>
        <li>Display Help menu button.</li>
        <li>Display monochrome toolbar header.</li>
    </ul>

    <p id="formats-settings" class="copy-link"><b>Formats</b></p>
    <ul>
        <li>Specify the list of formats allowed to be opened directly for editing.</li>
    </ul>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The plugin uses the <a href="<%= Url.Action("basic") %>">ONLYOFFICE Docs API</a> and is integrated into various Redmine pages,
        including <a href="#documents">Documents</a>, <a href="#attachments">Attachments</a>, <a href="#files">Files</a>,
        <a href="#issues">Issue</a>, <a href="#news">News</a>, <a href="#wiki">Wiki</a>,
        and <a href="#forums">Forums</a>. Additionally, the plugin adds general pages
        such as <a href="#create-page">"Create in ONLYOFFICE"</a> and <a href="#convert">"Convert with ONLYOFFICE"</a>.</p>

    <ul>
        <li>
            <p id="documents" class="copy-link"><b>Documents</b></p>
            <img alt="Documents page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/documents-page.png") %>"  />
            <p>On the <b>Documents</b> page, users can open the attachment to view, edit, create, or convert it.
                The options displayed in the interface may vary depending on the user permissions.</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Option</td>
                        <td>Permissions</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">View</td>
                        <td>View documents</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">Edit</td>
                        <td>View documents, Edit documents</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="create" class="copy-link">Create</td>
                        <td>View documents, Edit documents</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">Convert: Save</td>
                        <td>View documents, Edit documents</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">Convert: Download</td>
                        <td>View documents</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="attachments" class="copy-link"><b>Attachment</b></p>
            <img alt="Attachment page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/attachment-page.png") %>"  />
            <p>On the <b>Attachment</b> page, users can open the attachment to view, edit, or convert it.
                The options displayed in the interface may vary depending on the user's permissions for the module where the attachment is located.</p>
        </li>
        <li>
            <p id="files" class="copy-link"><b>Files</b></p>
            <img alt="Files page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/files-page.png") %>"  />
            <p>On the <b>Files</b> page, users can open the attachment to view, edit, or convert it.
                The options displayed in the interface may vary depending on the user's permissions.</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Option</td>
                        <td>Permissions</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">View</td>
                        <td>View files</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">Edit</td>
                        <td>View files, Manage files</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">Convert: Save</td>
                        <td>View files, Manage files</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">Convert: Download</td>
                        <td>View files</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="issues" class="copy-link"><b>Issues</b></p>
            <img alt="Issues page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/issues-page.png") %>"  />
            <p>On the <b>Issues</b> page, users can open the attachment to view, edit, or convert it.
                The options displayed in the interface may vary depending on the user's permissions.</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Option</td>
                        <td>Permissions</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">View</td>
                        <td>View issues</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">Edit</td>
                        <td>View issues, Edit own issues</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">Convert: Save</td>
                        <td>View issues, Edit own issues</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">Convert: Download</td>
                        <td>View issues</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="news" class="copy-link"><b>News</b></p>
            <img alt="News page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/news-page.png") %>"  />
            <p>On the <b>News</b> page, users can open the attachment to view, edit, or convert it.
                The options displayed in the interface may vary depending on the user's permissions.</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Option</td>
                        <td>Permissions</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">View</td>
                        <td>View news</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">Edit</td>
                        <td>View news, Manage news</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">Convert: Save</td>
                        <td>View news, Manage news</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">Convert: Download</td>
                        <td>View news</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="wiki" class="copy-link"><b>Wiki</b></p>
            <img alt="Wiki page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/wiki-page.png") %>"  />
            <p>On the <b>Wiki</b> page, users can open the attachment to view, edit, or convert it.
                The options displayed in the interface may vary depending on the user's permissions.</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Option</td>
                        <td>Permissions</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">View</td>
                        <td>View wiki</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">Edit</td>
                        <td>View wiki, Edit wiki pages</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">Convert: Save</td>
                        <td>View wiki, Edit wiki pages</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">Convert: Download</td>
                        <td>View wiki</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="forums" class="copy-link"><b>Forums</b></p>
            <img alt="Forums page" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/forums-page.png") %>"  />
            <p>On the <b>Forums</b> page, users can open the attachment to view, edit, or convert it.
                The options displayed in the interface may vary depending on the user's permissions.</p>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Option</td>
                        <td>Permissions</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="view" class="copy-link">View</td>
                        <td>View messages</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="edit" class="copy-link">Edit</td>
                        <td>View messages, Edit messages</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-save" class="copy-link">Convert: Save</td>
                        <td>View messages, Edit messages</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="convert-download" class="copy-link">Convert: Download</td>
                        <td>View messages</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
        </li>
        <li>
            <p id="view-or-edit" class="copy-link"><b>View Or Edit In ONLYOFFICE</b></p>
            <img alt="View Or Edit In ONLYOFFICE" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/view-or-edit.png") %>"  />
            <p>On the <b>View Or Edit In ONLYOFFICE</b> page, users can view or edit the attachment.
                The visibility of this page depends on the user's permissions for the module where the attachment is located.</p>
        </li>
        <li>
            <p id="create-page" class="copy-link"><b>Create in ONLYOFFICE</b></p>
            <img alt="Create in ONLYOFFICE" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/create-page.png") %>"  />
            <p>On the <b>Create in ONLYOFFICE</b> page, users can create the attachment using templates that consider the user's language preference.
                Take a look at <a href="#formats">supported formats</a>. The visibility of this page depends on the user's permissions for the module.</p>
        </li>
        <li>
            <p id="convert" class="copy-link"><b>Convert with ONLYOFFICE</b></p>
            <img alt="Convert with ONLYOFFICE" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/convert-page.png") %>"  />
            <p>On the <b>Convert with ONLYOFFICE</b> page, the user can convert the attachment.
                The visibility of this page depends on the user's permissions for the module where the attachment is located.</p>
        </li>
    </ul>

</asp:Content>
