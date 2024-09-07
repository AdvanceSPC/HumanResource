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
import model.Department;
import model.DepartmentDAO;
import model.Position;
import model.PositionDAO;

@WebServlet(name = "DepartmentController", urlPatterns = {"/DepartmentController"})
public class DepartmentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "edit":
                    this.editDepartment(request, response);
                    break;
                case "delete":
                    this.deleteDepartment(request, response);
                    break;
                default:
                    this.actionDefault(request, response);
                    break;
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
            switch (action) {
                case "insert":
                    this.insertDepartment(request, response);
                    break;
                case "update":
                    this.updateDepartment(request, response);
                    break;
                case "delete":
                    this.deleteDepartment(request, response);
                    break;
                default:
                    this.actionDefault(request, response);
                    break;
            }
        } else {
            this.actionDefault(request, response);
        }
    }

    protected void actionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Department> departments = new DepartmentDAO().getAllDepartment();
        List<Position> positions = new PositionDAO().getAllPosition();
        System.out.println("Department= " + departments);
        HttpSession session = request.getSession();
        session.setAttribute("departments", departments);
        session.setAttribute("positions", positions);
        response.sendRedirect("views/department.jsp");
    }
    
    protected void editDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Department department = new DepartmentDAO().getDepartmentById(new Department(id));
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("department", department);
        System.out.println("Usuario a Editar: " + department);
        String edit = "views/editDepartment.jsp";
        request.getRequestDispatcher(edit).forward(request, response);
    }
    
    protected void updateDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Department newDepartment;
        newDepartment = new Department(id, name, description);
        System.out.println("Name: " + name + " Description: " + description);
        int updateRegister = new DepartmentDAO().updateDepartment(newDepartment);
        this.actionDefault(request, response);
    }
    
    protected void insertDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Department department = new Department(name, description);
        int updateDepartment = new DepartmentDAO().addDepartment(department);
        this.actionDefault(request, response);
    }
    
    protected void deleteDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Department department = new Department(id);
        int updateRegister = new DepartmentDAO().deleteDepartment(department);
        this.actionDefault(request, response);
    }

}
