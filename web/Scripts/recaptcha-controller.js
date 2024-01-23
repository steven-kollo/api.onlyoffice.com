/*
 *
 * (c) Copyright Ascensio System SIA 2023
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


var RecaptchaController = new function () {
    /*  this.CheckRecaptcha = function () {
      };*/

    this.DisplayRecaptcha = function (recaptureFinishButtonText, parentElt, onComplete) {
        if (typeof (window.RecaptchaRequired) != "undefined" && window.RecaptchaRequired === false) {
            if (typeof onComplete === "function") {
                onComplete();
            }
            return;
        }

        if (typeof onComplete === "function") {
            this.CheckRecaptcha = onComplete;
        } else {
            this.CheckRecaptcha = function () { };
        }

        if (typeof (grecaptcha) === "undefined") {
            this.InitRecaptcha($("#RecaptchaContainer").attr("data-hl"));
        } else {
            grecaptcha.reset();
        }

        $("#RecaptureFinishButton").val(recaptureFinishButtonText);
        $('#RecaptchaErrorMessage').hide();
        RecaptchaController.RecapchaProgressBarDisplay(false);
        if (parentElt === null || parentElt === "" || $(parentElt).length == 0) {
            displayModalPanel('RecaptchaContainer');
        } else {
            if ($(parentElt).children().length == 0) {
                $("#RecaptchaContainer").appendTo(parentElt);
            }
            $(parentElt).show();
            $("#RecaptchaContainer").show();
        }
    };

    this.RecapchaProgressBarDisplay = function (displayFlag) {
        if (displayFlag) {
            $('#RecaptureCheckingDiv').show();
            $('#RecaptureFinishButton').addClass("disabled");
            $('#RecaptchaErrorMessage').hide();
        } else {
            $('#RecaptureCheckingDiv').hide();
            $('#RecaptureFinishButton').removeClass("disabled");
        }
    };

    this.InitRecaptcha = function (datahl) {
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.async = false;
        script.src = [
            'https://www.recaptcha.net/recaptcha/api.js?hl=',
            datahl
        ]
            .join('');

        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(script, s);
    };

};
