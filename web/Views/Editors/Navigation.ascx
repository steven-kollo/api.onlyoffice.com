<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">开始使用</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">基本概念</a>
    </li>
    <li>
        <a href="<%= Url.Action("getdocs") %>">获取 ONLYOFFICE 文档</a>
    </li>
    <li>
        <a href="<%= Url.Action("try") %>">现在试试</a>
    </li>
    <li>
        <a href="<%= Url.Action("demopreview") %>">特定语言示例</a>
        <ul>
            <li>
                <a href="<%= Url.Action("example/csharp") %>">.Net (C#) 示例</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/java") %>">Java 示例</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/javaspring") %>">Java Spring 示例</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/nodejs") %>">Node.js 示例</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/php") %>">PHP 示例</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/python") %>">Python 示例</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/ruby") %>">Ruby示例</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("frameworks") %>">前端框架</a>
        <ul>
            <li>
                <a href="<%= Url.Action("angular") %>">Angular</a>
            </li>
            <li>
                <a href="<%= Url.Action("react") %>">React</a>
            </li>
            <li>
                <a href="<%= Url.Action("vue") %>">Vue</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("plugins") %>">即用型连接器</a>
        <ul>
            <li>
                <a href="<%= Url.Action("alfresco") %>">Alfresco整合</a>
            </li>
            <li>
                <a href="<%= Url.Action("chamilo") %>">Chamilo整合</a>
            </li>
            <li>
                <a href="<%= Url.Action("confluence") %>">Confluence 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("drupal") %>">Drupal 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("humhub") %>">HumHub 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("jira") %>">Jira 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("liferay") %>">Liferay 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("mattermost") %>">Mattermost整合</a>
            </li>
            <li>
                <a href="<%= Url.Action("moodle") %>">Moodle 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("nextcloud") %>">Nextcloud 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("nuxeo") %>">Nuxeo 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("owncloud") %>">ownCloud云集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("plone") %>">Plone集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("redmine") %>">Redmine 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("sharepoint") %>">SharePoint 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("strapi") %>">Strapi 集成</a>
            </li>
            <li>
                <a href="<%= Url.Action("wordpress") %>">WordPress 集成</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a>
        <ul>
            <li>
                <a href="<%= Url.Action("open") %>">打开文件</a>
            </li>
            <li>
                <a href="<%= Url.Action("save") %>">保存文件</a>
            </li>
            <li>
                <a href="<%= Url.Action("coedit") %>">共同编辑</a>
            </li>
            <li>
                <a href="<%= Url.Action("history") %>">文件历史</a>
            </li>
            <li>
                <a href="<%= Url.Action("actionlink") %>">动作链接</a>
            </li>
            <li>
                <a href="<%= Url.Action("mentions") %>">提及</a>
            </li>
            <li>
                <a href="<%= Url.Action("rename") %>">重命名文件</a>
            </li>
            <li>
                <a href="<%= Url.Action("review") %>">审查</a>
            </li>
            <li>
                <a href="<%= Url.Action("inlineeditors") %>">内联编辑器</a>
            </li>
            <li>
                <a href="<%= Url.Action("conversion") %>">转换和下载文件</a>
            </li>
            <li>
                <a href="<%= Url.Action("security") %>">安全</a>
            </li>
            <li>
                <a href="<%= Url.Action("anonymoususers") %>">匿名用户</a>
            </li>
            <li>
                <a href="<%= Url.Action("commenting") %>">评论</a>
            </li>
            <li>
                <a href="<%= Url.Action("comparing") %>">比较文件</a>
            </li>
            <li>
                <a href="<%= Url.Action("viewing") %>">查看</a>
            </li>
            <li>
                <a href="<%= Url.Action("mobileintegration") %>">移动设备整合</a>
            </li>
            <li>
                <a href="<%= Url.Action("insertingexternaldata") %>">插入外部数据</a>
            </li>
            <li>
                <a href="<%= Url.Action("embeddingforms") %>">Embedding forms into a web page</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("interactingoutside/") %>">How to interact from the outside</a>
        <ul>
            <li>
                <a href="<%= Url.Action("interactingoutside/comments") %>">Working with comments</a>
            </li>
            <li>
                <a href="<%= Url.Action("interactingoutside/reviewwork") %>">Working with review changes</a>
            </li>
            <li>
                <a href="<%= Url.Action("interactingoutside/fillingform") %>">Filling out the form</a>
            </li>
        </ul>
    </li>
</ul>

<div class="treeheader">使用 API</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("advanced") %>">高级参数</a>
    </li>
    <li>
        <a href="<%= Url.Action("config/") %>">配置</a>
        <ul>
            <li>
                <a href="<%= Url.Action("config/document") %>">文档</a>
                <ul class="">
                    <li>
                        <a href="<%= Url.Action("config/document/info") %>">信息</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("config/document/permissions") %>">权限</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("config/editor") %>">编辑</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("config/editor/customization") %>">定制</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("config/editor/embedded") %>">嵌入式</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("config/editor/plugins") %>">插件</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("config/events") %>">事件</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("methods") %>">方法</a>
    </li>
    <li>
        <a href="<%= Url.Action("connector") %>">自动化API</a>
    </li>
    <li>
        <a href="<%= Url.Action("callback") %>">回调处理程序</a>
    </li>
</ul>

<div class="treeheader">使用WOPI</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("wopi/") %>">概述</a>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/discovery") %>">WOPI发现</a>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/hostpage") %>">主机页面</a>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/proofkeys") %>">证明密钥</a>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/restapi") %>">WOPI REST API</a>
        <ul>
            <li>
                <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">CheckFileInfo</a>
            </li>
            <li>
                <a href="<%= Url.Action("wopi/restapi/getfile") %>">GetFile</a>
            </li>
            <li>
                <a href="<%= Url.Action("wopi/restapi/lock") %>">Lock</a>
            </li>
            <li>
                <a href="<%= Url.Action("wopi/restapi/refreshlock") %>">RefreshLock</a>
            </li>
            <li>
                <a href="<%= Url.Action("wopi/restapi/unlock") %>">Unlock</a>
            </li>
            <li>
                <a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a>
            </li>
            <li>
                <a href="<%= Url.Action("wopi/restapi/putrelativefile") %>">PutRelativeFile</a>
            </li>
            <li>
                <a href="<%= Url.Action("wopi/restapi/renamefile") %>">RenameFile</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/conversionapi") %>">转换 API</a>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/editingbinary") %>">编辑二进制文件</a>
    </li>
    <li>
        <a href="<%= Url.Action("wopi/apivswopi") %>">API 与 WOPI</a>
    </li>
