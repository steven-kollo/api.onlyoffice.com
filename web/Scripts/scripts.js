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
    $(".qa-question-link").on("click", function () {
        var index = $(this).parents(".qa-questions .qa-block-question").index();
        $($(this).parents(".qa-blocks").find(".qa-block .qa-block-question").removeClass("selected")[index]).addClass("selected");
        $($(this).parents(".qa-blocks").find(".qa-block .qa-block-answer").fadeOut()[index]).fadeIn();
    });
    $(".faq_block dt").on("click", function () {
        var i = 0;
        $(this).toggleClass("expanded_node").siblings("dd").slideToggle("fast");

        $.each($(".faq_block dt"), function () {
            if ($(this).attr("class") == "expanded_node") {
                i = 1;
            }
        });
        if (i == 1) {
            $(".fq_expand").hide();
            $(".fq_collapse").show();
        } else {
            $(".fq_collapse").hide();
            $(".fq_expand").show();
        }
    });
    var current = window.location.href.split("#")[1];
    $.each($("dl"), function () {
        if (current == null || current == "undefined") {
            $(".faq_block:first-of-type dt").addClass("expanded_node");
            $(".faq_block:first-of-type dd").show();
        } else if (current == $(this).attr("id")) {
            $(this).children("dt").addClass("expanded_node").siblings("dd").show();
        }
    });
    $(".fq_expand").on("click", function () {
        $("dt").removeClass("expanded_node").addClass("expanded_node");
        $("dd").slideDown("fast");
        $(this).hide();
        $(".fq_collapse").show();
    });
    $(".fq_collapse").on("click", function () {
        $("dt").removeClass("expanded_node");
        $("dd").slideUp("fast");
        $(this).hide();
        $(".fq_expand").show();
    });
            var 
                allowedYes = '<p>allowed</p>',
                allowedNo = '<p>not allowed</p>',
                noDownloadButton = 'Document downloading is not allowed and the <b>Download</b> button is not displayed.',
                yesDownloadButton = 'Document downloading is allowed and the <b>Download</b> button is visible.',
                noEditButton = 'Document editing is disabled and the button which allows to switch to editing is hidden.',
                yesEditButton = 'Document editing is disabled but the button which allows to switch to editing is displayed.',
                noPrintButton = 'Document printing is not allowed and the <b>Print</b> button is not displayed.',
                yesPrintButton = 'Document printing is allowed and the <b>Print</b> button is visible.',
                noCommentingView = 'Document commenting is not allowed in <b>View</b> mode, comments can be viewed only.',
                noFillingView = 'Filling forms in the document is not allowed in <b>View</b> mode.',
                noReviewView = 'Document review is not allowed in <b>View</b> mode.',
                noCommentingEditingEdit = 'Document commenting is not allowed, comments can be viewed only.',
                yesCommentingEdit = 'Document commenting is enabled.',
                noCommentEdit = 'Document commenting is disabled.',
                commentOnlyMode = 'Commenting only mode is enabled.',
                yesFillingEdit = 'Filling forms in the document is allowed.',
                noFillingEdit = 'Filling forms in the document is disabled.',
                yesFillingOnlyEdit = 'Filling forms only mode is enabled.',
                yesReviewEdit = 'Review mode is enabled (form filling is also available).',
                yesReviewOnlyEdit = 'Review only mode is enabled (form filling is also available).',
                noReviewEdit = 'Review mode is disabled.';
            function toggler(){
                if($('#download .paramTrue').hasClass('active_param')){
                    $('#downloading .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                    $('#downloading .resultNote').html(yesDownloadButton);
                } else {
                    $('#downloading .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#downloading .resultNote').html(noDownloadButton);
                }
                
                if($('#print .paramTrue').hasClass('active_param')){
                    $('#printing .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                    $('#printing .resultNote').html(yesPrintButton)
                } else {
                    $('#printing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#printing .resultNote').html(noPrintButton);
                }
                
                // mode=view
                if($('#mode .paramView').hasClass('active_param')){
                    $('#commenting .resultPermission, #formFilling .resultPermission, #reviewing .resultPermission, #editing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                    $('#commenting .resultNote').html(noCommentingView);
                    $('#formFilling .resultNote').html(noFillingView);
                    $('#reviewing .resultNote').html(noReviewView);
                    // mode=view, edit=true
                    if($('#edit .paramTrue').hasClass('active_param')){
                        $('#editing .resultNote').html(yesEditButton);
                    }
                    // mode=view, edit=false
                    else {
                        $('#editing .resultNote').html(noEditButton);
                    }
                } 
                // mode=edit
                else {
                    // mode=edit, edit=true
                    if($('#edit .paramTrue').hasClass('active_param')){
                         $('#editing .resultPermission, #formFilling .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                        $('#editing .resultNote').html('Document editing is allowed.');
                        $('#formFilling .resultNote').html(yesFillingEdit);
                        //commenting modes
                        //mode=edit, edit=true, comment=true
                        if($('#comment .paramTrue').hasClass('active_param')){
                            $('#commenting .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                            $('#commenting .resultNote').html(yesCommentingEdit);
                        } 
                        //mode=edit, edit=true, comment=false
                        else {
                            $('#commenting .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                            $('#commenting .resultNote').html(noCommentingEditingEdit);
                        }
                        //reviewing modes
                        // mode=edit, edit=true, review=true
                        if($('#review .paramTrue').hasClass('active_param')){
                            $('#reviewing .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                            $('#reviewing .resultNote').html(yesReviewEdit);
                        }
                        // mode=edit, edit=true, review=false
                        else {
                            $('#reviewing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                            $('#reviewing .resultNote').html(noReviewEdit);
                        }
                    }
                    // mode=edit, edit=false
                    else {
                         $('#editing .resultPermission').addClass('notallowed').removeClass('allowed').html(allowedNo);
                        $('#editing .resultNote').html('Document editing is disabled.');
                        //reviewing modes
                        // mode=edit, edit=false, review=true
                        if($('#review .paramTrue').hasClass('active_param')){
                            $('#reviewing .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                            $('#reviewing .resultNote').html(yesReviewOnlyEdit);
                        }
                        // mode=edit, edit=false, review=false
                        else {
                            $('#reviewing .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                            $('#reviewing .resultNote').html(noReviewEdit);
                        }
                        //form filling modes
                        // mode=edit, edit=false, fillForms=true or review=true
                        if($('#fillForms .paramTrue').hasClass('active_param') || $('#review .paramTrue').hasClass('active_param')){
                            $('#formFilling .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                            $('#formFilling .resultNote').html(yesFillingEdit);
                        }
                        // mode=edit, edit=false, fillForms=true, review=false
                        else if($('#fillForms .paramTrue').hasClass('active_param') && $('#review .paramTrue').hasClass('inactive_param')) {
                            $('#formFilling .resultPermission').addClass('allowed').removeClass('notallowed').html(allowedYes);
                            $('#formFilling .resultNote').html(yesFillingOnlyEdit);
                        }
                        // mode=edit, edit=false, fillForms=false, review=false
                        else {
                            $('#formFilling .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                            $('#formFilling .resultNote').html(noFillingEdit);
                        }
                        //commenting modes
                        // mode=edit, edit=false, comment=false/true, fillForms=true, review=false
                        if($('#fillForms .paramTrue').hasClass('active_param') &&  $('#review .paramTrue').hasClass('inactive_param')){
                            $('#commenting .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                            $('#commenting .resultNote').html(noCommentingEditingEdit);
                        }
                        // mode=edit, edit=false, comment=true, review=true
                        else if($('#comment .paramTrue').hasClass('active_param') && $('#review .paramTrue').hasClass('active_param')){
                            $('#commenting .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                            $('#commenting .resultNote').html(yesCommentingEdit);
                        }
                        // mode=edit, edit=false, comment=true
                        else if($('#comment .paramTrue').hasClass('active_param')){
                            $('#commenting .resultPermission').removeClass('notallowed').addClass('allowed').html(allowedYes);
                            $('#commenting .resultNote').html(yesCommentingEdit);
                        }
                        // mode=edit, edit=false, comment=false
                        else {
                            $('#commenting .resultPermission').removeClass('allowed').addClass('notallowed').html(allowedNo);
                            $('#commenting .resultNote').html(noCommentingEditingEdit);
                        }
                    }
                }
            }
            $("#parameters td").on('click', function() {
                $(this).parents('.parameters_permissions tr').find('td').removeClass('active_param').addClass('inactive_param');
                $(this).removeClass('inactive_param').addClass('active_param');
                toggler();
            });
            $(document).ready(function() {
                toggler();
            });
});
