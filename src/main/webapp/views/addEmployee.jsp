<!-- Add Employee -->

<div class="modal fade" id="addEmployeeModal">
    <div class="modal-dialog model-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar Cliente</h5>
                <button class="clse" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/EmployeeController?action=insert" 
                  method="POST" >
                <section id="details">
                    <div class="container">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="identification">Identificación</label>
                                <input type="text" name="identification" id="identification" value="${employee.identification}"/>
                                <label for="name">Nombre</label>
                                <input type="text" name="name" id="name"value="${employee.name}"/>
                                <label for="lastName">Apellido</label>
                                <input type="text" name="lastName" id="lastName" value="${employee.lastName}"/>
                                <label for="bod">Fecha de Nacimiento</label>
                                <input type="date" name="bod" id="bod" value="${employee.bod}"/>
                                <label for="email">Correo</label>
                                <input type="email" name="email" id="email" value="${employee.email}"/>
                                <label for="phone">Teléfono</label>
                                <input type="tel" name="phone" id="phone" value="${employee.phone}"/>
                                <label for="department">Departamento</label>
                                <select class="form-control" name="department_id">
                                    <option value="1" ${employee.department_id == 1 ? 'selected' : ''}>Sistemas</option>
                                    <option value="2" ${employee.department_id == 2 ? 'selected' : ''}>Contabilidad</option>
                                    <option value="3" ${employee.department_id == 3 ? 'selected' : ''}>Recursos Humanos</option>
                                </select>
                                <label for="positionEmployee">Cargo</label>
                                <select class="form-control" name="positionEmployee_id">
                                    <option value="1" ${employee.positionEmployee_id == 1 ? 'selected' : ''}>Product Manager</option>
                                    <option value="2" ${employee.positionEmployee_id == 2 ? 'selected' : ''}>Product Analyst</option>
                                    <option value="3" ${employee.positionEmployee_id == 3 ? 'selected' : ''}>Managing Director</option>
                                    <option value="4" ${employee.positionEmployee_id == 4 ? 'selected' : ''}>Product Leader</option>
                                </select>
                                <label>Salario</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">$</span>
                                    </div>
                                    <input type="text" class="form-control" value="${employee.salary}" name="salary">
                                    <div class="input-group-append">
                                        <span class="input-group-text">.00</span>
                                    </div>
                                </div>
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