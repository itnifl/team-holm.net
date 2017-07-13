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
   require_once 'programClasses/Mobile-Detect-2.8.25/Mobile_Detect.php';
	include "allFunctions.inc.php";
   $detect = new Mobile_Detect;

	DataBase::getInstance()->connect($mysqlHost, $mysqlUsername, $mysqlPassword, $mysqlDatabase);
	$translation = Translate::getInstance();
	$lang = isset($_GET["lang"]) ? $_GET["lang"] : "no";
	$shigarName = isset($_GET["sn"]) ? $_GET["sn"] : "";
	if (!$translation->languageExist($lang)) $lang = "no";
	$translation->setLanguage($lang);
?>
<?php
$res = "";
// If this is a phone (tablets excluded) display mobile-specific content.
if( $detect->isMobile() && !$detect->isTablet() ) {
   ob_start(); // turn on output buffering
   include('index.mobile.php');
   $res = ob_get_contents(); // get the contents of the output buffer
   ob_end_clean(); //  clean (erase) the output buffer and turn off output buffering
   // Non-mobile devices will get the default content.
} else {
   ob_start(); // turn on output buffering
   include('index.standard.php');
   $res = ob_get_contents(); // get the contents of the output buffer
   ob_end_clean(); //  clean (erase) the output buffer and turn off output buffering
}
// End of the Mobile Detect conditional.
echo $res;
?>