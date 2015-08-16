<?php
function displayScriptCode($scriptName, $subSection) {
	//BUG: 1_a-kommentar.txt må være med som kommentarfil for en gruppe scripts, ellers vises det ett mindre script
	$countedLines = 0;
	if($subSection == false) { //Hvis vi ikke skal lete etter subseksjoner, leter vi etter scriptene rett under scriptmappa og viser frem det
		//Følgende henter altså frem scripts uten hensyn til scriptpakker/subseksjoner
		$path = "./scripts/".$scriptName;
		if (is_dir($path)) {
			if ($dh = opendir($path)) {
				$fileContents = array();
				$tableOfContents = array();
				$tableOfContents[0] = array();
				$tableOfContents[1] = array();
				$fileContents[0] = "";
				$lineLength = 0;
				$contentCounter = 1; //1_a-kommentar.txt skal alltid vøre på plass nummer 0, vi starter derfor på 1 for scriptene.
				$fieldCounter = 0;
				while (($filename = readdir($dh)) != false) {
					$number = 0;
					if($filename == "1_a-kommentar.txt") { //Dette blir kommentarene våre, og de skal alltid vises først/øverst og i en annen stil enn scriptene våre, som vises i else seksjonen.
						$longestLine = 0;
						$result = "<br/><div class=\"roundedcornr_box_525768\"><div class=\"roundedcornr_top_525768\"><div></div></div><div class=\"roundedcornr_content_525768\">";
						if ($filename != "." && $filename != ".." && file_exists($path."/".$filename)) {
							$file = fopen($path."/".$filename, "rt") or exit("Unable to open file ".$filename."!");
							while(!feof($file)) {
								$number++;
								$line = fgets($file);
								$lineLength = strlen($line);
								if($longestLine < $lineLength) $longestLine = $lineLength; 								
								$result .= $line;
							}
							fclose($file);
						} elseif (!file_exists($path."/".$filename)) {
							echo "Error: File $path/$filename does not exist!";
						}
						$result .= "</div><div class=\"roundedcornr_bottom_525768\"><div></div></div></div><br/>";
						if ($filename != "." && $filename != "..") $countedLines += ($number * 15) + 21;
						$tableOfContents[0][0] = $result;
						$tableOfContents[1][0] = $longestLine;
					} else {
						$fieldCounter++;
						$longestLine = 0;
						$result = "<div><table class=\"codeTable\" id=\"divTable". $fieldCounter ."\" width=\"100%\">";
						if ($filename != "." && $filename != ".." && file_exists($path."/".$filename)) {
							$fileCounter = fopen($path."/".$filename, "rt") or exit("Unable to open file ".$filename."!");
							$numberOfLines = 0;
							while(!feof($fileCounter)) {//Her teller vi antall linjer som skal skjules når man trykker på header i tabellen
								$numberOfLines++;
								$line = fgets($fileCounter);
							}
							fclose($fileCounter);
							$file = fopen($path."/".$filename, "rt") or exit("Unable to open file ".$filename."!");
							$result .= "<tr><th align=\"center\" colspan=\"2\" onMouseDown=\"changeScriptTable('". $fieldCounter ."',". $numberOfLines .");\" onMouseOver=\"document.getElementById('divTable". $fieldCounter ."').className = 'codeTableHover';\" onMouseOut=\"document.getElementById('divTable". $fieldCounter ."').className = 'codeTable';\"><A NAME=\"". str_replace(" ", "_",$filename) ."\">". $filename ."</A></div></th></tr>";
							$scriptSyntaxName = explode("/", $scriptName);
							$scriptSyntaxName = (count($scriptSyntaxName) > 1 ? $scriptSyntaxName[0] : $scriptName);
							$result .= "<tr><!--<td width=\"18\"><div id=\"divTableNumbers". $fieldCounter . $number ."\">". $number .".</div></td>--><td><pre class=\"brush: ". (strtolower($scriptSyntaxName) == "visualbasic" ? "vb" : strtolower($scriptSyntaxName)).";\">";
							while(!feof($file)) {
								$number++;
								$line = fgets($file);
								$lineLength = strlen($line);
								if($longestLine < $lineLength) $longestLine = $lineLength;
								$result .= str_replace("\t", "&nbsp;&nbsp;&nbsp;", $line);
							}
							$result .= "</pre></td></tr>";
							fclose($file);
						} elseif (!file_exists($path."/".$filename)) {
							echo "Error: File $path/$filename does not exist!";
						}
						$result .= "</table></div><br/>";
						if ($filename != "." && $filename != "..") {
							$countedLines += ($number * 15) + 21;
							$tableOfContents[0][$contentCounter] = $result;
							$tableOfContents[1][$contentCounter] = $longestLine;
							$contentCounter++;
						}	
					}
				}
				closedir($dh);
				//Her sorterer vi scriptene etter lengden på lengste rad, korteste rad først.
				for($forCounter = 1; $forCounter < count($tableOfContents[1]); $forCounter++) {
					for($sForCounter = 1; $sForCounter < count($tableOfContents[1]); $sForCounter++) {
						if(isset($tableOfContents[1][$sForCounter + 1])) {
							if($tableOfContents[1][$sForCounter] > $tableOfContents[1][$sForCounter + 1]) {
								$temporaryString = $tableOfContents[0][$sForCounter];
								$temporaryInteger = $tableOfContents[1][$sForCounter];
								$tableOfContents[0][$sForCounter] = $tableOfContents[0][$sForCounter + 1];						
								$tableOfContents[1][$sForCounter] = $tableOfContents[1][$sForCounter + 1];
								$tableOfContents[0][$sForCounter + 1] = $temporaryString;
								$tableOfContents[1][$sForCounter + 1] = $temporaryInteger;
							}
						}
					}
				}
				for($forCounter = 0; $forCounter < count($tableOfContents[0]); $forCounter++) {
					if(isset($tableOfContents[0][$forCounter]) && $tableOfContents[0][$forCounter] != "") echo $tableOfContents[0][$forCounter];
				}
			}
		} else {
			echo "Error: File $path does not exist!";
		}
		return $countedLines;
	} else {
		//Følgende lager en oversikt over subseksjoner
		$path = "./scripts/".$scriptName;
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
			$result .= "<tr><td width=\"240\"><li><a href=\"index.php?scriptName=". $scriptName ."/". $linkNames[3] ."&subSection=false\" class=\"packageTableLinks\">Scriptpakke: ". $linkNames[3] ."</td></tr>";
		}
		$result .= "</table>";
		$result .= "</div><div class=\"roundedcornr_bottom_525768\"><div></div></div></div></br></br></br>";
		echo $result;
		return $countedLines;
	}
}
?>