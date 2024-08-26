package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Employee;
import model.EmployeeDAO;

@WebServlet(name = "EmployeeController", urlPatterns = {"/EmployeeController"})
public class EmployeeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action != null) {
            switch (action){
                case "update":
                    this.updateEmployee(request, response); break;
                case "delete":
                    this.deleteEmployee(request, response); break;
                default:
                    this.actionDefault(request, response);
            }
        } else {
            this.actionDefault(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action != null) {
            switch (action){
                case "insert":
                    this.insertEmployee(request, response); break;
                case "update":
                    this.updateEmployee(request, response); break;
                case "delete":
                    this.deleteEmployee(request, response); break;
                default:
                    this.actionDefault(request, response);
            }
        } else {
            this.actionDefault(request, response);
        }
    }
    
    protected void actionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Employee> employees = new EmployeeDAO().getAllEmployee();
        System.out.println("Employee= "+employees);
        HttpSession session = request.getSession();
        session.setAttribute("employees", employees);
        response.sendRedirect("views/employee.jsp");
    }
    
    protected void editEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = new EmployeeDAO().searchEmployeeById(new Employee(id));
        request.setAttribute("employee", employee);
        String update ="views/employee.jsp";
        request.getRequestDispatcher(update).forward(request, response);
    }
    
    protected void updateEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastName");
        String bod = request.getParameter("bod");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int positionEmployee_id = Integer.parseInt(request.getParameter("positionEmployee_id"));
        int department_id = Integer.parseInt(request.getParameter("department_id"));
        String identification = request.getParameter("identification");
        double salary = 0;
        
        String Esalary = request.getParameter("salary");
        if(Esalary!=null && !"".equals(Esalary))
            salary = Double.parseDouble(Esalary);
        //Employee employee = new Employee(id, identification, name, lastName, bod, email, phone, positionEmployee_id, department_id, salary);
        //int updateRegister = new EmployeeDAO().updateEmployee(employee);
        this.actionDefault(request, response);
    }
    
    protected void insertEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastName");
        String bod = request.getParameter("bod");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int positionEmployee_id = Integer.parseInt(request.getParameter("positionEmployee_id"));
        int department_id = Integer.parseInt(request.getParameter("department_id"));
        String identification = request.getParameter("identification");
        double salary = 0;
        
        String Esalary = request.getParameter("salary");
        if(Esalary!=null && !"".equals(Esalary))
            salary = Double.parseDouble(Esalary);
        //Employee employee = new Employee(identification, name, lastName, bod, email, phone, positionEmployee_id, department_id, salary);
        //int updateRegister = new EmployeeDAO().addEmployee(employee);
        this.actionDefault(request, response);
    }
    
    protected void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = new Employee(id);
        int updateRegister = new EmployeeDAO().deleteEmployee(employee);
        this.actionDefault(request, response);
    }

}
