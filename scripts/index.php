<?php session_start();
	if(!isset($_SESSION['counted'])){
		$_SESSION['counted'] = True;
	}
	include "scriptFunctions.inc.php";
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>scripts.team-holm.net</title>
	<meta name="description" content="Free Script Examples" />
	<meta name="keywords" content="Scripts, BASH, PERL, PowerShell, VBS, VisualBasic" />
	<meta name="author" content="Atle Holm" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="js/vegas/jquery.vegas.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>	
	<script type="text/javaScript" src="js/scriptFunctions.js"></script>
	<script type="text/javascript" src="js/shCore.js"></script>
	<script type="text/javascript" src="js/shBrushBash.js"></script>
	<script type="text/javascript" src="js/shBrushPerl.js"></script>
	<script type="text/javascript" src="js/shBrushPowerShell.js"></script>
	<script type="text/javascript" src="js/shBrushVb.js"></script>		
	<link rel="stylesheet" type="text/css" href="js/vegas/jquery.vegas.css" />
	<link rel="stylesheet" type="text/css" href="css/shCore.css" />
	<link rel="stylesheet" type="text/css" href="css/shThemeFadeToGrey.css" />
	<link rel="stylesheet" type="text/css" href="css/myStyle.css?v=0001" />
	<?php include_once("analyticstracking.php") ?>
</head>
<body>
	<a href="http://www.team-holm.net" id="mainLogoLink"><img src="images/logos/team-holm1.png" width="100" height="60" style="position:absolute; top:5px; left:5px; border:0px;"/></a>
