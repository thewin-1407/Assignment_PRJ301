package model;

import java.util.ArrayList;
import java.util.List;

public class Semester {

    private int semId;
    private int year;
    private String season;
    private boolean active;
    private List<Course> courses = new ArrayList<>();

    public int getSemId() {
        return semId;
    }

    public void setSemId(int semId) {
        this.semId = semId;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }
}
