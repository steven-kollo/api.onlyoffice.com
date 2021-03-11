$(function () {

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }
    if ($("div.pushy-link").length) {
        $(".pushy-link").on("click", function () {
            $(".pushy-submenu")
                .addClass('pushy-submenu-closed')
                .removeClass('pushy-submenu-open');
            if (window.innerWidth < '1024') {
                var submenuOpen = $('.pushy-submenu.pushy-submenu-open');
                if (submenuOpen != null) {
                    $('.pushy-submenu').css('display', 'block');
                } else {
                    $('.pushy-submenu').show();
                }
            }
        });
    }

    $('header').mouseleave(function () {
        mouseleaveCloseMenu();
    });
    $('nav > div > ul > li > div').mouseleave(function () {
        mouseleaveCloseMenu();
    });

    $('body')
        .on("click", "a.nav_2nd_menu_link", function () {
            if (window.innerWidth < '1024') {
                $('.pushy-link').trigger('click');
                $('body').removeClass('pushy-open-left');
                var href = $(this).attr('href');
                highlightMenuItem(href);
            } else {
                mouseleaveCloseMenu();
                var href = $(this).attr('href');
                highlightMenuItem(href);
            }
        });
    $('.pushy.pushy-left').click(function () {
        if ($('.menuitem.active').length > 0) {
            $(".pushy-submenu")
                .addClass('pushy-submenu-closed')
                .removeClass('pushy-submenu-open');
            if (window.innerWidth < '1024') {
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
            if (window.innerWidth < '1024') {
                if ($($(this)[0].parentNode).hasClass('pushy-submenu-closed')) {
                    $('.pushy-submenu').hide();
                    $($(this)[0].parentNode).show();
                } else {
                    $('.pushy-submenu').show();
                }
            } else {
                $('ul.akkordeon li > a').addClass('active');
                $('ul.akkordeon li > div').show();

                $('.top_border').removeClass('top_border');

                setTimeout(function () {
                    menuitem.next().addClass('top_border');
                }, 100);

            }
        })
        .hover(function (event) {
            if (window.innerWidth >= '1024') {
                var menuitem = $(this);
                if (!menuitem.hasClass('active')) {
                    menuitem.click();
                }
            }
        });
    $('.navitem_description').click(function () { return false; })
    var mobileMenu = function () {
        $('ul.akkordeon > li > a').removeClass('active');
        $('ul.akkordeon > li > div').hide();
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
    };
    var desktopMenu = function () {
        $('ul.akkordeon > li > a').unbind('click');
        $('ul.akkordeon > li > a').addClass('active');
        $('ul.akkordeon > li > div').show();
    };
    var mouseleaveCloseMenu = function () {
        if (window.innerWidth > '1024') {
            $('.menuitem.active').click();
            if (!$('#LanguageSelector').hasClass('open')) $('#fshare-collapsed').show();
        }
    };
    function highlightMenuItem(href) {
        var anc = href ? href.split("#")[1] : window.location.hash.replace("#", "");

        $('ul.navitem_2nd_menu li a.nav_2nd_menu_link').removeClass('redirect');
    }
    $(document).ready(function () {
        highlightMenuItem();
        if (window.innerWidth >= '1024') {
            desktopMenu();
        } else {
            mobileMenu();
        }
    });
    $(window).resize(function () {
        if (window.innerWidth >= '1024') {
            $('.pushy-submenu').css('display', 'inline-block');
            desktopMenu();
        } else {
            $(".mobile_no_link").removeAttr("href");
            mobileMenu();
            var submenuOpen = $('.pushy-submenu.pushy-submenu-open');
            if (submenuOpen != null) {
                $('.pushy-submenu').css('display', 'block');
                submenuOpen.click();
            } else {
                $('.pushy-submenu').show();
            }
        }
    });
