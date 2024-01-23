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

var countryPhoneListHelper =
{
    countryList:
    [
        { title: "Afghanistan (‫افغانستان‬&lrm;)", key: "AF", country_code: "+93" },
        { title: "Albania (Shqipëria)", key: "AL", country_code: "+355" },
        { title: "Algeria (‫الجزائر‬&lrm;)", key: "DZ", country_code: "+213" },
        { title: "American Samoa (American Samoa)", key: "AS", country_code: "+1684" },
        { title: "Andorra (Andorra)", key: "AD", country_code: "+376" },
        { title: "Angola (Angola)", key: "AO", country_code: "+244" },
        { title: "Anguilla (Anguilla)", key: "AI", country_code: "+1264" },
        { title: "Antigua and Barbuda (Antigua and Barbuda)", key: "AG", country_code: "+1268" },
        { title: "Argentina (Argentina)", key: "AR", country_code: "+54" },
        { title: "Armenia (Հայաստանի Հանրապետություն)", key: "AM", country_code: "+374" },
        { title: "Aruba (Aruba)", key: "AW", country_code: "+297" },
        { title: "Ascension Island (Ascension Island)", key: "AC", country_code: "+247" },
        { title: "Australia (Australia)", key: "AU", country_code: "+61" },
        { title: "Austria (Österreich)", key: "AT", country_code: "+43" },
        { title: "Azerbaijan (Azərbaycan)", key: "AZ", country_code: "+994" },
        { title: "Bahamas (Bahamas)", key: "BS", country_code: "+1242" },
        { title: "Bahrain (‫البحرين‬&lrm;)", key: "BH", country_code: "+973" },
        { title: "Bangladesh (বাংলাদেশ)", key: "BD", country_code: "+880" },
        { title: "Barbados (Barbados)", key: "BB", country_code: "+1246" },
        { title: "Belarus (Беларусь)", key: "BY", country_code: "+375" },
        { title: "Belgium (België)", key: "BE", country_code: "+32" },
        { title: "Belize (Belize)", key: "BZ", country_code: "+501" },
        { title: "Benin (Bénin)", key: "BJ", country_code: "+229" },
        { title: "Bermuda (Bermuda)", key: "BM", country_code: "+1441" },
        { title: "Bhutan (འབྲུག)", key: "BT", country_code: "+975" },
        { title: "Bolivia (Bolivia)", key: "BO", country_code: "+591" },
        { title: "Bonaire, Sint Eustatius and Saba (Caribbean Netherlands)", key: "BQ", country_code: "+599" },
        { title: "Bosnia and Herzegovina (Bosna i Hercegovina)", key: "BA", country_code: "+387" },
        { title: "Botswana (Botswana)", key: "BW", country_code: "+267" },
        { title: "Brazil (Brasil)", key: "BR", country_code: "+55" },
        { title: "British Indian Ocean Territory (British Indian Ocean Territory)", key: "IO", country_code: "+246" },
        { title: "British Virgin Islands (British Virgin Islands)", key: "VG", country_code: "+1284" },
        { title: "Brunei Darussalam (Brunei)", key: "BN", country_code: "+673" },
        { title: "Bulgaria (България)", key: "BG", country_code: "+359" },
        { title: "Burkina Faso (Burkina Faso)", key: "BF", country_code: "+226" },
        { title: "Burundi (Uburundi)", key: "BI", country_code: "+257" },
        { title: "Cambodia (កម្ពុជា)", key: "KH", country_code: "+855" },
        { title: "Cameroon (Cameroun)", key: "CM", country_code: "+237" },
        { title: "Canada (Canada)", key: "CA", country_code: "+1" },
        { title: "Cape Verde (Kabu Verdi)", key: "CV", country_code: "+238" },
        { title: "Cayman Islands (Cayman Islands)", key: "KY", country_code: "+1345" },
        { title: "Central African Republic (République centrafricaine)", key: "CF", country_code: "+236" },
        { title: "Chad (Tchad)", key: "TD", country_code: "+235" },
        { title: "Chile (Chile)", key: "CL", country_code: "+56" },
        { title: "China (中国)", key: "CN", country_code: "+86" },
        { title: "Colombia (Colombia)", key: "CO", country_code: "+57" },
        { title: "Comoros (‫جزر القمر‬&lrm;)", key: "KM", country_code: "+269" },
        { title: "Congo-Brazzaville (Congo-Brazzaville)", key: "CG", country_code: "+242" },
        { title: "Cook Islands (Cook Islands)", key: "CK", country_code: "+682" },
        { title: "Costa Rica (Costa Rica)", key: "CR", country_code: "+506" },
        { title: "Croatia (Hrvatska)", key: "HR", country_code: "+385" },
        { title: "Cuba (Cuba)", key: "CU", country_code: "+53" },
        { title: "Curacao (Curaçao)", key: "CW", country_code: "+599" },
        { title: "Cyprus (Κύπρος)", key: "CY", country_code: "+357" },
        { title: "Czech Republic (Česká republika)", key: "CZ", country_code: "+420" },
        { title: "Denmark (Danmark)", key: "DK", country_code: "+45" },
        { title: "Djibouti (Djibouti)", key: "DJ", country_code: "+253" },
        { title: "Dominica (Dominica)", key: "DM", country_code: "+1767" },
        { title: "Dominican Republic (República Dominicana)", key: "DO", country_code: "+1809" },
        { title: "Ecuador (Ecuador)", key: "EC", country_code: "+593" },
        { title: "Egypt (‫مصر‬&lrm;)", key: "EG", country_code: "+20" },
        { title: "El Salvador (El Salvador)", key: "SV", country_code: "+503" },
        { title: "Equatorial Guinea (Guinea Ecuatorial)", key: "GQ", country_code: "+240" },
        { title: "Eritrea (Eritrea)", key: "ER", country_code: "+291" },
        { title: "Estonia (Eesti)", key: "EE", country_code: "+372" },
        { title: "Ethiopia (Ethiopia)", key: "ET", country_code: "+251" },
        { title: "Faroe Islands (Føroyar)", key: "FO", country_code: "+298" },
        { title: "Fiji (Fiji)", key: "FJ", country_code: "+679" },
        { title: "Finland (Suomi)", key: "FI", country_code: "+358" },
        { title: "France (France)", key: "FR", country_code: "+33" },
        { title: "French Guiana (Guyane française)", key: "GF", country_code: "+594" },
        { title: "French Polynesia (Polynésie française)", key: "PF", country_code: "+689" },
        { title: "Gabon (Gabon)", key: "GA", country_code: "+241" },
        { title: "Gambia (Gambia)", key: "GM", country_code: "+220" },
        { title: "Georgia (საქართველო)", key: "GE", country_code: "+995" },
        { title: "Germany (Deutschland)", key: "DE", country_code: "+49" },
        { title: "Ghana (Gaana)", key: "GH", country_code: "+233" },
        { title: "Gibraltar (Gibraltar)", key: "GI", country_code: "+350" },
        { title: "Greece (Ελλάδα)", key: "GR", country_code: "+30" },
        { title: "Greenland (Greenland)", key: "GL", country_code: "+299" },
        { title: "Grenada (Grenada)", key: "GD", country_code: "+1473" },
        { title: "Guadeloupe (Guadeloupe)", key: "GP", country_code: "+590" },
        { title: "Guam (Guam)", key: "GU", country_code: "+1671" },
        { title: "Guatemala (Guatemala)", key: "GT", country_code: "+502" },
        { title: "Guinea (Guinée)", key: "GN", country_code: "+224" },
        { title: "Guinea-Bissau (Guiné Bissau)", key: "GW", country_code: "+245" },
        { title: "Guyana (Guyana)", key: "GY", country_code: "+592" },
        { title: "Haiti (Haiti)", key: "HT", country_code: "+509" },
        { title: "Honduras (Honduras)", key: "HN", country_code: "+504" },
        { title: "Hong Kong (香港)", key: "HK", country_code: "+852" },
        { title: "Hungary (Magyarország)", key: "HU", country_code: "+36" },
        { title: "Iceland (Ísland)", key: "IS", country_code: "+354" },
        { title: "India (भारत)", key: "IN", country_code: "+91" },
        { title: "Indonesia (Indonesia)", key: "ID", country_code: "+62" },
        { title: "Iran (‫ایران‬&lrm;)", key: "IR", country_code: "+98" },
        { title: "Iraq (‫العراق‬&lrm;)", key: "IQ", country_code: "+964" },
        { title: "Ireland (Ireland)", key: "IE", country_code: "+353" },
        { title: "Israel (‫ישראל‬&lrm;)", key: "IL", country_code: "+972" },
        { title: "Italy (Italia)", key: "IT", country_code: "+39" },
        { title: "Ivory Coast (Côte d’Ivoire)", key: "CI", country_code: "+225" },
        { title: "Jamaica (Jamaica)", key: "JM", country_code: "+1876" },
        { title: "Japan (日本)", key: "JP", country_code: "+81" },
        { title: "Jordan (‫الأردن‬&lrm;)", key: "JO", country_code: "+962" },
        { title: "Kazakhstan (Казахстан)", key: "KZ", country_code: "+7" },
        { title: "Kenya (Kenya)", key: "KE", country_code: "+254" },
        { title: "Kiribati (Kiribati)", key: "KI", country_code: "+686" },
        { title: "Kuwait (‫الكويت‬&lrm;)", key: "KW", country_code: "+965" },
        { title: "Kyrgyzstan (Kyrgyzstan)", key: "KG", country_code: "+996" },
        { title: "Laos (ສ.ປ.ປ ລາວ)", key: "LA", country_code: "+856" },
        { title: "Latvia (Latvija)", key: "LV", country_code: "+371" },
        { title: "Lebanon (‫لبنان‬&lrm;)", key: "LB", country_code: "+961" },
        { title: "Lesotho (Lesotho)", key: "LS", country_code: "+266" },
        { title: "Liberia (Liberia)", key: "LR", country_code: "+231" },
        { title: "Libya (‫ليبيا‬&lrm;)", key: "LY", country_code: "+218" },
        { title: "Liechtenstein (Liechtenstein)", key: "LI", country_code: "+423" },
        { title: "Lithuania (Lietuva)", key: "LT", country_code: "+370" },
        { title: "Luxembourg (Luxembourg)", key: "LU", country_code: "+352" },
        { title: "Macau (澳門)", key: "MO", country_code: "+853" },
        { title: "Macedonia (Македонија)", key: "MK", country_code: "+389" },
        { title: "Madagascar (Madagasikara)", key: "MG", country_code: "+261" },
        { title: "Malawi (Malawi)", key: "MW", country_code: "+265" },
        { title: "Malaysia (Malaysia)", key: "MY", country_code: "+60" },
        { title: "Maldives (Maldives)", key: "MV", country_code: "+960" },
        { title: "Mali (Mali)", key: "ML", country_code: "+223" },
        { title: "Malta (Malta)", key: "MT", country_code: "+356" },
        { title: "Malvinas (Falkland Islands [Islas Malvinas])", key: "FK", country_code: "+500" },
        { title: "Marshall Islands (Marshall Islands)", key: "MH", country_code: "+692" },
        { title: "Martinique (Martinique)", key: "MQ", country_code: "+596" },
        { title: "Mauritania (‫موريتانيا‬&lrm;)", key: "MR", country_code: "+222" },
        { title: "Mauritius (Moris)", key: "MU", country_code: "+230" },
        { title: "Mexico (México)", key: "MX", country_code: "+52" },
        { title: "Micronesia (Micronesia)", key: "FM", country_code: "+691" },
        { title: "Moldova (Republica Moldova)", key: "MD", country_code: "+373" },
        { title: "Monaco (Monaco)", key: "MC", country_code: "+377" },
        { title: "Mongolia (Mongolia)", key: "MN", country_code: "+976" },
        { title: "Montenegro (Crna Gora)", key: "ME", country_code: "+382" },
        { title: "Montserrat (Montserrat)", key: "MS", country_code: "+1664" },
        { title: "Morocco (‫المغرب‬&lrm;)", key: "MA", country_code: "+212" },
        { title: "Mozambique (Moçambique)", key: "MZ", country_code: "+258" },
        { title: "Myanmar [Burma] (မြန်မာ)", key: "MM", country_code: "+95" },
        { title: "Namibia (Namibia)", key: "NA", country_code: "+264" },
        { title: "Nauru (Nauru)", key: "NR", country_code: "+674" },
        { title: "Nepal (नेपाल)", key: "NP", country_code: "+977" },
        { title: "Netherlands (Nederland)", key: "NL", country_code: "+31" },
        { title: "New Caledonia (Nouvelle-Calédonie)", key: "NC", country_code: "+687" },
        { title: "New Zealand (New Zealand)", key: "NZ", country_code: "+64" },
        { title: "Nicaragua (Nicaragua)", key: "NI", country_code: "+505" },
        { title: "Niger (Nijar)", key: "NE", country_code: "+227" },
        { title: "Nigeria (Nigeria)", key: "NG", country_code: "+234" },
        { title: "Niue (Niue)", key: "NU", country_code: "+683" },
        { title: "Norfolk Island (Norfolk Island)", key: "NF", country_code: "+6723" },
        { title: "North Korea (조선 민주주의 인민 공화국)", key: "KP", country_code: "+850" },
        { title: "Northern Mariana Islands (Northern Mariana Islands)", key: "MP", country_code: "+1" },
        { title: "Norway (Norge)", key: "NO", country_code: "+47" },
        { title: "Oman (‫عُمان‬&lrm;)", key: "OM", country_code: "+968" },
        { title: "Pakistan (‫پاکستان‬&lrm;)", key: "PK", country_code: "+92" },
        { title: "Palau (Palau)", key: "PW", country_code: "+680" },
        { title: "Palestine (‫فلسطين‬&lrm;)", key: "PS", country_code: "+970" },
        { title: "Panama (Panamá)", key: "PA", country_code: "+507" },
        { title: "Papua New Guinea (Papua New Guinea)", key: "PG", country_code: "+675" },
        { title: "Paraguay (Paraguay)", key: "PY", country_code: "+595" },
        { title: "Peru (Perú)", key: "PE", country_code: "+51" },
        { title: "Philippines (Philippines)", key: "PH", country_code: "+63" },
        { title: "Poland (Polska)", key: "PL", country_code: "+48" },
        { title: "Portugal (Portugal)", key: "PT", country_code: "+351" },
        { title: "Puerto Rico (Puerto Rico)", key: "PR", country_code: "+1787" },
        { title: "Qatar (‫قطر‬&lrm;)", key: "QA", country_code: "+974" },
        { title: "Republic of Korea (대한민국)", key: "KR", country_code: "+82" },
        { title: "Reunion (Réunion)", key: "RE", country_code: "+262" },
        { title: "Romania (România)", key: "RO", country_code: "+40" },
        { title: "Russia (Россия)", key: "RU", country_code: "+7" },
        { title: "Rwanda (Rwanda)", key: "RW", country_code: "+250" },
        { title: "Saint Barthélemy (Saint-Barthélémy)", key: "BL", country_code: "+590" },
        { title: "Saint Helena (Saint Helena)", key: "SH", country_code: "+290" },
        { title: "Saint Kitts and Nevis (Saint Kitts and Nevis)", key: "KN", country_code: "+1869" },
        { title: "Saint Lucia (Saint Lucia)", key: "LC", country_code: "+1758" },
        { title: "Saint Martin Island (Saint-Martin [partie française])", key: "MF", country_code: "+590" },
        { title: "Saint Pierre and Miquelon (Saint-Pierre-et-Miquelon)", key: "PM", country_code: "+508" },
        { title: "Saint Vincent and the Grenadines (Saint Vincent and the Grenadines)", key: "VC", country_code: "+1784" },
        { title: "Samoa (Samoa)", key: "WS", country_code: "+685" },
        { title: "San Marino (San Marino)", key: "SM", country_code: "+378" },
        { title: "Sao Tome and Principe (São Tomé e Príncipe)", key: "ST", country_code: "+239" },
        { title: "Saudi Arabia (‫المملكة العربية السعودية‬&lrm;)", key: "SA", country_code: "+966" },
        { title: "Senegal (Sénégal)", key: "SN", country_code: "+221" },
        { title: "Serbia (Србија)", key: "RS", country_code: "+381" },
        { title: "Seychelles (Seychelles)", key: "SC", country_code: "+248" },
        { title: "Sierra Leone (Sierra Leone)", key: "SL", country_code: "+232" },
        { title: "Singapore (Singapore)", key: "SG", country_code: "+65" },
        { title: "Sint Maarten (Sint Maarten)", key: "SX", country_code: "+1721" },
        { title: "Slovakia (Slovensko)", key: "SK", country_code: "+421" },
        { title: "Slovenia (Slovenija)", key: "SI", country_code: "+386" },
        { title: "Solomon Islands (Solomon Islands)", key: "SB", country_code: "+677" },
        { title: "Somalia (Soomaaliya)", key: "SO", country_code: "+252" },
        { title: "South Africa (South Africa)", key: "ZA", country_code: "" + 27 },
        { title: "South Sudan (‫جنوب السودان‬&lrm;)", key: "SS", country_code: "+211" },
        { title: "Spain (España)", key: "ES", country_code: "+34" },
        { title: "Sri Lanka (ශ්&zwj;රී ලංකාව)", key: "LK", country_code: "+94" },
        { title: "Sudan (‫السودان‬&lrm;)", key: "SD", country_code: "+249" },
        { title: "Suriname (Suriname)", key: "SR", country_code: "+597" },
        { title: "Swaziland (Swaziland)", key: "SZ", country_code: "+268" },
        { title: "Sweden (Sverige)", key: "SE", country_code: "+46" },
        { title: "Switzerland (Schweiz)", key: "CH", country_code: "+41" },
        { title: "Syria (‫سوريا‬&lrm;)", key: "SY", country_code: "+963" },
        { title: "Taiwan (台灣)", key: "TW", country_code: "+886" },
        { title: "Tajikistan (Tajikistan)", key: "TJ", country_code: "+992" },
        { title: "Tanzania (Tanzania)", key: "TZ", country_code: "+255" },
        { title: "Thailand (ไทย)", key: "TH", country_code: "+66" },
        { title: "The Democratic Republic of the Congo (Jamhuri ya Kidemokrasia ya Kongo)", key: "CD", country_code: "+243" },
        { title: "Timor-Leste (Timor-Leste)", key: "TL", country_code: "+670" },
        { title: "Togo (Togo)", key: "TG", country_code: "+228" },
        { title: "Tokelau (Tokelau)", key: "TK", country_code: "+690" },
        { title: "Tonga (Tonga)", key: "TO", country_code: "+676" },
        { title: "Trinidad and Tobago (Trinidad and Tobago)", key: "TT", country_code: "+1868" },
        { title: "Tunisia (‫تونس‬&lrm;)", key: "TN", country_code: "+216" },
        { title: "Turkey (Türkiye)", key: "TR", country_code: "+90" },
        { title: "Turkmenistan (Turkmenistan)", key: "TM", country_code: "+993" },
        { title: "Turks and Caicos Islands (Turks and Caicos Islands)", key: "TC", country_code: "+1649" },
        { title: "Tuvalu (Tuvalu)", key: "TV", country_code: "+688" },
        { title: "UK (United Kingdom)", key: "GB", country_code: "+44" },
        { title: "US Virgin Islands (US Virgin Islands)", key: "VI", country_code: "+1340" },
        { title: "Uganda (Uganda)", key: "UG", country_code: "+256" },
        { title: "Ukraine (Україна)", key: "UA", country_code: "+380" },
        { title: "United Arab Emirates (‫الإمارات العربية المتحدة‬&lrm;)", key: "AE", country_code: "+971" },
        { title: "United States (United States)", key: "US", country_code: "+1" },
        { title: "Uruguay (Uruguay)", key: "UY", country_code: "+598" },
        { title: "Uzbekistan (Ўзбекистон)", key: "UZ", country_code: "+998" },
        { title: "Vanuatu (Vanuatu)", key: "VU", country_code: "+678" },
        { title: "Vatican City (Città del Vaticano)", key: "VA", country_code: "+379" },
        { title: "Venezuela (Venezuela)", key: "VE", country_code: "+58" },
        { title: "Vietnam (Việt Nam)", key: "VN", country_code: "+84" },
        { title: "Wallis and Futuna (Wallis and Futuna)", key: "WF", country_code: "+681" },
        { title: "Yemen (‫اليمن‬&lrm;)", key: "YE", country_code: "+967" },
        { title: "Zambia (Zambia)", key: "ZM", country_code: "+260" },
        { title: "Zimbabwe (Zimbabwe)", key: "ZW", country_code: "+263" }
    ]
};

