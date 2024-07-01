package model;

public class Grade {

    private Exam exam;
    private Student student;
    private float score;

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        if (score < 0 || score > 10) {
            throw new IllegalArgumentException("Score must be between 0 and 10");
        }
        this.score = score;
    }

}
