$(document).ready(function() {
	/*The ESXi_CACHSS Box*/
	$('#btnESXi_CACHSS').click(function() {
		$('#ESXi_CACHSS').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeESXi_CACHSS').click(function() {
		if ($('#ESXi_CACHSS').is(':visible')) {
			$('#ESXi_CACHSS').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The ESXi_PerfMon Box*/
	$('#btnESXi_PerfMon').click(function() {
		$('#ESXi_PerfMon').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeESXi_PerfMon').click(function() {
		if ($('#ESXi_PerfMon').is(':visible')) {
			$('#ESXi_PerfMon').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The ESXi_CVPIDS Box*/
	$('#btnESXi_CVPIDS').click(function() {
		$('#ESXi_CVPIDS').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeESXi_CVPIDS').click(function() {
		if ($('#ESXi_CVPIDS').is(':visible')) {
			$('#ESXi_CVPIDS').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The ESXi_HTSATD Box*/
	$('#btnESXi_HTSATD').click(function() {
		$('#ESXi_HTSATD').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeESXi_HTSATD').click(function() {
		if ($('#ESXi_HTSATD').is(':visible')) {
			$('#ESXi_HTSATD').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The ESXi_GLORDM Box*/
	$('#btnESXi_GLORDM').click(function() {
		$('#ESXi_GLORDM').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeESXi_GLORDM').click(function() {
		if ($('#ESXi_GLORDM').is(':visible')) {
			$('#ESXi_GLORDM').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The VDIReporting1 Box*/
	$('#btnVDIReporting1').click(function() {
		$('#VDIReporting1').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeESXi_GLORDM').click(function() {
		if ($('#VDIReporting1').is(':visible')) {
			$('#VDIReporting1').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The VMWareUSBInst Box*/
	$('#btnVMWareUSBInst').click(function() {
		$('#VMWareUSBInst').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeESXi_PerfMon').click(function() {
		if ($('#VMWareUSBInst').is(':visible')) {
			$('#VMWareUSBInst').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
});
