<div class="modal fade" id="editEmployeeModal">
    <div class="modal-dialog model-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Editar Cliente</h5>
                <button class="clse" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/EmployeeController?action=updateEmployee" 
                  method="POST" >
                <div class="modal-body">
                    <div class="form-group">
                        <label for="identification">Identificación</label>
                        <input type="text" name="identification" id="identification"/>
                        <label for="name">Nombre</label>
                        <input type="text" name="name" id="name"/>
                        <label for="lastName">Apellido</label>
                        <input type="text" name="lastName" id="lastName"/>
                        <label for="bod">Fecha de Nacimiento</label>
                        <input type="date" name="bod" id="bod"/>
                        <label for="email">Correo</label>
                        <input type="email" name="email" id="email"/>
                        <label for="phone">Teléfono</label>
                        <input type="tel" name="phone" id="phone"/>
                        <label for="department">Departamento</label>
                        <select class="form-control">
                            <option value="1">Sistemas</option>
                            <option value="2">Contabilidad</option>
                            <option value="3">Recursos Humanos</option>
                        </select>
                        <label for="positionEmployee">Cargo</label>
                        <select class="form-control">
                            <option value="1">Product Manager</option>
                            <option value="2">Product Analyst</option>
                            <option value="3">Managing Director</option>
                            <option value="4">Product Leader</option>
                        </select>
                        <label>Salario</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">$</span>
                            </div>
                            <input type="text" class="form-control">
                            <div class="input-group-append">
                                <span class="input-group-text">.00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div> 