</ul>

<div class="treeheader">附加 API</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("command/") %>">命令服务</a>
        <ul>
            <li>
                <a href="<%= Url.Action("command/drop") %>">drop</a>
            </li>
            <li>
                <a href="<%= Url.Action("command/forcesave") %>">forcesave</a>
            </li>
            <li>
                <a href="<%= Url.Action("command/info") %>">info</a>
            </li>
            <li>
                <a href="<%= Url.Action("command/license") %>">license</a>
            </li>
            <li>
                <a href="<%= Url.Action("command/meta") %>">meta</a>
            </li>
            <li>
                <a href="<%= Url.Action("command/version") %>">version</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("conversionapi") %>">转换 API</a>
    </li>
    <li>
        <a href="<%= Url.Action("documentbuilderapi") %>">文档生成器 API</a>
    </li>
    <li>
        <a href="<%= Url.Action("signature/") %>">签名</a>
        <ul>
            <li>
                <a href="<%= Url.Action("signature/browser") %>">浏览器</a>
            </li>
            <li>
                <a href="<%= Url.Action("signature/body") %>">请求</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("signature/body") %>">正文中的令牌</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("signature/request") %>">标头中的令牌</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
</ul>

<div class="treeheader">更多信息</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("changelog") %>">变更日志</a>
    </li>
    <li>
        <a href="<%= Url.Action("faq") %>">常问问题</a>
        <ul>
            <li>
                <a href="<%= Url.Action("faq/general") %>">一般的</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/security") %>">安全</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/sharing") %>">分享</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/embedding") %>">嵌入</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/coediting") %>">共同编辑</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/customizing") %>">定制</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/integrating") %>">整合</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/editing") %>">编辑</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/managingversions") %>">管理版本</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/saving") %>">保存</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/renaming") %>">重命名</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq/usingwopi") %>">使用WOPI</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("troubleshooting") %>">故障排除</a>
    </li>
</ul>