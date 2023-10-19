


<script src="../js/proceso.js"></script>
<div class="col-lg-12">
                 <div class=" card shadow m-0" >
                    <div class="card-header with-border">
                        <h3 class="card-title">MODULOS</h3>
                        <button type="submit" class="btn btn-success" onclick="AbrirmodalCrearmodulo()"> Crear modal</button>
                    </div>
                    <div class="contenedor_table">
                    <table id="tabla_modulo" class="table table-striped responsive nowrap " style="width:100%">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre modulo</th>
                                <th scope="col">posicion</th>
                                <th scope="col">icono svg</th>
                                <th scope="col">AC</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        </tbody>
                    </table>
                    </div>

                   
                </div>
        </div>
        <script>
           traerdatos_modulo();
        </script>