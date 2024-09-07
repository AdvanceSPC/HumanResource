<!-- Add Position -->
<div class="modal fade" id="addPositionModal">
    <div class="modal-dialog model-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar Position</h5>
                <button class="clse" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 10px">ID</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th style="width: 40px">Salario Base</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="position" items="${positions}">
                            <tr>
                                <td>${position.id}</td>
                                <td>${position.name}</td>
                                <td>${position.description}</td>
                                <td>${position.salary_base}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/PositionController?action=insert" 
                  method="POST" >
                <section id="details">
                    <div class="container">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="name">Nombre</label>
                                <input type="text" name="name" id="name" value="${position.name}"/>
                                <label for="description">Descripción</label>
                                <input type="text" name="description" id="description" value="${position.description}"/>
                                <label for="salary">Salario Base</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">$</span>
                                    </div>
                                    <input type="text" class="form-control" value="${position.salary}" name="salary">
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