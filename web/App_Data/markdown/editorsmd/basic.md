# Basic concepts

ONLYOFFICE Document Server API is used to let the developers integrate the ONLYOFFICE Document/Spreadsheet/Presentation Editors into their own web sites and setup and manage the editors.

The API JavaScript file can normally be found in the following editors folder:

**https://documentserver/web-apps/apps/api/documents/api.js**

Where the **documentserver** is the name of the server with the ONLYOFFICE Document Server installed.

> For **Document Server** versions prior to 4.0 the path to the API JavaScript file will look like this:
>
> **https://documentserver/OfficeWeb/apps/api/documents/api.js**

The target HTML file where the editors are to be embedded need to have a placeholder *div* tag, where all the information about the editor parameters will be passed:

```html
<div id="placeholder"></div>
<script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
```

The page code containing the changeable parameters looks the following way:

```js
var docEditor = new DocsAPI.DocEditor("placeholder", config);
```

Where *config* is an object:

```js
config = {
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
};
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](https://api.onlyoffice.com/editors/howitworks) section to find out more on Document Server service client-server interactions.

From now the docEditor object can be used to call the **document editor** [Methods](https://api.onlyoffice.com/editors/methods).

The example above includes all the parameters necessary for Document Server correct startup. There are additional non-obligatory parameters though which can be changed to achieve different goals with your document (change access rights for the document, display different information about the document, etc.) See the [Advanced parameters](https://api.onlyoffice.com/editors/advanced) section to find out what these parameters are and how you can change them.

## Support

You can ask our developers at [dev.onlyoffice.org](http://dev.onlyoffice.org/viewforum.php?f=9) (registration required).
