/*
 *
 * (c) Copyright Ascensio System Limited 2010-2017
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
    
    $(".button-popap-open").click(function () {
        $("#containerDialog .popap-container>div").hide();
        var codeId = $(this).attr("data-body");
        $("#" + codeId).show();

        displayModalPanel("#containerDialog", 800, 650, 0);
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


    $("#builderFileLink").on("click", function (e) {
        e.preventDefault();
        $("#builderFile").click();
    });

    $("#builderFile").on("change", function (e) {
        var input = e.target;

        var reader = new FileReader();
        reader.onload = function () {
            var text = reader.result;
            $("#builderScript").val(text);
        };
        reader.readAsText(input.files[0]);
    });

    new Clipboard(".copy-link", {
        text: function (obj) {
            var current = location.href;
            if (current.indexOf("#") > 0) {
                current = current.substring(0, Math.max(current.indexOf("#")));
            }

            var href = $(obj).attr("href");
            if (!href) {
                var id = $(obj).attr("id");
                if (!id) {
                    id = $(obj).closest("[id]").attr("id");
                }
                location.hash = id;

                href = current + "#" + id;
            } else if (href.indexOf("#") == 0) {
                location.hash = href;

                href = current + href;
            }
            return href;
        }
    }).on("success",
        function () {
            //alert("Link was copied to clipboard");
        });


    var clipboard = new Clipboard(".copy-code", {
        target: function () {
            return $("pre:visible")[0];
        }
    });
});
$(document).ready(function () {
    $(".spoiler_heading").on("click", function () {
        $(this).next(".spoiler_code").slideToggle("fast");
    });
});
$(document).ready(function () {
    $('.qa-question-link').on('click', function() {
        var index = $(this).parents('.qa-questions .qa-block-question').index();
        $($(this).parents('.qa-blocks').find(".qa-block .qa-block-question").removeClass('selected')[index]).addClass('selected');
        $($(this).parents('.qa-blocks').find(".qa-block .qa-block-answer").fadeOut()[index]).fadeIn();
    });
});