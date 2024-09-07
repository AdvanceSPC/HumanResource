<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HRMS | Dashboard</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/dist/css/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/plugins/daterangepicker/daterangepicker.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">

    </head>

    <style>
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 900px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-pic-container {
            text-align: center;
            position: relative;
        }

        #profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }

        .format {
            font-size: 12px;
            color: #888;
        }

        .input-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            box-sizing: border-box;

        }

        .form-actions {
            display: flex;
            justify-content: space-between;
        }
    </style>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="${pageContext.request.contextPath}/public/dist/img/logo_HRMS.png" alt="Logo HRMS" height="60" width="60">
            </div>
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="main.jsp" class="nav-link">Inicio</a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="main.jsp" class="brand-link">
                    <img src="${pageContext.request.contextPath}/public/dist/img/logo_HRMS.png" alt="Logo HRMS" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">HRMS</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="${pageContext.request.contextPath}/public/dist/img/userico.png" class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="#" class="d-block">${sessionScope.name != null ? sessionScope.name : 'Invitado'}</a>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item menu-open">
                                <a href="main.jsp" class="nav-link active">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>
                                        Dashboard
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item menu-open">
                                <a href="${pageContext.request.contextPath}/DepartmentController" class="nav-link active">
                                    <i class="nav-icon fas fa-solid fa-building"></i>
                                    <p>
                                        Departamentos
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item menu-open">
                                <a href="${pageContext.request.contextPath}/EmployeeController" class="nav-link active">
                                    <i class="nav-icon fas fa-solid fa-user"></i>
                                    <p>
                                        Empleados
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item menu-open">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-solid fa-clipboard-list"></i>
                                    <p>
                                        Permisos
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item menu-open">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-solid fa-briefcase"></i>
                                    <p>
                                        Vacantes
                                    </p>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>
            <!-- Content Wrapper -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">Departamentos</h1>
                                <section id="actions" class="py-4 ab-4 bg-light">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <a href="#" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addEmployeeModal">
                                                    <i class="fas fa-plus"></i> Agregar Departamento
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="main.jsp">Inicio</a></li>
                                    <li class="breadcrumb-item active">Departamentos</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.content-header -->

                <!-- Main Content -->
                <section class="content">
                    <div class="col-md-15">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#listEmployee"
                                                            data-toggle="tab">Lista de Departamentos</a></li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="active tab-pane" id="listEmployee">
                                        <div class="card-body">
                                            <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-6"></div>
                                                    <div class="col-sm-12 col-md-6"></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table id="employeeTable" class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info">
                                                            <thead>
                                                                <tr>
                                                                    <th class="sorting sorting_asc" tabindex="0"
                                                                        aria-controls="example2" aria-sort="ascending"
                                                                        aria-label="Rendering engine: activate to sort column descending">
                                                                        Id</th>
                                                                    <th class="sorting sorting_asc" tabindex="0"
                                                                        aria-controls="example2" aria-sort="ascending"
                                                                        aria-label="Rendering engine: activate to sort column descending">
                                                                        Nombre</th>
                                                                    <th class="sorting" tabindex="0"
                                                                        aria-controls="example2" rowspan="1" colspan="1"
                                                                        aria-label="Nombre: activate to sort column ascending">
                                                                        Descripción</th>
                                                                    <th class="sorting" tabindex="0"
                                                                        aria-controls="example2" rowspan="1" colspan="1"
                                                                        aria-label="Nombre: activate to sort column ascending">
                                                                        Acción</th>
                                                                    </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="department" items="${departments}">
                                                                    <tr>
                                                                        <td>${department.id}</td>
                                                                        <td>${department.name}</td>
                                                                        <td>${department.description}</td>
                                                                        <td>
                                                                            <a href="${pageContext.request.contextPath}/DepartmentController?action=edit&id=${department.id}" class="btn btn-primary">Editar</a>
                                                                            <a href="${pageContext.request.contextPath}/DepartmentController?action=delete&id=${department.id}" class="btn btn-danger" onclick="return confirm('¿Está seguro que desea eliminar este departamento?');">Eliminar</a>
                                                                            <a href="#" data-toggle="modal" data-target="#addPositionModal" class="btn btn-info">Añadir Puesto</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <jsp:include page="addDepartment.jsp" />
            <jsp:include page="addPosition.jsp" />
            <footer class="main-footer">
                <strong>Copyright &copy; 2024 <a href="#">RBN Solutions</a>.</strong>
                All rights reserved.
                <div class="float-right d-none d-sm-inline-block">
                    <b>Version</b> 1.0.0
                </div>
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/public/plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="${pageContext.request.contextPath}/public/plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
                                                                                $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/public/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Sparkline -->
        <script src="${pageContext.request.contextPath}/public/plugins/sparklines/sparkline.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="${pageContext.request.contextPath}/public/plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="${pageContext.request.contextPath}/public/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/public/dist/js/adminlte.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <!-- DataTables Initialization -->
        <script>
                                                                                $(document).ready(function () {
                                                                                    $('#employeeTable').DataTable({
                                                                                        "language": {
                                                                                            "search": "Buscar:",
                                                                                            "lengthMenu": "Mostrar _MENU_ registros por página",
                                                                                            "zeroRecords": "No se encontraron resultados",
                                                                                            "info": "Mostrando página _PAGE_ de _PAGES_",
                                                                                            "infoEmpty": "No hay registros disponibles",
                                                                                            "infoFiltered": "(filtrado de _MAX_ registros totales)",
                                                                                            "paginate": {
                                                                                                "first": "Primero",
                                                                                                "last": "Último",
                                                                                                "next": "Siguiente",
                                                                                                "previous": "Anterior"
                                                                                            }
                                                                                        }
                                                                                    });
                                                                                });
                                                                                $(document).ready(function () {
                                                                                    $('#inactiveEmployeeTable').DataTable({
                                                                                        "language": {
                                                                                            "search": "Buscar:",
                                                                                            "lengthMenu": "Mostrar _MENU_ registros por página",
                                                                                            "zeroRecords": "No se encontraron resultados",
                                                                                            "info": "Mostrando página _PAGE_ de _PAGES_",
                                                                                            "infoEmpty": "No hay registros disponibles",
                                                                                            "infoFiltered": "(filtrado de _MAX_ registros totales)",
                                                                                            "paginate": {
                                                                                                "first": "Primero",
                                                                                                "last": "Último",
                                                                                                "next": "Siguiente",
                                                                                                "previous": "Anterior"
                                                                                            }
                                                                                        }
                                                                                    });
                                                                                });
        </script>
    </div>
</body>
</html>