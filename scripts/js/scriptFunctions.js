if (self != top){
	top.location = self.location;
}
function changeScriptTable(number, numberOfLines){
	/*var theTable = 'divTable' + number;
	var theTableNumbers = 'divTableNumbers' + number;
	var strTheTableNumbers = number + '';
  	var div = document.getElementById(theTable);
	var line = 0;
  	div.style.color="Black";
	if(document.getElementById(theTable).className != 'codeTableNoLine') {
		document.getElementById(theTable).className = 'codeTableNoLine';
		while(line < numberOfLines) {
			line++;
			setTimeout(document.getElementById(theTableNumbers + line).style.visibility = 'hidden',1500);
			document.getElementById(theTableNumbers + line).innerHTML = '';
		}
	} else {
		document.getElementById(theTable).className = 'codeTable';
		while(line < numberOfLines) {
			line++
			document.getElementById(theTableNumbers + line).style.visibility = 'visible';
			document.getElementById(theTableNumbers + line).innerHTML = line + ".";
		}
	}*/
}
$(document).ready(function() {
	/*Følgende kode _skal_ fører til smooth scrollingi alle browsere - takk til http://www.zachstronaut.com/posts/2009/01/18/jquery-smooth-scroll-bugs.html#opera*/
	/*Ser ikke ut til å funke her, men funker på itblog.team-holm.net*/
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
	/*Slutt på smooth scroll seksjonen*/
	
	var loaded = $.cookie('loaded_scripts');
	loaded = (typeof(loaded) == 'string') ? loaded.split('|') : [];
	if($.inArray('unique_key', loaded) == -1) {
		//first load:
		$.vegas({
			src:'/images/binary-code-background_3b.gif',
			fade:5000 // milliseconds
		});
		loaded.push('unique_key');
				var date = new Date();
		var minutes = 30;
		date.setTime(date.getTime() + (minutes * 60 * 1000));
		$.cookie('loaded_scripts', loaded.join('|'), { expires: date });
	} else {
		//subsequent load
		$.vegas({
			src:'/images/binary-code-background_3b.gif'
		});
	}
	$.vegas('overlay', {
		src:'/js/vegas/overlays/13.png',
		opacity:0.89
	});	
});