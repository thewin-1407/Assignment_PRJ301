package model;

import java.util.ArrayList;
import java.util.List;

public class Student {

    private int id;
    private String name;
    private List<Course> courses = new ArrayList<>();
    private List<Grade> grades = new ArrayList<>();
    private Student_Account user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public List<Grade> getGrades() {
        return grades;
    }

    public void setGrades(List<Grade> grades) {
        this.grades = grades;
    }

    public Student_Account getUser() {
        return user;
    }

    public void setUser(Student_Account user) {
        this.user = user;
    }
}
