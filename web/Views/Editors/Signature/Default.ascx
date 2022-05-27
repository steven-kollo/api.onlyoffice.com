<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Signature</span>
</h1>
<p class="dscr">ONLYOFFICE Document Server <a href="<%= Url.Action("security") %>">uses</a> <b>tokens</b> generated using the JSON Web Tokens standard.</p>

<div class="note">This feature is used in <b>Document Server</b> starting with version 4.2</div>

<p>For the validation setup it is necessary to edit the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#SecretKey" target="_blank">secret key</a> and <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#Token" target="_blank">token</a> parameters in the configuration file which can be found (or created) at the following path:</p>
<div>For Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>.</div>
<div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>.</div>

<div class="note">
    The default values are available in the <em>default.json</em> configuration file, which is available in the folders above (for Linux and Windows).
    Please do not edit the contents of the <em>default.json</em> file directly.
    The default values will be restored each time you restart Docker container or upgrade <b>Document Server</b> to a new version and all your changes will be lost.
</div>

<p>Restart the services for the config changes to take effect:</p>

<pre>
supervisorctl restart all
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 300px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 100px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.browser.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the client-side <a href="<%= Url.Action("signature/browser") %>">browser requests</a> to ONLYOFFICE Docs.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.inbox.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the <a href="<%= Url.Action("signature/request") %>#incoming">incoming HTTP requests</a> with the commands from the <b>document storage service</b> to the <b>document command service</b>, <b>document conversion service</b> and <b>document builder service</b>.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.outbox.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the <a href="<%= Url.Action("signature/request") %>#outgoing">outgoing HTTP requests</a> to the <em>callbackUrl</em> address by <b>document editing service</b>.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.browser</td>
            <td>Defines if a token in the client-side <a href="<%= Url.Action("signature/browser") %>">browser requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.inbox</td>
            <td>Defines if a token in the <a href="<%= Url.Action("signature/request") %>#incoming">incoming HTTP requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.outbox</td>
            <td>Defines if a token in the <a href="<%= Url.Action("signature/request") %>#outgoing">outgoing HTTP requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>


<div class="header-gray">Sample local.json configuration</div>
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

