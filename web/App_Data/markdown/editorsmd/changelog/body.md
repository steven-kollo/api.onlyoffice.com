# Changelog

The list of changes of ONLYOFFICE Document Server API.

## Version 5.5

* Added the [editorConfig.customization.spellcheck](/editors/config/editor/customization#spellcheck) field.

* Conversion [document](/editors/conversionapi#text-matrix), [spreadsheet](/editors/conversionapi#spreadsheet-matrix), [presentation](/editors/conversionapi#presentation-matrix) to pdfa format.

* Added the [events.onRequestCompareFile](/editors/config/events#onRequestCompareFile) event.

* Added the [setRevisedFile](/editors/methods#setRevisedFile) method.

* Token in [methods](/editors/signature/browser#methods) parameters.

* The [document.permissions.changeHistory](/editors/config/document/permissions#changeHistory) field is deprecated, please add the [events.onRequestRestore](/editors/config/events#onRequestRestore) field instead.

* Added the [editorConfig.customization.goback.requestClose](/editors/config/editor/customization#goback) field.

* Added the [events.onRequestSharingSettings](/editors/config/events#onRequestSharingSettings) event.

* Added the [editorConfig.customization.unit](/editors/config/editor/customization#unit) field.

* Added the [region](/editors/conversionapi#region) field.

* Added the [spreadsheetLayout](/editors/conversionapi#spreadsheetLayout) field.

* Added [input error](/editors/conversionapi#error) for conversion.

* The [events.onRequestSendNotify](/editors/config/events#onRequestSendNotify) event and the [events.onRequestUsers](/editors/config/events#onRequestUsers) event can be set independently.

* Added the [editorConfig.customization.mentionShare](/editors/config/editor/customization#mentionShare) field.

* The callbackUrl is selected based on [status](/editors/callback#used-callbackUrl).

## Version 5.4

* Added the [editorConfig.region](/editors/config/editor#region) field.

* The [document.info.created](/editors/config/document/info#created) field is deprecated, please use the [document.info.uploaded](/editors/config/document/info#uploaded) field instead.

* The [document.info.author](/editors/config/document/info#author) field is deprecated, please use the [document.info.owner](/editors/config/document/info#owner) field instead.

* The [events.onReady](/editors/config/events#onReady) event is removed.

* The *firstname* and *lastname* fields in the [](/editors/config/editor#user) editorConfig.user</a> object is removed.

* Added the [events.onRequestSaveAs](/editors/config/events#onRequestSaveAs) event.

* Added the [events.onRequestInsertImage](/editors/config/events#onRequestInsertImage) event.

* Added the [insertImage](/editors/methods#insertImage) method.

* Added the [events.onRequestMailMergeRecipients](/editors/config/events#onRequestMailMergeRecipients) event.

* Added the [setMailMergeRecipients](/editors/methods#setMailMergeRecipients) method.

* Added the [setSharingSettings](editors/methods#setSharingSettings) method.

* Added the [events.onRequestUsers](/editors/config/events#onRequestUsers) event.

* Added the [setUsers](/editors/methods#setUsers) method.

* Added the [events.onRequestSendNotify](/editors/config/events#onRequestSendNotify) event.

## Version 5.3

* Added the [editorConfig.customization.reviewDisplay](/editors/config/editor/customization#reviewDisplay) field.

* The [editorConfig.customization.commentAuthorOnly](/editors/config/editor/customization#commentAuthorOnly) field is now used to restrict comment deletion as well.

* Added the [editorConfig.customization.compactHeader](/editors/config/editor/customization#compactHeader) field.

* Added the [editorConfig.customization.hideRightMenu](/editors/config/editor/customization#hideRightMenu) field.

* Added the [editorConfig.customization.toolbarNoTabs](/editors/config/editor/customization#toolbarNoTabs) field.

* Added [conversion error](/editors/conversionapi#error) for password protected documents.

* Added the [editorConfig.actionLink](/editors/config/editor#actionLink) field.

* Added the [setActionLink](/editors/methods#setActionLink) method.

* Added the [events.onMakeActionLink](/editors/config/events#onMakeActionLink) event.

## Version 5.2

* Token in request [body](/editors/signature/body) parameters.

* [document.permissions.comment](/editors/config/document/permissions#comment)  is available in all types of editors.

* Added the [document.permissions.fillForms](/editors/config/document/permissions#fillForms) field.

* Added the [editorConfig.customization.help](/editors/config/editor/customization#help) field.

* Added the possibility to make the [editorConfig.customization.logo](/editors/config/editor/customization#logo)  not clickable.

* Added for the [aspect](/editors/conversionapi#thumbnail-aspect)  field value 2 for the conversion.

## Version 5.1

* Added the [document.permissions.modifyContentControl](/editors/config/document/permissions#modifyContentControl) field.

* Added support for OpenDocument Template [formats](/editors/conversionapi#text-matrix).

* Added the [events.onRequestClose](/editors/config/events#onRequestClose) event.

* Added the [editorConfig.customization.goback.blank](/editors/config/editor/customization#goback) field.

## Version 5.0

* Added the [document.permissions.modifyFilter](/editors/config/document/permissions#modifyFilter) field.

* Added support for macro-enabled document, document template and flat document [formats](/editors/conversionapi#text-matrix).

* The [events.onReady](/editors/config/events#onReady) event is deprecated, please use the [events.onAppReady](/editors/config/events#onAppReady) events instead.

* Added the [events.onDocumentReady](/editors/config/events#onDocumentReady) event.

* Added the [editorConfig.plugins.autostart](/editors/config/editor/plugins#autostart) field.

* Added the [events.onWarning](/editors/config/events#onWarning) event.

* Added the [Document Builder service](/editors/documentbuilderapi).

## Version 4.4

* Changed the [showMessage](/editors/methods#showMessage) method.

* Conversion [presentation](/editors/conversionapi#presentation-matrix) to odp format.

* Added the [document.permissions.comment](/editors/config/document/permissions#comment) field.

* Added the [document.permissions.changeHistory](/editors/config/document/permissions#changeHistory) field.

* Added the [events.onRequestRestore](/editors/config/events#onRequestRestore) event.

* Added the [meta](/editors/command#meta) command.

* Added the [events.onMetaChange](/editors/config/events#onMetaChange) event.

* Changed the use of callbackUrl from the [last user](/editors/callback#used-callbackUrl) who joined the co-editing.

## Version 4.3

* Added the [destroyEditor](/editors/methods#destroyEditor) method.

* Removed the [editorConfig.plugins.url](/editors/config/editor/plugins#url) field from the plugin connection pattern.

* Added the [editorConfig.customization.commentAuthorOnly](/editors/config/editor/customization#commentAuthorOnly) field.

* Added the [editorConfig.customization.forcesave](/editors/config/editor/customization#forcesave) field.

* Added the [editorConfig.customization.showReviewChanges](/editors/config/editor/customization#showReviewChanges) field.

* Added the [forcesavetype](/editors/callback#forcesavetype) field in the callback handler request when force saving the file.

* Added the [JSON format for response](/editors/conversionapi#response) from document conversion service.

## Version 4.2

* The [firstname](/editors/config/editor#user) and [lastname](/editors/config/editor#user) fields is deprecated, please use the [name](/editors/config/editor#user)] field instead.

* Added the possibility to specify the values for the [editorConfig.customization.chat](/editors/config/editor/customization#chat) and [editorConfig.customization.comments](/editors/config/editor/customization#comments) in the Open Source version.

* Added the [editorConfig.customization.compactToolbar](/editors/config/editor/customization#compactToolbar) field.

* Added the [editorConfig.customization.zoom](/editors/config/editor/customization#zoom) field.

* Added the [editorConfig.customization.autosave](/editors/config/editor/customization#autosave) field.

* The [changeshistory](/editors/callback#changeshistory) field is removed, please use the [history](/editors/callback#history) field instead.

* Changed the [setHistoryData](/editors/methods#setHistoryData) method.

* Added the possibility to convert files to [thumbnail](/editors/conversionapi#sample-thumbnail) in the [document conversion service](/editors/conversionapi).

* The POST requests are now used for the interaction with the [document command service](/editors/command) and the [document conversion service](/editors/conversionapi).

* Added the [version](/editors/command#version) command.

* Added the [signature](/editors/signature) for the editor opening and for the incoming and outgoing requests.
