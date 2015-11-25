<!DOCTYPE HTML>
<html>
<head>
<title>ClassRoomScheduling</title>
<link href="css1/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js1/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css1/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 










</script>

<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:100,300,400,600,700,800'
	rel='stylesheet' type='text/css'>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js1/move-top.js"></script>
<script type="text/javascript" src="js1/easing.js"></script>
<!---- start-smoth-scrolling---->
</head>
<body>

	<div class="header_bottom">
		<div class="container">
			<div class="logo">
				<a href="Index.jsp"><img src="img/CRS.png" alt="" /></a>
			</div>
			<div class="consul_btn1">
				<a href="#">Free Consultation</a>
			</div>
			<div class="menu">
				<div class="h_menu4">
					<!-- start h_menu4 -->
					<a class="toggleMenu" href="#">Menu</a>
					<div class="nav_icon">
						<img src="images/nav_icon.png" alt="" />
					</div>
					<ul class="nav">

						<li class="active"><a href="#home" class="scroll">Home</a></li>
						<li><a href="#about" class="scroll">About Us</a>
						<li><a href="#contact" class="scroll">Contact us</a></li>
						
					</ul>
					<script type="text/javascript" src="js1/nav.js"></script>
				</div>
				<!-- end h_menu4 -->
				<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event) {
							event.preventDefault();
							$('html,body').animate({
								scrollTop : $(this.hash).offset().top
							}, 1000);
						});
					});
				</script>

				<div class="consul_btn">
					<a href="Login.jsp">Login</a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="slider_custom" id="home">
	
		<div class="slider_container">
			<div class="wmuSlider example1">
				<div >
				
					<article style="position: absolute; width: 100%; opacity: 0;">
						<div class="banner-wrap">
							<div class="slider-left">
								<h1><font color=#00000>Welcome to</font></h1>
								<p class="top"><font color=#00000>ClassRoomScheduling</font></p>
								<ul class="button">
									<li><a href="Student_Registration.jsp">Register</a></li>
								</ul>
							</div>
						</div>
					</article>

				</div>
			</div>
			<script src="js1/jquery.wmuSlider.js"></script>
			<script>
				$('.example1').wmuSlider();
			</script>
		</div>
		
	</div>
	<div class="main">
		<div id="about" class="about">
			<div class="container">
				<div class="gallery-head text-center">
					<h3>About Us</h3>
					<p>Making Future Nothing Else!</p>
					<span> </span>
				</div>
				<div class="row text-center">
					<div class="col-md-4 about_grid">
						<i class="icon1"> </i>
						<h3>
							<a href="www.facebook.com/CRS">Facebook</a>
						</h3>
						
					</div>
					
					
				</div>
			</div>
		</div>
		
		

		
		
	</div>
	<div class="contact" id="contact">

			<div class="container">
				<div class="work_top text-center">
					<h3>Contact Us</h3>
					<h5>CRS Developers</h5>
					<h5>Windsor,Canada</h5>
					<h5>E-mail : abc</h5>
					<h5>Phone:00000000</h5>
					
				</div>


			</div>
		</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="copy">
				<p>
					2015 &copy; ClassRoomScheduling <a href="" target="_blank"> </a>
				</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>

