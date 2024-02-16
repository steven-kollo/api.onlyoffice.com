<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    回调处理程序
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">回调处理程序</span>
    </h1>

    <p class="dscr">
        <b>文档编辑服务</b> 用 <a href="<%= Url.Action("basic") %>">JavaScript API</a>的 <em>callbackUrl</em> 通知 <b>文档存储服务</b> 有关文档编辑的状态。
        <b>文档编辑服务</b> 使用POST 请求，请求信息在正文中。
    </p>

    <h2>参数及其说明：</h2>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
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
                <td id="actions" class="copy-link">actions</td>
                <td>
                    定义当用户对文档执行操作时接收到的对象。<em>type</em> 字段值可以具有以下值：
                    <ul>
                        <li><b>0</b> - 用户断开与文档共同编辑的连接，</li>
                        <li><b>1</b> - 新用户连接到文档共同编辑，</li>
                        <li><b>2</b> - 用户单击 <a href="<%= Url.Action("config/editor/customization") %>#forcesave">强制保存按钮</a>。</li>
                    </ul>
                    <em>userid</em> 字段值是用户标识符。
                </td>
                <td>object数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="changeshistory" class="copy-link">changeshistory</td>
                <td>
                    定义具有文档更改历史的对象数组。仅当 <em>status</em> 值等于 <b>2</b> 或 <b>3</b> 时，对象才存在。
                    必须作为对象的属性 <em>changes</em> 以参数形式发送给 <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> 方法。
                    自 4.2 版起已删除，请改用 <a href="#history">history</a>。
                </td>
                <td>object数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="changesurl" class="copy-link">changesurl</td>
                <td>
                    使用文档编辑数据定义文件的链接，用于跟踪和显示文档更改历史记录。
                    仅当 <em>status</em> 等于 <b>2</b> 或 <b>3</b> 时，链接才存在。必须保存文件，并且必须使用 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法将其地址作为 <i>changesUrl</i> 参数发送，以显示与特定文档版本对应的更改。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="filetype" class="copy-link">filetype</td>
                <td>
                    定义从 <a href="#url">url</a> 参数指定的链接下载文档的扩展名。
                    文件类型默认为 OOXML，但如果启用了 <a href="<%= Url.Action("save") %>#assemblyFormatAsOrigin">assemblyFormatAsOrigin</a> 服务器设置，则文件将以原始格式保存。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="forcesavetype" class="copy-link">forcesavetype</td>
                <td>
                    定义执行 <a href="<%= Url.Action("save") %>#forcesave">强制保存</a> 请求时的启动器类型。
                    可以有以下值：
                    <ul>
                        <li><b>0</b> - 为 <a href="<%= Url.Action("command/forcesave") %>">命令服务</a>执行强制保存请求，</li>
                        <li><b>1</b> - 每次保存完成时都会执行强制保存请求（例如单击 <b>保存</b> 按钮），这仅在 <a href="<%= Url.Action("config/editor/customization") %>#forcesave">forcesave</a> 选项设置为 <em>true</em>时可用，</li>
                        <li><b>2</b> - 强制保存请求由计时器按服务器配置中的设置执行，</li>
                        <li><b>3</b> - 每次提交表单时都会执行强制保存请求（例如 <a href="<%= Url.Action("config/editor/customization") %>#submitForm">提交表单</a> 按钮被点击 )。</li>
                    </ul>
                    该类型仅在 <em>status</em> 值等于 <b>6</b> 或 <b>7</b> 时出现。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="formsdataurl" class="copy-link">formsdataurl</td>
                <td>
                    用提交的表单数据,定义 JSON 文件的 URL。
                     <a href="<%= Url.Action("global", "docbuilder") %>#FormData">此处</a>描述了包含表单数据的数组结构。
                     该文件包含以下参数：
                    <ul>
                        <li>
                            <b>key</b> - 表单键。 如果当前表单是单选按钮，则该字段包含表单组键，
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "Text1";
                        </li>
                        <li>
                            <b>tag</b> - 表单标签,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "";
                        </li>
                        <li>
                            <b>value</b> - 当前表单值,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "inner text";
                        </li>
                        <li>
                            <b>type</b> - 表单类型 (<b>text</b>, <b>checkBox</b>, <b>picture</b>, <b>comboBox</b>, <b>dropDownList</b>, <b>dateTime</b>, <b>radio</b>),
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "text".
                        </li>
                    </ul>
                    当 <em>status</em> 值等于 <em>6</em> 并且 <em>forcesavetype</em> 值等于 <em>3</em> 时,该对象才存在。
                </td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="history" class="copy-link">history</td>
                <td>
                    定义有文档更改历史的对象。
                    仅当 <em>status</em> 值等于 <b>2</b> 或 <b>3</b> 时，对象才存在。它包含对象 <em>changes</em> 和 <em>serverVersion</em>，它们必须作为对象的属性 <em>changes</em> 和 <em>serverVersion</em> 以参数形式发送给 <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> 方法。
                </td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="key" class="copy-link">key</td>
                <td>定义编辑的文档标识符。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="status" class="copy-link">status</td>
                <td>
                    定义文档的状态。
                    可以有以下值：
                    <ul>
                        <li><b>1</b> - 正在编辑文档，</li>
                        <li><b>2</b> - 文档已准备好保存，</li>
                        <li><b>3</b> - 发生文档保存错误，</li>
                        <li><b>4</b> - 文档已关闭，没有任何更改，</li>
                        <li><b>6</b> - 正在编辑文档，但保存了当前文档状态，</li>
                        <li><b>7</b> - 强制保存文档时发生错误。</li>
                    </ul>
                </td>
                <td>integer</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>
                    定义已编辑的要由文档存储服务保存的文档的链接。
                    仅当 <em>status</em> 值等于 <b>2</b>, <b>3</b>, <b>6</b> 或 <b>7</b> 时，链接才存在。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="userdata" class="copy-link">userdata</td>
                <td>定义发送到<a href="<%= Url.Action("command/forcesave") %>">forcesave</a>
                    和 <a href="<%= Url.Action("command/info") %>">info</a> 命令的命令服务的自定义信息（如果它在请求中存在）。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="users" class="copy-link">users</td>
                <td>定义打开文档进行编辑的用户的标识符列表；当文档被更改时，用户将返回最后编辑文档的用户的标识符（对于 <em>status</em> <b>2</b> 和 <em>status</em> <b>6</b> 的应答）。</td>
                <td>string数组</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <p id="used-callbackUrl" class="copy-link">
        从 5.5 版本开始，根据请求的 <em>status</em> 选择 <a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>。
        从 4.4 到 5.5 版本， <em>callbackUrl</em> 来自最后一个加入共同编辑的用户。
        在 4.4 之前的版本中，在共同编辑时， <em>callbackUrl</em> 来自第一次打开文件进行编辑的用户。
    </p>
    <p>
        从 7.0 版开始， <em>callbackUrl</em> 来自同一用户的最后一个标签。在 7.0 版之前， <em>callbackUrl</em> 来自第一个用户标签。
    </p>

    <div id="status-descr" class="copy-link header-gray">可能的文档状态及其描述</div>

    <table class="error-table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>状态</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="status1" class="copy-link"><em>status</em> <b>1</b></td>
                <td>
                    <p>每次用户连接或断开文档共同编辑时都会收到它。他们的 <em>callbackUrl</em> 被使用。</p>
                    <p>请注意，当用户在遭遇Internet 故障后返回到没有更改的文档时也可以收到 <em>status</em> <b>1</b>。这种情况可以描述如下：</p>
                    <ul>
                        <li>当用户打开文档时，会发送 <em>status</em> <b>1</b>。</li>
                        <li>如果 Internet 连接丢失并且用户没有对文档进行任何更改，则会发送 <em>status</em> <b>4</b>。
                            屏幕上显示错误并在查看器中打开文档。</li>
                        <li>在 100 秒内，互联网连接恢复，用户重新连接到文档并再次发送 <em>status</em> <b>1</b>。</li>
                        <li>现在用户可以继续编辑文档。将收到 <em>status</em> <b>2</b> 或 <b>4</b>，具体取决于用户是否对文档进行了任何更改。</li>
                    </ul>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="status2" class="copy-link"><em>Status</em> <b>2</b> (<b>3</b>)</td>
                <td>
                    <p>它在编辑文档关闭后 <a href="<%= Url.Action("save") %>#savedelay">10 秒</a> 收到，该用户的标识符是最后一个将更改发送到文档编辑服务的用户。
                        对文件进行最后更改的用户的 <em>callbackUrl</em> 被使用。</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="status4" class="copy-link"><em>Status</em> <b>4</b></td>
                <td>
                    <p>它是在最后一个用户关闭所编辑的没有更改的文档情况下收到的。他们的 <em>callbackUrl</em> 被使用。</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="status6" class="copy-link"><em>Status</em> <b>6</b> (<b>7</b>)</td>
                <td>
                    <p>在执行强制保存请求时接收到。</p>
                    <p><em>callbackUrl</em> 依赖于 <em>forcesavetype</em> 参数：</p>
                    <ul>
                        <li>如果 <em>forcesavetype</em> 参数设置为 <b>1</b>，则使用点击 <b>保存</b> 按钮的用户的 <em>callbackUrl</em>。</li>
                        <li>如果 <em>forcesavetype</em> 参数设置为 <b>0</b> 或 <b>2</b>，则使用对文件进行最后更改的用户的 <em>callbackUrl</em>。</li>
                        <li>如果 <em>forcesavetype</em> 参数设置为<b>3</b>，则使用点击 <b>提交</b> 按钮的用户的 <em>callbackUrl</em>。</li>
                    </ul>
                    <p>从版本 5.5 到版本 6.1，始终使用对文件进行最后更改的用户的 <em>callbackUrl</em>。</p>
                </td>
            </tr>
        </tbody>
    </table>

    <div id="status-1" class="header-gray copy-link">当两个用户共同编辑文档时，文档编辑服务发送到"callbackUrl"地址的 JSON 对象示例</div>
    <pre>
{
    "actions": [{"type": 1, "userid": "78e1e841"}],
    "key": "Khirz6zTPdfd7",
    "status": 1,
    "users": ["6d5a81d0", "78e1e841"]
}
</pre>

    <div id="status-2" class="header-gray copy-link">当用户更改文档并关闭编辑的文档时，文档编辑服务发送到"callbackUrl"地址的 JSON 对象示例</div>
    <pre>
{
    "actions": [{"type": 0, "userid": "78e1e841"}],
    "changesurl": "https://documentserver/url-to-changes.zip",
    "history": {
        "changes": changes,
        "serverVersion": serverVersion
    },
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "status": 2,
    "url": "https://documentserver/url-to-edited-document.docx",
    "users": ["6d5a81d0"]
}
</pre>

    <div id="status-4" class="header-gray copy-link">当最后一个用户关闭编辑的无更改的文档时，文档编辑服务发送到 "callbackUrl" 地址的 JSON 对象示例</div>
