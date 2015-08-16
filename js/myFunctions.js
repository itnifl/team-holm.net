//if (self != top){
//	top.location = self.location;
//}
$(document).ready(function() {
	var goToPage = GetURLParameter('sn');
	if(goToPage) {
		switch(goToPage) {
			case 'pers': 
				printPersonalia();
				break;
			case 'edu': 
				printEdu();
				break;
			case 'share': 
				printSharing();
				break;
			case 'int': 
				printInt();
				break;
			case 'links': 
				printLinks();
				break;
		}
	}
	if(typeof goToPage === 'undefined') {
		getMovieCoster('moviesAsHTML/large/true');
	}
});
function getMovieCoster(apiRoute, callingElement) {	
	if(apiRoute == 'nextOne' || apiRoute == 'previousOne') {
		apiRoute = callingElement.dataset.currentapiroute == 'moviesAsHTML/true' ? 'moviesAsHTML/large/true' : 'moviesAsHTML/true';
	}
	if(apiRoute == 'moviesAsHTML/true') {
		var height = '291';
		var width = '281';
		var margin = '80';
	} else {
        var height = 334;
		var width = 506;
		var margin = '189';
		if (navigator.userAgent.search("MSIE") >= 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
			width = width + 30;			
		}
    }
	$.get("http://nodenet.homelinux.net:3000/"+apiRoute, function(data) {
		$('#divField').hide('show', function() {
			$(this).css('opacity',0.0).empty();
			$(this).show('fast', function() {
				$(this).css('opacity',1.0);
				$('#divField')
			        .hide()
			        .css('opacity',0.0)
			        .html('<iframe id="preview-iframe" src="about:blank" width="'+width+'" height="'+height+'" frameBorder="0" scrolling="no"></iframe><br/>' +
			    	'<img src="images/arrow_previous.png" title="Previous myMovieApi coaster" style="margin-right:'+margin+'px; cursor: pointer;" onClick="getMovieCoster(\'previousOne\', this);" data-currentApiRoute="'+apiRoute+'" id="previousCarousel" />' +
			    	'<a href="http://nodenet.homelinux.net:3000/moviesAsHTMLList" target="_blank"><img src="images/arrow_up.png" title="myMovieApi list view"  id="showMyMovieApiHtmlListView" style="height:66px;width:66px;border:0;margin-bottom:7px;"/></a>' + 
			    	'<img src="images/arrow_next.png" title="Next myMovieApi coaster" style="margin-left:'+margin+'px; cursor: pointer;" onclick="getMovieCoster(\'nextOne\', this)" data-currentApiRoute="'+apiRoute+'" id="nextCarousel" />'
			        ).slideDown('fast')
			        .animate({opacity: 1.0});
			    $('#divHeader')
			        .hide()
			        .css('opacity',0.0)
			        .html(setText('movieLikesHeader'))
			        .slideDown('fast')
			        .animate({opacity: 1.0});	

				    var iframe =  $('#preview-iframe');
					var idoc = iframe[0].contentDocument;
					idoc.open();
					idoc.write(data);
					idoc.close();
					iframe.css('overflow','hidden');    
			});
		
		});							
	});	
}
function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}
function setText(id) {
    var language = GetURLParameter('lang');
    if(!language || (language != 'no' && language != 'is' && language != 'en')) {
    	language = "no";
    }
    var text = "None Found";
    $.ajax({
        url: 'translations.xml',
        async: false,
        success: function(xml) {
            $(xml).find('translation').each(function(){
                if($(this).attr('id') == id) text = $(this).find(language).text();
            });
        }
    });
    return text;
}
function addShigarNameAfterUrl(shigarName) {
  	$("a[name='languageLink']").each(function() {
		var href = this.href;
		if (href.indexOf("#") != -1) href = href.substring(0, href.indexOf('#'));
		//if (href.indexOf('&sn=' + shigarName) != -1) href = href.substring(0, href.indexOf('&' + shigarName));
		//if (href.indexOf('?sn=' + shigarName) != -1) href = href.substring(0, href.indexOf('?' + shigarName));
		if (href.indexOf("&") != -1) href = href.split("&")[0];
		if (href.indexOf('?') != -1) {
			href = href + '&sn='+shigarName;
		} else {
			href = href + '?sn='+shigarName;
		}
		$(this).attr('href', href);
	});
}
function printPersonalia(){
  	var div = document.getElementById('divField');
  	div.style.color="Black";
	//var randomnumber=Math.floor(Math.random()*3);
	$('#divHeader').html(setText('personaliaHeader'));
  	$('#divField').html(setText('personaliaField'));
  	addShigarNameAfterUrl('pers');
}
function printEdu(){
 	var div = document.getElementById('divField');
 	div.style.color="Black";
 	$('#divHeader').html(setText('eduHeader'));
 	$('#divField').html(setText('eduField'));
 	addShigarNameAfterUrl('edu');

}
function printInt(){
 	var div = document.getElementById('divField');
 	div.style.color="Black";
	$('#divHeader').html(setText('intHeader'));
  	$('#divField').html(setText('intField'));
  	addShigarNameAfterUrl('int');
}
function printLinks(){
  	var div = document.getElementById('divField');
  	div.style.color="Black";
	$('#divHeader').html(setText('linkHeader'));
  	$('#divField').html(setText('linkField'));
  	addShigarNameAfterUrl('links');
}
function printSharing(){
  	var div = document.getElementById('divField');
  	div.style.color="Black";
	$('#divHeader').html(setText('codeHeader'));
	populateMenu("linkMenu2.xml", "divField", false); /* Bygger en scrollmeny til divField i stedet for å lage lenker, ved at vi spesifiserer false som siste argument. */
	addShigarNameAfterUrl('share');
}
function fillShareTable(theXML, thePanel) {
/* Denne funksjonen skal fylle notater/deling tabellen med info ut fra hvilken tittel den kalles med  */
/* Argumentene til funksjonen er xml fila vi leser innholdet til tabellen fra, og panelet hvor resultatet lagres*/
	var request = null;
	var xml_response = null;
	var resultString = new String();
	var selected = document.shareForm.shareList.selectedIndex;
	var selected_text = document.shareForm.shareList.options[selected].text;
	//alert(selected_text); //For testing
	//alert(theXML); //For testing
	
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(request) {
		request.open("GET", theXML);
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				xml_response = request.responseXML;
				var titles = xml_response.getElementsByTagName("title");
				var descriptions = xml_response.getElementsByTagName("description");
				var sources = xml_response.getElementsByTagName("source");
				var links = xml_response.getElementsByTagName("link");
				resultString += '<center><form name="shareForm" class="boxedBorder"><select size="3" style="background-color: white; color: Black; font-weight: Bold;" name="shareList" onChange="fillShareTable(' + '\'' + theXML + '\',' + ' \'' + thePanel + '\'' +')">';
				for (var loop = 0; loop < titles.length; loop++) {
					resultString += '<option value="' + titles[loop].firstChild.nodeValue + '" title="' + titles[loop].firstChild.nodeValue + '">' + titles[loop].firstChild.nodeValue + '</option>';
				}
				for (var loop = 0; loop < titles.length; loop++) {
					if(titles[loop].firstChild.nodeValue == selected_text) {
						var regex1=new RegExp(titles[loop].firstChild.nodeValue,"i");
						resultString += '</select></form>';
						resultString += '<table width="580" border="1" align="center" class="imagetable">' + 
						'<tr><th><b>Title</b></th><th bgcolor="Silver"><div id="titleContent">' + titles[loop].firstChild.nodeValue + '</div></th></tr>' + 
						'<tr><td><b>Description</b></td><td bgcolor="Beige"><div id="descriptionContent">' + descriptions[loop].firstChild.nodeValue + '</div></td></tr>' + 
						'<tr><td><b>Source</b></td><td bgcolor="Beige"><div id="sourceContent">' + sources[loop].firstChild.nodeValue + '</div></td></tr>';
						for (var linkloop = 0; linkloop < links.length; linkloop++) {
							/*alert(titles[loop].firstChild.nodeValue + " with " + links[linkloop].firstChild.nodeValue + ", " + regex1.test((links[linkloop].firstChild.nodeValue)));*/
							if(links[linkloop].firstChild.nodeValue != null) {
								if(regex1.test((links[linkloop].firstChild.nodeValue))) {
									var regex2=new RegExp(links[linkloop].firstChild.nodeValue,"i");
									resultString += '<tr><td align="top">';
									if(regex2.test('/code/Folder-Watcher-v1.0.0.rar')) {resultString +='<center><a href="images/Folder-Watcher-v1.0.0-teaser.png" rel="lightbox" title="Folder-Watcher-v1.0.0"><img src="images/Folder-Watcher-v1.0.0-teaser-thumb.png" border="0" height="30" width="70" /></a></center>';}
									if(regex2.test('/code/movieListerPackage-v.0.1.0b.tar.7z')) {resultString +='<center><a href="images/movieLister0.1.0-teaser.png" rel="lightbox" title="movieLister 0.1.0b"><img src="images/movieLister0.1.0-teaser-thumb.png" border="0" height="30" width="70" /></a></center>';}
									if(regex2.test('/code/movieListerPackage-v.0.0.8.1.tar.gz')) {resultString +='<center><a href="images/movieLister0.0.8-teaser.png" rel="lightbox" title="movieLister 0.0.8"><img src="images/movieLister0.0.8-teaser-thumb.png" border="0" height="30" width="70" /></a></center>';}
									if(regex2.test('/code/movieListerPackage-v.0.0.1.tar.gz')) {resultString +='<center><a href="images/movieLister0.0.1-teaser.png" rel="lightbox" title="movieLister 0.0.1"><img src="images/movieLister0.0.1-teaser-thumb.png" border="0" height="30" width="70" /></a></center>';}
									if(regex2.test('/code/movieLister.0.0.0.pre-version.zip')) {resultString +='<center><a href="images/movieLister-pre-version-teaser.png" rel="lightbox" title="movieLister Pre-Version"><img src="images/movieLister-pre-version-teaser-thumb.png" border="0" height="30" width="70" /></a></center>';}
									resultString +='</td><td bgcolor="Beige"><div id="linkContent-'+linkloop+'"><a href="' + links[linkloop].firstChild.nodeValue + '" target="_blank" class="shareLink"><center>' + links[linkloop].firstChild.nodeValue; + '</center></a></div></td></tr>';
								}
							}
						}
						resultString += '</table><p>&nbsp;</p><p><br /></p>';
						document.getElementById(thePanel).innerHTML = resultString;
					}
				}
			} else {
				resultString += '</select><h1></h1></center><br/><br/><br/><br/><br/><br/><br/><br/><br/>';
				document.getElementById(thePanel).innerHTML = resultString;
				resultString = new String();
			}
		}
		request.send(null);
	}
}
var menu_array = new Array("linkMenu0", "linkMenu1", "linkMenu2", "linkMenu3", "linkMenu4");
function setMenu(theMenu, newVisibility) {
	if (theMenu == "linkMenu2" && newVisibility == "visible") {
		populateMenu(theMenu + '.xml', theMenu, true); /* True sørger for at resultatene settes i menyen/det valgte feltet som lenker */
	}
	document.getElementById(theMenu).style.visibility = newVisibility;
	$('#' + theMenu).animate({ opacity: 'show', height: 'show'}, 'slow');
}
/*function closeMenus() {
//Depreceated:
	for (var loop = 0; loop < menu_array.length; loop++) {
		setMenu(menu_array[loop], "hidden");
	}
}*/
function populateMenu(theXML, thePanel, links) { /* XML fil og panelnavn er likt, det finnes fem paneler, linkMenu0-4 
													links er en boolean som bestemmer om vi skal fylle et linkepanel eller en deletabell*/
	var request = null;
	var xml_response = null;
	var resultString = new String();
	
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (request && links == true) {
		request.open("GET", theXML);
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				xml_response = request.responseXML;
				var titles = xml_response.getElementsByTagName("title");
				var links = xml_response.getElementsByTagName("link");

				for (var loop = 0; loop < titles.length; loop++) {
					var regex1=new RegExp(titles[loop].firstChild.nodeValue,"i");
					for (var linkloop = 0; linkloop < links.length; linkloop++) {
						/*alert(titles[loop].firstChild.nodeValue + " with " + links[linkloop].firstChild.nodeValue + ", " + regex1.test((links[linkloop].firstChild.nodeValue)) + ", and resultString is " + resultString);*/
						if(links[linkloop].firstChild.nodeValue != null) {
							if(regex1.test((links[linkloop].firstChild.nodeValue)) && !regex1.test(resultString)) {
								resultString += '<a href="' + (titles[loop].firstChild.nodeValue == 'MovieLister' ? 'https://github.com/itnifl/movieLister' : links[linkloop].firstChild.nodeValue) + '" class="menuLink" target="_blank">' + titles[loop].firstChild.nodeValue + '</a><br />';
								//resultString += '<a href="' + (titles[loop].firstChild.nodeValue == 'myMovieApi' ? 'https://github.com/itnifl/myMovieApi' : links[linkloop].firstChild.nodeValue) + '" class="menuLink" target="_blank">' + titles[loop].firstChild.nodeValue + '</a><br />';
							} 
						}
					}
				}
				document.getElementById(thePanel).innerHTML = resultString;
			} else {
				document.getElementById(thePanel).innerHTML = '<b>Searching for content..</b><br><center><img src="images/loading.gif" /></center>';
			}
		}
		request.send(null);
	} else if (request && links == false) {
		request.open("GET", theXML, true);
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				xml_response = request.responseXML;
				var titles = xml_response.getElementsByTagName("title");
				resultString += '<center><form name="shareForm" class="boxedBorder"><select size="3" style="background-color: white; color: black; font-weight: Bold;" name="shareList" onChange="fillShareTable(' + '\'' + theXML + '\',' + ' \'' + thePanel + '\'' +')">';
				for (var loop = 0; loop < titles.length; loop++) {
					resultString += '<option value="' + titles[loop].firstChild.nodeValue + '" title="' + titles[loop].firstChild.nodeValue + '">' + titles[loop].firstChild.nodeValue + '</option>';
				}
				resultString += '</select></form></center>';
				resultString += '<br><div id="divField" class="centerText"><img src="images/10639735_s.jpg" height="285" width="401" /><p>&nbsp;</p><p>&nbsp;</p></div>';
				document.getElementById(thePanel).innerHTML = resultString;
			} else {
				document.getElementById(thePanel).innerHTML = '<b>Building scrollmenu..</b><br><center><img src="images/loading.gif" /></center><br><b>Searching for content..</b><br><br><br>';
			}
		}
		request.send(null);
		//fillShareTable(theXML, thePanel);
	} else {
		alert("Sorry, you must update your browser before seeing" + " Ajax in action.");
	}
}