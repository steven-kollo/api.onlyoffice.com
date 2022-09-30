<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">签名</span>
</h1>
<p class="dscr">ONLYOFFICE 文档服务器 <a href="<%= Url.Action("security") %>">使用</a> 按JSON Web <b>令牌</b> 标准生成的令牌。</p>

<div class="note">从 4.2 版开始在 <b>文档服务器</b> 中使用此功能</div>

<p>对于验证设置，有必要编辑配置文件，该文件可以在以下路径中找到（或创建）：</p>
<div>对于 Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>。</div>
<div>对于 Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>。</div>

<div class="note">
    默认值在 <em>default.json</em> 配置文件中可用，该文件位于上述文件夹中（适用于 Linux 和 Windows）。
    请不要直接编辑 <em>default.json</em> 文件的内容。
    每次重新启动 Docker 容器或将 <b>Document Server</b> 升级到新版本时都会恢复默认值，并且所有更改都将丢失。
</div>

<p>重新启动服务以使配置更改生效：</p>

<pre>
    supervisorctl restart all
</pre>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col style="width: 300px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 100px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>参数</td>
            <td>描述</td>
            <td>类型</td>
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.inbox.string</td>
            <td>定义用于在 <a href="<%= Url.Action("signature/browser") %>">浏览器</a> 中生成令牌的 <em>密钥</em>，以便 <b>文档编辑器</b> 打开并调用方法及 <a href="<%= Url.Action("signature/request") %>">请求</a> <b>文档命令服务</b>、 <b>文档转换服务</b> 及 <b>文档生成器服务</b>。</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.outbox.string</td>
            <td>定义 <em>密钥</em>，以在 <b>文档编辑服务</b> 对"callbackUrl"地址的 <a href="<%= Url.Action("signature/request") %>">请求</a> 中生成令牌。</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.browser</td>
            <td>指定在 <a href="<%= Url.Action("signature/browser") %>">配置</a> 中为 <b>文档编辑器</b> 打开和调用方法启用令牌验证。</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.inbox</td>
            <td>指定在对 <b>文档命令服务</b>、<b>文档转换服务</b>和<b>文档生成器服务</b>的 <a href="<%= Url.Action("signature/request") %>">请求</a> 中启用令牌验证。</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.outbox</td>
            <td>指定为 <b>文档编辑服务</b> 向 <b>文档存储服务</b>的 <a href="<%= Url.Action("signature/request") %>">请求</a>启用令牌生成。</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>


<div class="header-gray">示例 local.json 配置</div>
<pre>
{
    "services": {
        "CoAuthoring": {
            "secret": {
                "inbox": {
                    "string": "secret"
                },
                "outbox": {
                    "string": "secret"
                },
            },
            "token": {
                "enable": {
                    "browser": true,
                    "request": {
                        "inbox": true,
                        "outbox": true
                    }
                }
            }
        }
    }
}
</pre>
