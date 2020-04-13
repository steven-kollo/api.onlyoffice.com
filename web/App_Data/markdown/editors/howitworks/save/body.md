# Saving file

The reference figure and the steps below explain the process of saving the document in ONLYOFFICE Document Server.

![saving](/content/img/editor/saving.jpg)

1. The user edits the document in the **document editor**.

2. The **document editor** sends the changes to the **document editing service**.

3. The user closes the **document editor**.

4. The **document editing service** watches the end of work with the document and collects the changes sent from the **document editor** into one document.

5. The **document editing service** informs the **document storage service** about the end of the document editing using the `callbackUrl` from [JavaScript API](/editors/basic) and returns the link to the modified document.

    >Please note that since version 5.5, [callbackUrl](/editors/config/editor#callbackUrl) is selected based on [status](/editors/callback#status) of the request. Starting from version 4.4 to version 5.5, callbackUrl is used from the last user who joined the co-editing. Prior to version 4.4, when co-editing, callbackUrl is used from the user who first opened the file for editing.

6. The **document storage service** downloads the document file with all the saved changes from the **document editing service** and stores it.

## How this can be done in practice

1. Create a [callback handler](/editors/callback) to save the document from **document editing service**.

2. Create an *html* file to [Open the document](/editors/open#apply).

3. In the configuration script for Document Editor initialization specify the URL to the file with the *Callback handler* in the [parameter line](/editors/config/editor#callbackUrl).

    ```js
    new DocsAPI.DocEditor("placeholder", {
        "document": {
            "fileType": "docx",
            "key": "Khirz6zTPdfd7",
            "title": "Example Document Title.docx",
            "url": "https://example.com/url-to-example-document.docx"
        },
        "documentType": "text",
        "editorConfig": {
            "callbackUrl": "https://example.com/url-to-callback.ashx"
        }
    });
    ```

    Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed.

4. Open your *html* file in the browser and edit your document.

5. Close the **Document Editor**. Check out your document in about 10 seconds. All changes should be saved, meaning the configuration is correct.

## Save delay

Once the document editing is finished, the **document editing service** informs the **document storage service** about it. The time before this is done is calculated using the conversion time of the edited file into the Office Open XML format (which depends on the file size, complexity and the computer power, and can be performed rather a long time), and conversion start delay time (which is equal to 5 seconds by default). In most common cases the time is about 10 seconds after the editing is finished.

The conversion start delay is necessary to allow to return to the file editing session without the file saving, e.g. when reloading the browser page with the file opened for editing. The default conversion start delay time is defined in **Document Server** configuration file, which can be found at the following path:  
For Linux - */etc/onlyoffice/documentserver/**default.json***.  
For Windows - *%ProgramFiles%\ONLYOFFICE\DocumentServer\config\\**default.json***.

If you want to change it, you can use the local.json file, where all the edited parameters should be stored. This file is located in the same directory as the default.json file and the **whole object structure** for the necessary parameter **must be retained** (see the examples below).

>Please do not edit the contents of the default.json file directly. The default values will be restored each time you restart Docker container or upgrade **Document Server** to a new version and all your changes will be lost.

* Parameters

    Parameter | Description | Type | Example
    ----------| ----------- | ---- | -------
    services.CoAuthoring.server.savetimeoutdelay | Defines the conversion start delay time (in milliseconds) after the edited file is closed. | integer | 5000

* Sample local.json configuration

    ```json
    {
        "services": {
            "CoAuthoring": {
                "server": {
                    "savetimeoutdelay": 5000
                }
            }
        }
    }
    ```

## Force saving

**Document editing service** allows to get the current document state before the editing is finished. The process is called *forcesave* in ONLYOFFICE Document Server. When forcesave is initiated, **document editing service** performs request to the [callback handler](/editors/callback) with the link to the document as the *url* parameter and with the **6** value for the **status** parameter. The forcesave process can be initiated the following ways:

* By the request to the [document command service](/editors/command) with the **forcesave** value in the c parameter. The *forcesavetype* parameter will have the **0** value when sending the request to the **callback handler**.

* Enable the [editorConfig.customization.forcesave](/editors/config/editor/customization#forcesave) mode setting it to **true** in the editor initialization configuration. In this case each time the user clicks the **Save** button, the forcesave will be done, and the *forcesavetype* parameter will have the **1** value when sending the request to the **callback handler**.

* You can enable the repeating forcesave start in the **Document Server** additional configuration file, which can be either found at (in case you have already created it) or placed to the following path:  
For Linux - */etc/onlyoffice/documentserver/**local.json***.  
For Windows -      *%ProgramFiles%\ONLYOFFICE\DocumentServer\config\\**local.json***

* Parameters

    Parameter | Description | Type | Example
    --------- | ----------- | ---- | -------
    services.CoAuthoring.autoAssembly.enable | Specifies enabling the repeating force saving. The default value is false. | boolean | **false**
    services.CoAuthoring.autoAssembly.interval | Defines the time interval in minutes for initializing the force save. | string | 5m

* Sample local.json configuration

    ```json
    {
        "services": {
            "CoAuthoring": {
                "autoAssembly": {
                    "enable": true,
                    "interval": "5m"
                }
            }
        }
    }
    ```

The *forcesavetype* parameter will have the **2** value when sending the request to the **callback handler**.