<pre>
{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
</pre>

    <div id="status-6" class="header-gray copy-link">接收到 <a href="<%= Url.Action("command/forcesave") %>">forcesave</a> 命令后文档编辑服务发送到 "callbackUrl" 地址的JSON对象示例</div>
    <pre>
{
    "changesurl": "https://documentserver/url-to-changes.zip",
    "forcesavetype": 0,
    "history": {
        "changes": changes,
        "serverVersion": serverVersion
    },
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "status": 6,
    "url": "https://documentserver/url-to-edited-document.docx",
    "users": ["6d5a81d0"],
    "userdata": "sample userdata"
}
</pre>

    <div id="error-0" class="header-gray copy-link">来自文档存储服务的响应</div>

    <p><b>文档存储服务</b> 必须返回以下响应，否则 <b>文档编辑器</b> 将显示错误消息：</p>
    <pre>
{
    "error": 0
}
</pre>

    <p id="implement"><b>文档管理器</b> 和 <b>文档存储服务</b> 要么包含在社区版服务器中，要么必须由在自己的服务器上使用 ONLYOFFICE 文档服务器的软件集成商实施。</p>

    <div id="csharp" class="header-gray copy-link">.Net (C#) 文档保存示例</div>
    <pre>
public class WebEditor : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string body;
        using (var reader = new StreamReader(context.Request.InputStream))
            body = reader.ReadToEnd();

        var fileData = new JavaScriptSerializer().Deserialize&lt;Dictionary&lt;string, object&gt;&gt;(body);
        if ((int) fileData["status"] == 2)
        {
            var req = WebRequest.Create((string) fileData["url"]);

            using (var stream = req.GetResponse().GetResponseStream())
            using (var fs = File.Open(PATH_FOR_SAVE, FileMode.Create))
            {
                var buffer = new byte[4096];
                int readed;
                while ((readed = stream.Read(buffer, 0, 4096)) != 0)
                    fs.Write(buffer, 0, readed);
            }
        }
        context.Response.Write("{\"error\":0}");
    }
}
</pre>
    <div class="note"><em>PATH_FOR_SAVE</em> 是保存文件的计算机文件夹的绝对路径，包括文件名。</div>

    <div id="java" class="header-gray copy-link">Java 文档保存示例</div>
    <pre>
