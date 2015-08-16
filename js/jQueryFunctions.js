$(document).ready(function() {
	$('body').click(function() {
		if ($('#linkMenu4').is(':visible')) {
			$('#linkMenu4').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
		if ($('#linkMenu2').is(':visible')) {
			$('#linkMenu2').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		} 
	});
	$('#linkMenu4').mouseleave(function() {
		$('#linkMenu4').animate({ opacity: 'hide', height: 'hide'}, 'slow');
	});
	$('#linkMenu2').mouseleave(function() {
		$('#linkMenu2').animate({ opacity: 'hide', height: 'hide'}, 'slow');
	});
	$('#personalia').hover(function() {
		$('#personalia').animate({color: '#EBF5FF'})
	});
	$('#personalia').mouseleave(function() {
		$('#personalia').animate({color: '#000000'});
	});
	
	$('#utdanning').hover(function() {
		$('#utdanning').animate({color: '#EBF5FF'});
	});
	$('#utdanning').mouseleave(function() {
		$('#utdanning').animate({color: '#000000'});
	});
	$('#interesser').hover(function() {
		$('#interesser').animate({color: '#EBF5FF'});
	});
	$('#interesser').mouseleave(function() {
		$('#interesser').animate({color: '#000000'});
	});
	$('#lenker').hover(function() {
		$('#lenker').animate({color: '#EBF5FF'});
	});
	$('#lenker').mouseleave(function() {
		$('#lenker').animate({color: '#000000'});
	});
	$('#redCode').hover(function() {
		$('#redCode').animate({color: '#FF0000'});
	});
	$('#redCode').mouseleave(function() {
		$('#redCode').animate({color: '#000000'});
	});
	$('#greenCode').hover(function() {
		$('#greenCode').animate({color: '#008000'});
	});
	$('#greenCode').mouseleave(function() {
		$('#greenCode').animate({color: '#000000'});
	});
	$('#blueCode').hover(function() {
		$('#blueCode').animate({color: '#0000FF'});
	});
	$('#blueCode').mouseleave(function() {
		$('#blueCode').animate({color: '#000000'})
	});
	$('#goldCode').hover(function() {
		$('#goldCode').animate({color: '#FFD700'});
	});
	$('#goldCode').mouseleave(function() {
		$('#goldCode').animate({color: '#000000'});
	});
});
