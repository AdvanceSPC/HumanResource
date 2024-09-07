package model;

import data.DBConnection;
import java.util.List;
import model.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class EmployeeDAO {
    
    public List<Employee> getAllEmployee(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Employee> employees = new ArrayList<Employee>();
        String query = "SELECT * FROM active_employee";
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String identification = rs.getString("identification");
                String name = rs.getString("name");
                String lastName = rs.getString("lastName");
                String bod = rs.getString("bod");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String position_name = rs.getString("position_name");
                String department_name = rs.getString("department_name");
                Double salary = rs.getDouble("salary");
                
                employees.add(new Employee(id, identification, name, lastName, bod, email, phone, position_name, department_name, salary));
                
            }
            System.out.println(employees);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeResources(rs, stmt);
        }
        
        return employees;
    }
    
    public List<Employee> inactiveEmployee(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Employee> inactiveEmployees = new ArrayList<Employee>();
        String query = "SELECT * FROM inactive_employee";
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String identification = rs.getString("identification");
                String name = rs.getString("name");
                String lastName = rs.getString("lastName");
                String bod = rs.getString("bod");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String position_name = rs.getString("position_name");
                String department_name = rs.getString("department_name");
                Double salary = rs.getDouble("salary");
                
                inactiveEmployees.add(new Employee(id, identification, name, lastName, bod, email, phone, position_name, department_name, salary));
                
            }
            System.out.println(inactiveEmployees);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeResources(rs, stmt);
        }
        
        return inactiveEmployees;
    }
    
    public List<Employee> getEmployeeBirthday() {
        List<Employee> employees = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM employee_birthday";
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                Employee employee = new Employee();
                employee.setName(rs.getString("name"));
                employee.setBod(rs.getString("bod"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeResources(rs, stmt);
        }
        
        return employees;
    }
    
    public Employee searchEmployeeById(Employee employee){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM active_employee WHERE id=?";
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setInt(1,employee.getId());
            rs = stmt.executeQuery();
            
            rs.next();
            employee.setIdentification(rs.getString("identification"));
            employee.setName(rs.getString("name"));
            employee.setLastName(rs.getString("lastName"));
            employee.setBod(rs.getString("bod"));
            employee.setEmail(rs.getString("email"));
            employee.setPhone(rs.getString("phone"));
            employee.setPosition_name(rs.getString("position_name"));
            employee.setDepartment_name(rs.getString("department_name"));
            employee.setSalary(rs.getDouble("salary"));
            
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeResources(rs, stmt);
        }
        
        return employee;
    }
    
    public int addEmployee(Employee employee) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "INSERT INTO employee (identification, name, lastName, bod, email, phone, positionEmployee_id, department_id, salary) "
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        int rows = 0;
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1,employee.getIdentification());
            stmt.setString(2,employee.getName());
            stmt.setString(3,employee.getLastName());
            stmt.setString(4,employee.getBod());
            stmt.setString(5,employee.getEmail());
            stmt.setString(6,employee.getPhone());
            stmt.setInt(7,employee.getPositionEmployee_id());
            stmt.setInt(8, employee.getDepartment_id());
            stmt.setDouble(9,employee.getSalary());
            
            rows = stmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeStmt(stmt);
        }
        
        return rows;
    }
    
    public int updateEmployee(Employee employee) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "UPDATE employee SET "
                + "identification=?, name=?, lastName=?, bod=?, email=?, phone=?, positionEmployee_id=?, department_id=?, salary=? "
                + "WHERE id=?";
        int rows = 0;
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1,employee.getIdentification());
            stmt.setString(2,employee.getName());
            stmt.setString(3,employee.getLastName());
            stmt.setString(4,employee.getBod());
            stmt.setString(5,employee.getEmail());
            stmt.setString(6,employee.getPhone());
            stmt.setInt(7,employee.getPositionEmployee_id());
            stmt.setInt(8, employee.getDepartment_id());
            stmt.setDouble(9,employee.getSalary());
            stmt.setInt(10,employee.getId());
            
            rows = stmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeStmt(stmt);
        }
        
        return rows;
    }
    
    public int deleteEmployee(Employee employee) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "UPDATE employee SET status=2 WHERE id=?";
        int rows = 0;
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setInt(1,employee.getId());
                        
            rows = stmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeStmt(stmt);
        }
        
        return rows;
    }
}
