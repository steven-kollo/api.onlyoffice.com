<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
        <span class="hdr">PutRelativeFile</span>
    </h1>

    <div class="header-gray"><b>POST /wopi/files/<i>(file_id)</i></b></div>
    <p class="dscr">基于当前文件在主机上创建一个新文件。</p>
    <p>此操作的工作原理如下：</p>
    <ol>
        <li>WOPI 主机检查文件当前是否被锁定。</li>
        <li>如果文件当前 <b>被锁定</b> 并且 <b>X-WOPI-Lock</b> 值与文件上当前的锁不匹配，
        则主机必须返回 <b>409 Conflict</b> (<em>"lock mismatch"</em>) 并包含 <b>X-WOPI-Lock</b> 响应标头，标头中包含文件当前锁的值。
        在文件未被锁定的情况下，主机必须将 <b>X-WOPI-Lock</b> 设置为空字符串。</li>
        <li>如果文件 <b>已解锁</b>，主机会从 <b>X-WOPI-SuggestedTarget</b> 标头中获取文件名并修改它以使请求成功：
            <ul>
                <li>如果标头仅包含文件扩展名（以句点开头），则生成的文件名将包含此扩展名和不带扩展名的初始文件名。</li>
                <li>如果标头包含完整的文件名，那么它将是结果文件的名称。</li>
            </ul>
        </li>
        <li>最后，主机创建一个具有合法名称且不覆盖任何现有文件的新文件，同时保留文件扩展名。</li>
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
                <td>访问令牌——主机将用它确定请求是否被授权。</td>
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
                <td>来自 WOPI 服务器的请求操作 (<em>PUT_RELATIVE</em>)。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr>
                <td>X-WOPI-SuggestedTarget</td>
                <td>文件扩展名或完整文件名，包括 UTF-7 编码字符串格式的文件扩展名。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr>
                <td>X-WOPI-Size</td>
                <td>文件的大小（以字节为单位）。</td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>X-WOPI-FileConversion</td>
                <td>表明请求是在 <a href="<%= Url.Action("wopi/editingbinary") %>">二进制文档转换</a>的上下文中进行的。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">请求正文</div>
    <p>请求正文必须包含二进制格式的完整文件内容。</p>

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
                <td>锁ID——标识文件上的当前锁。当使用 <b>409 Conflict</b>响应请求时，必须始终包含此标头。
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

    <div class="header-gray">响应体</div>
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
                <td>名称</td>
                <td>文件名，包括扩展名，没有路径。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr>
                <td>Url</td>
                <td>URI，其形式为 <em>http://server/ <...>/wopi/files/(file_id)?access_token=(access token)</em></em>, 在主机上新创建的文件。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr>
                <td>HostViewUrl</td>
                <td>主机页面的 URI，该页面为新创建文件加载 <a href="<%= Url.Action("wopi/discovery") %>#view">查看</a> WOPI 操作。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td>HostEditUrl</td>
                <td>主机页面的 URI，该页面为新创建的文件加载 <a href="<%= Url.Action("wopi/discovery") %>#edit">编辑</a> 操作。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
