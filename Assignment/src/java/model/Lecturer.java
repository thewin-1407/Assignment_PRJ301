package model;

import java.util.List;
import java.util.ArrayList;

public class Lecturer {

    private int id;
    private String name;
    private List<Course> courses = new ArrayList<>();
    private Lecturer_Account lecturerAccount;

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

    public Lecturer_Account getLecturerAccount() {
        return lecturerAccount;
    }

    public void setLecturerAccount(Lecturer_Account lecturerAccount) {
        this.lecturerAccount = lecturerAccount;
    }
}
