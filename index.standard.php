<!DOCTYPE HTML>
<html>
<head><title>team-holm.net</title>
	<meta name="description" content="Atle Holm, Personalia, Utdanning, Notater, Interesser, Lenker" />
	<meta name="keywords" content="Atle, Holm, Atle Holm, Informasjon, Information, person, IT, ranting, blogg, IT-blogg, Scripts, BASH, PERL, PowerShell, VBS, VisualBasic, Java, free code, code, rollespill, AD&ampD, software, free software, Linux" />
	<meta name="author" content="Atle Holm" />
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
	<link rel="Stylesheet" type="text/css" href="css/myStyle.css?v=0007" />
	<link rel="Stylesheet" type="text/css" href="css/pace.css" />
	<link rel="Stylesheet" type="text/css" href="css/lightbox.css"  />
	<link rel="Stylesheet" type="text/css" href="css/myWeather.css"  />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/pace.min.js"></script>
	<script type="text/javascript" src="js/jquery.animate-colors-min.js"></script>
	<script type="text/javascript" src="js/myFunctions.js?v=0006"></script>
	<script type="text/javascript" src="js/jQueryFunctions.js"></script>
	<script type="text/javascript" src="js/lightbox.js?v=0001"></script>
	<script type="text/javascript" src="js/myWeather.js"></script>
<script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47427351-3', 'team-holm.net');
  ga('send', 'pageview');

</script>
<script>
    lightbox.option({
      'maxWidth': 800,
      'maxHeight': 600
    });
