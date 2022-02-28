<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Group 7</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="CSS/MyBootrap.css">
<link rel="stylesheet" href="CSS/index_css.css" />
<link rel="stylesheet" href="CSS/nav_css.css" />
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Add css online library -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.mySlides {
	display: none
}

.w3-left, .w3-right, .w3-badge {
	cursor: pointer
}

.w3-badge {
	height: 13px;
	width: 13px;
	padding: 0
}
</style>
</head>

</head>
<body>
	<!---------------------------nav bar ------------------------------->
	<jsp:include page="./group menu.jsp"></jsp:include>
	
	
	<!---------------------------content-------------------------------->

	<div class="w3-content w3-display-container" style="max-width: 1366px">
		<img class="mySlides" src="IMAGES/imag1.png" style="width: 100%">
		<img class="mySlides" src="IMAGES/imag2.png" style="width: 100%">
		<img class="mySlides" src="IMAGES/imag3.png" style="width: 100%">
		<div
			class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle"
			style="width: 100%">
			<div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
			<div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
			<span class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(1)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(2)"></span> <span
				class="w3-badge demo w3-border w3-transparent w3-hover-white"
				onclick="currentDiv(3)"></span>
		</div>
	</div>

	<script>
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function currentDiv(n) {
			showDivs(slideIndex = n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demo");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" w3-white", "");
			}
			x[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " w3-white";
		}

		var slideIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > x.length) {
				slideIndex = 1
			}
			x[slideIndex - 1].style.display = "block";
			setTimeout(carousel, 5000); // Change image every 2 seconds
		}
	</script>

	<div class="row" id="space">
		<div class="col-12"></div>
	</div>

	<!---------------------------footer--------------------------------->
	<!-- The Contact Section -->
	<div class="w3-content w3-padding-64  w3-text-white" id="contact">
		<h2 class="w3-wide w3-center">CONTACT</h2>
		<div class="w3-row w3-padding-32">
			<div class="w3-col m6 w3-large w3-margin-bottom">
				<i class="fa fa-map-marker  w3-text-white" style="width: 30px"></i>
				Nong Lam University,Thu Duc, Ho Chi Minh<br> <i
					class="fa fa-phone  w3-text-white" style="width: 30px"></i> Phone:
				+84987654321<br> <i class="fa fa-envelope  w3-text-white"
					style="width: 30px"> </i> Email: web2017group7@gmail.com<br>
			</div>
			<div class="w3-col m6">
				<form action="/action_page.php" target="_blank">
					<div class="w3-row-padding" style="margin: 0 -16px 8px -16px">
						<div class="w3-half">
							<input class="w3-input w3-border" type="text" placeholder="Name"
								required name="Name">
						</div>
						<div class="w3-half">
							<input class="w3-input w3-border" type="text" placeholder="Email"
								required name="Email">
						</div>
					</div>
					<input class="w3-input w3-border" type="text" placeholder="Message"
						required name="Message">
					<button
						class="w3-button w3-white w3-section w3-right w3-text-black"
						type="submit">SEND</button>
				</form>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<footer class="w3-container w3-padding-5 w3-center w3-xlarge"
		style="background-color: black; border-top-color: red; border-top-style: solid;">
		<i class="fa fa-facebook-official w3-hover-opacity w3-text-white"></i>
		<i class="fa fa-instagram w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-snapchat w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-twitter w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-linkedin w3-hover-opacity w3-text-white"></i>
		<p class="w3-medium w3-text-white">
			Powered by <a href="#" target="_blank">Group 7</a>
		</p>
	</footer>

	<!---------------------------content-------------------------------->

	<!---------------------------footer--------------------------------->
	<footer> </footer>
	<!---------------------------footer--------------------------------->

</body>


</html>