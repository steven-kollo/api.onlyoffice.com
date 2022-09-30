<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">WOPI REST API</span>
</h1>

    <p class="dscr">
        <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/rest/" target="_blank">WOPI REST API</a> 指定一组操作，使客户端能够访问和更改存储在服务器上的文件。
    </p>
    <p>ONLYOFFICE Docs 使用以下 WOPI 操作：</p>
    <ul>
        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">CheckFileInfo</a> - 返回有关文件属性、访问权限和编辑器设置的信息。</li>
        <li><a href="<%= Url.Action("wopi/restapi/getfile") %>">GetFile</a> - 请求消息以检索 <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> 操作的文件。</li>
        <li><a href="<%= Url.Action("wopi/restapi/lock") %>">Lock</a> - 由请求锁定的online office锁定文件编辑。</li>
        <li><a href="<%= Url.Action("wopi/restapi/refreshlock") %>">RefreshLock</a> - 通过将文件的自动到期计时器重置为 30 分钟来刷新文件的锁定。</li>
        <li><a href="<%= Url.Action("wopi/restapi/unlock") %>">Unlock</a> - 允许文件编辑。</li>
        <li><a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a> - 请求消息以更新 <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> 操作的文件。</li>
        <li><a href="<%= Url.Action("wopi/restapi/renamefile") %>">RenameFile</a> - 重命名文件。</li>
    </ul>

    <div class="header-gray">可能的错误代码及其描述</div>
    <table class="table">
        <colgroup>
            <col />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>错误代码</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>200 OK</td>
                <td>成功</td>
            </tr>
            <tr>
                <td>400 Bad Request</td>
                <td><b>X-WOPI-Lock</b> 未提供或为空/指定名称非法</td>
            </tr>
            <tr>
                <td>401 Unauthorized</td>
                <td>无效的访问令牌</td>
            </tr>
            <tr>
                <td>404 Not Found</td>
                <td>未找到资源/用户未经授权</td>
            </tr>
            <tr>
                <td>409 Conflict</td>
                <td>锁不匹配/被另一个接口锁定；使用此响应代码时，必须始终包含包含文件当前锁定值的 <b>X-WOPI-Lock</b> 响应标头</td>
            </tr>
            <tr>
                <td>412 Precondition Failed</td>
                <td>文件大于 <b>X-WOPI-MaxExpectedSize</b></td>
            </tr>
            <tr>
                <td>文件太大；</td>
                <td>最大文件大小是特定于主机的</td>
            </tr>
            <tr>
                <td>500 Internal Server Error</td>
                <td>服务器错误</td>
            </tr>
            <tr>
                <td>501 Not Implemented</td>
                <td>不支持操作</td>
            </tr>
        </tbody>
    </table>