<div id="container">
<table WIDTH="1000" HEIGHT="900" border="1" style="border: 3px solid black">
	<tr height="35">
		<td colspan="2" width="20%" align="center" id="headerTop" class="bannerHeader" background="images/codeBackground_small.jpg"><b><div class="headerFont">scripts.team-holm.net</div></b></td>						
    </tr>
    <tr height="35">	
		<td width="20%" align="left" id="headerFive" class="bannerButtonUp" onMouseOver="document.getElementById('headerFive').className = 'bannerButtonDown';" onMouseOut="document.getElementById('headerFive').className = 'bannerButtonUp';" onMouseDown=""><a href="index.php" class="headerLink" onClick="" onMouseOver=""><b>Hovedsiden</b></a></td>
		<td valign="top" rowspan="6" id="mainContent1" bgcolor="White">
		<?php
			$lineExtension = 0;
			if(isset($_GET['scriptName'])) {
				$scriptName = $_GET['scriptName'];
				if(preg_match("*PowerShell*", $scriptName, $match) || preg_match("*Perl*", $scriptName, $match) || preg_match("*VisualBasic*", $scriptName, $match) || preg_match("*BASH*", $scriptName, $match) || preg_match("*BATCH*", $scriptName, $match)) {
					echo "<div align=\"center\" style=\"font-size: 1.5em;\">$match[0] Scripts</div>";
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
			} else {
			?>
				<br/><div align="center" style="font-size: 1.5em;"></div>
				<br/><div class="roundedcornr_box_525768"><div class="roundedcornr_top_525768"><div></div></div><div class="roundedcornr_content_525768">
				Legger frem her er en rekke script som av forskjellig art, det kommer mer med tiden.
				Har alltid v&aelig;rt tilhenger av nyttige enkle sm&aring; script p&aring; nettet som er lette &aring; hente inspirasjon fra. Derfor har jeg leden av &aring; ogs&aring; bidra litt i tillegg til &aring; ogs&aring; lage en personlig liten fremstilling av en scriptsamling. Poengterer at alle script som brukes her
				b&oslash;r forst&aring;s og leses gjennom p&aring; forh&aring;nd, slik at du selv kan ta ansvar for om det er tilpasset ditt milj&oslash; eller ikke. Alle Powershell og VBS Script som finnes her inne har v&aelig;rt brukt i
				et aktivt produksjonsmilj&oslash; opp til en haug av ganger. V&aelig;r oppmerksom p&aring; at enkelte av Powershell scriptene krever <a href="http://www.quest.com/powershell/activeroles-server.aspx" target="_blank">Quest ActiveRoles Management Shell for Active Directory</a> installert - <a href="mailto:atle@team-holm.net" border="0" class="articleLink">atle@team-holm.net</a>
				</div><div class="roundedcornr_bottom_525768"><div></div></div></div>
				<center><h1>Nyheter</h1></center>
												<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>20.12.2013 - mer VMWare scripts lagt inn under Powershell og Perl seksjonene</b></div>
					&nbsp;&nbsp;&nbsp; Fem scripts/eksempler er lagt til. Ett under Perl -> VMware, og fire under Powershell->VMware.
				</div>
				<br/>
												<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>13.07.2013 - VMWare scripts lagt inn under Powershell seksjonen</b></div>
					&nbsp;&nbsp;&nbsp; Seks scripts/eksempler på praktisk h&aring;ndtering av gjester ol. p&aring; et ESXi milj&oslash; er lagt til.
				</div>
				<br/>
								<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>10.02.2013 - Valve-HLDS lagt til under BASH.</b></div>
					&nbsp;&nbsp;&nbsp; Scriptet starter en Half-Life Dedicated Server installert p&aring; Linux som en tjeneste via screen. Greit &aring; bruke update-rc.d eller liknende for &aring; sette opp ditt boot milj&oslash; i etterkant.
				</div>
				<br/>
								<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>05.08.2012 - logon2load.vbs og getDesktopServers.vbs lagt til.</b></div>
					&nbsp;&nbsp;&nbsp;Disse to scriptene skal henholdsvis logge en bruker p&aring; alle servere i en publisert desktop samtidig og liste alle servere i en publisert desktop.
				</div>
				<br/>
								<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>21.05.2012 - utvidet VBScript seksjonen.</b></div>
					&nbsp;&nbsp;&nbsp;Har utvidet VBScript seksjonen med flere scripts etter at disse kom nylig til nytte &aring; skrive og bruke.
				</div>
				<br/>
				<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>14.04.2012 - ny VBScript seksjon.</b></div>
					&nbsp;&nbsp;&nbsp;Har utvidet VBScript seksjonen med et script for &aring; lete etter hotfix'er p&aring alle servere i en farm.
				</div>
				<br/>
				<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>02.04.2011 - lagt til VBScript.</b></div>
					&nbsp;&nbsp;&nbsp;replaceFile.vbs er lagt til samlingen med Visual Basic script. Skal bli et handy tilleggsverkt&oslash;y sammen med MassRegger som senere var tenkt &aring presenteres p&aring; team-holm.net. MassRegger er et GUI skrevet i VB .Net for masse registrering av DLL'er.
				</div>
				<br/>
				<div class="boxedNewsborder"><div style="font-family: Georgia, serif;"><b>02.03.2011 - scripts.team-holm.net er oppe og g&aring;r.</b></div>
					&nbsp;&nbsp;&nbsp;Oppdateringer kommer.
				</div>
			<?php
			}
		?>
		</td>
    </tr>
	<tr height="35">
		<td width="20%" align="left" id="headerTwo" class="bannerButtonUp" onMouseOver="document.getElementById('headerTwo').className = 'bannerButtonDown';" onMouseOut="document.getElementById('headerTwo').className = 'bannerButtonUp';" onMouseDown=""><a href="index.php?scriptName=Perl&subSection=true" class="headerLink" onClick="" onMouseOver=""><b class="label">Perl</b></a></td>	
	</tr>
	<tr height="35">
		<td width="20%" align="left" id="headerThree" class="bannerButtonUp" onMouseOver="document.getElementById('headerThree').className = 'bannerButtonDown';" onMouseOut="document.getElementById('headerThree').className = 'bannerButtonUp';" onMouseDown=""><a href="index.php?scriptName=VisualBasic&subSection=true" class="headerLink" onClick="" onMouseOver=""><b class="label">VisualBasic</b></a></td>
	</tr>
	<tr height="35">
        <td width="20%" align="left" id="headerFour" class="bannerButtonUp" onMouseOver="document.getElementById('headerFour').className = 'bannerButtonDown';" onMouseOut="document.getElementById('headerFour').className = 'bannerButtonUp';" onMouseDown=""><a href="index.php?scriptName=BASH&subSection=false" class="headerLink" onClick="" onMouseOver=""><b class="label">BASH</b></a></td>
    </tr>
	<tr height="35">
		<td width="20%" align="left" id="headerOne" class="bannerButtonUp" onMouseOver="document.getElementById('headerOne').className = 'bannerButtonDown';" onMouseOut="document.getElementById('headerOne').className = 'bannerButtonUp';" onMouseDown=""><a href="index.php?scriptName=PowerShell&subSection=true" class="headerLink" onMouseOver=""><b class="label">Powershell</b></a></td>		
	</tr>
	<tr height="<?php if($lineExtension == 0) echo '590'; elseif($lineExtension < 590) echo '590'; else echo $lineExtension; ?>">
		<td width="20%" id="mainContent2" background="images/codeBackground_small.jpg"></td>
	</tr>
</table>
</div> <!-- Ends container -->
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
</body>
</html>