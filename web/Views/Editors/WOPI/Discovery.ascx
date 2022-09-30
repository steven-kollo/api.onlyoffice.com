<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">WOPI发现</span>
</h1>

    <p class="dscr">
        <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/discovery" target="_blank">WOPI 发现</a> 是通过从在online office请求discovery XML 来帮助 WOPI 服务器发现 WOPI 客户端的过程。
        WOPI 主机使用discovery XML 来指定如何与online office进行交互。
        请求被发送到 <span class="fakelink">https://documentserver/hosting/discovery</span> 地址，其中 <b>documentserver</b> 是安装了 ONLYOFFICE Docs 的服务器的名称。
    </p>


    <h2 id="actions" class="copy-link">WOPI 发现操作</h2>

    <p>discovery XML的 <b>操作</b> 元素提供了关于在线办公的重要特征。该元素代表：</p>
    <ul>
        <li>online office中可用的文档操作，</li>
        <li>支持的文件格式（扩展名）。</li>
    </ul>

    <div class="header-gray">属性</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>requires</td>
                <td>使用操作所需的 WOPI REST 端点。</td>
            </tr>
            <tr>
                <td>urlsrc</td>
                <td>为了对特定文件调用操作而导航到的 URL。</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">示例</div>
    <pre>
&lt;action name="edit" ext="docx" requires="locks,update"
    urlsrc="https://word-edit.officeapps.live.com/we/wordeditorframe.aspx?
ui=en-us&thm=1&"/&gt;
</pre>

    <p><b>发现查询参数</b> 是可以通过 <em>urlsrc</em> 属性中的文件存储公开的参数，以自定义编辑器行为。
        例如，更改语言、主题或聊天。</p>


    <h2 id="wopi-standart" class="copy-link">WOPI标准</h2>

    <div class="header-gray">参数</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>示例</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="ui" class="copy-link">ui</td>
                <td>指示 WOPI 服务器包含 <a href="https://datatracker.ietf.org/doc/html/rfc1766.html" target="_blank">[RFC1766]</a>中所述格式的首选 UI 语言。</td>
                <td>en-us</td>
            </tr>
            <tr>
                <td id="rs" class="copy-link">rs</td>
                <td>指示 WOPI 服务器包含 <a href="https://datatracker.ietf.org/doc/html/rfc1766.html" target="_blank">[RFC1766]</a> 
                    中所述格式的首选数据语言，用于语言可能影响数据计算的情况（在电子表格编辑器中）。</td>
                <td>en-us</td>
            </tr>
            <tr>
                <td id="thm" class="copy-link">thm</td>
                <td>指示 WOPI 服务器包含一个值来指定使用的主题。当前值为 <em>"1"</em> 表示浅色主题，
                    <em>"2"</em> 表示深色主题。</td>
                <td>1</td>
            </tr>
            <tr>
                <td id="dchat" class="copy-link">dchat</td>
                <td>指示 WOPI 服务器包含dchat值为 <em>"1"</em>，以加载一个不创建或加入聊天会话的文档视图。</td>
                <td>1</td>
            </tr>
        </tbody>
    </table>


    <h2 id="collabora-specific" class="copy-link">Collabora特性</h2>

    <p>请注意 Collabora 连接器的 <em>discovery.xml</em> 结构。
        他们通过包含在以下结构的 <em>app</em> 元素中的 MIME 类型打开编辑器：</p>
<pre>
&lt;app name="application/msword"&gt;
    &lt;action default="true" ext="" name="edit" urlsrc="http://159.89.20.129:9980/loleaflet/ba528af/loleaflet.html?"/&gt;
&lt;/app&gt;
</pre>
    <p>像这样的 <em>app</em> 元素：</p>
    <pre>
&lt;app name="Word" favIconUrl="http://localhost:8000/web-apps/apps/documenteditor/main/resources/img/favicon.ico"&gt;
    </pre>
    <p>被 Collabora 连接器忽略。</p>
