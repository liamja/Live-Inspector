$(document).ready(function(){

	console.log('main.js loaded');

	$('input[name="file"]').click(function(e) {
		e.preventDefault();
		mixpanel.track('Project File Uploaded');
	});

});
