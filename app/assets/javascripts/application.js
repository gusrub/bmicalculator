// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require_tree .

function hideIntro() {
	$("#intro").slideUp({
		done: showCalculator
	});
}

function showIntro() {
	$("#intro").slideDown();
}

function showCalculator() {
	$("#calculator").slideDown();
}

function hideCalculator() {
	$("#calculator").slideUp({
		done: showIntro
	});
}

function doCalculation() {
	switchCalculateState("disabled");
	$.ajax("/measurements", {
		data: $("#frm-calculation").serialize(),
		dataType: 'json',
		method: 'POST',
		error: handleError,
		success: handleSuccess
	});
}

function switchCalculateState(state) {
	if (state == "enabled") {
		$("#btn-calculate").removeClass("disabled");
		$("#btn-calculate").text("calculate");
	} else {
		$("#btn-calculate").addClass("disabled");
		$("#btn-calculate").text("calculating...");
	}
}

function handleError(req, status, error) {
	console.log(req);
	displayErrors(req.responseJSON);
	switchCalculateState("enabled");
}

function displayErrors(errors) {
	$("#calculation-error-msg").text(errors.join(', '));
	$("#calculation-errors").show();
}

function handleSuccess(data, status, req) {
	console.log(data);
	switchCalculateState("enabled");
	showResults(data);
}

function showResults(measurement) {
	$("#calculator").slideUp({
		done: function(){
			$("#cat_"+measurement.bmi_range.category).addClass("active highlighted-result");
			$('#results').slideDown();
		}
	});
}

function hideResults() {
	$(".highlighted-result").removeClass("highlighted-result active");
	$("#results").slideUp({
		done: showCalculator
	});
}

$(document).ready(function(){
	$("#btn-intro").click(hideIntro);
	$("#btn-return-intro").click(hideCalculator);
	$("#btn-calculate").click(doCalculation);
	$("#btn-return-result").click(hideResults);
});

