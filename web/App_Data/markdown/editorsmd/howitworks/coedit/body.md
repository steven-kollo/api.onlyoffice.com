# Coediting

The reference figure and the steps below explain the process of co-editing the document in ONLYOFFICE Document Server.

![coedit](/content/img/editor/coedit.jpg)

1. User 1 and user 2 open one and the same document in **document editor**, i.e. when opening the file one and the same [document.key](/editors/config/document#key) has been used.

2. User 1 makes changes to the opened document.

3. The **document editor** sends changes made by user 1 to the **document editing service**.

4. The **document editing service** sends the changes made by user 1 to the user 2 **document editor**.

5. Now these changes become visible to user 2.

![coedit-view.png](/content/img/editor/coedit-view.png)

## How this can be done in practice

1. Create an empty *html* file.

2. Add the `div` element as shown below.

    ```html
    <div id="placeholder"></div>
    ```

3. Specify your ONLYOFFICE Document Server link with the JavaScript API that will be used for your website.

    ```js
    <script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
    ```

    Where the **documentserver** is the name of the server with the ONLYOFFICE Document Server installed.

4. Add the script initializing the **Document Editor** for the `div` element with the configuration for the document you want to open.

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
            "user": {
                "id": "78e1e841",
                "name": "John Smith"
            }
        }
    });
    ```

    Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed.

5. Open your *html* file in the browser.

6. Now make a copy of your *html* file created above.

7. Change the script initializing the **Document Editor** in the copied *html* file.

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
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            }
        }
    });
    ```

    Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed.

8. Open your copied and edited *html* file in the browser.
