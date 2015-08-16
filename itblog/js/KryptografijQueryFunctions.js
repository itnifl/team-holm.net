$(document).ready(function() {
	/*The BCRYPT Box*/
	$('#btnBCRYPT').click(function() {
		$('#BCRYPT').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeBCRYPT').click(function() {
		if ($('#BCRYPT').is(':visible')) {
			$('#BCRYPT').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
});
