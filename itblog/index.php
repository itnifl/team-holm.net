<?php session_start();
	if(!isset($_SESSION['counted'])){
		$_SESSION['counted'] = True;
	}

	$localPage = "http://";
	if ($_SERVER["SERVER_PORT"] != "80") {
		$localPage .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"];
	} else {
		$localPage .= $_SERVER["SERVER_NAME"];
	}

	$ini = parse_ini_file("websiteConfig.ini");

	$GLOBALS['mysqlHost'] = $ini['mysqlHost'];
	$GLOBALS['mysqlUsername'] = $ini['mysqlUsername'];
	$GLOBALS['mysqlPassword'] =  $ini['mysqlPassword'];
	$GLOBALS['mysqlDatabase'] = $ini['mysqlDatabase'];	

	require_once "programClasses/languages/DataBase.php";
	require_once "programClasses/languages/Language.php";
	require_once "programClasses/languages/Result.php";
	require_once "programClasses/languages/Translation.php";
	require_once "programClasses/languages/Translate.php";
	include "blogFunctions.inc.php";
	DataBase::getInstance()->connect($mysqlHost, $mysqlUsername, $mysqlPassword, $mysqlDatabase);
	$translation = Translate::getInstance();
	$lang = isset($_GET["lang"]) ? $_GET["lang"] : "en";
	$shigarName = isset($_GET["sn"]) ? $_GET["sn"] : "";
	if (!$translation->languageExist($lang)) $lang = "en";
	if($lang != "en") $lang = "en";
	$translation->setLanguage($lang);
?>
<!DOCTYPE HTML>
<html>
<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">-->
<head>
	<title>itblog.team-holm.net</title>
	<meta name="description" content="All IT-stuff related, scripts, how-to's, code and info.." />
	<meta name="keywords" content="IT, IT-blogg, IT blog, Windows, Kryptografi, Cryptography, Dos, Scripts, Skript, Sikkerhet, Security, SQL, SQL Server, MS SQL, VMWare, vSphere, Slots, Deadlocking, Performance, Half-Life, Half-Life Dedicated Linux Server" />
	<meta name="author" content="Atle Holm" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.8.1/build/cssreset/cssreset-min.css">-->
	<!--<link rel="Stylesheet" type="text/css" href="css/screen.css" />-->
	<link rel="Stylesheet" type="text/css" href="css/pace.css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/pace.min.js"></script>
	<script type="text/javascript" src="js/LinuxjQueryFunctions.js?v=0002"></script>
	<script type="text/javascript" src="js/VMWarejQueryFunctions.js?v=0002"></script>
	<script type="text/javascript" src="js/ScriptsjQueryFunctions.js?v=0003"></script>
	<script type="text/javascript" src="js/MicrosoftjQueryFunctions.js?v=0002"></script>
	<script type="text/javascript" src="js/KryptografijQueryFunctions.js"></script>
	<script type="text/javascript" src="js/SikkerhetjQueryFunctions.js"></script>
	<script type="text/javascript" src="js/HyperVjQueryFunctions.js"></script>
	<script type="text/javascript" src="js/blogFunctions.js?v=0003"></script>	
	<script type="text/javascript" src="js/jquery.watermark.min.js"></script>
	<script type="text/javascript" src="js/vegas/jquery.vegas.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/lightbox-2.6.min.js"></script>
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
	<script type="text/javascript" src="js/shCore.js"></script>
	<script type="text/javascript" src="js/shBrushSql.js"></script>
	<script type="text/javascript" src="js/shBrushPowerShell.js"></script>
	<script type="text/javascript" src="js/shBrushBash.js"></script>
	<script type="text/javascript" src="js/shBrushCSharp.js"></script>
	<script type="text/javascript" src="js/shBrushXml.js"></script>
	<link rel="stylesheet" type="text/css" href="js/vegas/jquery.vegas.css" />
	<link rel="Stylesheet" type="text/css" href="css/lightbox.css" />
	<link rel="stylesheet" type="text/css" href="css/shCore.css" />
	<link rel="stylesheet" type="text/css" href="css/shThemeEclipse.css?v=0001" />
	<link rel="Stylesheet" type="text/css" href="css/myStyles.css?v=0006" />
<script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-47427351-2', 'team-holm.net');
  ga('send', 'pageview');

</script>
</head>
<body style="background-color: #FFFFFF">
	<a href="http://www.team-holm.net" id="mainLogoLink"><img src="images/logos/team-holm1.png" width="80" height="48" style="position:absolute; top:14px; left:8px; border:0px;"/></a>
