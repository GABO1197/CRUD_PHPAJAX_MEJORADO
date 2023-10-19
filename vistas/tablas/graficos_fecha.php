<script src="../js/proceso.js"></script>

<div class="col-lg-12 pt-4">
              <div class="card">
                 <div class="card-body card-block">
                                      <div class="grid_row form-group">
                                              <div>
                                              <label for="fecha1etapa">Fecha Inicio</label>                          
                                                  <input id="fecha1etapa" type='date' class="form-control">
                                              </div>
                                              <div>
                                                      <label for="fecha2etapa">Fecha Fin</label>                           
                                                      <input id="fecha2etapa" type='date' class="form-control">
                                              </div>
                                              <div>
                                                      <label for="etapas">Etapas</label>                           
                                                      <select class="form-control" name="etapas" id="etapas">
                                                      <option value=''>Todos</option>
                                                      <?php
                                                      // include ('../controles/accionesestados.php');
                                                      ?>
                                                      </select>
                                              </div>
                                              <div class="col-sm-12"><br>
                                              <button type="button" class="btn btn-warning btn-sm" onclick="informeacciones()"><i class="fa fa-search"></i>&nbsp; Buscar</button>
                                              </div>
                                              <!-- <div class="col-sm-2"><br>
                                              <button type="button" class="btn btn-warning btn-sm" onclick="ocultardiv('graficaacciones')"><i class="fa fa-search"></i>&nbsp; Mostrar Grafica</button>
                                          </div> -->
                                      </div>
                 </div>
              </div>
          </div>  
          <div class="parametros_busqueda tres_columnas_buscar">
              <div class="col-lg-12">
                  <div class="card">
                      <div class="card-header">
                          <strong class="card-title">Resultados: Informe</strong>
                      </div>
                      <div class="card-body">
                          <table id="tabla2" class="table table-striped responsive nowrap " style="width:100%">
                              <thead>
                                  <tr>
                                      <th scope="col">Nombre producto</th>
                                      <th scope="col">Cantidad</th>
                                      <th scope="col">Porcentaje</th>
                                  </tr>
                              </thead>
                              <tbody>
                              
                              </tbody>
                              <tfoot>
                                      <th scope="col">Nombre producto</th>
                                      <th scope="col">Cantidad</th>
                                      <th scope="col">Porcentaje</th>
                              </tfoot>
                          </table>
                      </div>
                  </div>    
              </div>
              <div class="card" id="graficaacciones">
                        <div class="char">
                          <canvas id="graphCanvasacciones"></canvas>
                        </div>
                </div>
        </div>

        <script>
            informeacciones();
        </script>