<h2 id="code-samples" class="copy-link">Code samples for signature generation</h2>
<p>Below you can find examples of signature generation for init config and requests.
They are taken from <a href="<%= Url.Action("demopreview") %>">test samples</a> in different programming languages.
We advise you to use this code in your projects to generate signatures.</p>
<div class="container">
    <ul class="code">
        <li class="code tab active copy-link" id="csharp-mvc">.Net (C# MVC)</li>
        <li class="code tab copy-link" id="csharp">.Net (C#)</li>
        <li class="code tab copy-link" id="java">Java</li>
        <li class="code tab copy-link" id="java-spring">Java Spring</li>
        <li class="code tab copy-link" id="nodejs">Node.js</li>
        <li class="code tab copy-link" id="php">PHP</li>
        <li class="code tab copy-link" id="python">Python</li>
        <li class="code tab copy-link" id="ruby">Ruby</li>
    </ul>
    <div id="csharp-mvc" class="content active">
        <pre>
static JwtManager()
{
    Secret = WebConfigurationManager.AppSettings["files.docservice.secret"] ?? "";
    Enabled = !string.IsNullOrEmpty(Secret);
    Serializer = new JavaScriptSerializer();
}

public static string Encode(IDictionary<string, object> payload)
{
    var header = new Dictionary<string, object>
        {
            { "alg", "HS256" },
            { "typ", "JWT" }
        };

    var encHeader = Base64UrlEncode(Serializer.Serialize(header));
    var encPayload = Base64UrlEncode(Serializer.Serialize(payload));
    var hashSum = Base64UrlEncode(CalculateHash(encHeader, encPayload));

    return string.Format("{0}.{1}.{2}", encHeader, encPayload, hashSum);
}

private static byte[] CalculateHash(string encHeader, string encPayload)
{
    using (var hasher = new HMACSHA256(Encoding.UTF8.GetBytes(Secret)))
    {
        var bytes = Encoding.UTF8.GetBytes(string.Format("{0}.{1}", encHeader, encPayload));
        return hasher.ComputeHash(bytes);
    }
}

private static string Base64UrlEncode(string str)
{
    return Base64UrlEncode(Encoding.UTF8.GetBytes(str));
}

private static string Base64UrlEncode(byte[] bytes)
{
    return Convert.ToBase64String(bytes)
        .TrimEnd('=').Replace('+', '-').Replace('/', '_');
}

</pre>
    </div>
    <div id="csharp" class="content active">
        <pre>
static JwtManager()
{
    Secret = WebConfigurationManager.AppSettings["files.docservice.secret"] ?? "";
    Enabled = !string.IsNullOrEmpty(Secret);
    Serializer = new JavaScriptSerializer();
}

public static string Encode(IDictionary<string, object> payload)
{
    var header = new Dictionary<string, object>
        {
            { "alg", "HS256" },
            { "typ", "JWT" }
        };

    var encHeader = Base64UrlEncode(Serializer.Serialize(header));
    var encPayload = Base64UrlEncode(Serializer.Serialize(payload));
    var hashSum = Base64UrlEncode(CalculateHash(encHeader, encPayload));

    return string.Format("{0}.{1}.{2}", encHeader, encPayload, hashSum);
}

private static byte[] CalculateHash(string encHeader, string encPayload)
{
    using (var hasher = new HMACSHA256(Encoding.UTF8.GetBytes(Secret)))
    {
        var bytes = Encoding.UTF8.GetBytes(string.Format("{0}.{1}", encHeader, encPayload));
        return hasher.ComputeHash(bytes);
    }
}

private static string Base64UrlEncode(string str)
{
    return Base64UrlEncode(Encoding.UTF8.GetBytes(str));
}
 
private static string Base64UrlEncode(byte[] bytes)
{
    return Convert.ToBase64String(bytes)
        .TrimEnd('=').Replace('+', '-').Replace('/', '_');
}
</pre>
    </div>
    <div id="java" class="content active">
        <pre>
public static String CreateToken(Map<String, Object> payloadClaims)
{
    try
    {
        Signer signer = HMACSigner.newSHA256Signer(GetTokenSecret());
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

public static String GetTokenSecret()
{
    return ConfigManager.GetProperty("files.docservice.secret");
}
</pre>
    </div>
    <div id="java-spring" class="content active">
        <pre>
@Value("${files.docservice.secret}")
private String tokenSecret;
    
public String createToken(Map<String, Object> payloadClaims) {
    try {
        Signer signer = HMACSigner.newSHA256Signer(tokenSecret);
        JWT jwt = new JWT();
        for (String key : payloadClaims.keySet()) {
            jwt.addClaim(key, payloadClaims.get(key));
        }
        return JWT.getEncoder().encode(jwt, signer);
    } catch (Exception e) {
        return "";
    }
}
</pre>
    </div>
    <div id="nodejs" class="content active">
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
    <div id="php" class="content active">
        <pre>
function jwtEncode($payload) {
    $header = [
        "alg" => "HS256",
        "typ" => "JWT"
    ];
    $encHeader = base64UrlEncode(json_encode($header));
    $encPayload = base64UrlEncode(json_encode($payload));
    $hash = base64UrlEncode(calculateHash($encHeader, $encPayload));

    return "$encHeader.$encPayload.$hash";
}

function calculateHash($encHeader, $encPayload) {
    return hash_hmac("sha256", "$encHeader.$encPayload", $GLOBALS['DOC_SERV_JWT_SECRET'], true);
}

function base64UrlEncode($str) {
    return str_replace("/", "_", str_replace("+", "-", trim(base64_encode($str), "=")));
}
</pre>
    </div>
    <div id="python" class="content active">
        <pre>
def encode(payload):
    return jwt.encode(payload, config.DOC_SERV_JWT_SECRET, algorithm='HS256')

</pre>
    </div>
    <div id="ruby" class="content active">
        <pre>
@jwt_secret = Rails.configuration.jwtSecret

def encode(payload)
    header = { :alg => "HS256", :typ => "JWT" }
    enc_header = Base64.urlsafe_encode64(header.to_json).remove("=")
    enc_payload = Base64.urlsafe_encode64(payload.to_json).remove("=")
    hash = Base64.urlsafe_encode64(calc_hash(enc_header, enc_payload)).remove("=")

    return "#{enc_header}.#{enc_payload}.#{hash}"
end

def calc_hash(header, payload)
    return OpenSSL::HMAC.digest("SHA256", @jwt_secret, "#{header}.#{payload}")
end
</pre>
    </div>
</div>

<script type="text/javascript">
    $('ul.code').on('click', 'li:not(.code tab active)', function() {
        $(this)
        .addClass('active').siblings().removeClass('active')
        .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
    });
    var loc = window.location.hash;
    if (loc != "") {
        var id = loc.substring(1);;
        $('.code .tab').removeClass('active');
        $('.code .tab[id="'+id  +'"]').addClass('active');
        $('.content').removeClass('active');
        $('.content[id="'+id  +'"]').addClass('active');
    }
</script>
