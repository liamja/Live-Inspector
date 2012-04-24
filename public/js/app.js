$(document).ready(function(){

	$('input[type="file"]').click(function(e) {
		mixpanel.track('File Selected');
	});

	$('button[type="submit"]').click(function(e) {
		mixpanel.track('File Uploaded');
	});

});
