import data.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import model.Employee;
import model.EmployeeDAO;
import java.util.List;

public class EmployeeCRUDTest {
    private static EmployeeDAO employeeDAO = new EmployeeDAO();

    public static void main(String[] args) {
        // Test Create
        //testCreateEmployee();
        
        //test Position Employee Id
        //testPositionEmployee();

        // Test Read
        //testReadAllEmployees();
        //testReadEmployeeById();
        //testReadInactiveEmployees();

        // Test Update
        //testUpdateEmployee();

        // Test Delete
        //testDeleteEmployee();
        
        //Nueva consulta
        //testReadAllEmployees();
        testBirthdayEmployees();
    }
    
    private static void testPositionEmployee() {
        System.out.println("Checking positionemployee table:");
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM positionemployee")) {
            
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id") + ", Name: " + rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println();
    }

    private static void testCreateEmployee() {
        System.out.println("Testing Create Employee:");
        Employee newEmployee = new Employee("123456798", "Jane", "Doe", "1990-01-01", "jane.doe@example.com", "1234567890", 1, 1, 50000.0);
        int result = employeeDAO.addEmployee(newEmployee);
        System.out.println("Create result: " + (result > 0 ? "Success" : "Failure"));
        System.out.println();
    }

    private static void testReadAllEmployees() {
        System.out.println("Testing Read All Employees:");
        List<Employee> employees = employeeDAO.getAllEmployee();
        System.out.println();
    }
    private static void testBirthdayEmployees() {
    System.out.println("Testing Read BirthDay Employees:");
    List<Employee> employees = employeeDAO.getEmployeeBirthday();
    
    if (employees.isEmpty()) {
        System.out.println("No hay empleados que cumplan años.");
    } else {
        for (Employee employee : employees) {
            System.out.println("Empleado: " + employee.getName() + ", Cumpleaños: " + employee.getBod());
        }
    }
}
    
    private static void testReadInactiveEmployees() {
        System.out.println("Testing Read Inactive Employees:");
        List<Employee> employees = employeeDAO.inactiveEmployee();
        System.out.println();
    }

    private static void testReadEmployeeById() {
        System.out.println("Testing Read Employee by ID:");
        // Asume que el ID 1 existe, ajusta según sea necesario
        Employee employee = new Employee(3);
        employee = employeeDAO.searchEmployeeById(employee);
        System.out.println("Employee found: " + employee);
        System.out.println();
    }

    private static void testUpdateEmployee() {
        System.out.println("Testing Update Employee:");
        // Primero, obtenemos un empleado existente
        List<Employee> employees = employeeDAO.getAllEmployee();
        if (!employees.isEmpty()) {
            Employee employeeToUpdate = employees.get(0);
            // Asegúrese de establecer todos los campos requeridos
            employeeToUpdate.setName("Jane");
            employeeToUpdate.setLastName("Smith");
            employeeToUpdate.setIdentification(employeeToUpdate.getIdentification()); // Mantenemos la identificación existente
            employeeToUpdate.setBod(employeeToUpdate.getBod()); // Mantenemos la fecha de nacimiento existente
            employeeToUpdate.setEmail("jane.smith@example.com");
            employeeToUpdate.setPhone(employeeToUpdate.getPhone()); // Mantenemos el teléfono existente
            employeeToUpdate.setPositionEmployee_id(employeeToUpdate.getPositionEmployee_id()); // Mantenemos la posición existente
            employeeToUpdate.setDepartment_id(employeeToUpdate.getDepartment_id()); // Mantenemos el departamento existente
            employeeToUpdate.setSalary(55000.0);

            int result = employeeDAO.updateEmployee(employeeToUpdate);
            System.out.println("Update result: " + (result > 0 ? "Success" : "Failure"));
        } else {
            System.out.println("No employees found to update.");
        }
        System.out.println();
    }

    private static void testDeleteEmployee() {
        System.out.println("Testing Delete Employee:");
        // Asume que el ID 2 existe, ajusta según sea necesario
        Employee employeeToDelete = new Employee(15);
        int result = employeeDAO.deleteEmployee(employeeToDelete);
        System.out.println("Delete result: " + (result > 0 ? "Success" : "Failure"));
        System.out.println();
    }
}