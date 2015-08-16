if (self != top){
	top.location = self.location;
}
/*Følgende kode fører til smooth scrollingi alle browsere - takk til http://www.zachstronaut.com/posts/2009/01/18/jquery-smooth-scroll-bugs.html#opera*/
$(document).ready(function() {
	var goToPage = GetURLParameter('sn');
	if(goToPage) {
		switch(goToPage) {
			case 'page1':
				break;
			case 'page2':
				break;
			case 'page3':
				break;
			case 'page4':
				break;
			case 'page5':
				break;
		}
	}
    function filterPath(string) {
        return string
                .replace(/^\//,'')
                .replace(/(index|default).[a-zA-Z]{3,4}$/,'')
                .replace(/\/$/,'');
    }
    var locationPath = filterPath(location.pathname);
    var scrollElement = 'html, body';
    $('html, body').each(function () {
        var initScrollTop = $(this).attr('scrollTop');
        $(this).attr('scrollTop', initScrollTop + 1);
        if ($(this).attr('scrollTop') == initScrollTop + 1) {
            scrollElement = this.nodeName.toLowerCase();
            $(this).attr('scrollTop', initScrollTop);
            return false;
        }    
    });
    $('a[href*=#]').each(function() {
        var thisPath = filterPath(this.pathname) || locationPath;
        if	(locationPath == thisPath && (location.hostname == this.hostname || !this.hostname) && this.hash.replace(/#/, '')) {
			if ($(this.hash).length) {
				$(this).click(function(event) {
					var targetOffset = $(this.hash).offset().top;
					var target = this.hash;
					event.preventDefault();
					$(scrollElement).animate({scrollTop: targetOffset},500,function() { location.hash = target;});
				});
			}
        }
    });
	/*The following shows divs that are named in an anchor tag in the url*/
	if(window.location.hash) {
		$("#" + window.location.hash.replace("#", "")).show();
	}
	$('#searchString').watermark('Enter search text here..');
	$('#searchString').attr('size',18);
	
	/*Vegas backgrounds*/
	/*$.vegas('slideshow', {
		delay:10000,
		backgrounds:[
		{ src:'/images/backgrounds/superman-symbol-splatter.jpg', fade:3000 }]
	})('overlay', {
		src:'/js/vegas/overlays/11.png'
	});*/
	var loaded = $.cookie('loaded');
	loaded = (typeof(loaded) == 'string') ? loaded.split('|') : [];
	if($.inArray('unique_key', loaded) == -1) {
		//first load:
		$.vegas({
			src:'/images/backgrounds/superman-symbol-splatter.jpg',
			fade:5000 // milliseconds
		});
		loaded.push('unique_key');
		var date = new Date();
		var minutes = 30;
		date.setTime(date.getTime() + (minutes * 60 * 1000));
		$.cookie('loaded', loaded.join('|'), { expires: date });
	} else {
		//subsequent load
		$.vegas({
			src:'/images/backgrounds/superman-symbol-splatter.jpg'
		});
	}	
	$.vegas('overlay', {
  		src:'/js/vegas/overlays/11.png'
	});
});
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
    if(!language || (language != 'no' && language != 'en')) {
    	language = "en";
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