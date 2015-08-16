<?php 
	session_start();
	include "allFunctions.inc.php";
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>My lost stuff...</title>
	<meta name="description" content="Levels for games, Half-Life, Quake, Quke 2, Command and Conquer, Red Alert 2, StarCraft, old programming code, Half-Life 1 lights.rad, lights.rad, Sun Solaris" />
	<meta name="keywords" content="IT, game creations, spill, skaperverk, games, creations, code, code examples, examples, kode, eksempler, kiddy stuff, other stuff, spill brett, half-life, game levels, levels, C&C, Command and Conquer, Red Alert Levels, Quake, Quake 2, Quake Levels, Quake brett, kiddy programmering, fjortissprogrammering, lights.rad, Sun Solaris Excercises Norwegian, Sun Solaris" />
	<meta name="author" content="Atle Holm" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	
	<link rel="Stylesheet" type="text/css" media="screen" href="css/jquery.shadow.css" />	
	<link rel="Stylesheet" type="text/css" href="css/lightbox.css" />
	<link rel="Stylesheet" type="text/css" href="css/screen.css" />
	<link rel="Stylesheet" type="text/css" href="css/myStyles.css" />
	<!--link rel="Stylesheet" type="text/css" href="css/myStyles.css" /-->
	<link rel="Stylesheet" type="text/css" href="css/lightbox.css"  />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.shadow.js"></script>
	<script type="text/javascript" src="js/jQueryFunctions.js"></script>
	<script type="text/javascript" src="js/lightbox-2.6.min.js"></script>
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
	<script type="text/javascript" src="js/vegas/jquery.vegas.js"></script>
	<link rel="stylesheet" type="text/css" href="js/vegas/jquery.vegas.css" />
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47427351-4', 'team-holm.net');
  ga('send', 'pageview');

</script>
</head>
<body>
	<a href="http://www.team-holm.net"><img src="images/logos/team-holm1.png" width="100" height="60" style="position:absolute; bottom:15px; right:5px; border:0px;"/></a>
	<?php
		displayPanelMenu();
	?>
		<table style="margin-left:auto;margin-right:auto;">
			<tr><td>
			<?php
				setGameCreations();		
			?>
			</td></tr>
			<tr><td>
			<?php
				setOldCode();
			?>
			</td></tr>	
			<tr><td>
			<?php
				setWhatsup();
			?>
			</td></tr>
			<tr><td>
			<?php
				setOtherStuff();
			?>
			</td></tr>
		</table>
	<?php
		setGasDeath101Pictures();
		setMalosPatosPictures();
		setHometripPictures();
		setPnFortPictures();
		setHeadOnPictures();
		setSandMissionPictures();
		setUprisingPictures();
		setTorturePictures();
	?>
</body>
</html>
