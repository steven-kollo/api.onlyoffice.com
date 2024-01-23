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


$(document).ready(function () {
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
		selector.each((index, el) => {
			$(el).on("mousemove", function () {
				lineClass.css("top", $(this).position().top - offset);
			});
		});
	};

	handleMouseMoveEllipse($(".main-item-links.docs li a"), $(".line-ellipse.line-1-ellipse-4"), 450);
	handleMouseMoveEllipse($(".main-item-links.docspace li a"), $(".line-ellipse.line-2-ellipse-3"), 495);
	handleMouseMoveEllipse($(".main-item-links.workspace li a"), $(".line-ellipse.line-3-ellipse-3"), 380);

	function createIntersectionObserver(selector, callback) {
		const observer = new IntersectionObserver(function (entries, observer) {
			entries.forEach(function (entry) {
				if (entry.isIntersecting) {
					callback(entry.target);
				}
			});
		}, { root: null, threshold: 0 });

		observer.observe($(selector)[0]);
	};

	createIntersectionObserver(".main-item.docs", function () {
		$(".line-1-circle-1").addClass("animate");
		$(".line-1-circle-2").addClass("animate");
	});

	createIntersectionObserver(".main-item.docspace", function () {
		$(".line-2-circle-1").addClass("animate");
		$(".line-2-circle-2").addClass("animate");
	});

	createIntersectionObserver(".main-item.workspace", function () {
		$(".line-3-circle-1").addClass("animate");
		$(".line-3-circle-2").addClass("animate");
	});
});