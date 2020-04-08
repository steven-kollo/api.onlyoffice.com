FIXIT

# Document Server FAQ: Security questions

FIXIT

<details>
    <summary>How to limit access to my Document Server?</summary>
        <br>

To prevent an unauthorized access to your documents and the substitution of important parameters in ONLYOFFICE Document Server requests, it uses a JSON Web Token (JWT) compatible tokens to ensure security. The tokens are signed by the server key, so the client is able to verify that the token is legitimate.

The **token** is added in the configuration when initializing Document Server and during the exchange of commands between **document storage service** and **document editing service**, **document command service** and **document conversion service**.

Document Server validates the token. If it is valid, the data from the *payload* is used instead of the corresponding data from the main parameters. If the token is invalid, the command is not executed and no parameters are used or changed.

The token can be sent both in the request [header](https://api.onlyoffice.com/editors/signature/request) or [body](https://api.onlyoffice.com/editors/signature/body).

</details>

<details>
    <summary>What's the difference between sending the token in header and in body?</summary>
        <br>

Starting with version 5.2 of Document Server it is possible to send token both in the request header and body. The main difference between these two methods is in the length limitation: a HTTP header has length limitation and some servers (such as some NGINX versions) do not accept the requests with the header longer than 4 kilobytes, while other servers restrict the header length to 8–48 kilobytes. In case the header length exceeds these values, the server will return the 413 *Entity Too Large* error.

To avoid this limitation, sending the token in the request body should be the preferred method of doing this. To enable it set the `services.CoAuthoring.token.inbox.inBody` and `services.CoAuthoring.token.outbox.inBody` in the `local.json` configuration file to *true* (the default values are set to *false*):

```json
{
    "services": {
        "CoAuthoring": {
            "token": {
                "inbox": {
                    "inBody": true,
                },
                "outbox": {
                    "inBody": true
                }
            }
        }
    }
}
```

See the [Request with token in header](https://api.onlyoffice.com/editors/signature/request) or [Request with token in body](https://api.onlyoffice.com/editors/signature/body) sections for more details on this.

</details>
