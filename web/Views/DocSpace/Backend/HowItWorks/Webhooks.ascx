<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Webhooks</span>
</h1>

<p>Webhooks are the HTTP/HTTPS callbacks triggered by the events of the API requests, such as POST, PUT, and DELETE. The SSL verification is set when configuring webhooks.</p>
<p>The DocSpace administrator can create webhooks, subscribe to them, and configure webhooks so that events on the portal trigger actions on external services.
    This approach can be useful for synchronizing and tracking certain events.</p>
<p>The instructions on how to create and configure webhooks can be found <a href="https://helpcenter.onlyoffice.com/administration/docspace-webhooks.aspx" target="_blank">here</a>.</p>
<p>The API methods for working with webhooks can be found <a href="<%= Url.Action("section/settings/webhooks") %>">in this section</a>.</p>

<h2 id="webhook-request" class="copy-link">Webhook request</h2>
<p>The <b>Accept</b> and <b>Content-Type</b> webhook headers must be used. Custom headers are not available.</p>
<p>The API request is signed with the secret key which is generated when creating the webhook:</p>
<pre>
private string GetSecretHash(string secretKey, string body)
{
    var secretBytes = Encoding.UTF8.GetBytes(secretKey);
    using var hasher = new HMACSHA256(secretBytes);
    var data = Encoding.UTF8.GetBytes(body);
    var hash = hasher.ComputeHash(data);
    return Convert.ToHexString(hash);
}
</pre>

<p>The secret key is sent in the <b>x-docspace-signature-256</b> header:</p>
<pre>
{
    "Accept": ["*/*"],
    "x-docspace-signature-256": [
        "sha256=0D4C9D09136103625379E0BC3AA6084E941EA2F2901A2C94FACEFE3A7F9688F3"
    ]
}
</pre>
<p>The webhook request body contains the original request body.</p>

<h2 id="timeout-policy" class="copy-link">Timeout policy</h2>
<p>The request timeout is 5 minutes:</p>
<pre>
var lifeTime = TimeSpan.FromMinutes(5);

Func&lt;IServiceProvider, HttpRequestMessage, IAsyncPolicy&lt;HttpResponseMessage&gt;&gt; policyHandler = (s, _) =&gt;
{
    var settings = s.GetRequiredService&lt;Settings&gt;();

    return HttpPolicyExtensions
        .HandleTransientHttpError()
        .OrResult(msg => msg.StatusCode == HttpStatusCode.NotFound)
        .WaitAndRetryAsync(settings.RepeatCount ?? 5, retryAttempt =&gt; TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));
};

services.AddHttpClient(WebhookSender.WEBHOOK)
.SetHandlerLifetime(lifeTime)
.AddPolicyHandler(policyHandler);

services.AddHttpClient(WebhookSender.WEBHOOK_SKIP_SSL)
.SetHandlerLifetime(lifeTime)
.AddPolicyHandler(policyHandler)
.ConfigurePrimaryHttpMessageHandler(_ =&gt;
{
    return new HttpClientHandler
    {
        ServerCertificateCustomValidationCallback = (_, _, _, _) =&gt; true
    };
});
</pre>
<p>If the response contains the <b>5xx</b>, <b>408</b>, or <b>404</b> statuses, the request can be repeated.
There are 5 requests available with an interval of 2 to the power of the attempt number, measured in seconds.</p>

<h2 id="webhook-response" class="copy-link">Webhook response</h2>
<p>There are no restrictions for the response body, except for the database limit on the <em>text</em> size.
The response does not need to be signed. It must contain any successful status.</p>

<h2 id="webhook-queue" class="copy-link">Webhook queue</h2>
<p>Each webhook is added to the queue and then sequentially retrieved from there.
    But webhooks are sent in parallel. Therefore, webhooks may not be in the same sequence as simulating events.</p>
<p>The pending webhooks in the queue are checked every 5 seconds, and up to 10 threads are started to send unprocessed webhooks.</p>