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

public class DepartmentDAO {

    public List<Department> getAllDepartment() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Department> department = new ArrayList<Department>();
        String query = "SELECT * FROM department WHERE status=1";

        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");

                department.add(new Department(id, name, description));
            }
            System.out.println(department);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeResources(rs, stmt);
        }
        return department;
    }

    public Department getDepartmentById(Department department) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM department WHERE id=?";

        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, department.getId());
            rs = stmt.executeQuery();

            rs.next();
            department.setName(rs.getString("name"));
            department.setDescription(rs.getString("description"));

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeResources(rs, stmt);
        }

        return department;
    }

    public int addDepartment(Department department) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "INSERT INTO department (name, description) "
                + "VALUES (?,?)";

        int rows = 0;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, department.getName());
            stmt.setString(2, department.getDescription());
            System.out.println("Nombre: " + department.getName());
            System.out.println("Descripción: " + department.getDescription());
            rows = stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeStmt(stmt);
        }

        return rows;
    }

    public int updateDepartment(Department department) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "UPDATE department SET "
                + "name=?, description=? "
                + "WHERE id=?";
        int rows = 0;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, department.getName());
            stmt.setString(2, department.getDescription());
            stmt.setInt(3, department.getId());
            rows = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeStmt(stmt);
        }

        return rows;
    }

    public int deleteDepartment(Department department) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "UPDATE department SET status=2 WHERE id=?";
        int rows = 0;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, department.getId());

            rows = stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeStmt(stmt);
        }

        return rows;
    }
}
