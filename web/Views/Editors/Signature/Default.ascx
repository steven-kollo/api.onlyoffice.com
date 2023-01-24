<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">签名</span>
</h1>
<p class="dscr">ONLYOFFICE 文档服务器 <a href="<%= Url.Action("security") %>">使用</a> 按JSON Web <b>令牌</b> 标准生成的令牌。</p>

<div class="note">从 4.2 版开始在 <b>文档服务器</b> 中使用此功能</div>

<p>对于验证设置，需要编辑位于配置文件中的 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#SecretKey" target="_blank">secret key</a> 和 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#Token" target="_blank">token</a> 参数，配置文件可在以下路径找到(或创建)：</p>
<div>对于 Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>。</div>
<div>对于 Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>。</div>

<div class="note">
    默认值在 <em>default.json</em> 配置文件中可用，该文件位于上述文件夹中(适用于 Linux 和 Windows)。
    请不要直接编辑 <em>default.json</em> 文件的内容。
    每次重新启动 Docker 容器或将 <b>Document Server</b> 升级到新版本时都会恢复默认值，并且所有更改都将丢失。
</div>

<p>重新启动服务以使配置更改生效：</p>

<pre>
    supervisorctl restart all
</pre>

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
            <td>参数</td>
            <td>描述</td>
            <td>类型</td>
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.browser.string</td>
            <td>定义 <em>密钥</em> ，用以在客户端生成到ONLYOFFICE文档的 <a href="<%= Url.Action("signature/browser") %>">浏览器请求</a> 令牌。</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.inbox.string</td>
              <td>定义<em>密钥</em>，用以在<a href="<%=Url.Action("signature/request") %>#incoming">传入HTTP请求</a>中使用<b>从文档存储服务</b>到<b>文档命令服务</b>、<b>文档转换服务</b>和<b>文档生成服务</b>的命令生成令牌。</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.outbox.string</td>
            <td>定义<em>密钥</em>，用以通过<b>文档编辑服务的</b>在<a href="<%=Url.Action("signature/request") %>#outgoing">传出HTTP请求</a>到<em>回调Url</em>地址中生成令牌。</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.browser</td>
            <td>定义是否启用客户端<a href="<%=Url.Action("signature/browser") %>">浏览器请求</a>中的令牌。</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.inbox</td>
            <td>定义是否启用<a href="<%= Url.Action("signature/request") %>#incoming">传入HTTP请求</a>中的令牌。</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.outbox</td>
            <td>定义<a href="<%= Url.Action("signature/request") %>#outgoing">传出HTTP请求</a>中的令牌是否已启用。</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>


<div class="header-gray">示例 local.json 配置</div>
<pre>
{
    "services": {
        "CoAuthoring": {
            "secret": {
                "browser": {
                    "string": "secret"
                },
                "inbox": {
                    "string": "secret"
                },
                "outbox": {
                    "string": "secret"
                },
            },
            "token": {
                "enable": {
                    "browser": true,
                    "request": {
                        "inbox": true,
                        "outbox": true
                    }
                }
            }
        }
    }
}
</pre>

<h2 id="code-samples" class="copy-link">用于生成签名的代码示例</h2>
<p>下面是为初始化设置和请求生成签名的示例。
它们取自不同编程语言的<a href="<%= Url.Action("demopreview") %>">测试范例。</a>。
我们建议您在项目中使用此代码来生成签名。</p>
<div class="container">
    <ul class="browser">
        <li class="browser tab active copy-link" id="csharp">C#</li>
        <li class="browser tab copy-link" id="java">Java</li>
        <li class="browser tab copy-link" id="nodejs">Node.js</li>
        <li class="browser tab copy-link" id="php">PHP</li>
        <li class="browser tab copy-link" id="python">Python</li>
        <li class="browser tab copy-link" id="ruby">Ruby</li>
    </ul>
    <div id="csharp" class="content active">
        <pre>
public static class JwtManager
{
    private static readonly string Secret;
    public static readonly bool Enabled;

    static JwtManager()
    {
        Secret = WebConfigurationManager.AppSettings["files.docservice.secret"] ?? "";
        Enabled = !string.IsNullOrEmpty(Secret);
    }

    public static string Encode(IDictionary&lt;string, object&gt; payload)
    {
        var encoder = new JwtEncoder(new HMACSHA256Algorithm(),
                                        new JsonNetSerializer(),
                                        new JwtBase64UrlEncoder());
        return encoder.Encode(payload, Secret);
    }
}
</pre>
    </div>
    <div id="java" class="content">
        <pre>
public static String CreateToken(Map<String, Object> payloadClaims)
{
    try
    {
        String secret = ConfigManager.GetProperty("files.docservice.secret");
        Signer signer = HMACSigner.newSHA256Signer(secret);
        JWT jwt = new JWT();
        for (String key : payloadClaims.keySet())
        {
            jwt.addClaim(key, payloadClaims.get(key));
        }
        return JWT.getEncoder().encode(jwt, signer);
    }
    catch (Exception e)
    {
        return "";
    }
}
</pre>
    </div>
    <div id="nodejs" class="content">
        <pre>
var configServer = require('config').get('server');
var cfgSignatureSecretExpiresIn = configServer.get('token.expiresIn');
var cfgSignatureSecret = configServer.get('token.secret');
var cfgSignatureSecretAlgorithmRequest = configServer.get('token.algorithmRequest');

documentService.getToken = function (data) {
    var options = {algorithm: cfgSignatureSecretAlgorithmRequest, expiresIn: cfgSignatureSecretExpiresIn};
    return jwt.sign(data, cfgSignatureSecret, options);
};
</pre>
    </div>
    <div id="php" class="content">
        <pre>
function jwtEncode($payload) {
    return \Firebase\JWT\JWT::encode($payload, $GLOBALS["DOC_SERV_JWT_SECRET"]);
}
</pre>
    </div>
    <div id="python" class="content">
        <pre>
def encode(payload):
    return jwt.encode(payload, config.DOC_SERV_JWT_SECRET, algorithm='HS256')

</pre>
    </div>
    <div id="ruby" class="content">
        <pre>
@jwt_secret = Rails.configuration.jwtSecret

class << self
    def encode(payload)
        return JWT.encode payload, @jwt_secret, 'HS256'
    end
end
</pre>
    </div>
</div>

<script type="text/javascript">
    $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
        $(this)
        .addClass('active').siblings().removeClass('active')
        .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
    });
    var loc = window.location.hash;
    if (loc != "") {
        var id = loc.substring(1);;
        if ($('.browser .tab[id="' + id + '"]').length) {
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="' + id + '"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="' + id + '"]').addClass('active');
        }
    }
</script>

