package model;

import java.util.ArrayList;

public class Lecturer {

    private int id;
    private String name;
    private ArrayList<Course> courses = new ArrayList<>();
    private Lecturer_Account user;

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

    public Lecturer_Account getUser() {
        return user;
    }

    public void setUser(Lecturer_Account user) {
        this.user = user;
    }

}
