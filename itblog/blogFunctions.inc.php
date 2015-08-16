<?php

function displayScriptCode($scriptName, $subSection) {
	//Først henter vi kommentarer og forklaringer til scriptet som skal vises, og viser dette i egen seksjon før scriptet.
	//Deretter henter vi selve scriptet og viser dette pent og ryddelig
	
	$countedLines = 0;
	if($subSection == false) { //Hvis vi ikke skal lete etter subseksjoner, leter vi etter scriptene rett under scriptmappa og viser frem det
		//Følgende henter altså frem scripts uten hensyn til scriptpakker/subseksjoner
		$path = "./blogs/".$scriptName;
		if (is_dir($path)) {
			if ($dh = opendir($path)) {
				$linkContents = array ();
				$linkContents[] = "<nav>";
				$fileContents = array ();
				$linkid = array ();
				$fileContents[0] = "<div class=\"roundedcornr_box_525768\"><div class=\"roundedcornr_top_525768\"><div></div></div><div class=\"roundedcornr_content_525768\"><div style=\"font-size: 1.3em;\" align=\"center\">Index</div><hr/>";
				$contentCounter = 1; //1_a-kommentar.txt skal alltid være på plass nummer 0, vi starter derfor på 1 for scriptene.
				while (($filename = readdir($dh)) != false) {
					$number = 0;
					if($filename == "1_a-kommentar.txt") {
						if ($filename != "." && $filename != ".." && file_exists($path."/".$filename)) {
							$file = fopen($path."/".$filename, "rt") or exit("Unable to open file ".$filename."!");
							while(!feof($file)) {
								$number++;
								$result .= fgets($file);
							}
							fclose($file);
						} elseif (!file_exists($path."/".$filename)) {
							echo "Error: File $path/$filename does not exist!";
						}
						if ($filename != "." && $filename != "..") $countedLines += ($number * 15) + 21;
						$fileContents[0] = $result;
					} else {
						$result = "";
						if ($filename != "." && $filename != ".." && file_exists($path."/".$filename)) {
							$file = fopen($path."/".$filename, "rt") or exit("Unable to open file ".$filename."!");
							/*Code for table start and table header is placed far below where the finished html code is returned*/
							$result .= "<tr><td colspan=\"2\">";
							$tableReading = False;
							while(!feof($file)) {
								$number++;
								$line = fgets($file);
								if(trim($line) == "|TableStart") {
									$result .= "<table border=\"0\" align=\"center\" class=\"boxedInfoborder\">";
									$tableReading = True;
								} 
								if($tableReading && trim($line) != "|TableStart" && trim($line) != "|TableEnd") {
									$pieces = explode("|", $line);
									if(count($pieces) == 1) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td></tr>";
									if(count($pieces) == 2) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td></tr>";
									if(count($pieces) == 3) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td></tr>";
									if(count($pieces) == 4) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td></tr>";
									if(count($pieces) == 5) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td></tr>";
									if(count($pieces) == 6) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td></tr>";
									if(count($pieces) == 7) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td><td><span class=\"smaller\">".$pieces[6]."</span></td></tr>";
									if(count($pieces) == 8) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td><td><span class=\"smaller\">".$pieces[6]."</span></td><td><span class=\"smaller\">".$pieces[7]."</span></td></tr>";
								} elseif(!$tableReading) {
									$result .= $line;
								}
								if(trim($line) == "|TableEnd") {
									$result .= "</table>";
									$tableReading = False;
								} 
								if (preg_match("*A\sNAME=*", $line)) {
									for($forCounter = 0; $forCounter < strlen($line) - 6; $forCounter++) {
										$stringExtract = $line[$forCounter] . $line[$forCounter + 1] . $line[$forCounter + 2] . $line[$forCounter + 3] . $line[$forCounter + 4] . $line[$forCounter + 5];
										$linkPos = 0;
										if($stringExtract == "NAME=\"") {
											$newLink = "<li><a href=\"#";
											$nextScanPosition = 0;
											$linkTagName = "";
											for($sForCounter = 0; $line[$forCounter + 6 + $sForCounter] != "\""; $sForCounter++) {
												$linkTagName .= $line[$forCounter + 6 + $sForCounter];
												$nextScanPosition = $forCounter + 6 + $sForCounter;
											}
											$linkid[] = $linkTagName;
											$newLink .= $linkTagName;
											$newLink .= "\" class=\"packageTableLinks\" id=\"btn". $linkTagName ."\" style=\"margin-left:35px;\">";
											
											for($sForCounter = 6; (($line[$nextScanPosition + $sForCounter] != "<") || ($line[$nextScanPosition + $sForCounter + 1] != "/") || ($line[$nextScanPosition + $sForCounter + 2] != "u") || ($line[$nextScanPosition + $sForCounter + 3] != ">")); $sForCounter++) {
												$newLink .= $line[$nextScanPosition + $sForCounter];
											}
											$newLink .= "</a>";
											$linkContents[] = $newLink;
										}
									}
								}
							}
							fclose($file);
						} elseif (!file_exists($path."/".$filename)) {
							echo "Error: File $path/$filename does not exist!";
						}
						$result .= displayInlineBlogTags($filename);
						$result .= "</td></tr></table><br/></div>";
						if ($filename != "." && $filename != "..") {
							$countedLines += ($number * 16) + 21;
							$tableHeader = "<tr><th align=\"center\" colspan=\"1\" width=\"1800\">". $filename ."</th><th valign=\"left\" align=\"left\" colspan=\"1\" width=\"13\"><a href=\"#\" border=\"0\" id=\"close".$linkid[$contentCounter-1]."\"><img src=\"images/close.png\" height=\"12\" width=\"12\" border=\"0\"/></a></th></tr>";
							if(count($linkid) > 1) {
								$fileContents[$contentCounter] = "<div class=\"hiddenDiv\" id=\"" . $linkid[$contentCounter-1] . "\"><table class=\"codeTable\">" . $tableHeader . $result;
							} else {
								$fileContents[$contentCounter] = "<div id=\"" . $linkid[$contentCounter-1] . "\"><table class=\"codeTable\">" . $tableHeader . $result;
							}
							$contentCounter++;
						}	
					}
				}
				$linkContents[] = "</nav>";
				closedir($dh);
				$fileContents[0] .= "<div style=\"column-width:350px;-moz-column-width:350px;-webkit-column-width:350px;\">";
				for($forCounter = 0; $forCounter < count($linkContents); $forCounter++) {
					$fileContents[0] .= $linkContents[$forCounter];
				}
				$fileContents[0] .= "</div>";
				$fileContents[0] .= "</div><div class=\"roundedcornr_bottom_525768\"><div></div></div></div><hr/>";
				for($forCounter = 0; $forCounter < count($fileContents); $forCounter++) {
					if(isset($fileContents[$forCounter]) && $fileContents[$forCounter] != "") echo $fileContents[$forCounter];
				}
			}
			displayFacebookCommentField("?scriptName=$scriptName&subSection=false");
		} else {
			echo "Error: File $path does not exist!";
		}
		return $countedLines;
	} else {
		//Følgende lager en oversikt over subseksjoner
		$path = "./blogs/".$scriptName;
		$directoryListing = array ();
		if (is_dir($path)) {
			if ($dh = opendir($path)) {
				while (($filename = readdir($dh)) != false) {
					if($filename != "." && $filename != ".." && (is_dir($path."/".$filename))) $directoryListing[] = $path."/".$filename;
				}
			}
		}
		$result = "<div class=\"roundedcornr_box_525768\"><div class=\"roundedcornr_top_525768\"><div></div></div><div class=\"roundedcornr_content_525768\">";
		$result .= "<table align=\"center\" border=\"0\">";
		$result .= "<th align=\"center\"><font style=\"font-size: 1.3em;\">Scriptpakker</font></th>";
		foreach($directoryListing as $directoryInstance) {
			$linkNames = explode("/", $directoryInstance);
			$result .= "<tr><td><li><a href=\"index.php?scriptName=". $scriptName ."/". $linkNames[3] ."&subSection=false\" class=\"packageTableLinks\">Scriptpakke: ". $linkNames[3] ."</td></tr>";
		}
		$result .= "</table>";
		$result .= "</div><div class=\"roundedcornr_bottom_525768\"><div></div></div></div></br></br></br>";;
		echo $result;
		return $countedLines;
	}
}
function displayFacebookCommentField($url) {
	echo "<div id=\"fb-root\"></div>";
	echo "<script>(function(d, s, id) {";
	echo " var js, fjs = d.getElementsByTagName(s)[0];";
	echo "  if (d.getElementById(id)) return;";
	echo " js = d.createElement(s); js.id = id;";
	echo " js.src = \"//connect.facebook.net/nb_NO/sdk.js#xfbml=1&version=v2.0\";";
	echo " fjs.parentNode.insertBefore(js, fjs);";
	echo "}(document, 'script', 'facebook-jssdk'));</script>";
	echo "<center><div class=\"fb-comments\" data-href=\"http://itblog.team-holm.net/$url\" data-numposts=\"5\" data-colorscheme=\"light\" data-width=\"1050\"></div></center>";
}
function displayBlogByTag($tagName) {	
	$countedLines = 0;
	$db=mysql_connect($GLOBALS['mysqlHost'], $GLOBALS['mysqlUsername'], $GLOBALS['mysqlPassword']) or die("Unable to connect to MySQL Server: " . mysql_error());
	mysql_select_db($GLOBALS['mysqlDatabase'], $db) or die("Could not select database");
	$sql = "SELECT b.name, b.blogpath FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID = b.tagType_1) WHERE t.name = '".$tagName."' UNION ALL " .
			"SELECT b.name, b.blogpath FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID = b.tagType_2) WHERE t.name = '".$tagName."' UNION ALL " .
			"SELECT b.name, b.blogpath FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID = b.tagType_3) WHERE t.name = '".$tagName."'";
	$sqlresult = mysql_query($sql);
	$linkContents = array ();
	$linkContents[] = "<nav>";
	$fileContents = array ();
	$linkid = array ();
	$fileContents[0] = "<div class=\"roundedcornr_box_525768\"><div class=\"roundedcornr_top_525768\"><div></div></div><div class=\"roundedcornr_content_525768\"><div style=\"font-size: 1.3em;\" align=\"center\">Index</div><hr/>";
	$contentCounter = 1; //1_a-kommentar.txt skal alltid være på plass nummer 0, vi starter derfor på 1 for scriptene.
	$filename = "";
	while($row = mysql_fetch_array($sqlresult)) {
		$result = "";
		$number = 0;
		$path = ".".$row{'blogpath'}.$row{'name'};
		$filename = $row{'name'};
		if (file_exists($path)) {
			if ($filename != "." && $filename != "..") {
				$file = fopen($path, "rt") or exit("Unable to open file .".$path."!<br/>");
				/*Code for table start and table header is placed far below where the finished html code is returned*/
				$result .= "<tr><td colspan=\"2\">";
				$tableReading = False;
				while(!feof($file)) {
					$number++;
					$line = fgets($file);
					if(trim($line) == "|TableStart") {
						$result .= "<table border=\"0\" align=\"center\" class=\"boxedInfoborder\">";
						$tableReading = True;
					} 
					if($tableReading && trim($line) != "|TableStart" && trim($line) != "|TableEnd") {
						$pieces = explode("|", $line);
						if(count($pieces) == 1) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td></tr>";
						if(count($pieces) == 2) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td></tr>";
						if(count($pieces) == 3) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td></tr>";
						if(count($pieces) == 4) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td></tr>";
						if(count($pieces) == 5) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td></tr>";
						if(count($pieces) == 6) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td></tr>";
						if(count($pieces) == 7) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td><td><span class=\"smaller\">".$pieces[6]."</span></td></tr>";
						if(count($pieces) == 8) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td><td><span class=\"smaller\">".$pieces[6]."</span></td><td><span class=\"smaller\">".$pieces[7]."</span></td></tr>";
					} elseif(!$tableReading) {
						$result .= $line;
					}
					if(trim($line) == "|TableEnd") {
						$result .= "</table>";
						$tableReading = False;
					} 
					if (preg_match("*A\sNAME=*", $line)) {
						for($forCounter = 0; $forCounter < strlen($line) - 6; $forCounter++) {
							$stringExtract = $line[$forCounter] . $line[$forCounter + 1] . $line[$forCounter + 2] . $line[$forCounter + 3] . $line[$forCounter + 4] . $line[$forCounter + 5];
							$linkPos = 0;
							if($stringExtract == "NAME=\"") {
								$newLink = "<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#";
								$nextScanPosition = 0;
								$linkTagName = "";
								for($sForCounter = 0; $line[$forCounter + 6 + $sForCounter] != "\""; $sForCounter++) {
									$linkTagName .= $line[$forCounter + 6 + $sForCounter];
									$nextScanPosition = $forCounter + 6 + $sForCounter;
								}
								$linkid[] = $linkTagName;
								$newLink .= $linkTagName;
								$newLink .= "\" class=\"packageTableLinks\" id=\"btn". $linkTagName ."\">";
								
								for($sForCounter = 6; (($line[$nextScanPosition + $sForCounter] != "<") || ($line[$nextScanPosition + $sForCounter + 1] != "/") || ($line[$nextScanPosition + $sForCounter + 2] != "u") || ($line[$nextScanPosition + $sForCounter + 3] != ">")); $sForCounter++) {
									$newLink .= $line[$nextScanPosition + $sForCounter];
								}
								$newLink .= "</a>";
								$linkContents[] = $newLink;
							}
						}
					}
				}
				fclose($file);				
			} elseif (!file_exists($path)) {
				echo "Error: File \"$path\" does not exist!<br/>";
			}			
			$result .= displayInlineBlogTags($filename);
			$result .=  "</td></tr></table><br/></div>";
			if ($filename != "." && $filename != "..") {
				$countedLines += ($number * 16) + 21;
				$tableHeader = "<tr><th align=\"center\" colspan=\"1\" width=\"1800\">". $filename ."</th><th valign=\"left\" align=\"left\" colspan=\"1\" width=\"13\"><a href=\"#\" border=\"0\" id=\"close".$linkid[$contentCounter-1]."\"><img src=\"images/close.png\" height=\"12\" width=\"12\" border=\"0\"/></a></th></tr>";
				if(count($linkid) > 1) {
					$fileContents[$contentCounter] = "<div class=\"hiddenDiv\" id=\"" . $linkid[$contentCounter-1] . "\"><table class=\"codeTable\">" . $tableHeader . $result;
				} else {
					$fileContents[$contentCounter] = "<div id=\"" . $linkid[$contentCounter-1] . "\"><table class=\"codeTable\">" . $tableHeader . $result;
				}
				$contentCounter++;
			}
			
		} else {
			echo "Error: File \"$path\" does not exist!<br/>";
		}
	}
	$linkContents[] = "</nav><!-- Test -->";
	$fileContents[0] .= "<div style=\"column-width:350px;-moz-column-width:350px;-webkit-column-width:350px;\">";
	for($forCounter = 0; $forCounter < count($linkContents); $forCounter++) {
		$fileContents[0] .= $linkContents[$forCounter];
	}
	$fileContents[0] .= "</div>";
	$fileContents[0] .= "</div><div class=\"roundedcornr_bottom_525768\"><div></div></div></div><hr/>";
	for($forCounter = 0; $forCounter < count($fileContents); $forCounter++) {
		if(isset($fileContents[$forCounter]) && $fileContents[$forCounter] != "") echo $fileContents[$forCounter];
	}
	mysql_close($db);
	displayFacebookCommentField("?tagName=$tagName");
	return $countedLines;
}
function displayBlogBySearchString($searchString) {	
	$countedLines = 0;
	$db=mysql_connect($GLOBALS['mysqlHost'], $GLOBALS['mysqlUsername'], $GLOBALS['mysqlPassword']) or die("Unable to connect to MySQL Server: " . mysql_error());
	mysql_select_db($GLOBALS['mysqlDatabase'], $db) or die("Could not select database");
	$sql = "select name, blogPath from blogTitles where name like '%". mysql_real_escape_string($searchString) ."%'";
	$sqlresult = mysql_query($sql);
	$linkContents = array ();
	$linkContents[] = "<nav>";
	$fileContents = array ();
	$linkid = array ();
	$fileContents[0] = "<div class=\"roundedcornr_box_525768\"><div class=\"roundedcornr_top_525768\"><div></div></div><div class=\"roundedcornr_content_525768\"><div style=\"font-size: 1.3em;\" align=\"center\">Using keyword '". $searchString ."'</div><hr/>";
	$contentCounter = 1; //1_a-kommentar.txt skal alltid være på plass nummer 0, vi starter derfor på 1 for scriptene.
	$filename = "";
	while($row = mysql_fetch_array($sqlresult)) {
		$result = "";
		$number = 0;
		$path = ".".$row{'blogPath'}.$row{'name'};
		$filename = $row{'name'};
		if (file_exists($path)) {
			if ($filename != "." && $filename != "..") {
				$file = fopen($path, "rt") or exit("Unable to open file .".$path."!<br/>");
				/*Code for table start and table header is placed far below where the finished html code is returned*/
				$result .= "<tr><td colspan=\"2\">";
				$tableReading = False;
				while(!feof($file)) {
					$number++;
					$line = fgets($file);
					if(trim($line) == "|TableStart") {
						$result .= "<table border=\"0\" align=\"center\" class=\"boxedInfoborder\">";
						$tableReading = True;
					} 
					if($tableReading && trim($line) != "|TableStart" && trim($line) != "|TableEnd") {
						$pieces = explode("|", $line);
						if(count($pieces) == 1) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td></tr>";
						if(count($pieces) == 2) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td></tr>";
						if(count($pieces) == 3) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td></tr>";
						if(count($pieces) == 4) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td></tr>";
						if(count($pieces) == 5) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td></tr>";
						if(count($pieces) == 6) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td></tr>";
						if(count($pieces) == 7) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td><td><span class=\"smaller\">".$pieces[6]."</span></td></tr>";
						if(count($pieces) == 8) $result .= "<tr><td><span class=\"smaller\">".$pieces[0]."</span></td><td><span class=\"smaller\">".$pieces[1]."</span></td><td><span class=\"smaller\">".$pieces[2]."</span></td><td><span class=\"smaller\">".$pieces[3]."</span></td><td><span class=\"smaller\">".$pieces[4]."</span></td><td><span class=\"smaller\">".$pieces[5]."</span></td><td><span class=\"smaller\">".$pieces[6]."</span></td><td><span class=\"smaller\">".$pieces[7]."</span></td></tr>";
					} elseif(!$tableReading) {
						$result .= $line;
					}
					if(trim($line) == "|TableEnd") {
						$result .= "</table>";
						$tableReading = False;
					} 
					if (preg_match("*A\sNAME=*", $line)) {
						for($forCounter = 0; $forCounter < strlen($line) - 6; $forCounter++) {
							$stringExtract = $line[$forCounter] . $line[$forCounter + 1] . $line[$forCounter + 2] . $line[$forCounter + 3] . $line[$forCounter + 4] . $line[$forCounter + 5];
							$linkPos = 0;
							if($stringExtract == "NAME=\"") {
								$newLink = "<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"#";
								$nextScanPosition = 0;
								$linkTagName = "";
								for($sForCounter = 0; $line[$forCounter + 6 + $sForCounter] != "\""; $sForCounter++) {
									$linkTagName .= $line[$forCounter + 6 + $sForCounter];
									$nextScanPosition = $forCounter + 6 + $sForCounter;
								}
								$linkid[] = $linkTagName;
								$newLink .= $linkTagName;
								$newLink .= "\" class=\"packageTableLinks\" id=\"btn". $linkTagName ."\">";
								
								for($sForCounter = 6; (($line[$nextScanPosition + $sForCounter] != "<") || ($line[$nextScanPosition + $sForCounter + 1] != "/") || ($line[$nextScanPosition + $sForCounter + 2] != "u") || ($line[$nextScanPosition + $sForCounter + 3] != ">")); $sForCounter++) {
									$newLink .= $line[$nextScanPosition + $sForCounter];
								}
								$newLink .= "</a>";
								$linkContents[] = $newLink;
							}
						}
					}
				}
				
				fclose($file);
			} elseif (!file_exists($path)) {
				echo "Error: File \"$path\" does not exist!<br/>";
			}
			$result .= displayInlineBlogTags($filename);
			$result .=  "</td></tr></table><br/></div>";
			if ($filename != "." && $filename != "..") {
				$countedLines += ($number * 16) + 21;
				$tableHeader = "<tr><th align=\"center\" colspan=\"1\" width=\"1800\">". $filename ."</th><th valign=\"left\" align=\"left\" colspan=\"1\" width=\"13\"><a href=\"#\" border=\"0\" id=\"close".$linkid[$contentCounter-1]."\"><img src=\"images/close.png\" height=\"12\" width=\"12\" border=\"0\"/></a></th></tr>";
				if(count($linkid) > 1) {
					$fileContents[$contentCounter] = "<div class=\"hiddenDiv\" id=\"" . $linkid[$contentCounter-1] . "\"><table class=\"codeTable\">" . $tableHeader . $result;
				} else {
					$fileContents[$contentCounter] = "<div id=\"" . $linkid[$contentCounter-1] . "\"><table class=\"codeTable\">" . $tableHeader . $result;
				}
				$contentCounter++;
			}			
		} else {
			echo "Error: File \"$path\" does not exist!<br/>";
		}
	}
	$linkContents[] = "</nav>";
	/*Her bygges index linkene*/
	$fileContents[0] .= "<div style=\"column-width:350px;-moz-column-width:350px;-webkit-column-width:350px;\">";
	for($forCounter = 0; $forCounter < count($linkContents); $forCounter++) {
		$fileContents[0] .= $linkContents[$forCounter];
	}
	$fileContents[0] .= "</div>"; //Her ender DIV tag ovenfor med css column-width
	if($contentCounter > 1){
		$fileContents[0] .= "</div><div class=\"roundedcornr_bottom_525768\"><div></div></div></div><hr/>";
	} else {
		$fileContents[0] .= "<br/><br/><div style=\"font-size: 2.0em;\" align=\"center\">did not yield any results ;(</div></div><div class=\"roundedcornr_bottom_525768\"><div></div></div></div><hr/>";
	}
	
	for($forCounter = 0; $forCounter < count($fileContents); $forCounter++) {
		if(isset($fileContents[$forCounter]) && $fileContents[$forCounter] != "") echo $fileContents[$forCounter];
	}
	mysql_close($db);
	displayFacebookCommentField("index.php?searchString=$searchString");
	return $countedLines;
}
function fetchTagbarContent() {
	$db=mysql_connect($GLOBALS['mysqlHost'], $GLOBALS['mysqlUsername'], $GLOBALS['mysqlPassword']) or die("Unable to connect to MySQL Server: " . mysql_error());
	mysql_select_db($GLOBALS['mysqlDatabase'], $db) or die("Could not select database");
	$result1 = mysql_query("select t.name, count(t.tagTypeID) as count FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID=b.tagType_1) group by t.name");
	$resultArray = array();
	/*Check if elements in result1 exist in result2 - if they do, add together and store in resultArray, if not store genuine result1 values in resultArray*/
	while ($row1 = mysql_fetch_array($result1)) {
		$matched = False;
		$result2 = mysql_query("select t.name, count(t.tagTypeID) as count FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID=b.tagType_2) group by t.name");
		while ($row2 = mysql_fetch_array($result2)) {
			/*echo $row1{'name'} . "==" . $row2{'name'} . "<br/>";*/
			if($row1{'name'} == $row2{'name'}) {
				/*echo "First add " . $row1{'name'} . " - " . ($row1{'count'} . " + " . $row2{'count'}) . "<br/>"; */
				$resultArray[$row1{'name'}]=$row1{'count'} + $row2{'count'};
				$matched = True;
			}
		}
		if(!$matched) {
			/*echo "First genuine add " . $row1{'name'} . " - " . $row1{'count'} . "<br/>"; */
			$resultArray[$row1{'name'}]=$row1{'count'};
		}
	}
	/*Check if elements in result2 exist in result1, if they don't - store genuine result2 values in resultArray*/
	$result2 = mysql_query("select t.name, count(t.tagTypeID) as count FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID=b.tagType_2) group by t.name");
	while ($row2 = mysql_fetch_array($result2)) {
		$matched = False;
		$result1 = mysql_query("select t.name, count(t.tagTypeID) as count FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID=b.tagType_1) group by t.name");
		while ($row1 = mysql_fetch_array($result1)) {
			if($row2{'name'} == $row1{'name'}) {
				$matched = True;
			}
		}
		if(!$matched) {
			/*echo "Second genuine add " . $row2{'name'} . " - " . $row2{'count'} . "<br/>"; */
			$resultArray[$row2{'name'}]=$row2{'count'};
		}
	}
	/*Check if elements in result3 exist in resultArray, if they don't - store genuine result3 values in resultArray, if they do - add together with values in reultArray */
	$result3 = mysql_query("select t.name, count(t.tagTypeID) as count FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID=b.tagType_3) group by t.name");
	while ($row3 = mysql_fetch_array($result3)) {
		$matched = False;
		foreach($resultArray as $key => $value) {
			if($row3{'name'} == $key) {
				/*echo "Third add " . $key . " - " . $row3{'count'} . "+" . $value . "<br/>";*/ 
				$resultArray[$key] = $row3{'count'} + $value;
				$matched = True;
			}
		}
		if(!$matched) {
			echo "Third genuine add " . $row3{'name'} . " - " . $row3{'count'} . "<br/>"; 
			$resultArray[$row3{'name'}]=$row3{'count'};
		}
	}
	mysql_close($db);
	return $resultArray;
}
function displayTagbar() {
		$tagbarContent = fetchTagbarContent();
		echo "<span id = \"linkMenu2\" class = \"boxed6\">";
		echo "<div style=\"text-align:center;text-decoration: none; color: black; font-family: Messkit; font-size: 1.5em;\">Taglist</div>";
		foreach($tagbarContent as $key => $value) {
			if($value == 1){echo "<font style=\"line-height:normal;font-size:xx-small;margin-left:8px;\"><a href=\"index.php?tagName=".$key."\" class=\"tagLink\">".$key."</a></font><br/>";}
			if($value == 2){echo "<font style=\"line-height:normal;font-size:x-small;margin-left:8px;\"><a href=\"index.php?tagName=".$key."\" class=\"tagLink\">".$key."</a></font><br/>";}
			if($value == 3){echo "<font style=\"line-height:normal;font-size:small;margin-left:8px;\"><a href=\"index.php?tagName=".$key."\" class=\"tagLink\">".$key."</a></font><br/>";}
			if($value == 4){echo "<font style=\"line-height:normal;font-size:medium;margin-left:8px;\"><a href=\"index.php?tagName=".$key."\" class=\"tagLink\">".$key."</a></font><br/>";}
			if($value == 5){echo "<font style=\"line-height:normal;font-size:large;margin-left:8px;\"><a href=\"index.php?tagName=".$key."\" class=\"tagLink\">".$key."</a></font><br/>";}
			if($value == 6){echo "<font style=\"line-height:normal;font-size:x-large;margin-left:8px;\"><a href=\"index.php?tagName=".$key."\" class=\"tagLink\">".$key."</a></font><br/>";}
			if($value >= 7){echo "<font style=\"line-height:normal;font-size:xx-large;margin-left:8px;\"><a href=\"index.php?tagName=".$key."\" class=\"tagLink\">".$key."</a></font><br/>";}
		}
		echo "</span>";
}
function displaySearchbar() {
		//$tagbarContent = fetchTagbarContent();
		echo "<span id = \"linkMenu3\" class = \"boxed7\">";
		echo "<center><form action=\"index.php\" method=\"get\">";
		echo "<input type=\"text\" name=\"searchString\" id=\"searchString\" class=\"round\" align=\"center\">";
		echo "</form></center>";
		echo "</span>";
}
function displayInlineBlogTags($blogName) {
	$dbtags=mysql_connect($GLOBALS['mysqlHost'], $GLOBALS['mysqlUsername'], $GLOBALS['mysqlPassword']) or die("Unable to connect to MySQL Server: " . mysql_error());
	mysql_select_db($GLOBALS['mysqlDatabase'], $dbtags) or die("Could not select database");
	$sql = "SELECT t.name FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID = b.tagType_1) WHERE b.name = '".$blogName."' UNION ALL " .
			"SELECT t.name FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID = b.tagType_2) WHERE b.name = '".$blogName."' UNION ALL " .
			"SELECT t.name FROM tagTypes t INNER JOIN blogTitles b ON (t.tagTypeID = b.tagType_3) WHERE b.name = '".$blogName."'";
	$sqlresult = mysql_query($sql);
	$result = "Tagged as: ";
	while($row = mysql_fetch_array($sqlresult)) {
		$result .= "<a href=\"index.php?tagName=".$row{'name'}."\" class=\"articleLink\">".$row{'name'}."</a>,&nbsp;";
	}
	$result = substr($result,0,-7);
	/*mysql_close($dbtags);*/
	return $result;
}
?>