$(document).ready(function () {
    const patternWebSite = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.){0,1}[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;

    let _clearErrors = function () {
        $(".error-text").hide();
        $(".data-item .input-wrapper").removeClass("error");
        $(".recaptcha-error").hide();
        PhoneController.ClearErrors();
    };

    let _clearData = function () {
        $(".input-wrapper input").val("");
        $(".input-wrapper").removeClass("valid");
        PhoneController.ClearDataAndErrors();
        $(".phoneControlContainer").removeClass("valid");
        $("#checkbox").prop("checked", false);
        grecaptcha.reset();
    };

    function isValidEmail(email) {
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailRegex.test(email);
    };

    const _initPhoneControl = function ($input) {
        PhoneController.Init($input, window.countryPhoneListHelper.countryList,
        [
            "RU",
            "RU",
            $("#LanguageSelector").attr("data-country"),
            "US"
        ]
        );
    };

    _initPhoneControl($("#phone"));
    RecaptchaController.InitRecaptcha($("#recaptchaBlock").attr("data-hl"));

    let _sendServerRequest = function () {
        $(".request-progress").show();
    
        let isValid = true,
            data = {
                name: $.trim($(".input-name").val()),
                email: $.trim($(".input-email").val()),
                phone: PhoneController.GetPhone(),
                companyName: $.trim($(".input-company-name").val()),
                website: $.trim($(".input-company-webiste").val()),
                spam: +$("#checkbox").is(":checked"),
                recaptchaResponse: (typeof (window.grecaptcha) != "undefined") ? window.grecaptcha.getResponse() : ""
            };
    
        if (data.name == "") {
            $(".input-name").parent().addClass("error");
            $(".name-error").show();
            isValid = false;
        }
        if (data.email == "") {
            $(".input-email").parent().addClass("error");
            $(".email-error").text("Email is empty").show();
            isValid = false;
        } else if (!isValidEmail(data.email)) {
            $(".input-email").parent().addClass("error");
            $(".email-error").text(window.errorMessage.GetMessageByType("Email is incorrect")).show();
            isValid = false;
        }
        if (!PhoneController.phoneControlContainer.find("#phone")[0].validity.valid) {
            if (data.phone == "" || data.phone == PhoneController.selectedCountryPhone.country_code || $.trim(PhoneController.phoneControlContainer.find("#phone").val()) == "") {
                $(".phone-error").html(errorMessage.GetMessageByType("Phone is empty")).show();
            } else {
                $(".phone-error").html(errorMessage.GetMessageByType("Phone is incorrect")).show();
            }
            PhoneController.ShowErrors();
            isValid = false;
        }
        if (data.companyName == "") {
            $(".input-company-name").parent().addClass("error");
            $(".company-name-error").show();
            isValid = false;
        }
        if (data.website && patternWebSite.test(data.website) == false) {
            $(".input-company-website").addClass("error");
            $(".company-website-error").text("Company website is incorrect").show();
            isValid = false;
        }
        if (!isValid) {
            $(".divRequestProgress").hide();
            $(".progress-panel .button").addClass("disabled").removeClass("text-hide");
            $(".btn-loader").hide();
            return;
        }
    };

    function inputFocus() {
        $(this).parent().removeClass("error").removeClass("valid").addClass("focus");
        $(this).parent().next(".error-text").hide();

        if ($(this)[0].id == "phone") {
            PhoneController.ClearErrors();
            $(".phone-error").hide();
            $(".phoneControlContainer").removeClass("valid");
        } else {
            $("." + $(this)[0].id + "-error").hide();
        }

        if ($(this)[0].id === "company-website" && $(this).val() === "") {
            $(this).val("https://");
        }
    };
    
    function inputFocusOut() {
        let currentInput = $(this);
    
        let currentInputId = currentInput[0].id;
        let currentInputWrapper = currentInput.parent();
        currentInputWrapper.removeClass("focus");
    
        let currentInputValue = $.trim(currentInput[0].value);
        if (currentInputValue.length > 0) {
            currentInput.addClass("valid");
        }
    
        if (currentInputId == "email") {
            if (currentInputValue == "") {
                currentInput.parent().addClass("error");
                $(currentInputWrapper).next(".error-text").text("Email is empty").show();
            } else if (!isValidEmail(currentInputValue)) {
                currentInput.parent().addClass("error");
                $(currentInputWrapper).next(".error-text").text("Email is incorrect").show();
            } else {
                currentInput.removeClass("error");
                $(currentInputWrapper).next("error-text").hide();
                currentInputWrapper.addClass("valid");
            }
        } else if (currentInputId == "name") {
            if (currentInputValue == "") {
                currentInputWrapper.addClass("error");
                $(".name-error").show();
                isValid = false;
            } else {
                currentInputWrapper.removeClass("error").addClass("valid");
                $(".name-error").hide();
            }
        } else if (currentInputId == "phone") {
            if ((PhoneController.GetPhone() == "" || PhoneController.GetPhone() == PhoneController.selectedCountryPhone.country_code || $.trim(PhoneController.phoneControlContainer.find("#phone").val()) == "")) {
                $(".phone-error").html("Phone is empty").show();
                PhoneController.ShowErrors();
                isValid = false;
            } else {
                if (PhoneController.phoneControlContainer.find("#phone")[0].validity.valid) {
                    $(".phoneControlContainer").addClass("valid");
                } else {
                    $(".phone-error").html("Phone is incorrect").show();
                    PhoneController.ShowErrors();
                    isValid = false;
                }
            }
        } else if (currentInputId == "company-name") {
            if (currentInputValue == "") {
                currentInputWrapper.addClass("error");
                $(".company-name-error").show();
                isValid = false;
            } else {
                currentInputWrapper.removeClass("error").addClass("valid");
                $(".company-name-error").hide();
            }
        } else if (currentInputId == "company-website") {
            if (currentInputValue === "https://" || currentInputValue === "") {
                currentInput.val("");
                currentInputWrapper.removeClass("error valid");
                $(".company-website-error").hide();
            } else if (currentInputValue && patternWebSite.test(currentInputValue) == false) {
                currentInputWrapper.addClass("error");
                $(".company-website-error").text("Company website is incorrect").show();
                isValid = false;
            } else {
                currentInputWrapper.removeClass("error").addClass("valid");
                $(".company-website-error").hide();
            }
        } else if (currentInputValue.length > 0) {
            currentInput.parent().addClass("valid");
        }
    };

    function switchAccessToSbmtRequestBtn() {
        if (!(($.trim($("#name").val()) == "") || ($.trim($("#email").val()) == "") || ($.trim($("#company-name").val()) == "") || ($.trim($("#phone").val()).length < 2) || (grecaptcha.getResponse() == ""))) {
            $(".progress-panel .button").removeClass("disabled");
        } else {
            $(".progress-panel .button").addClass("disabled");
        }
    };

    $("#phone").focus(function () {
        $(".phoneControlContainer").addClass("active");
        $(".phoneControlContainer").addClass("focus");
    });

    $("#phone").focusout(function () {
        if ($(".phoneControlInput:first")[0].value == "") {
            $(".phoneControlContainer").removeClass("active");
        } else {
            $(".phoneControlContainer").addClass("active");
        }
        $(".phoneControlContainer").removeClass("focus");
    });
    
    $(".data-item input").focus(inputFocus).focusout(inputFocusOut);

    $("input").on("input keyup change focusout", switchAccessToSbmtRequestBtn);

    $(".progress-panel .button").on("click", function () {
        if ($(".progress-panel .button").hasClass("disabled")) return;
        $(".progress-panel .button").addClass("disabled").addClass("text-hide");
        $(".btn-loader").show();
    
        _sendServerRequest();
    });

    function onSuccesfulResponse() {
        $(".btn-loader").hide();
        $(".progress-panel .button").removeClass("disabled").addClass("text-hide");

        setTimeout(function () {
            $(".progress-panel .button").addClass("disabled").removeClass("text-hide");
            _clearData();
            _clearErrors();
        }, 5000);

        grecaptcha.reset();
    };

    function onFailedRequest() {
        $(".error-req").show();
        $(".btn-loader").hide();
        $(".progress-panel .button").removeClass("disabled").addClass("error-req-active");

        setTimeout(function () {
            $(".error-req").hide();
            $(".progress-panel .button").removeClass("text-hide error-req-active");
            switchAccessToSbmtRequestBtn();
        }, 5000);
    };
});

function recaptchaCallback() {
    $(".recaptcha-error").hide();
    if (!(($.trim($("#name").val()) == "") || ($.trim($("#email").val()) == "") || ($.trim($("#company-name").val()) == "") || ($.trim($("#phone").val()).length < 2))) {
        $(".progress-panel .button").removeClass("disabled");
    }
};