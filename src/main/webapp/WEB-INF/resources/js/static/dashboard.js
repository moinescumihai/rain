function getTasksProgressValues() {
    var regexp = new RegExp('\\D+');
    var progressValue;
    var progressClass;
    $.each($('.progress-bar'), function () {
        progressValue = parseInt($(this).attr('style').replace(regexp, ''));

        if (progressValue < 30) {
            progressClass = 'progress-bar-default';
        } else if (progressValue < 60) {
            progressClass = 'progress-bar-warning';
        } else if (progressValue < 80) {
            progressClass = 'progress-bar-info';
        } else if (progressValue > 80) {
            progressClass = 'progress-bar-success';
        }

        $(this).addClass(progressClass);
    });
}

$(document).ready(function () {
    getTasksProgressValues();
});
