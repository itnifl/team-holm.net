$(document).ready(function() {
	/*The HYPER_GSWH Box*/
	$('#btnHYPER_GSWH').click(function() {
		$('#HYPER_GSWH').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeHYPER_GSWH').click(function() {
		if ($('#HYPER_GSWH').is(':visible')) {
			$('#HYPER_GSWH').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The HYPER_GCRFBTS Box*/
	$('#btnHYPER_GCRFBTS').click(function() {
		$('#HYPER_GCRFBTS').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeHYPER_GCRFBTS').click(function() {
		if ($('#HYPER_GCRFBTS').is(':visible')) {
			$('#HYPER_GCRFBTS').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
});
