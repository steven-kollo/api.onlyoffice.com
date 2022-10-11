<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">license</span>
</h1>

<div class="header-gray">描述</div>

<p class="dscr">从Document Server请求许可证，以及有关服务器和用户配额的信息。</p>

<div class="header-gray">请求示例</div>
<pre>
{
"c": "license"
}
</pre>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 150px;" />
        <col style="width: 100px;" />
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
        <tr class="tablerow">
            <td>c</td>
            <td>定义命令类型。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">响应示例</div>

<pre>
{
    "error": 0,
    "license": {
        "end_date": "2021-07-07T23:59:59.000Z",
        "trial": false,
        "customization": false,
        "connections": 0,
        "connections_view": 0,
        "users_count": 10,
        "users_view_count": 10,
        "users_expire": 30
    },
    "server": {
        "resultType": 3,
        "packageType": 1,
        "buildDate": "2021-05-21T00:00:00.000Z",
        "buildVersion": "6.3.0",
        "buildNumber": 111
    },
    "quota": {
        "users": [
            {
                "userid": "uid-0",
                "expire": "2021-07-07T23:59:59.000Z"
            },
            {
                "userid": "uid-1",
                "expire": "2021-07-09T23:59:59.000Z"
            },
            ...
        ],
        "users_view": [
            {
                "userid": "uid-0",
                "expire": "2021-07-07T23:59:59.000Z"
            },
            {
                "userid": "uid-1",
                "expire": "2021-07-09T23:59:59.000Z"
            },
            ...
        ]
    }
}
</pre>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>参数</td>
            <td>描述</td>
            <td>类型</td>
            <td>出现</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="error" class="copy-link">error</td>
            <td>定义错误代码</td>
            <td>integer</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td id="license" class="copy-link">license</td>
            <td>定义文档许可证信息：
                <ul>
                    <li>
                        <b>End_date</b> - 许可证到期日期。
                        <br />
                        <b>type</b>：字符串
                        <br />
                        <b>存在</b>：必需
                    </li>
                    <li>
                        <b>trial</b> - 定义许可证是否试用。
                        <br />
                        <b>Type：布尔型</b>：布尔型
                        <br />
                        <b>存在</b>：必需
                    </li>
                    <li>
                        <b>customization</b> - 定义标记为*符号的 <a href="<%= Url.Action("config/editor/customization") %>">customization</a> 参数是否仅在ONLYOFFICE 开发者版本中可编辑。
                        <br />
                        <b>Type：布尔型</b>：布尔型
                        <br />
                        <b>存在</b>：必需
                    </li>
                    <li>
                        <b>connections</b> - 连接许可证的连接数。
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>出现</b>: 可选的
                    </li>
                    <li>
                        <b>connections_view</b> - 实时查看器的连接数。
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>出现</b>: 可选的
                    </li>
                    <li>
                        <b>users_count</b> - 用户许可证的用户数。
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>出现</b>: 可选的
                    </li>
                    <li>
                        <b>users_view_count</b> - 实时查看器的用户数。
                        <br />
                        <b>type</b>: integer
                        <br />
                         <b>出现</b>: 可选的
                    </li>
                    <li>
                        <b>users_expire</b> - 用户许可证过期的天数。
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>出现</b>: 可选的
                    </li>
                </ul>
            </td>
            <td>对象</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td id="server" class="copy-link">server</td>
            <td>定义服务器特征：
                <ul>
                    <li>
                        <b>resultType</b> - 许可证状态 (<b>1</b> - 发生错误, <b>2</b> - 许可证过期, <b>3</b> - 许可证仍然可用, <b>6</b> - 试用许可证过期).
                        <br />
                        <b>类型</b>: integer
                        <br />
                        <b>存在</b>: 必需的
                    </li>
                    <li>
                        <b>packageType</b> - 产品版本 (<b>0</b> - 开源产品, <b>1</b> - 企业版, <b>2</b> - 开发者版).
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>出现</b>: 必需的
                    </li>
                    <li>
                        <b>buildDate</b> - 生成日期.
                        <br />
                        <b>type</b>：字符串
                        <br />
                        <b>存在</b>：必需
                    </li>
                    <li>
                        <b>buildVersion</b> - 生成版本.
                        <br />
                        <b>type</b>：string
                        <br />
                        <b>出现</b>：可选的
                    </li>
                    <li>
                        <b>buildNumber</b> - 内部版本号
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>出现</b>: 必需的
                    </li>
                </ul>
            </td>
            <td>对象</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td id="quota" class="copy-link">quota</td>
            <td>定义用户配额值：
                <ul>
                    <li>
                        <b>users</b> - 用户许可证的用户配额，其中 <em>userid</em> - 打开编辑器的用户的id， <em>expire</em> - 此用户的许可证过期日期。
                        <br />
                        <b>type</b>: object数组
                        <br />
                        <b>出现</b>: 必需的
                    </li>
                    <li>
                        <b>users_view</b>-实时查看器的用户配额，其中<em>userid</em> - 打开编辑器的用户的id，<em>expire</em> - 此用户的查看过期日期。
                        <br />
                        <b>type</b>: object数组
                        <br />
                         <b>出现</b>: 必需的
                    </li>
                </ul>
            </td>
            <td>对象</td>
            <td>必需的</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
