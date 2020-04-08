# Document Server FAQ: Integrating questions

FIXME

<details>
    <summary>Where can I find integration examples for ONLYOFFICE Document Server?</summary>

The examples of integration of Document Server with your own website can be found [here](https://api.onlyoffice.com/editors/demopreview). You can choose among different web development programming languages:

* [.Net (C#)](https://api.onlyoffice.com/editors/example/csharp)

* [Java](https://api.onlyoffice.com/editors/example/java)

* [Node.js](https://api.onlyoffice.com/editors/example/nodejs)

* [PHP](https://api.onlyoffice.com/editors/example/php)

* [Python](https://api.onlyoffice.com/editors/example/python)

* [Ruby](https://api.onlyoffice.com/editors/example/ruby)

The examples will show where to get the source codes, how to install and set up the working examples for integrating Document Server into your website written with the help of one of these programming languages.

If you want to connect Document Server to one of the existing document management services, you can see the ready-made connectors for the following services:

* [Alfresco](https://api.onlyoffice.com/editors/alfresco)

* [Confluence](https://api.onlyoffice.com/editors/confluence)

* [Nextcloud](https://api.onlyoffice.com/editors/nextcloud)

* [ownCloud](https://api.onlyoffice.com/editors/owncloud)

* [SharePoint](https://api.onlyoffice.com/editors/sharepoint)

Most of the connectors are available from the corresponding service application store and are easy to install. Just follow the step-by-step instructions at the connector page and connect Document Server to your service.

</details>

<details>
    <summary>Which paths should I specify when integrating Document Server with my website?</summary>

FIXME

After you download and unpack the examples for integration Document Server with your website, you need to open the source codes and replace all the instances of the **<text>https://documentserver/</text>** string with the actual address of your installed Document Server.

</details>

<details>
    <summary>What settings should be used when connecting ONLYOFFICE to ownClowd/Nextcloud via a local and public network?</summary>

When connecting your ownCloud/Nextcloud installation to Document Server, you need to make sure that the server with Document Server installed is accessible both for the internet browsers and ownCloud/Nextcloud installations, i.e. the requests can be sent to and the responses can be accepted from the computer with Document Server installed.

The interaction scheme between ownCloud installation and Document Server is available [here](https://api.onlyoffice.com/editors/owncloud#settings). If you use Nextcloud, visit [this page](https://api.onlyoffice.com/editors/nextcloud#settings) to see how you can properly set up your server.

</details>
