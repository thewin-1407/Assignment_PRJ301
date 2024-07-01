package model;

import java.util.ArrayList;

public class Student {

    private int id;
    private String name;
    private ArrayList<Course> courses = new ArrayList<>();
    private ArrayList<Grade> gardes = new ArrayList<>();
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

    public ArrayList<Course> getCourses() {
        return courses;
    }

    public void setCourses(ArrayList<Course> courses) {
        this.courses = courses;
    }

    public ArrayList<Grade> getGardes() {
        return gardes;
    }

    public void setGardes(ArrayList<Grade> gardes) {
        this.gardes = gardes;
    }

    public Student_Account getUser() {
        return user;
    }

    public void setUser(Student_Account user) {
        this.user = user;
    }

}
