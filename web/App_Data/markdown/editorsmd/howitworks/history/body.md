# Document history

You can view the document history using the **document editor**.

>The history is currently available for text document files only.

The document history is stored with the **document storage service**. The **document editor** displays the document history as a version list at the left-side panel. When you select a document version from the list it will be displayed for preview.

1. The user clicks the Version History button while editing the document within the **document editor**.

2. The **document editor** requests the list of the document versions from the **document storage service**.

3. The **document storage service** sends the list of the document versions with the version number to be displayed.

4. The **document editor** requests the information about the selected document version from the **document storage service**.

5. The **document storage service** sends the link to the selected version of the document.

6. The **document editor** displays the selected document version.

7. When the user clicks another version in the document version list, the **document editor** requests the information about the version to be displayed anew.

## How this can be done in practice

1. Create an *html* file to [Open the document](https://api.onlyoffice.com/editors/open#apply).

2. Specify the event handler for opening the [version history](https://api.onlyoffice.com/editors/config/events#onRequestHistory) list in the configuration script for **document editor** initialization. When the [onRequestHistory](https://api.onlyoffice.com/editors/config/events#onRequestHistory) event is called, the [refreshHistory](https://api.onlyoffice.com/editors/methods#refreshHistory) method must be executed. This method contains document history for each document version, if the history parameter has been present for each version.

    ```js
    var onRequestHistory = function() {
        docEditor.refreshHistory({
            "currentVersion": 2,
            "history": [
                {
                    "created": "2010-07-06 10:13 AM",
                    "key": "af86C7e71Ca8",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    },
                    "version": 1
                },
                {
                    "created": "2010-07-07 3:46 PM",
                    "key": "Khirz6zTPdfd7",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    },
                    "version": 2
                },
                ...
            ]
        });
    };

    var docEditor = new DocsAPI.DocEditor("placeholder", {
        "events": {
            "onRequestHistory": onRequestHistory,
            ...
        },
        ...
    });
    ```

    ![history_open.png](https://api.onlyoffice.com/content/img/editor/history_open.png)

3. In the configuration script for Document Editor initialization specify the event handler which will select the [version from history](https://api.onlyoffice.com/editors/config/events#onRequestHistoryData). When the [onRequestHistoryData](https://api.onlyoffice.com/editors/config/events#onRequestHistoryData) event is called, the [setHistoryData](https://api.onlyoffice.com/editors/methods#setHistoryData) method must be executed. This method contains the absolute URL to the file of the corresponding version.

    ```js
    var onRequestHistoryData = function(event) {
        var version = event.data;
        docEditor.setHistoryData({
            "key": "Khirz6zTPdfd7",
            "url": "https://example.com/url-to-example-document.docx",
            "version": version
        })
    };

    var docEditor = new DocsAPI.DocEditor("placeholder", {
        "events": {
            "onRequestHistoryData": onRequestHistoryData,
            ...
        },
        ...
    });
    ```

    ![history.png](https://api.onlyoffice.com/content/img/editor/history.png)

4. Open your *html* file in the browser.

5. Open the *Version History* option in the Document Editor menu.

## Opening the document history with changes highliting

If the document version was created with the **document editor**, then the document changes can be displayed when viewing the document history. The additional data must be saved to the **document storage service** when [saving](https://api.onlyoffice.com/editors/save) the editing session beside the document versions themselves to achieve that. After editing in **document editor** the information about the changes during the editing session is sent together with the changed document:

* [history](https://api.onlyoffice.com/editors/callback#history) - this information allows to display the time and the author for each document version when you view the document history in the side panel. Must be sent as a property changes of the object sent as the argument to the [refreshHistory](https://api.onlyoffice.com/editors/methods#refreshHistory) method.

    ```js
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "changes": changes, //the changes from the history object returned after saving the document
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "serverVersion": serverVersion, //the serverVersion from the history object returned after saving the document
                "user": {
                    "id": "F89d8069ba2b",
                    "name": "Kate Cage"
                },
                "version": 1
            },
            {
                "changes": changes,
                "created": "2010-07-07 3:46 PM",
                "key": "Khirz6zTPdfd7",
                "serverVersion": serverVersion,
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
            ...
        ],
    });
    ```

* [changesurl](https://api.onlyoffice.com/editors/callback#changesurl) - the absolute URL to the file with the document editing data used to show the changes corresponding to the specific document version. The file must be saved and its address must be sent as changesUrl parameter using the [setHistoryData](https://api.onlyoffice.com/editors/methods#setHistoryData) method. The link to the previous document version (*previous.url*) must be added into the object.

    ```js
    docEditor.setHistoryData({
        "changesUrl": "https://example.com/url-to-changes.zip",
        "key": "Khirz6zTPdfd7",
        "previous": {
            "key": "af86C7e71Ca8",
            "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
        },
        "url": "https://example.com/url-to-example-document.docx",
        "version": 2
    });
    ```

>The `changesurl` request is made in the browser from the added iframe with the **documentserver** domain, where the **documentserver** is the name of the server with the ONLYOFFICE Document Server installed. For its correct work the cross-origin HTTP requests must be allowed (CORS). This can be achieved using the *Access-Control-Allow-Origin* header.

![changesurl.png](https://api.onlyoffice.com/content/img/editor/changesurl.png)
