window.addEventListener("scroll", function() {
	var scroll = window.pageYOffset || document.documentElement.scrollTop;
	var lnb = document.getElementById("lnb");
	var high = document.getElementsByClassName("detail_wrap")

	if (scroll >= 100) {
			lnb.classList.add("fixed");
	} else {
			lnb.classList.remove("fixed");
	}

	if (scroll >= 2400 && high>=2400 ) {
			lnb.classList.add("absolute");
			lnb.style.top = "2400px";
	} else {
			lnb.classList.remove("absolute");
			lnb.style.top = "";
	}
});