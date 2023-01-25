<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
    <span class="hdr">Unlock</span>
</h1>

    <div class="header-gray"><b>POST /wopi/files/<i>(file_id)</i></b></div>
    <p class="dscr">允许文件编辑。</p>
    <p>此操作的工作原理如下：</p>
    <ol>
        <li>WOPI 主机检查文件当前是否被锁定。</li>
        <li>如果文件 <b>未被锁定</b>，或者文件当前 <b>被锁定</b> 并且 <b>X-WOPI-Lock</b> 值与文件当前锁不匹配，
        则主机必须返回 <b>409 Conflict</b> (<em>"lock mismatch"</em>) 并包含 <b>X-WOPI-Lock</b> 响应标头，标头中包含文件当前锁的值。
        在文件未被锁定的情况下，主机必须将 <b>X-WOPI-Lock</b> 设置为空字符串。</li>
        <li>在文件被第三方客户端锁定的情况下，主机仍应始终在 <b>X-WOPI-Lock</b> 响应标头中包含当前锁定的值。</li>
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
    <div class="mobile-content"></div>

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
    <div class="mobile-content"></div>

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
                <td>来自 WOPI 服务器的请求操作 (<em>UNLOCK</em>)。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr>
                <td>X-WOPI-Lock</td>
                <td>锁ID主机必须用它来标识文件上的锁。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
    <div class="mobile-content"></div>
