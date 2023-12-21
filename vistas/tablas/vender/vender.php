<script src="../js/proceso.js"></script>

<div class="row">
    <div class="col-6">
        <div class="card ">
        <form action="" method="post">
            <div class="container mt-3">
                
                    <div class="mb-3 row">
                        <label for="inputName" class="col-4 col-form-label">Producto</label>
                        <div class="col-8">
                            <input type="text" class="form-control" name="producto" id="producto" placeholder="Name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputName" class="col-4 col-form-label">Valor</label>
                        <div class="col-8">
                            <input type="text" class="form-control" name="valor" id="valor" placeholder="Name">
                        </div>
                    </div>
                    <fieldset class="mb-3 row">
                        <legend class="col-form-legend col-4">compra</legend>
                        <div class="col-8">
                            compra
                        </div>
                    </fieldset>
                    <div class="mb-3 row">
                        <div class="col col-12 btn-lg">
                            <butto class="btn btn-primary" onclick="vender()">Action</button>
                        </div>
                    </div>
                
            </div>
        </form>
        </div>
       
    </div>
    <div class="col-6">
        <div class=" card shadow m-0" >
                    <div class="card-header with-border">
                        <h3 class="card-title">AGREGADOS</h3>
                        <div class="card-tools">
                           
                        </div>
                    </div>
                    <div class="contenedor_table">
                    <table id="tabla_vender" class="table table-striped responsive nowrap " style="width:100%">
                        <thead>
                            <tr class="bg-primary">
                                <th scope="col">#</th>
                                <th scope="col">Nombre Producto</th>
                                <th scope="col">valor</th>
                                <th scope="col">AC</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        </tbody>
                    </table>
                    </div>

                   
        </div>
    </div>
</div>
<script>
    Traer_venta();
</script>