function goToAssessment(subjectId, event) {
    var target = event.target || event.srcElement;
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("/students/subject") !== -1) {
        window.location.href = 'assessment?subid=' + subjectId;
    } else if (currentUrl.indexOf("/lecturers/subject") !== -1) {
        window.location.href = 'assessment?subid=' + subjectId;
    }
}

function navigateHomeofSubject() {
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("/students/subject") !== -1) {
        window.location.href = '../HomeStudent';
    } else if (currentUrl.indexOf("/lecturers/subject") !== -1) {
        window.location.href = '../HomeLecturer';
    }
}

function navigateBackToSubjectList() {
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("/students/assessment") !== -1) {
        window.location.href = '../students/subject';
    } else if (currentUrl.indexOf("/lecturers/assessment") !== -1) {
        window.location.href = '../lecturers/subject';
    }
}

function navigateHomeofAssessments() {
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("/students/assessment") !== -1) {
        window.location.href = '../HomeStudent';
    } else if (currentUrl.indexOf("/lecturers/assessment") !== -1) {
        window.location.href = '../HomeLecturer';
    }
}
