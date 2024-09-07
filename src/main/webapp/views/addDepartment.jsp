<!-- Add Department -->

<div class="modal fade" id="addEmployeeModal">
    <div class="modal-dialog model-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar Departamento</h5>
                <button class="clse" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/DepartmentController?action=insert" 
                  method="POST" >
                <section id="details">
                    <div class="container">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="name">Nombre</label>
                                <input type="text" name="name" id="name" value="${department.name}"/>
                                <label for="description">Descripción</label>
                                <input type="text" name="description" id="description" value="${department.description}"/>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary" >Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </form>
        </div>
    </div>
</div>