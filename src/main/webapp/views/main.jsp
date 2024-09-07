<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String email = (String) session.getAttribute("email");
    if (email != null) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms", "root", "root");

            String sql = "SELECT username FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("username");
                session.setAttribute("name", name);
            } else {
                out.println("Usuario no encontrado");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    } else {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
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
        <link rel="stylesheet" href="../public/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="../public/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../public/dist/css/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="../public/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="../public/plugins/daterangepicker/daterangepicker.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">

    </head>

    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="../public/dist/img/logo_HRMS.png" alt="Logo HRMS" height="60" width="60">
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
                    <img src="../public/dist/img/logo_HRMS.png" alt="Logo HRMS" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">HRMS</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="../public/dist/img/userico.png" class="img-circle elevation-2" alt="User Image">
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
                                <a href="${pageContext.request.contextPath}/PayrollController" class="nav-link active">
                                    <i class="nav-icon fas fa-solid fa-clipboard-list"></i>
                                    <p>
                                        Nómina
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
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">Dashboard</h1>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="main.jsp">Inicio</a></li>
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="col-md-6">
                        <!-- USERS LIST -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Cumpleañeros del Mes</h3>
                                <div class="card-tools">
                                    <span class="badge badge-danger">${TotalbirthdayEmployees} Colaboradores</span>
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <ul class="users-list clearfix">
                                    <li>
                                        <img src="../public/dist/img/user1-128x128.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">Alexander Pierce</a>
                                        <span class="users-list-date">Today</span>
                                    </li>
                                    <li>
                                        <img src="../public/dist/img/user8-128x128.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">Norman</a>
                                        <span class="users-list-date">Yesterday</span>
                                    </li>
                                    <li>
                                        <img src="../public/dist/img/user7-128x128.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">Jane</a>
                                        <span class="users-list-date">12 Jan</span>
                                    </li>
                                    <li>
                                        <img src="../public/dist/img/user6-128x128.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">John</a>
                                        <span class="users-list-date">12 Jan</span>
                                    </li>
                                    <li>
                                        <img src="../public/dist/img/user2-160x160.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">Alexander</a>
                                        <span class="users-list-date">13 Jan</span>
                                    </li>
                                    <li>
                                        <img src="../public/dist/img/user5-128x128.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">Sarah</a>
                                        <span class="users-list-date">14 Jan</span>
                                    </li>
                                    <li>
                                        <img src="../public/dist/img/user4-128x128.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">Nora</a>
                                        <span class="users-list-date">15 Jan</span>
                                    </li>
                                    <li>
                                        <img src="../public/dist/img/user3-128x128.jpg" alt="User Image">
                                        <a class="users-list-name" href="#">Nadia</a>
                                        <span class="users-list-date">15 Jan</span>
                                    </li>
                                </ul>
                                <!-- /.users-list -->
                            </div>
                        </div>
                        <!--/.card -->
                    </div>
                </section>
                <!-- /.content -->

            </div>
            <jsp:include page="../include/footer.html" />
        </div>
    </body>
</html>
