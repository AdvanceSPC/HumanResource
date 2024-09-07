<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Empleado - Nómina</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Buscar Empleado para Proceso de Nómina</h2>
        
        <form action="${pageContext.request.contextPath}/PayrollController?action=searchEmployee" method="GET">
            <div class="form-group">
                <label for="searchTerm">Buscar por Cédula, Nombre o Apellido</label>
                <input type="text" class="form-control" name="searchTerm" placeholder="Ingrese cédula, nombre o apellido" required>
            </div>
            <button type="submit" class="btn btn-primary">Buscar</button>
        </form>

        <c:if test="${not empty employeeList}">
            <h3>Resultados de la Búsqueda</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cédula</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Sueldo Base</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="employee" items="${employeeList}">
                        <tr>
                            <td>${employee.id}</td>
                            <td>${employee.cedula}</td>
                            <td>${employee.firstName}</td>
                            <td>${employee.lastName}</td>
                            <td>${employee.baseSalary}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/PayrollController?action=selectEmployee" method="POST">
                                    <input type="hidden" name="employeeId" value="${employee.id}">
                                    <button type="submit" class="btn btn-info">Seleccionar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
