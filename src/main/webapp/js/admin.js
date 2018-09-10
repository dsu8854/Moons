$(document).ready(function() {
	$('#reportBtn').on('click', function() {
		location.href = "adminReport.do";
	});

	$('#withdrawBtn').on('click', function() {
		location.href = "adminWithdraw.do";
	});

	$('#boardBtn').on('click', function() {
		location.href = "adminBoard.do";
	});
});