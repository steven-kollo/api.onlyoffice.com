<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">概述</span>
</h1>

    <p class="dscr">
        从 6.4 版开始，ONLYOFFICE 文档提供 <b>对Web 应用程序开放平台接口协议 (WOPI)</b> 的支持 - 一种基于 REST 的协议，
        用于将您的应用程序与online office集成。WOPI 操作允许您打开存储在服务器上的文件、编辑和保存它们。
    </p>
    <p>本文档描述：</p>
    <ul>
        <li>可以通过 <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>指定的文件属性；</li>
        <li>必须构建 <a href="<%= Url.Action("wopi/hostpage") %>">主机页面</a> 以在online office内创建 iframe 元素；</li>
        <li><a href="<%= Url.Action("wopi/proofkeys") %>">proof keys</a> - 用于检查是否从online office收到请求；</li>
        <li>支持的 <a href="<%= Url.Action("wopi/restapi") %>">WOPI REST API</a> 函数；</li>
        <li>可以通过 <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>发布的可用消息；</li>
        <li>在online office中<a href="<%= Url.Action("wopi/conversionapi") %>">转换</a>不同文件格式请求参数；</li>
        <li><a href="<%= Url.Action("wopi/editingbinary") %>">编辑二进制文档格式</a>的方案；</li>
        <li>ONLYOFFICE 文档 API 和 WOPI 之间的<a href="<%= Url.Action("wopi/apivswopi") %>">区别</a>。</li>
    </ul>

    <p>有关 WOPI 协议的更多信息，请阅读 <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/" target="_blank">WOPI 文档</a>。</p>

    <p>您可以在配置文件中查找和更改所有必要的<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#WOPI" target="_blank">WOPI设置</a>，该文件可以在以下路径中找到（或创建）：</p>
    <div>对于 Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>。</div>
    <div>对于 Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>。</div>

    <div class="note">
        默认值在 <em>default.json</em> 配置文件中可用，该文件位于上述文件夹中（适用于 Linux 和 Windows）。
        请不要直接编辑 <em>default.json</em> 文件的内容。
        每次重新启动 Docker 容器或将 <b>文档服务器</b> 升级到新版本时都会恢复默认值，并且所有更改都将丢失。
    </div>

    <h2 id="enable" class="copy-link">启用 WOPI</h2>
    <p>要启用 WOPI，请将文档服务器配置中的 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#wopi-enable" target="_blank">wopi.enable</a> 参数设置为 <b>true</b>:</p>

    <div class="header-gray">参数</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
                <td>示例</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>wopi.enable</td>
                <td>定义是否启用 WOPI。默认值为 <b>false</b>。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">示例</div>
<pre>
{
    "wopi": {
        "enable": true
    }
}
</pre>

    <h2 id="ip-filter" class="copy-link">IP过滤器</h2>
    <p>ONLYOFFICE 文档只能接受来自受信任的集成商的 WOPI 请求。
        此类集成商的 IP 地址必须包含在 <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/build-test-ship/settings#wopi-domain-allow-list" target="_blank">WOPI 域允许列表</a>中。
        同时，必须拒绝所有其他集成商的访问。</p>
    <note>默认情况下，所有 IP 地址都被认为是可信的。</note>
    <p>按照以下步骤配置文档服务器<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#IPFilter" target="_blank">IP筛选器</a>：</p>
    <ol>
        <li>
            <p>使用任何可用的文本编辑器打开 <em>/etc/onlyoffice/documentserver/local.json</em> 文件：</p>
            <pre>
"ipfilter": {
    "rules": [
        {
            "address": "ip_address",
            "allowed": true
        },
        {
            "address": "*",
            "allowed": false
        }
    ],
    "useforrequest": false,
    "errorcode": 403
}
</pre>
        </li>
        <li>
            <p>更改以下默认设置。输入您的 <em>"ip_address"</em>，其中可以包含：</p>
            <ul>
                <li>ipv4 的 XXXX 格式的 IP，</li>
                <li>ipv6 的 xxxx.xxxx.xxxx.xxxx.xxxx.xxxx.xxxx.xxxx 格式的 IP，</li>
                <li>dns-name,</li>
                <li>* 通配符替换任何符号。</li>
            </ul>
            </ul>
        </li>
        <li>更改 <em>"允许"</em> 规则,可以为 <b>true</b> 或 <b>false</b>的。</li>
        <li>
            <p>重新启动服务以使配置更改生效：</p>
            <p><b>对于 RPM/DEB 软件包：</b></p>
            <pre>
systemctl restart ds-*
</pre>

            <p><b>对于 Docker:</b></p>
            <pre>
supervisorctl restart all
</pre>
        </li>
    </ol>
