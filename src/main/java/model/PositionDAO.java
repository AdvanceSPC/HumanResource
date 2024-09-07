package model;

import data.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PositionDAO {
    public List<Position> getAllPosition() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Position> position = new ArrayList<Position>();
        String query = "SELECT * FROM positionemployee";

        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double salary_base = rs.getDouble("salary_base");
                int department_id = rs.getInt("department_id");

                position.add(new Position(id, name, description, salary_base, department_id));
            }
            System.out.println(position);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeResources(rs, stmt);
        }
        return position;
    }
    
    public int addPosition(Position position) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "INSERT INTO positionemployee (name, description, salary_base, department_id) "
                + "VALUES (?,?,?,?)";
        int rows = 0;
        
        try {
            conn = DBConnection.getConnection();
            stmt = conn.prepareStatement(query);
            stmt.setString(1,position.getName());
            stmt.setString(2,position.getDescription());
            stmt.setDouble(3,position.getSalary_base());
            stmt.setInt(4,position.getDepartment_id());
            
            rows = stmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            DBConnection.closeStmt(stmt);
        }
        
        return rows;
    }
}
