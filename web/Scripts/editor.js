/*
 *
 * (c) Copyright Ascensio System Limited 2010-2016
 *
 * This program is freeware. You can redistribute it and/or modify it under the terms of the GNU 
 * General Public License (GPL) version 3 as published by the Free Software Foundation (https://www.gnu.org/copyleft/gpl.html). 
 * In accordance with Section 7(a) of the GNU GPL its Section 15 shall be amended to the effect that 
 * Ascensio System SIA expressly excludes the warranty of non-infringement of any third-party rights.
 *
 * THIS PROGRAM IS DISTRIBUTED WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF MERCHANTABILITY OR
 * FITNESS FOR A PARTICULAR PURPOSE. For more details, see GNU GPL at https://www.gnu.org/copyleft/gpl.html
 *
 * You can contact Ascensio System SIA by email at sales@onlyoffice.com
 *
 * The interactive user interfaces in modified source and object code versions of ONLYOFFICE must display 
 * Appropriate Legal Notices, as required under Section 5 of the GNU GPL version 3.
 *
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


$(function () {

    window.initCount = 0;

    function initEditor () {
        window.initCount++;
        if (!!window.docEditor) {
            if (typeof window.docEditor.destroyEditor == "function") {
                window.docEditor.destroyEditor();
            } else {
                location.reload();
                return;
            }
        }

        window.docUrl = getDocumentUrl();

        var docType = window.docUrl.substring(window.docUrl.lastIndexOf(".") + 1).trim().toLowerCase();

        var documentType = getDocumentType(docType);

        $(".demo-tab-panel a").removeClass("active");
        $("#" + documentType + "Demo").addClass("active");

        //creating object editing
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                document: {
                    title: "Demo." + docType,
                    url: window.docUrl,
                    key: window.Config.EditorKey + window.initCount,
                    permissions: {
                        download: false,
                        print: false,
                    }
                },
                editorConfig: {
                    customization: {
                        feedback: true,
                    },
                },
                documentType: documentType,
                height: "550px",
                width: "100%",
            });
    }

    var getDocumentType = function (ext) {
        if (".docx".indexOf(ext) != -1) return "text";
        if (".xlsx".indexOf(ext) != -1) return "spreadsheet";
        if (".pptx".indexOf(ext) != -1) return "presentation";
        return null;
    };

    var getDocumentUrl = function () {
        var fileName = "demo.docx";
        switch (location.hash) {
            case "#spreadsheet":
                fileName = "demo.xlsx";
                break;
            case "#presentation":
                fileName = "demo.pptx";
                break;
        }
        return window.Config.DemoUrl + fileName;
    };

    $(window).on("hashchange", function () {
        initEditor();
    });

    initEditor();
});