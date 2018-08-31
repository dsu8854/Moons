$(document).ready(function() {
	$('#reportBtn').on('click', function() {
		location.href = "adminReport.do";
	});

	$('#withdrawBtn').on('click', function() {
		location.href = "adminWithdraw.do";
	});

	$('#manageBtn').on('click', function() {
		location.href = "adminManage.do";
	});
});