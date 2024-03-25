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

function adaptiveSvgPath() {
	if ($(window).width() > 1250) {
		const docspaceBlockHeight = Number($(".main-item.docspace").outerHeight(true).toFixed()) + 327;
		const mainItemInnerHeightDocspace = $(".main-item.docspace .main-item-inner").outerHeight(true).toFixed();
		const pathDocspace = `M96.5 ${Number($(".main-item.docspace .main-item-wrapper").outerHeight(true).toFixed()) + 327}V${380 + Number(mainItemInnerHeightDocspace)}L63.5 ${354 + Number(mainItemInnerHeightDocspace)}V310`;

		$(".line.line-1 svg").attr("height", docspaceBlockHeight).attr("viewBox", `0 0 109 ${docspaceBlockHeight}`);
		$(".path-line-1").attr("d", pathDocspace);
		$(".line-ellipse.line-1-ellipse-4").css("offset-path", "path('" + pathDocspace + "')");
		$(".line-circle.line-1-circle-2").css("offset-path", "path('" + pathDocspace + "')");
		$(".line-ellipse.line-1-ellipse-4").css("top", $(".main-item-links.docspace li:first-child a").position().top - (Number($(".main-item.docspace .main-item-wrapper").outerHeight(true).toFixed()) - 48));

		const docsBlockHeight = Number($(".main-item.docs").outerHeight(true).toFixed()) + 317;
		const mainItemInnerHeightDocs = $(".main-item.docs .main-item-inner").outerHeight(true).toFixed();
		const pathDocs = `M94.5 ${Number($(".main-item.docs .main-item-wrapper").outerHeight(true).toFixed()) + 281}V${368 + Number(mainItemInnerHeightDocs)}L61.5 ${344 + Number(mainItemInnerHeightDocs)}V334`;

		$(".line.line-2 svg").attr("height", docsBlockHeight).attr("viewBox", `0 0 106 ${docsBlockHeight}`);
		$(".path-line-2").attr("d", pathDocs);
		$(".line-ellipse.line-2-ellipse-3").css("offset-path", "path('" + pathDocs + "')");
		$(".line-circle.line-2-circle-2").css("offset-path", "path('" + pathDocs + "')");
		$(".path-line-2-2").attr("d", `M62 ${Number(mainItemInnerHeightDocs) + Number("344")}V279`);
		$(".line-ellipse.line-2-ellipse-3").css("top", $(".main-item-links.docs li:first-child a").position().top - (Number($(".main-item.docs .main-item-wrapper").outerHeight(true).toFixed()) - 55));

		const portalsBlockHeight = Number($(".main-item.portals").outerHeight(true).toFixed()) + 103;
		const mainItemInnerHeightPortals = $(".main-item.portals .main-item-inner").outerHeight(true).toFixed();
		const pathPortals = `M96.5001 ${Number($(".main-item.portals .main-item-wrapper").outerHeight(true).toFixed()) + 98}V${148 + Number(mainItemInnerHeightPortals)}L63.5001 ${125 + Number(mainItemInnerHeightPortals)}V73`;

		$(".line.line-3 svg").attr("height", portalsBlockHeight).attr("viewBox", `0 0 110 ${portalsBlockHeight}`);
		$(".path-line-3").attr("d", pathPortals);
		$(".line-ellipse.line-3-ellipse-3").css("offset-path", "path('" + pathPortals + "')");
		$(".line-circle.line-3-circle-2").css("offset-path", "path('" + pathPortals + "')");
		$(".line-ellipse.line-3-ellipse-3").css("top", $(".main-item-links.portals li:first-child a").position().top - (Number($(".main-item.portals .main-item-wrapper").outerHeight(true).toFixed()) - 53));
	}
}

$(window).on("load", function() {
	adaptiveSvgPath();

	function animateEllipses(...ellipses) {
		let currentEllipseIndex = 0;

		function toggleAnimation() {
			ellipses.forEach((ellipse) => ellipse.removeClass("animate"));
			ellipses[currentEllipseIndex].addClass("animate");
			currentEllipseIndex = (currentEllipseIndex + 1) % ellipses.length;
		}

		toggleAnimation();

		setInterval(toggleAnimation, 3000);
	};

	animateEllipses($(".line-1-ellipse-1"), $(".line-1-ellipse-2"), $(".line-1-ellipse-3"));
	animateEllipses($(".line-2-ellipse-1"), $(".line-2-ellipse-2"));
	animateEllipses($(".line-3-ellipse-1"), $(".line-3-ellipse-2"));

	function handleMouseMoveEllipse(selector, lineClass, offset) {
		if ($(selector).length > 0) {
			selector.each((index, el) => {
				$(el).on("mousemove", function () {
					lineClass.css("top", $(this).position().top - offset);
				});
			});
		}
	};

	handleMouseMoveEllipse($(".main-item-links.docspace li a"), $(".line-ellipse.line-1-ellipse-4"), Number($(".main-item.docspace .main-item-wrapper").outerHeight(true).toFixed()) - 48);
	handleMouseMoveEllipse($(".main-item-links.docs li a"), $(".line-ellipse.line-2-ellipse-3"), Number($(".main-item.docs .main-item-wrapper").outerHeight(true).toFixed()) - 55);
	handleMouseMoveEllipse($(".main-item-links.portals li a"), $(".line-ellipse.line-3-ellipse-3"), Number($(".main-item.portals .main-item-wrapper").outerHeight(true).toFixed()) - 53);

	function createIntersectionObserver(selector, callback) {
		if ($(selector).length > 0) {
			const observer = new IntersectionObserver(function (entries, observer) {
				entries.forEach(function (entry) {
					if (entry.isIntersecting) {
						callback(entry.target);
					}
				});
			}, { root: null, threshold: 0 });
	
			observer.observe($(selector)[0]);
		}
	};

	createIntersectionObserver(".main-item.docs", function () {
		$(".line-1-circle-1").addClass("animate");
		$(".line-1-circle-2").addClass("animate");
	});

	createIntersectionObserver(".main-item.docspace", function () {
		$(".line-2-circle-1").addClass("animate");
		$(".line-2-circle-2").addClass("animate");
	});

	createIntersectionObserver(".main-item.portals", function () {
		$(".line-3-circle-1").addClass("animate");
		$(".line-3-circle-2").addClass("animate");
	});
});

$(document).ready(function () {
	$(window).resize(function() {
    adaptiveSvgPath();
  });
});