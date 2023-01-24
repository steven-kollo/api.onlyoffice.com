<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
    <span class="hdr">获取文件</span>
</h1>

    <div class="header-gray"><b>GET /wopi/files/<i>(file_id)</i>/contents</b></div>
    <p class="dscr">请求消息以检索 <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> 操作的文件。</p>
    <p>响应正文必须包含二进制格式的完整文件内容。</p>

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
                <td>X-WOPI-MaxExpectedSize</td>
                <td>被请求文件的最大预期大小。如果请求中未设置此值，则主机应使用 4 字节整数的最大值。
                如果请求的文件大于此值，则主机必须以 <b>412 Precondition Failed</b>响应。</td>
                <td>integer</td>
                <td>可选的</td>
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
                <td>X-WOPI-ItemVersion</td>
                <td>文件版本。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Response body</div>
    <p>The response body must be the full binary contents of the file.</p>
