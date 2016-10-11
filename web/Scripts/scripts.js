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


$(function() {
    function initDemo () {
        if (!!window.docEditor) {
            location.reload();
            return;
        }
        if (location.href.indexOf("demopreview") > -1 && $("#embeddedEditor").length) {
            $(".layout-content").css("max-width", "1085px");
            var hash = location.hash.replace("#", "") || "text";
            $(".demo-tab-panel a").removeClass("active");
            $("#" + hash + "Demo").addClass("active");
            $("#embeddedEditor").html("<div id=\"placeholder\"></div>");
            window.docKey = null;
            var docKey = window.Config.EditorKey;
            initEditor(docKey);
        }
    }

    function displayModalPanel (obj, width, height, top, position) {
        try {
            width = parseInt(width || 0);
            height = parseInt(height || 0);
            left = parseInt(-width / 2);
            top = parseInt(top || -height / 2);
            position = position || "fixed";
            $.blockUI({
                message: $(obj),
                css: {
                    left: '50%',
                    top: '50%',
                    opacity: '1',
                    border: 'none',
                    padding: '0px',
                    width: width > 0 ? width + 'px' : 'auto',
                    height: height > 0 ? height + 'px' : 'auto',
                    cursor: 'default',
                    textAlign: 'left',
                    position: position,
                    'margin-left': left + 'px',
                    'margin-top': top + 'px',
                    'background-color': 'Transparent'
                },

                overlayCSS: {
                    backgroundColor: '#eee',
                    cursor: 'default',
                    opacity: '0.6'
                },

                focusInput: true,
                baseZ: 666,

                fadeIn: 0,
                fadeOut: 0,
                onBlock: function () {
                    var $blockUI = $(obj).parents('div.blockUI:first'), blockUI = $blockUI.removeClass('blockMsg').addClass('blockDialog').get(0), cssText = '';
                    if ($.browser.msie && $.browser.version < 9 && $blockUI.length !== 0) {
                        var prefix = ' ', cssText = prefix + blockUI.style.cssText, startPos = cssText.toLowerCase().indexOf(prefix + 'filter:'), endPos = cssText.indexOf(';', startPos);
                        if (startPos !== -1) {
                            if (endPos !== -1) {
                                blockUI.style.cssText = [cssText.substring(prefix.length, startPos), cssText.substring(endPos + 1)].join('');
                            } else {
                                blockUI.style.cssText = cssText.substring(prefix.length, startPos);
                            }
                        }
                    }
                }
            });
        } catch (e) {
        }
    }

    $(".button-popap-try").click(function () {
        $("#trySourceCodeDialog .popap-container>div").hide();
        var codeId = $(this).attr("data-code");
        $("#" + codeId).show();
        
        displayModalPanel("#trySourceCodeDialog", 825, 650, 0, "absolute");
    });

    $(".video-link").click(function () {
        var poapDialog = $(this).find(".popap-dialog");

        displayModalPanel(poapDialog, 680, 500, 0, "absolute");
    });

    $("body").on("click", ".button-close, .blockOverlay", $.unblockUI);

    $(document).keyup(function (event) {
        if (!$('.blockUI').is(':visible'))
            return;

        var code;
        if (!e) var e = event;
        if (e.keyCode) code = e.keyCode;
        else if (e.which) code = e.which;

        if (code == 27) {
            $.unblockUI();
        }
    });

    $(window).on("hashchange", function () {
        initDemo();
    });

    $(".search-box .btn").click(function () {
        $(this).parent().submit();
    });

    $(".search-box input").bind("change paste keyup", function () {
        $(this).val() ? $(".search-box .search-clear").show() : $(".search-box .search-clear").hide();
    });

    $(".search-box .search-clear").click(function () {
        $(".search-box input").val("");
        $(this).hide();
    });

    $(".side-nav").treeview({
        collapsed: true,
        animated: "medium",
        unique: false,
        persist: "location"
    });

    $("pre").each(function (i, block) {
        hljs.highlightBlock(block);
    });

    var clipboard = new Clipboard("#clipLink", {
        text: function () {
            return location.href + "#returns";
        }
    });

    clipboard.on('success', function () { alert("Link was copied to clipboard"); });

    initDemo();
});