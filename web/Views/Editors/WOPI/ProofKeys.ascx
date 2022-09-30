<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">证明密钥</span>
</h1>

    <p class="dscr">要限制公众访问您的数据，必须配置online office和集成商之间的安全请求交换。</p>

    <p>集成商必须检查是否从 ONLYOFFICE Docs 收到请求。它为此目的使用 <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/scenarios/proofkeys" target="_blank">证明密钥</a>。
        文档服务器使用私钥对请求进行签名。相应的公钥写在 <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery XML</a>的 proof-key 元素中。集成商使用公钥检查私钥。
        签名随 <b>X-WOPI-Proof</b> 和 <b>X-WOPI-ProofOld</b> HTTP 标头中的每个请求一起发送。
        私钥和公钥通过以下配置参数设置：</p>


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
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
                <td>示例</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>wopi.publicKey</td>
                <td>定义集成商用来检查私钥的公钥。</td>
                <td>string</td>
                <td>"public key example"</td>
            </tr>
            <tr>
                <td>wopi.modulus</td>
                <td>以 Base64 编码格式定义用于检索公钥的 RSA 模块。</td>
                <td>string</td>
                <td>"modulus example"</td>
            </tr>
            <tr>
                <td>wopi.exponent</td>
                <td>以 Base64 编码格式定义用于检索公钥的 RSA 指数。</td>
                <td>string</td>
                <td>"AQAB"</td>
            </tr>
            <tr>
                <td>wopi.privateKey</td>
                <td>定义签署文档服务器请求的私钥。</td>
                <td>string</td>
                <td>"private key example"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">示例</div>
<pre>
{
    "wopi": {
        "publicKey": "public key example",
        "modulus": "modulus example",
        "exponent": "AQAB",
        "privateKey": "private key example"
    }
}
</pre>

    <note>默认情况下，证明密钥已设置。它们不会生成，即所有安装都使用相同的密钥。</note>
