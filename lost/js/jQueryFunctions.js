$(document).ready(function() {
	/*$('body').click(function() {
		if ($('#boxGameCreations').is(':visible')) {
			$('#boxGameCreations').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
		if ($('#boxOldCode').is(':visible')) {
			$('#boxOldCode').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
		if ($('#boxOtherStuff').is(':visible')) {
			$('#boxOtherStuff').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
		if ($('#boxUnforseenStuff').is(':visible')) {
			$('#boxUnforseenStuff').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});*/
	/*Vegas backgrounds*/
	$.vegas('slideshow', {
		delay:10000,
		backgrounds:[
		{ src:'/images/Hometrip2.jpg', fade:3000 },
		{ src:'/images/torture/ezquake011.png', fade:3000 },
		{ src:'/images/pnfort/2013-02-03_00009.jpg', fade:3000 },
		{ src:'/images/Tournament_Malos_Patos.png', fade:3000 },
		{ src:'/images/pnfort/2013-02-03_00002.jpg', fade:3000 },
		{ src:'/images/pnfort/2013-02-03_00001.jpg', fade:3000 },
		{ src:'/images/Torture/ezquake007.png', fade:3000 },
		{ src:'/images/gasdeath101/2013-01-30_00011.jpg', fade:3000 },
		{ src:'/images/gasdeath101/2013-01-30_00009.jpg', fade:3000 },
		{ src:'/images/HeadOn.png', fade:3000 },
		{ src:'/images/gasdeath101/2013-01-30_00008.jpg', fade:3000 },
		{ src:'/images/Hometrip1.jpg', fade:3000 },
		{ src:'/images/gasdeath101/2013-01-30_00006.jpg', fade:3000 },
		{ src:'/images/gasdeath101/2013-01-30_00002.jpg', fade:3000 }
		]
	})('overlay', {
		src:'/js/vegas/overlays/11.png'
	});
	
/*The Game Creations Box*/
	$('#boxGameCreationsClose').click(function() {
		//if(!$('#boxTorturePictures').is(':visible') && !$('#boxgasDeath101Pictures').is(':visible') && !$('#boxMalosPatosPictures').is(':visible') && !$('#boxHometripPictures').is(':visible') && !$('#boxUprisingPictures').is(':visible') && !$('#boxSandMissionPictures').is(':visible') && !$('#boxHeadOnPictures').is(':visible') && !$('#boxPnFortPictures').is(':visible')) {
			$('#boxGameCreations').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		//}
	});
	$('#btnGameCreations').click(function() {
		//if(!$('#boxTorturePictures').is(':visible') && !$('#boxgasDeath101Pictures').is(':visible') && !$('#boxMalosPatosPictures').is(':visible') && !$('#boxHometripPictures').is(':visible') && !$('#boxUprisingPictures').is(':visible') && !$('#boxSandMissionPictures').is(':visible') && !$('#boxHeadOnPictures').is(':visible') && !$('#boxPnFortPictures').is(':visible')) {
			$('#boxGameCreations').animate({ opacity: 'show', height: 'show'}, 'slow');
		//}
	});
	$('#boxGameCreations').shadow('raised');
	
/* The Old Code Box*/
	$('#boxOldCodeClose').click(function() {
		$('#boxOldCode').animate({ opacity: 'hide', height: 'hide'}, 'slow');
	});
	$('#btnOldCode').click(function() {
		//if(!$('#boxTorturePictures').is(':visible') && !$('#boxgasDeath101Pictures').is(':visible') && !$('#boxMalosPatosPictures').is(':visible') && !$('#boxHometripPictures').is(':visible') && !$('#boxUprisingPictures').is(':visible') && !$('#boxSandMissionPictures').is(':visible') && !$('#boxHeadOnPictures').is(':visible') && !$('#boxPnFortPictures').is(':visible')) {
			$('#boxOldCode').animate({ opacity: 'show', height: 'show'}, 'slow');
		//}
	});
	$('#boxOldCode').shadow('raised');
	
/*The Other Stuff Box*/
	$('#boxOtherStuffClose').click(function() {
		$('#boxOtherStuff').animate({ opacity: 'hide', height: 'hide'}, 'slow');
	});
	$('#btnOtherStuff').click(function() {
		//if(!$('#boxTorturePictures').is(':visible') && !$('#boxgasDeath101Pictures').is(':visible') && !$('#boxMalosPatosPictures').is(':visible') && !$('#boxHometripPictures').is(':visible') && !$('#boxUprisingPictures').is(':visible') && !$('#boxSandMissionPictures').is(':visible') && !$('#boxHeadOnPictures').is(':visible') && !$('#boxPnFortPictures').is(':visible')) {
			$('#boxOtherStuff').animate({ opacity: 'show', height: 'show'}, 'slow');
		//}
	});
	$('#boxOtherStuff').shadow('raised');
	
/*The WhatsUpBox*/
	$('#boxWhatsupClose').click(function() {
		$('#boxWhatsup').animate({ opacity: 'hide', height: 'hide'}, 'slow');
	});
	$('#btnWhatsup').click(function() {
			$('#boxWhatsup').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxWhatsup').shadow('raised');
	
/*The Other Stuff Box*/
	$('#boxOtherStuffClose').click(function() {
		$('#boxOtherStuff').animate({ opacity: 'hide', height: 'hide'}, 'slow');
	});
	$('#btnOtherStuff').click(function() {
		//if(!$('#boxTorturePictures').is(':visible') && !$('#boxgasDeath101Pictures').is(':visible') && !$('#boxMalosPatosPictures').is(':visible') && !$('#boxHometripPictures').is(':visible') && !$('#boxUprisingPictures').is(':visible') && !$('#boxSandMissionPictures').is(':visible') && !$('#boxHeadOnPictures').is(':visible') && !$('#boxPnFortPictures').is(':visible')) {
			$('#boxOtherStuff').animate({ opacity: 'show', height: 'show'}, 'slow');
		//}
	});
	$('#boxOtherStuff').shadow('raised');
	
	
	
	/*The Gas Death Box*/
	/*$('#boxgasDeath101Pictures').mouseleave(function() {
		$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
	});*/
	$('#btngasDeath101Pictures').hover(function() {
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHeadOnPictures').is(':visible')) {
			$('#boxHeadOnPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxgasDeath101Pictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxgasDeath101Pictures').shadow('raised');
	$('#boxgasDeathClose').click(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	/*The Malos Patos Box*/
	$('#btnMalosPatos').hover(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHeadOnPictures').is(':visible')) {
			$('#boxHeadOnPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxMalosPatosPictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxMalosPatosPictures').shadow('raised');
	$('#boxMalosPatosClose').click(function() {
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	/*The Hometrip Pictures Box*/
	$('#btnHometrip').hover(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHeadOnPictures').is(':visible')) {
			$('#boxHeadOnPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxHometripPictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxHometripPictures').shadow('raised');
	$('#boxHometripClose').click(function() {
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	/*The PnFort Box*/
	$('#btnPnFortPictures').hover(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHeadOnPictures').is(':visible')) {
			$('#boxHeadOnPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxPnFortPictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxPnFortPictures').shadow('raised');
	$('#boxPnFortClose').click(function() {
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	/*The HeadOn Box*/
	$('#btnHeadOn').hover(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxHeadOnPictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxHeadOnPictures').shadow('raised');
	$('#boxHeadOnClose').click(function() {
		if ($('#boxHeadOnPictures').is(':visible')) {
			$('#boxHeadOnPictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	/*The SandMission Box*/
	$('#btnSandMission').hover(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHeadOnPictures').is(':visible')) {
			$('#boxHeadOnPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxSandMissionPictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxSandMissionPictures').shadow('raised');
	$('#boxSandMissionClose').click(function() {
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	/*The Uprising Box*/
	$('#btnUprising').hover(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxUprisingPictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxUprisingPictures').shadow('raised');
	$('#boxUprisingClose').click(function() {
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	/*The Torture Box*/
	$('#btnTorture').hover(function() {
		if ($('#boxgasDeath101Pictures').is(':visible')) {
			$('#boxgasDeath101Pictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxHometripPictures').is(':visible')) {
			$('#boxHometripPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxPnFortPictures').is(':visible')) {
			$('#boxPnFortPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxSandMissionPictures').is(':visible')) {
			$('#boxSandMissionPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxMalosPatosPictures').is(':visible')) {
			$('#boxMalosPatosPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		if ($('#boxUprisingPictures').is(':visible')) {
			$('#boxUprisingPictures').animate({ opacity: 'hide', height: 'hide'}, 'fast');
		}
		$('#boxTorturePictures').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#boxTorturePictures').shadow('raised');
	$('#boxTortureClose').click(function() {
		if ($('#boxTorturePictures').is(':visible')) {
			$('#boxTorturePictures').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
});