<div id="container">
<table WIDTH="1300" border="1" style="border: 3px solid black">
	<tr>
		<td colspan="2" width="14%" align="center" id="headerTop" class="bannerHeader" background="images/ITBlogBannerBackground.png"><b><span class="headerFont">itblog.team-holm.net</span></b></td>						
    </tr>
    <tr>	
		<td width="14%" align="left" rowspan="7" class="bannerSide" id="massiveBannerSide"></td>
		<td valign="top" rowspan="7" id="mainContent1" bgcolor="White">
		<?php
			$lineExtension = 0;
			if(isset($_GET['tagName'])) {
				$tagName = $_GET['tagName'];
				echo "<div align=\"center\" style=\"font-size: 1.9em;\">$tagName tagged blogs</div>";
				$lineExtension = displayBlogByTag($tagName);
			} elseif(isset($_GET['scriptName'])) {
				$scriptName = $_GET['scriptName'];
				if(preg_match("*Sikkerhet*", $scriptName, $match) || preg_match("*Kryptografi*", $scriptName, $match) || preg_match("*Microsoft*", $scriptName, $match) || preg_match("*Linux*", $scriptName, $match) || preg_match("*Scripts*", $scriptName, $match) || preg_match("*VMWare*", $scriptName, $match) || preg_match("*Hyper-V*", $scriptName, $match)) {
					echo "<div align=\"center\" style=\"font-size: 1.9em;\">" . ucfirst(utf8_encode($translation->getTranslation($match[0]))) ."</div>";
					if(preg_match("*\/*", $scriptName)) {
						$subTitles = explode("/", $scriptName);
						echo "<div align=\"center\" style=\"font-size: 0.9em;\">". $subTitles[1] ."</div>"; 
					}
					echo "<br/>";
					if(isset($_GET['subSection'])) {
						if($_GET['subSection'] == "true") $subSection = true;
						else $subSection = false;
					} else $subSection = false;
					$lineExtension = displayScriptCode($scriptName, $subSection);	
				}
			} elseif(isset($_GET['searchString'])) {
				$searchString = $_GET['searchString'];
				echo "<div align=\"center\" style=\"font-size: 1.9em;\">Search results</div>";
				$lineExtension = displayBlogBySearchString(htmlspecialchars($searchString));
			} else {
			?>
				<div id="languageSelections">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<a href="<?php echo $localPage."/?lang=no" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.."><img src="images/flags/Norway.png" style="border: 0;" /></a>
							</td>
							<td>
								<a href="<?php echo $localPage."/?lang=en" . ($shigarName != "" ? "&sn=" . $shigarName : ""); ?>" name="languageLink" title="Choose language.."><img src="images/flags/United-Kingdom.png" style="border: 0;"/></td></a>
							</td>
						</tr>
					</table>
				</div>
				<div id="fb-root"></div>
				<script>
					(function(d, s, id) {
					  var js, fjs = d.getElementsByTagName(s)[0];
					  if (d.getElementById(id)) return;
					  js = d.createElement(s); js.id = id;
					  js.src = "//connect.facebook.net/nb_NO/all.js#xfbml=1";
					  fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));
				</script>
				<div class="fb-like" data-href="https://www.facebook.com/atle.holm" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
				<div id="introContainer">
					<script type="text/javascript" language="javascript">
						$('#introContainer').html(setText('introContainer'));						
					</script>					
				</div>
				<!--<iframe src="http://nodenet.homelinux.net:3700/" width="1000">-->
				<!--New blogs since last update;

				-->
			<?php
			}
		?>
		</td>
    </tr>
</table>
<span id = "linkMenu1" class = "boxed5">
	<a href="index.php" class="headerLink" onClick="" onMouseOver=""><b>Main page</b></a><br/>
	<a href="index.php?scriptName=Sikkerhet&amp;subSection=false" class="headerLink" onClick="" onMouseOver=""><b>Security</b></a><br/>
	<a href="index.php?scriptName=Kryptografi&amp;subSection=false" class="headerLink" onClick="" onMouseOver=""><b>Crypto</b></a><br/>
	<a href="index.php?scriptName=Microsoft&amp;subSection=false" class="headerLink" onClick="" onMouseOver=""><b>Microsoft</b></a><br/>
	<a href="index.php?scriptName=Linux&amp;subSection=false" class="headerLink" onClick="" onMouseOver=""><b>Linux</b></a><br/>
	<a href="index.php?scriptName=Scripts&amp;subSection=false" class="headerLink" onClick="" onMouseOver=""><b>Scripts</b></a><br/>
	<a href="index.php?scriptName=VMWare&amp;subSection=false" class="headerLink" onClick="" onMouseOver=""><b>VMWare</b></a>
	<a href="index.php?scriptName=Hyper-V&amp;subSection=false" class="headerLink" onClick="" onMouseOver=""><b>Hyper-V</b></a>
</span>
<?php
	displaySearchbar();
	displayTagbar();
?>
</div> <!-- Ends container -->
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
</body>
</html>