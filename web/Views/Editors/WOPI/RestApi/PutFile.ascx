<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
    <span class="hdr">PutFile</span>
</h1>

    <div class="header-gray"><b>POST /wopi/files/<i>(file_id)</i>/contents</b></div>
    <p class="dscr">请求消息以更新 <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> 操作的文件。</p>
    <p>请求正文必须包含二进制格式的完整文件内容。</p>
    <p>此操作的工作原理如下：</p>
    <ol>
        <li>WOPI 主机检查文件当前是否被锁定。</li>
        <li>如果文件当前 <b>被锁定</b> 并且 <b>X-WOPI-Lock</b> 值与文件上当前的锁不匹配，
        则主机必须返回 <b>409 Conflict</b> (<em>"lock mismatch"</em>) 并包含 <b>X-WOPI-Lock</b> 响应标头，标头中包含文件当前锁的值。
        在文件未被锁定的情况下，主机必须将 <b>X-WOPI-Lock</b> 设置为空字符串。</li>
        <li>如果文件 <b>未锁定</b>，主机必须检查文件的当前大小。如果它是 0 字节，则 <b>PutFile</b> 请求应被视为有效并应继续。
        如果它是 0 字节以外的任何值，或者完全丢失，主机应该以 <b>409 Conflict</b>响应。</li>
        <li>在文件被第三方客户端锁定的情况下，主机仍应始终在 <b>X-WOPI-Lock</b> 响应标头中包含当前锁ID。</li>
    </ol>

    <div class="header-gray">参数</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>file_id</td>
                <td>必须是 URL 安全的文件 ID。</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">查询参数</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>access_token</td>
                <td>访问令牌主机将用它确定请求是否被授权。</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">请求标头</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
                <td>出现</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>X-WOPI-Override</td>
                <td>来自 WOPI 服务器的请求操作 (<em>PUT</em>)。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr>
                <td>X-WOPI-Lock</td>
                <td>锁ID主机必须用它来标识文件上的锁。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>X-WOPI-Editors</td>
                <td>在此 <b>PutFile</b> 请求中对文档做出更改的所有用户（<a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserId">UserId</a> 值以逗号分隔）。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>X-LOOL-WOPI-IsModifiedByUser</td>
                <td>指示用户是否在保存之前修改了文档（<b>"true"</b>），或者他们是否只是按下了 <b>保存</b> 按钮而没有进行任何修改（<b>"false"</b>）。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>X-LOOL-WOPI-IsAutosave</td>
                <td>指示 <b>PutFile</b> 是由自动保存 (<b>"true"</b>) 还是由显式用户操作（<b>保存</b> 按钮或菜单项）（<b>"false"</b>）触发。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>X-LOOL-WOPI-IsExitSave</td>
                <td>指示当从内存中清除文档时（例如，当所有用户断开连接时）是否会触发自动保存。（是：<b>"true"</b>，否：<b>"false"</b>）</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">响应标头</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
                <td>出现</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>X-WOPI-Lock</td>
                <td>锁ID标识文件上的当前锁。当使用 <b>409 Conflict</b>响应请求时，必须始终包含此标头。
                    用 <b>200 OK</b>响应请求时不应包含它。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>X-WOPI-LockFailureReason</td>
                <td>锁定失败的原因。当使用 <b>409 Conflict</b>响应请求时，可能会包含此标头。它只能用于记录目的。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>X-WOPI-ItemVersion</td>
                <td>文件版本。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
