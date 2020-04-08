FIXME

# Document Server FAQ: General questions

FIXME

<details>
    <summary>I am new to Document Server API. Where should I start?</summary>
        <br>

If you do not know where to start with Document Server API, we suggest that you first read the [Basic concepts](https://api.onlyoffice.com/editors/basic) and [How it works](https://api.onlyoffice.com/editors/howitworks) sections to have better understanding of how Document Server API is built. Once you are familiar with the main concepts, you can visit the [Try now](https://api.onlyoffice.com/editors/try) section to see the live examples of the main Document Server features in action.

If you are interested in a specific programming language example, see the [Integration examples](https://api.onlyoffice.com/editors/demopreview) which are available in several programming languages and explain how to install Document Server, where to get the example source files and how to install them and connect Document Server.

The users who use some document management systems (Nextcloud, ownCloud, SharePoint etc.) and simply want to know how to connect Document Server to these systems should visit the [Integration connectors](https://api.onlyoffice.com/editors/plugins) section where all the main plugins working with Document Server are explained.

The detailed description of every API method is available in the larger **Documentation** module. All the methods are described in the appropriate sections, the list of them is available in the [Advanced parameters](https://api.onlyoffice.com/editors/advanced).

</details>

<details>
    <summary>How to find out the current version number of Document Server?</summary>
        <br>

The current Document Server version number can be found at the **About** page of the Document, Presentation or Spreadsheet Editor, right below the logo and the editor name.

You can use the API to send a POST request to the **document command service**. Use the c parameter for that with the **version** value, which is sent as a JSON object in the request body:

```json
{
    "c": "version"
}
```

The request result of version is returned in JSON form, like this:

```json
{
    "error": 0,
    "version": "4.3.1.4"
}
```

More detailed information about the interaction with the **document command service** and the use of various commands to do that is available [at this page](https://api.onlyoffice.com/editors/command).

</details>


<details>
     <summary>I want to change some Document Server parameters from the default.json configuration file. How can I do that so that my changes were not lost after update?</summary>

All the main settings for Document Sever are stored in the `default.json` configuration file which is available in the `/etc/onlyoffice/documentserver/` folder (for Linux) or `%ProgramFiles%\ONLYOFFICE\DocumentServer\config\` (for Windows). There is also the platform-specific `production.json` file in the same folder, in which the settings relevant for Linux or Windows are stored.

Document server uses the [Node.js config module](https://www.npmjs.com/package/config) to organize and structure configuration files, so the hierarchy of these files looks like this:

```property
default.json
production.json
local.json
```

Where all the main settings are stored in the `default.json` file, with some of them added or overriden by ones from `production.json` file and any user/developer settings overriden by the ones from `local.json` configuration file.

>If you change the parameters in either `default.json` or `production.json` file, all the changes will be lost after Document Server update or Docker container restart (in case you have Document server installed using Docker).

So we strongly recommend that you **do not** alter the parameters in either `default.json` or `production.json` files and use `local.json` configuration file instead. This file must be created in the same folder with the `default.json` file and the **whole object structure** for the necessary parameter **must be retained**.

The examples of `local.json` use can be found in the following sections:

* [Save delay](https://api.onlyoffice.com/editors/save#savedelay)

* [Force saving](https://api.onlyoffice.com/editors/save#forcesave)

* [Request with token in body](https://api.onlyoffice.com/editors/signature/body)

</details>
