$(document).ready(function() {
	/*The DOSA Box*/
	$('#btnDOSA').click(function() {
		$('#DOSA').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeDOSA').click(function() {
		if ($('#DOSA').is(':visible')) {
			$('#DOSA').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The LANSEC Box*/
	$('#btnLANSEC').click(function() {
		$('#LANSEC').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeLANSEC').click(function() {
		if ($('#LANSEC').is(':visible')) {
			$('#LANSEC').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
});
