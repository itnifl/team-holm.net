<?php
function displayPanelMenu() {
	echo "<div style=\"border:1px solid; border-color: #999999; width:150px; overflow:hidden; position:absolute; right:40px; top:20px;\">";
	echo "<table class=\"menuTable\" width=\"150\"><th><div class=\"panelHeaders\">Panel Menu</div></th>";
	echo "<tr><td style=\"text-align: center;\"><a href=\"http://www.team-holm.net\" target=\"_blank\" class=\"panelLinks\">Main Page</a></font></td></tr>";
	echo "<tr><td style=\"text-align: center;\"><a href=\"#\" class=\"panelLinks\" id=\"btnGameCreations\" title=\"Addons that I have made for for games\">Game Creations</a></font></td></tr>";
	echo "<tr><td style=\"text-align: center;\"><a href=\"#\" class=\"panelLinks\" id=\"btnOldCode\" title=\"Old code from a long time ago..\">Old Code</a></font></td></tr>";
	echo "<tr><td style=\"text-align: center;\"><a href=\"#\" class=\"panelLinks\" id=\"btnOtherStuff\" title=\"Other stuff worth of sharing\">Other stuff</a></font></td></tr>";
	echo "<tr><td style=\"text-align: center;\"><a href=\"#\" class=\"panelLinksSmaller\" id=\"btnWhatsup\" title=\"What?\">What is this stuff?</a></font></td></tr>";
	echo "<tr></tr></table></div>";
}
function setGameCreations() {
	echo "<div id=\"boxGameCreations\" class=\"boxGeneral\">";
	echo "<span style=\"position:absolute;top:5px;right:5px;\"><a href=\"#\" id=\"boxGameCreationsClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></span>";
	echo "<div style=\"color:Black; text-align:center;font-size:20px;font-weight:bold;\">Game Creations</div><br/>";
	echo "<div style=\"text-align:left; position:relative; left:12px; bottom:9px;\">";
	echo "<a href=\"http://www.moddb.com/mods/confronted-with-consequences\" alt=\"http://city17.ru/hl/confront/\" class=\"boxLinks\" target=\"_blank\">Half-Life - Confronted With Consequences</a><br/>";
	echo "<a href=\"gameCreations/Half-Life/gasdeath101.zip\" class=\"boxLinks\" id=\"btngasDeath101Pictures\">Half-Life - GasDeath101</a><br/>";
	echo "<a href=\"http://www.gamers.org/pub/idgames2/levels/deathmatch/p-r/pnfort.zip\" class=\"boxLinks\" id=\"btnPnFortPictures\">Half-Life - PainFort</a><br/>";
	echo "<a href=\"http://www.atomicgamer.com/files/430/atle-holms-hometrip\" class=\"boxLinks\" id=\"btnHometrip\" target=\"_blank\">Quake 2 - Hometrip</a><br/>";
	echo "<a href=\"http://www.quaddicted.com/files/idgames2/levels/deathmatch/s-u/torturedm.zip\" class=\"boxLinks\" id=\"btnTorture\">Quake 1 - Torture</a><br/>";
	echo "<a href=\"gameCreations/Zero_Hour/Tournament_Malos_Patos.zip\" class=\"boxLinks\" id=\"btnMalosPatos\">C&C - Zero Hour - Tournament Malos Patos</a><br/>";
	echo "<a href=\"gameCreations/Generals/HeadOn.zip\" class=\"boxLinks\" id=\"btnHeadOn\">C&C - Generals - HeadOn</a><br/>";
	echo "<a href=\"gameCreations/Generals/SandMission.zip\" class=\"boxLinks\" id=\"btnSandMission\">C&C - Generals - Sand Mission</a><br/>";
	echo "<a href=\"gameCreations/Generals/Uprising.zip\" class=\"boxLinks\" id=\"btnUprising\">C&C - Generals - Uprising</a><br/>";
	echo "<a href=\"gameCreations/StarCraft_Maps/StarCraftMaps.zip\" class=\"boxLinks\">Starcraft Maps</a><br/>";
	echo "<a href=\"gameCreations/Ra2levels.zip\" class=\"boxLinks\">Red Alert 2 Levels</a><br/>";
	echo "<a href=\"gameCreations/C&Clevels.zip\" class=\"boxLinks\">Command & Conquer Levels(first version C&C)</a><br/>";
	echo "</div>";
	echo "</div>";
}
function setOldCode() {
	echo "<div id=\"boxOldCode\" class=\"boxGeneral\">";
	echo "<span style=\"position:absolute;top:5px;right:5px;\"><a href=\"#\" id=\"boxOldCodeClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></span>";
	echo "<div style=\"color:Black; text-align:center;font-size:20px;font-weight:bold;\">Old Code</div><br/>";
	echo "<div style=\"text-align:left; position:relative; left:12px; bottom:9px;\">";
	echo "<a href=\"oldCode/dosf.h\" alt=\"Compile if you can..\" class=\"boxLinks\">Dos Functions Header File(C).</a><br/>";
	echo "<a href=\"oldCode/tmouse.c\" alt=\"Compile if you can..\" class=\"boxLinks\">Demonstration of using text mode mouse services(C).</a><br/>";
	echo "<a href=\"oldCode/Findf.cpp\" alt=\"Compile if you can..\" class=\"boxLinks\">Function Finder(DOS/Mouse functions).</a><br/>";
	echo "<a href=\"oldCode/Role_Playing_Game.zip\" alt=\"Compile if you can..\" class=\"boxLinks\">Role Playing Game</a><br/>";
	echo "<br/><div style=\"text-decoration: none; color: Grey; font-size:14px; text-align:center;\">NB! Dette er gammel fjortisskode.</div>";
	echo "</div>";
	echo "</div>";
}
function setWhatsup() {
	echo "<div id=\"boxWhatsup\" class=\"boxGeneral\">";
	echo "<span style=\"position:absolute;top:5px;right:5px;\"><a href=\"#\" id=\"boxWhatsupClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></span>";
	echo "<div style=\"color:Black; text-align:center;font-size:20px;font-weight:bold;\">What is this stuff?</div><br/>";
	echo "<div style=\"text-align:left; position:relative; left:12px; bottom:9px; margin-right:9px; text-decoration: none; color: Grey; font-size:14px;\">";
	echo "The stuff that is shared on this page is all old creations made ";
	echo "when I was younger. Stuff that has been lying around on my harddrive or else where, ";
	echo "forgotten over time. In remembrance of past nerdy passions, I found it fun to share ";
	echo "this stuff with the rest of the world. Enjoy!<br/>";
	echo "</div>";
	echo "</div>";
}
function setOtherStuff() {
	echo "<div id=\"boxOtherStuff\" class=\"boxGeneral\">";
	echo "<span style=\"position:absolute;top:5px;right:5px;\"><a href=\"#\" id=\"boxOtherStuffClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></span>";
	echo "<div style=\"color:Black; text-align:center;font-size:20px;font-weight:bold;\">Other Stuff</div><br/>";	
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\">";
	echo "<a href=\"#\" class=\"boxLinks\">&gt;Half-Life 1 Dedicated Server: <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;halflifededicated.homelinux.net</a><br/>";
	echo "<a href=\"gameCreations/Half-Life/lights.rad.zip\" class=\"boxLinks\">&gt;The long forgotten Lights.rad for Half-Life 1.</a><br/>";
	echo "<a href=\"documents/Sun_Solaris-Unix-Ovelser_paa_norsk.zip\" class=\"boxLinks\" title=\"Self made Sun Solaris excercises\">&gt;Sun Solaris Excersices in Norwegian</a>";
	echo "</div>";
	echo "</div>";
}
function setGasDeath101Pictures() {
	echo "<div id=\"boxgasDeath101Pictures\" class=\"boxgasDeath101Pictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">GasDeath 101</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxgasDeathClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td><a href=\"images/gasdeath101/2013-01-30_00001.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00001.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\"/></a></td><td><a href=\"images/gasdeath101/2013-01-30_00002.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00002.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00003.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00003.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00004.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00004.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00005.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00005.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00006.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00006.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td></tr>";
	echo "<tr><td><a href=\"images/gasdeath101/2013-01-30_00007.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00007.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00008.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00008.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00009.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00009.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00010.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00010.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00011.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00011.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/gasdeath101/2013-01-30_00012.jpg\" data-lightbox=\"GasDeath\" title=\"GasDeath101\"><img src=\"images/gasdeath101/thumbnails/2013-01-30_00012.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
function setMalosPatosPictures() {
	echo "<div id=\"boxMalosPatosPictures\" class=\"boxMalosPatosPictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">Tournament Malos Patos</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxMalosPatosClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td style=\"padding-left:180px;\"><a href=\"images/Tournament_Malos_Patos.png\" rel=\"lightbox\" title=\"Tournament Evil Ducks\"><img src=\"images/thumbnails/Tournament_Malos_Patos.png\" border=\"0\" height=\"70\" width=\"70\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
function setHometripPictures() {
	echo "<div id=\"boxHometripPictures\" class=\"boxHometripPictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">The Hometrip</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxHometripClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td style=\"padding-left:125px;\"><a href=\"images/Hometrip1.jpg\" data-lightbox=\"HomeTrip\" title=\"Hometrip\"><img src=\"images/thumbnails/Hometrip1.jpg\" border=\"0\" height=\"53\" width=\"70\" /></a></td><td style=\"padding-left:40px;\"><a href=\"images/Hometrip2.jpg\" data-lightbox=\"HomeTrip\" title=\"Hometrip\"><img src=\"images/thumbnails/Hometrip2.jpg\" border=\"0\" height=\"53\" width=\"70\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
function setPnFortPictures() {
	echo "<div id=\"boxPnFortPictures\" class=\"boxPnFortPictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">PainFort</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxPnFortClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td><a href=\"images/pnfort/2013-02-03_00001.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00001.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/pnfort/2013-02-03_00002.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00002.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/pnfort/2013-02-03_00003.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00003.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/pnfort/2013-02-03_00004.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00004.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/pnfort/2013-02-03_00005.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00005.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/pnfort/2013-02-03_00006.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00006.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td></tr>";
	echo "<tr><td><a href=\"images/pnfort/2013-02-03_00007.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00007.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/pnfort/2013-02-03_00008.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00008.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/pnfort/2013-02-03_00009.jpg\" data-lightbox=\"pnfort\" title=\"PainFort\"><img src=\"images/pnfort/thumbnails/2013-02-03_00009.jpg\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
function setHeadOnPictures() {
	echo "<div id=\"boxHeadOnPictures\" class=\"boxHeadOnPictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">Tournament HeadOn</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxHeadOnClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td style=\"padding-left:180px;\"><a href=\"images/HeadOn.png\" rel=\"lightbox\" title=\"Tournament HeadOn\"><img src=\"images/thumbnails/HeadOn.png\" border=\"0\" height=\"70\" width=\"70\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
function setSandMissionPictures() {
	echo "<div id=\"boxSandMissionPictures\" class=\"boxSandMissionPictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">Tournament Sandmission</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxSandMissionClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td style=\"padding-left:180px;\"><a href=\"images/SandMission.png\" rel=\"lightbox\" title=\"Tournament SandMission\"><img src=\"images/thumbnails/SandMission.png\" border=\"0\" height=\"70\" width=\"70\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
function setUprisingPictures() {
	echo "<div id=\"boxUprisingPictures\" class=\"boxUprisingPictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">TournamentUprising</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxUprisingClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td style=\"padding-left:180px;\"><a href=\"images/Uprising.png\" rel=\"lightbox\" title=\"Tournament Uprising\"><img src=\"images/thumbnails/Uprising.png\" border=\"0\" height=\"70\" width=\"70\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
function setTorturePictures() {
	echo "<div id=\"boxTorturePictures\" class=\"boxTorturePictures\">";
	echo "<table width=\"100%\"><tr><td width=\"5%\"></td><td><div style=\"color:Red;text-align:center;font-size:18px;font-weight:bold;\">Quake Torture</div><br/><td><td width=\"5%\" valign=\"top\"><a href=\"#\" id=\"boxTortureClose\"><img src=\"images/close.png\" border=\"0\" height=\"19\" width=\"27\" valign=\"top\"/></a></td></tr></table>";
	echo "<div style=\"text-align:left;position:relative; left:12px; bottom:9px;\"><table>";
	echo "<tr><td><a href=\"images/Torture/ezquake000.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake000.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake001.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake002.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake003.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake003.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake004.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake004.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake005.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake005.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake006.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake006.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td></tr>";
	echo "<tr><td><a href=\"images/Torture/ezquake007.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake007.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake008.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake008.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake009.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake009.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake010.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake010.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake011.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake011.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td><td><a href=\"images/Torture/ezquake012.png\" data-lightbox=\"torture\"title=\"Quake Torture\"><img src=\"images/Torture/thumbnails/ezquake012.png\" border=\"0\" height=\"30\" width=\"70\" style=\"margin:2px;\" /></a></td></tr>";
	echo "</table></div>";
	echo "</div>";
}
?>