public class IndexServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        Scanner scanner = new Scanner(request.getInputStream()).useDelimiter("\\A");
        String body = scanner.hasNext() ? scanner.next() : "";

        JSONObject jsonObj = (JSONObject) new JSONParser().parse(body);

        if((long) jsonObj.get("status") == 2)
        {
            String downloadUri = (String) jsonObj.get("url");

            URL url = new URL(downloadUri);
            java.net.HttpURLConnection connection = (java.net.HttpURLConnection) url.openConnection();
            InputStream stream = connection.getInputStream();

            File savedFile = new File(pathForSave);
            try (FileOutputStream out = new FileOutputStream(savedFile)) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = stream.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }

                out.flush();
            }

            connection.disconnect();
        }
        writer.write("{\"error\":0}");
    }
}
</pre>
    <div class="note"><em>pathForSave</em> 是保存文件的计算机文件夹的绝对路径，包括文件名。</div>

    <div id="nodejs" class="header-gray copy-link">Node.js 文档保存示例</div>
    <pre>
var fs = require("fs");
var syncRequest = require("sync-request");

app.post("/track", function (req, res) {

    var updateFile = function (response, body, path) {
        if (body.status == 2)
        {
            var file = syncRequest("GET", body.url);
            fs.writeFileSync(path, file.getBody());
        }

        response.write("{\"error\":0}");
        response.end();
    }

    var readbody = function (request, response, path) {
        var content = "";
        request.on("data", function (data) {
            content += data;
        });
        request.on("end", function () {
            var body = JSON.parse(content);
            updateFile(response, body, path);
        });
    }

    if (req.body.hasOwnProperty("status")) {
        updateFile(res, req.body, pathForSave);
    } else {
        readbody(req, res, pathForSave)
    }
});
</pre>
    <div class="note"><em>pathForSave</em> 是保存文件的计算机文件夹的绝对路径，包括文件名。</div>

    <div id="php" class="header-gray copy-link">PHP文档保存示例</div>
    <pre>
