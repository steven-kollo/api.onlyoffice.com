<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
    <span class="hdr">RenameFile</span>
</h1>

    <div class="header-gray"><b>POST /wopi/files/<i>(file_id)</i></b></div>
    <p class="dscr">重命名文件。</p>
    <p>此操作的工作原理如下：</p>
    <ol>
        <li>WOPI 主机检查文件当前是否被锁定。</li>
        <li>如果文件当前 <b>被锁定</b> 并且 <b>X-WOPI-Lock</b> 值与文件上当前的锁不匹配，
        则主机必须返回 <b>409 Conflict</b> (<em>"lock mismatch"</em>) 并包含 <b>X-WOPI-Lock</b> 响应标头，标头包含文件当前锁的值。</li>
        <li>如果文件 <b>未被锁定</b>，主机应以 <b>200 OK</b> 响应并继续重命名。</li>
        <li>如果主机因为请求的名称无效或与现有文件冲突而无法重命名文件，
        主机应尝试根据请求的名称生成满足文件名要求的不同名称。</li>
        <li>如果主机不能生成不同的名称，它应该返回 <b>400 Bad Request</b>。响应必须包含描述文件名无效原因的
            <b>X-WOPI-InvalidFileNameError</b> 标头。</li>
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
            <col />
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
                <td>来自 WOPI 服务器的请求操作 (<em>RENAME_FILE</em>)。</td>
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
                <td>X-WOPI-RequestedName</td>
                <td>文件名，不包括文件扩展名（UTF-7 格式）。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">响应标头</div>
    <table class="table">
        <colgroup>
            <col />
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
                <td>X-WOPI-InvalidFileNameError</td>
                <td>无法完成重命名操作的原因。仅当响应代码为 <b>400 Bad Request</b>时才应包含此标头。
                此值只能用于记录目的。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
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
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Response body</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Name</td>
                <td>The renamed file name without a path or file extension.</td>
                <td>string</td>
                <td>required</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
