$(document).ready(function() {
	/*The SQLJoins Box*/
	$('#btnSQLJoins').click(function() {
		$('#SQLJoins').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeSQLJoins').click(function() {
		if ($('#SQLJoins').is(':visible')) {
			$('#SQLJoins').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The SQLSelectLimiting Box*/
	$('#btnSQLSelectLimiting').click(function() {
		$('#SQLSelectLimiting').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeSQLSelectLimiting').click(function() {
		if ($('#SQLSelectLimiting').is(':visible')) {
			$('#SQLSelectLimiting').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The SYNTAXCOMP Box*/
	$('#btnSYNTAXCOMP').click(function() {
		$('#SYNTAXCOMP').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeSYNTAXCOMP').click(function() {
		if ($('#SYNTAXCOMP').is(':visible')) {
			$('#SYNTAXCOMP').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The JsEssentials Box*/
	$('#btnJsEssentials').click(function() {
		$('#JsEssentials').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeJsEssentials').click(function() {
		if ($('#JsEssentials').is(':visible')) {
			$('#JsEssentials').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The SQL_LFT Box*/
	$('#btnSQL_LFT').click(function() {
		$('#SQL_LFT').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeSQL_LFT').click(function() {
		if ($('#SQL_LFT').is(':visible')) {
			$('#SQL_LFT').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The POWERSHELLMongoDBUPSERT Box*/
	$('#btnPOWERSHELLMongoDBUPSERT').click(function() {
		$('#POWERSHELLMongoDBUPSERT').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closePOWERSHELLMongoDBUPSERT').click(function() {
		if ($('#POWERSHELLMongoDBUPSERT').is(':visible')) {
			$('#POWERSHELLMongoDBUPSERT').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
	/*The UCSCode Box*/
	$('#btnUCSCode').click(function() {
		$('#UCSCode').animate({ opacity: 'show', height: 'show'}, 'slow');
	});
	$('#closeUCSCode').click(function() {
		if ($('#UCSCode').is(':visible')) {
			$('#UCSCode').animate({ opacity: 'hide', height: 'hide'}, 'slow');
		}
	});
});
