
<script src="../js/proceso.js"></script>
<div class="col-lg-12">
                 <div class=" card shadow m-0" >
                    <div class="card-header with-border">
                        <h3 class="card-title">Opciones</h3>
                        <button type="submit" class="btn btn-success" onclick="AbrirmodalCrearopcion()"> Crear Opcion</button>
                    </div>
                    <div class="contenedor_table">
                    <table id="tabla_opcion" class="table table-striped responsive nowrap " style="width:100%">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Posicion </th>
                                <th scope="col">Modulo </th>
                                <th scope="col">Ruta </th>
                                <th scope="col">Estatus</th>
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
           Traer_opcion();
        </script>