</script>
</head>
<body style="background-color: #D7D6D6">
<div id="container">
	<a href="index.php" title="Home"><img src="images/logos/team-holm1.png" width="100" height="60" style="margin-left:35px;margin-bottom:8px;border:0px;" alt="" /></a>
	<a href="http://itblog.team-holm.net" title="IT technicalities" target="_blank"><img src="images/logos/itblog1.png" width="70" height="42" style="margin-left:0px;margin-bottom:8px;border:0px;" alt="" /></a>
	<a href="http://scripts.team-holm.net" title="IT Scripts" target="_blank"><img src="images/logos/scripts1.png" width="70" height="42" style="margin-left:0px;margin-bottom:8px;border:0px;" alt="" /></a>
	<div id="inlineContainer">
		<div id="inlineRow">
			<div id="inlineCell1">
				<div id="familySelections" class="bannerSelections">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<a href="http://josef.team-holm.net" name="languageLink" title="Josef" target="_blank"><img src="images/josef_ikon.png" height="24" width="24" alt="" /></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="http://natnaree.team-holm.net" name="languageLink" title="Natnaree" target="_blank"><img src="images/natnaree_ikon.png" height="24" width="24" alt="" /></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="http://angsumarin.team-holm.net" name="languageLink" title="Angsumarin" target="_blank"><img src="images/angsumarin_ikon.png" height="24" width="24" alt="" /></a>
							</td>
						</tr>
					</table>
				</div>
			</div> <!-- Ends inlineCell1 -->
			<div id="inlineCell2">
				<table WIDTH="1000" border="0" style="border: 3px solid black;" background="" id="mainTableForm">
					<tr height="45" class="backgray" align="center">
						<td width="18%" align="center" id="headerOne" class="bannerButtonUp_1" onMouseOver="document.getElementById('headerOne').className = 'bannerButtonDown_1';" onMouseOut="document.getElementById('headerOne').className = 'bannerButtonUp_1';" onMouseDown="printPersonalia( );"><a href="#pers" class="<?php echo headerLinkClass_detect($translation->getLanguage()); ?>" onClick="printPersonalia( );" id="personalia"><?php echo ucfirst(utf8_encode($translation->getTranslation("personalia"))); ?></a></td>
						<td width="18%" align="center" id="headerTwo" class="bannerButtonUp_2" onMouseOver="document.getElementById('headerTwo').className = 'bannerButtonDown_2';" onMouseOut="document.getElementById('headerTwo').className = 'bannerButtonUp_2';" onMouseDown="printEdu( );"><a href="#edu" class="<?php echo headerLinkClass_detect($translation->getLanguage()); ?>" onClick="printEdu( );" id="utdanning"><?php echo ucfirst(utf8_encode($translation->getTranslation("utdanning"))); ?></a></td>
						<td width="28%" align="center" id="headerThree" class="bannerButtonUp_3" onMouseOver="document.getElementById('headerThree').className = 'bannerButtonDown_3';" onMouseOut="document.getElementById('headerThree').className = 'bannerButtonUp_3';" onMouseDown="printSharing( );"><a href="#share" class="<?php echo ($lang == "is" ? "headerLinkIce-white" : "headerLink-white"); ?>" onClick="printSharing( );" onMouseOver="setMenu('linkMenu2','visible');" id="notater"><span id="goldCode">C</span><span id="redCode">O</span><span id="greenCode">D</span><span id="blueCode">E</span></a></td>
						<td width="18%" align="center" id="headerFour" class="bannerButtonUp_4" onMouseOver="document.getElementById('headerFour').className = 'bannerButtonDown_4';" onMouseOut="document.getElementById('headerFour').className = 'bannerButtonUp_4';" onMouseDown="printInt( );"><a href="#int" class="<?php echo headerLinkClass_detect($translation->getLanguage()); ?>" onClick="printInt( );" id="interesser"><?php echo ucfirst(utf8_encode($translation->getTranslation("interesser"))); ?></a></td>
						<td width="18%" align="center" id="headerFive" class="bannerButtonUp_5" onMouseOver="document.getElementById('headerFive').className = 'bannerButtonDown_5';" onMouseOut="document.getElementById('headerFive').className = 'bannerButtonUp_5';" onMouseDown="printLinks( );"><a href="#links" class="<?php echo headerLinkClass_detect($translation->getLanguage()); ?>" onClick="printLinks( );" onMouseOver="; setMenu('linkMenu4','visible');" id="lenker"><?php echo ucfirst(utf8_encode($translation->getTranslation("lenker"))); ?></a></td>
					</tr>
					<tr bgcolor="Black" height="5">
						<td align="top" colspan="5">
						</td>
					</tr>
					<tr>
						<td class="backwhite" colspan="5" background="">
							<b id="divHeader"><center><h1><br/></h1></center></b><br/>
							<a NAME="field"><div id="divField" class="centerText">							
							<img src="images/10639735_s.jpg" height="285" width="401" />
							<?php
                     if(ae_detect_ie()) {
                        echo "<p><b><font size=\"2\">These pages are better viewed and supported in other web browsers then Internet Explorer. <br/>Google Chrome or FireFox are recommended favorites.</font></b></p><p>&nbsp;</p>";
                     } else {
                        echo "<p>&nbsp;</p><p>&nbsp;</p>";
                     }
                            ?>
							</div></a>
						</td>
					</tr>
					<tr>
						<td height="5" align="center" colspan="5">
						</td>
					</tr>
				</table>
				<div id="wxWrap">
					<span id="wxIntro">
						<script type="text/javascript" language="javascript">
							$('#wxIntro').html(setText('wxIntro'));
						</script>
					</span>
					<span id="wxIcon2"></span>
					<span id="wxTemp"></span>
				</div>
				<span id = "linkMenu0" class = "boxed5"><a href = "#" class="menuLink"><!-- --></a><br><br></span>
				<span id = "linkMenu1" class = "boxed5"><a href = "#" class="menuLink"><!-- --></a><br><br></span>
				<span id = "linkMenu2" class = "boxed3"><a href = "#" class="menuLink"><!-- --></a><br><br></span>
				<span id = "linkMenu3" class = "boxed5"><a href = "#" class="menuLink"><!-- --></a><br><br></span>
				<span id = "linkMenu4" class = "boxed5"><a href="http://midgard.team-holm.net" class="menuLink" target="_blank">Midgard</a><br><a href="http://itblog.team-holm.net" class="menuLink" target="_blank">IT-blog</a><br><a href="http://scripts.team-holm.net" class="menuLink" target="_blank">Scripts</a><br> <a href="http://lost.team-holm.net" class="menuLink" target="_blank">Lost stuff</a><br></span>	
			</div> <!-- Ends inlineCell2 -->
			<div id="inlineCell3">
				<div id="languageSelections" class="bannerSelections">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<a href="<?php echo $localPage."/?lang=no" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.."><img src="images/flags/Norway.png" /></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="<?php echo $localPage."/?lang=is" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.."><img src="images/flags/Iceland.png" /></td></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="<?php echo $localPage."/?lang=en" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.."><img src="images/flags/United-Kingdom.png" /></td></a>
							</td>
						</tr>
					</table>
				</div>
			</div> <!-- Ends inlineCell2 -->
		</div> <!-- Ends inlineRow -->
	</div> <!-- Ends inlineContainer -->
</div> <!-- Ends container -->
</body>
</html>