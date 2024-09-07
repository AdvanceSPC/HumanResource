package model;

import java.io.Serializable;

public class Position implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
    private String description;
    private double salary_base;
    private int department_id;

    public Position() {
    }

    public Position(int id, String name, String description, double salary_base, int department_id) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.salary_base = salary_base;
        this.department_id = department_id;
    }

    public Position(String name, String description, double salary_base, int department_id) {
        this.name = name;
        this.description = description;
        this.salary_base = salary_base;
        this.department_id = department_id;
    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getSalary_base() {
        return salary_base;
    }

    public void setSalary_base(double salary_base) {
        this.salary_base = salary_base;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }
    
    
    
    @Override
    public String toString() {
        return "Position{" + "id=" + id + 
                ", name=" + name + 
                ", description=" + description + 
                ", salary_base=" + salary_base + 
                ", department_id=" + department_id + '}';
    }
    
    
}
