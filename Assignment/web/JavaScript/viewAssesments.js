function goToAssessment(subjectId, event) {
    var target = event.target || event.srcElement;
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("/students/subject") !== -1) {
        window.location.href = '/Assignment/students/assessment?subid=' + subjectId;
    } else if (currentUrl.indexOf("/lecturers/subject") !== -1) {
        window.location.href = '/Assignment/lecturers/assessment?subid=' + subjectId;
    }
}

function navigateHomeofSubject() {
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("/students/subject") !== -1) {
        window.location.href = 'http://localhost:1407/Assignment/HomeStudent';
    } else if (currentUrl.indexOf("/lecturers/subject") !== -1) {
        window.location.href = 'http://localhost:1407/Assignment/HomeLecturer';
    }
}

function navigateBackToSubjectList() {
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("subject/assesment") !== -1) {
        window.location.href = 'http://localhost:1407/Assignment/students/subject';
    } else if (currentUrl.indexOf("/subject/assessment") !== -1) {
        window.location.href = 'http://localhost:1407/Assignment/lecturers/subject';
    }
}

function navigateHomeofAssessments() {
    var currentUrl = window.location.href;

    if (currentUrl.indexOf("subject/assesment") !== -1) {
        window.location.href = 'http://localhost:1407/Assignment/HomeStudent';
    } else if (currentUrl.indexOf("/subject/assessment") !== -1) {
        window.location.href = 'http://localhost:1407/Assignment/HomeLecturer';
    }
}