&lt;?php

if (($body_stream = file_get_contents("php://input"))===FALSE){
    echo "Bad Request";
}

$data = json_decode($body_stream, TRUE);

if ($data["status"] == 2){
    $downloadUri = $data["url"];
        
    if (($new_data = file_get_contents($downloadUri))===FALSE){
        echo "Bad Response";
    } else {
        file_put_contents($path_for_save, $new_data, LOCK_EX);
    }
}
echo "{\"error\":0}";

?&gt;
</pre>
    <div class="note"><em>$path_for_save</em> 是保存文件的计算机文件夹的绝对路径，包括文件名。</div>

    <div id="ruby" class="header-gray copy-link">Ruby 文档保存示例</div>
    <pre>
class ApplicationController< ActionController::Base
    def index
        body = request.body.read

        file_data = JSON.parse(body)
        status = file_data["status"].to_i

        if status == 2
            download_uri = file_data["url"]
            uri = URI.parse(download_uri)
            http = Net::HTTP.new(uri.host, uri.port)

            if download_uri.start_with?("https")
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            end

            req = Net::HTTP::Get.new(uri.request_uri)
            res = http.request(req)
            data = res.body

            File.open(path_for_save, "wb") do |file|
                file.write(data)
            end
        end
        render :text =>"{\"error\":0}"
    end
end
</pre>
    <div class="note"><em>path_for_save</em> 是保存文件的计算机文件夹的绝对路径，包括文件名。</div>

</asp:Content>

