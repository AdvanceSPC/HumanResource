/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author Rubén
 */
@WebServlet(name = "PositionController", urlPatterns = {"/PositionController"})
public class PositionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action!= null) {
                switch (action) {
                    case "insert":
                        this.insertPosition(request, response);
                        break;
                    default:
                        this.actionDefault(request, response);
                }
            } else {
            this.actionDefault(request, response);
        }
    }
    
    protected void actionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.sendRedirect("views/department.jsp");
    }
    
    protected void insertPosition(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double salary_base = Double.parseDouble(request.getParameter("salary_base"));
        int department_id = Integer.parseInt(request.getParameter("department_id"));
        Position position = new Position(name, description, salary_base, department_id);
        int updatePosition = new PositionDAO().addPosition(position);
        this.actionDefault(request, response);
    }

}
