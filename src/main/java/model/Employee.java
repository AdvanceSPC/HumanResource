package model;

public class Employee {
    private int id;
    private String identification;
    private String name;
    private String lastName;
    private String bod;
    private String email;
    private String phone;
    private String position_name;
    private String department_name;
    private double salary;
    private int positionEmployee_id;
    private int department_id;

    public Employee(int id) {
        this.id = id;
    }
    
    public Employee(){
        
    }

    public Employee(int id, String identification, String name, String lastName, String bod, String email, String phone, String position_name, String department_name, double salary) {
        this.id = id;
        this.identification = identification;
        this.name = name;
        this.lastName = lastName;
        this.bod = bod;
        this.email = email;
        this.phone = phone;
        this.position_name = position_name;
        this.department_name = department_name;
        this.salary = salary;
    }

    public Employee(String identification, String name, String lastName, String bod, String email, String phone, String position_name, String department_name, double salary) {
        this.identification = identification;
        this.name = name;
        this.lastName = lastName;
        this.bod = bod;
        this.email = email;
        this.phone = phone;
        this.position_name = position_name;
        this.department_name = department_name;
        this.salary = salary;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBod() {
        return bod;
    }

    public void setBod(String bod) {
        this.bod = bod;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPosition_name() {
        return position_name;
    }

    public void setPosition_name(String position_name) {
        this.position_name = position_name;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public int getPositionEmployee_id() {
        return positionEmployee_id;
    }

    public void setPositionEmployee_id(int positionEmployee_id) {
        this.positionEmployee_id = positionEmployee_id;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    
    @Override
    public String toString() {
        return "Employee{" + "id=" + id + ", identification=" + identification + ", name=" + name + ", lastName=" + lastName + ", bod=" + bod + ", email=" + email + ", phone=" + phone + ", position_name=" + position_name + ", department__name=" + department_name + ", salary=" + salary + '}';
    }
    
    
}
