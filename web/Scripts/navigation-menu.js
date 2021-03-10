$(function () {

    var menuBreakpoint = '1024';
    var headerShadowed = false;

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }
    function navHeight() {
        var phoneWrapperPosition = $(".phone_wrapper").css("position"),
            menuHeight = $(".all-menu-items").innerHeight(),
            windowHeight = window.innerHeight;
        if (phoneWrapperPosition == "fixed") {
            menuHeight = menuHeight + 140;
        } else {
            menuHeight = menuHeight;
        }
        if (menuHeight > windowHeight) {
            $('ul.all-menu-items').append($(".search-box-container")).append($(".phone_wrapper"));
            $(".search-box-container, #search-button").addClass("nav-height-over");
            $(".phone_wrapper").css("position", "relative");
        } else {
            $('.pushy-content').append($(".phone_wrapper"));
            $('.pushy-left').append($(".search-box-container"));
            $(".search-box-container, #search-button").removeClass("nav-height-over");
            $(".phone_wrapper").css("position", "fixed");
        }
    }
    if ($("div.pushy-link").length) {
        $(".pushy-link").on("click", function () {
            $(".pushy-submenu")
                .addClass('pushy-submenu-closed')
                .removeClass('pushy-submenu-open');
            if (window.innerWidth < menuBreakpoint) {
                var submenuOpen = $('.pushy-submenu.pushy-submenu-open');
                if (submenuOpen != null) {
                    $('.pushy-submenu').css('display', 'block');
                } else {
                    $('.pushy-submenu').show();
                }
            }
        });
    }

    $(".ham_menu").on("click", function () {
        if (!headerShadowed) {
            $("header").addClass("overlayed");
            $(".narrowheader").addClass("overlayed");
            headerShadowed = true;
        } else {
            $("header").removeClass("overlayed");
            $(".narrowheader").removeClass("overlayed");
            headerShadowed = false;
        }
    });
    
    var onlyofficeCookie = $.cookies.get('onlyoffice_cookie');
    if (onlyofficeCookie == null || onlyofficeCookie == false) {
        if (!$('body').hasClass('desktop')) $('.cookie_mess').show();
    }
    $('.cookie_mess_button').click(function () {
        $('.cookie_mess').hide();

        var d = new Date();
        d.setFullYear(d.getFullYear() + 1);

        $.cookies.set('onlyoffice_cookie', true, { expiresAt: d});
    });
    
    $('header').mouseleave(function () {
        mouseleaveCloseMenu();
    });
    $('nav > div > ul > li > div').mouseleave(function() {
        mouseleaveCloseMenu();
    });
    
    var doc = $(document),
        header = $('header');
    $(window).on('scroll', function() {
        if (onlyofficeCookie == null || onlyofficeCookie == false) {
            var docTop = doc.scrollTop(),
                headerTop = $('.cookie_mess').height();
            if (docTop > headerTop) {
                if (!header.hasClass('fixed')) {
                    header.addClass('fixed');
                }
            } else {
                if (header.hasClass('fixed')) {
                    header.removeClass('fixed');
                }
            }
        } else {
            header.addClass('fixed');
        }
    });
    
    $('body')
        .on("click", "a.nav_2nd_menu_link, .dropdown-item:not(.mobile_no_link)", function () {
            if (window.innerWidth < menuBreakpoint) {
                $('.pushy-link').trigger('click');
                $('body').removeClass('pushy-open-left');
                var href = $(this).attr('href');
            } else {
                mouseleaveCloseMenu();
                var href = $(this).attr('href');
            }
        });
    $('.pushy.pushy-left').click(function () {
        if ($('.menuitem.active').length > 0) {
            $(".pushy-submenu")
                .addClass('pushy-submenu-closed')
                .removeClass('pushy-submenu-open');
            if (window.innerWidth < menuBreakpoint) {
                var submenuOpen = $('.pushy-submenu.pushy-submenu-open');
                if (submenuOpen != null) {
                    $('.pushy-submenu').css('display', 'block');
                } else {
                    $('.pushy-submenu').show();
                }
            }
        } 
    });
    $('.menuitem')
        .click(function () {
            var menuitem = $(this);
            if (window.innerWidth < menuBreakpoint) {
                if ($($(this)[0].parentNode).hasClass('pushy-submenu-closed')) {
                    $('.pushy-submenu').hide();
                    $($(this)[0].parentNode).show();
                } else {
                    $('.pushy-submenu').show();

                    $(this).removeClass("mobile-menuitem-hover");
                }
            } else {
                $('ul.akkordeon li > a').addClass('active');
                $('ul.akkordeon li > div').show();

                $('.top_border').removeClass('top_border');
                
                setTimeout(function() {
                    menuitem.next().addClass('top_border');
                }, 100);
            
            }
        })
        .hover(function (event) {
            if (window.innerWidth >= menuBreakpoint) {
                var menuitem = $(this);
                if (!menuitem.hasClass('active')) {
                    menuitem.click();
                }
            }
        });
    var mobileMenu = function () {
        $('ul.all-menu-items').append($(".search-box-container")).append($(".phone_wrapper"));
        $('ul.akkordeon > li > a').removeClass('active');
        $('.footer-search-box').show();
        $('ul.akkordeon > li > a').unbind('click');
        $('ul.akkordeon > li > a').click(function (event) {
            if (!$(this).hasClass('active')) {
                $('ul.akkordeon > li > a').removeClass('active').next('div').slideUp();
                $(this).addClass('active');
                $(this).next('div').slideDown(200);
            } else {
                $(this).removeClass('active').next('div').slideUp();
            }
            event.stopPropagation();
        });
        $(".all-menu-items > li > a").on("mouseenter", function () {
            $(this).addClass("mobile-menuitem-hover");
        });
        $(".all-menu-items > li > a").on("mouseleave", function () {
            $(this).removeClass("mobile-menuitem-hover");
        });
    };
    var desktopMenu = function() {
        $('ul.akkordeon > li > a').unbind('click');
        $('ul.akkordeon > li > a').addClass('active');
        $('.pushy-content').append($(".phone_wrapper"));
        $('.pushy-left').append($(".search-box-container"));
    };
    var mouseleaveCloseMenu = function() {
        if (window.innerWidth > menuBreakpoint) {
            $('.menuitem.active').click();
        } else {
            $("header").removeClass("overlayed");
            $(".narrowheader").removeClass("overlayed");
            headerShadowed = false;
        }
    };
    
    $(document).ready(function () {
        if (window.innerWidth >= menuBreakpoint) {
            desktopMenu();
            $(".phone_wrapper").css("position", "absolute");
        } else {
            mobileMenu();
            navHeight();
            $(".pushy-link, .site-overlay").on("click", function () {

                var zopim = $(".zopim");

                if($("body").hasClass("pushy-open-left")){
                    zopim.hide()
                } else {
                    for (var i = 0; i < zopim.length; i++) {
                        (zopim[i].getAttribute("data-test-id") == "ChatWidgetMobileButton" || zopim[i].getAttribute("data-test-id") == "ChatWidgetButton") && $(zopim[i]).show();
                    }
                }
            });
        }
        var desktopPhoneControlInput = $('body.desktop .signuppageform .dataForm.formSteps div.step .dataItem input.phoneControlInput');
        desktopPhoneControlInput.focus(function () {
            $('.phoneControlContainer').addClass('focus');
        });
        desktopPhoneControlInput.focusout(function () {
            $('.phoneControlContainer').removeClass('focus');
        });
    });
    $(".all-menu-items").on("mresize", function(){
        if(window.innerWidth < menuBreakpoint) {
            navHeight();
        } else {
            $(".phone_wrapper").css("position", "absolute");
        }
    });
    $(document.body).trigger("resize");
    $(window).resize(function () {
        if (window.innerWidth >= menuBreakpoint) {
            $('.pushy-submenu').css('display', 'inline-block');
            desktopMenu();
            $(".phone_wrapper").css("position", "absolute");
        } else {
            mobileMenu();
            navHeight();
            var submenuOpen = $('.pushy-submenu.pushy-submenu-open');
            if (submenuOpen != null) {
                $('.pushy-submenu').css('display', 'block');
                submenuOpen.click();
            } else {
                $('.pushy-submenu').show();
            }
        }
    });

    
    //init Top Navigation Menu events
    $.dropdownToggle({
        dropdownID: "navitem_prices_menu",
        switcherSelector: "#navitem_prices",
        simpleToggle: true,
        showFunction: function (switcherObj, dropdownItem) {
            if (dropdownItem.is(":hidden")) {
                switcherObj.addClass("active");

                var promo = $(".nav_free_for_np").removeClass("display-none");
                var random = getRandomInt(0, promo.length);

                $.each(promo, function (index, value) {
                    if (index != random)
                        $(value).addClass("display-none");
                });

            } else {
                switcherObj.removeClass("active");
            }
        },
        hideFunction: function () {
            $("#navitem_prices").removeClass("active");
        }
    });

    $.dropdownToggle({
        dropdownID: "navitem_solutions_menu",
        switcherSelector: "#navitem_solutions",
        simpleToggle: true,
        showFunction: function (switcherObj, dropdownItem) {
            if (dropdownItem.is(":hidden")) {
                switcherObj.addClass("active");
            } else {
                switcherObj.removeClass("active");
            }
        },
        hideFunction: function () {
            $("#navitem_solutions").removeClass("active");
        }
    });

    $.dropdownToggle({
        dropdownID: "navitem_features_menu",
        switcherSelector: "#navitem_features",
        simpleToggle: true,
        showFunction: function (switcherObj, dropdownItem) {
            if (dropdownItem.is(":hidden")) {
                switcherObj.addClass("active");
            } else {
                switcherObj.removeClass("active");
            }
        },
        hideFunction: function () {
            $("#navitem_features").removeClass("active");
        }
    });

    $.dropdownToggle({
        dropdownID: "navitem_partnership_menu",
        switcherSelector: "#navitem_partners",
        simpleToggle: true,
        showFunction: function (switcherObj, dropdownItem) {
            if (dropdownItem.is(":hidden")) {
                switcherObj.addClass("active");
            } else {
                switcherObj.removeClass("active");
            }
        },
        hideFunction: function () {
            $("#navitem_partners").removeClass("active");
        }
    });

    $.dropdownToggle({
        dropdownID: "navitem_about_menu",
        switcherSelector: "#navitem_about",
        simpleToggle: true,
        showFunction: function (switcherObj, dropdownItem) {
            if (dropdownItem.is(":hidden")) {
                switcherObj.addClass("active");
            } else {
                switcherObj.removeClass("active");
            }
        },
        hideFunction: function () {
            $("#navitem_about").removeClass("active");
        }
    });

    $.dropdownToggle({
        dropdownID: "navitem_download_menu",
        switcherSelector: "#navitem_download",
        simpleToggle: true,
        showFunction: function (switcherObj, dropdownItem) {
            if (dropdownItem.is(":hidden")) {
                switcherObj.addClass("active");
            } else {
                switcherObj.removeClass("active");
            }
        },
        hideFunction: function () {
            $("#navitem_download").removeClass("active");
        }
    });

    //init Navigation Menu events
    NavigationMenuManager.bindEvents();

    $(window).on("ready resize", function () {
        if (window.innerWidth < menuBreakpoint) { $(".mobile_no_link").on("click", function (e) { e.preventDefault(); }) };
    });

    if (typeof blogNewsDataObjectLocale != 'undefined') {
        blogNewsDataObject = _.merge(blogNewsDataObject, blogNewsDataObjectLocale);
    }

    var latesNewsKeys = Object.keys(blogNewsDataObject.news);
    var latestNewsObject = blogNewsDataObject.news[latesNewsKeys[0]];
    $("#latest_release_div").on("click", function () {
        location.href = latestNewsObject.blogUrl;
    });
    var menuNewstemplateHtml = $("#menu-news-template").html(),
        menuNewsListHtml = "";
    var articleDate = "",
        articleDay = (new Date(latestNewsObject["dateTime"])).getDate(),
        articleMonth = (new Date(latestNewsObject["dateTime"])).getMonth(),
        articleYear = (new Date(latestNewsObject["dateTime"])).getFullYear();

    articleDate = blogNewsDateTemplate.replace(/{{day}}/g, articleDay)
                              .replace(/{{month}}/g, monthsList[articleMonth])
                              .replace(/{{year}}/g, articleYear);

    menuNewsListHtml += menuNewstemplateHtml.replace(/{{name}}/g, latestNewsObject["name"])
                                            .replace(/{{date}}/g, articleDate);
    $("#latest_release_div").html(menuNewsListHtml);
    $("#latest_release_img").css("background-image", "url(.." + latestNewsObject.img + ")");

    if (typeof customersDataObjectLocale != 'undefined') {
        customersDataObject = _.merge(customersDataObject, customersDataObjectLocale);
    }

    var customersKeys = Object.keys(customersDataObject.customers);
    var customersKey = customerOrder[0];
    var customersObject = customersDataObject.customers[customersKey];
    
    $("#customer_stories_img").css("background-image", "url(.." + customersDataObject.customers[customersKey].img + ")");
    $("#customer_stories_header").text(customersDataObject.customers[customersKey].title);

    var urlLang = location.pathname.substring(0, 4);
    if (urlLang[3] != "/") {
        urlLang = "/";
    }

    $("#customer_stories_div").on("click", function () {
        location.href = urlLang + "customers.aspx";
    });

    $("#compare_div").on("click", function () {
        location.href = urlLang + "compare-editions.aspx";
    });

    $("#reseller_div").on("click", function () {
        location.href = urlLang + "find-partners.aspx";
    });

    $("#security_div").on("click", function () {
        location.href = urlLang + "private-rooms.aspx";
    });
});