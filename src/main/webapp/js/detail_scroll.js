window.addEventListener("scroll", function() {
	var scroll = window.pageYOffset || document.documentElement.scrollTop;
	var lnb = document.getElementById("lnb");

	if (scroll >= 100) {
			lnb.classList.add("fixed");
	} else {
			lnb.classList.remove("fixed");
	}

	if (scroll >= 3600) {
			lnb.classList.add("absolute");
			lnb.style.top = "3600px";
	} else {
			lnb.classList.remove("absolute");
			lnb.style.top = "";
	}
});