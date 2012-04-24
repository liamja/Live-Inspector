$(document).ready(function(){

	$('input[name="file"]').click(function(e) {
		e.preventDefault();
		mixpanel.track('Project File Uploaded');
	});

});
