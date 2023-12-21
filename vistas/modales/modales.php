<div class="modal fade" id="modal_editar"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Editar productos</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                  <!-- <label for="">id</label> -->
                  <input type="text" class="form-control" id="txt_id" name="txtid" placeholder="id"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">producto</label>
                  <input type="text" class="form-control" id="txt_nombre_producto_editar" name="txt_nombre_editar" placeholder="Ingrese producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">catidad producto</label>
                  <input type="txt" class="form-control" id="txt_cantidad_producto_editar" name="txt_cantidad_editar" placeholder="catidad producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">cantidad stock</label>
                  <input type="txt" class="form-control" id="txt_cantidad_stok_producto_editar" name="txt_cantidad_stok_editar" placeholder="cantidad stock"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">venta cantidad</label>
                  <input type="txt" class="form-control" id="txt_venta_cantidad_editar" name="txt_venta_cantidad_editar" placeholder="venta cantidad "><br>
                </div>
                <div class="col-lg-12">
                <label for="">fecha registro</label>
                  <input type="date" class="form-control" id="txt_fecha_procuto_editar" name="txt_fecha_procuto_editar" placeholder="fecha registro"><br>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="actualizaproductos()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modal_registrar"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Registrar productos</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                  <label for="">producto</label>
                  <input type="text" class="form-control" id="txt_nombre_producto" name="txt_nombre_producto" placeholder="Ingrese producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">catidad producto</label>
                  <input type="txt" class="form-control" id="txt_cantidad_producto" name="txt_cantidad_producto" placeholder="catidad producto"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">cantidad stock</label>
                  <input type="txt" class="form-control" id="txt_cantidad_stok_producto" name="txt_cantidad_stok_producto" placeholder="cantidad stock"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">venta cantidad</label>
                  <input type="txt" class="form-control" id="txt_venta_cantidad" name="txt_venta_cantidad" placeholder="venta cantidad "><br>
                </div>
                <div class="col-lg-12">
                <label for="">fecha registro</label>
                  <input type="date" class="form-control" id="txt_fecha_procuto" name="txt_fecha_procuto" placeholder="fecha registro"><br>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="registroproductos()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>
<div class="modal fade" id="modal_registrar_user"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Registrar usuario</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
              
                <div class="col-lg-12">
                  <label for="">Nombre usuario</label>
                  <input type="text" class="form-control" id="txt_nombre" name="txt_nombre" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Telefono</label>
                  <input type="txt" class="form-control" id="txt_telefono" name="txt_telefono" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Contraseña</label>
                  <input type="password" class="form-control" id="txt_pass" name="txt_pass" placeholder="Email"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Email</label>
                  <input type="email" class="form-control" id="txt_email" name="txt_email" placeholder="Email"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Rol</label>
                  <select class="form-select" aria-label="Default select example" id="txt_rol"name="txt_rol" style="width: 100%;">
                  </select>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="registroUsuario()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>

<div class="modal fade" id="modal_editar_user"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Editar usuario</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            
            <div class="modal-body">
                <div class="col-lg-12">
                  <label for="">ID</label>
                  <input type="text" class="form-control" id="txt_id_editar_usu" name="txt_id_editar_usu"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Nombre usuario</label>
                  <input type="text" class="form-control" id="txt_nombre_editar" name="txt_nombre_editar" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Telefono</label>
                  <input type="txt" class="form-control" id="txt_telefono_editar" name="txt_telefono_editar" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Contraseña</label>
                  <input type="password" class="form-control" id="txt_pass_editar" name="txt_pass_editar" placeholder="pass"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Email</label>
                  <input type="email" class="form-control" id="txt_email_editar" name="txt_email_editar" placeholder="Email"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Rol</label>
                  <select class="form-select" aria-label="Default select example" id="txt_rol_editar"name="txt_rol_editar" style="width: 100%;">
                  </select>
                </div>
                <!-- <div class="col-lg-12">
                  <label for="">Estatus</label>
                  <input type="txt" class="form-control" id="txt_estatus_editar" name="txt_estatus_editar" placeholder="rol "><br>
                </div> -->
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="actualiza_user()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>

<div class="modal fade" id="registrar_modulo"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Crear modulo</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            
            <div class="modal-body">
                
                <div class="col-lg-12">
                  <label for="">Nombre Modulo</label>
                  <input type="text" class="form-control" id="txt_nombre_modulo" name="txt_nombre_modulo" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Posicion del Modulo</label>
                  <input type="txt" class="form-control" id="txt_posicion_modulo" name="txt_posicion_modulo" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">icono svg</label>
                  <!-- <input type="text" class="form-control" id="txt_icono" name="txt_icono" placeholder="icono"> -->
                  <textarea class="form-control" aria-label="With textarea" type="text" class="form-control" id="txt_icono" name="txt_icono" placeholder="icono"></textarea>
                  <br>
                </div>
                
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="crearmodulo()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>

<div class="modal fade" id="modificar_modulo"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">ACTUALIZAR MODULO</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                  <label for="">ID</label>
                  <input type="text" class="form-control" id="idmodulo" name="idmodulo" disabled><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Nombre modulo</label>
                  <input type="text" class="form-control" id="nombremodulo" name="nombremodulo" ><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Posicion del modulo</label>
                  <input type="txt" class="form-control" id="ordenmodulo" name="ordenmodulo" ><br>
                </div>
                <div class="col-lg-12">
                  <label for="">icono</label>
                  <input class="form-control"  type="text"  id="icono" name="icono" >
                  <br>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="actualiza_modulo()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>
<div class="modal fade" id="registrar_opcion"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Crear Opcion</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                  <label for="">Nombre Opcion</label>
                  <input type="text" class="form-control" id="txt_nombre_opcion" name="txt_nombre_opcion" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Posicion de la Opcion</label>
                  <input type="txt" class="form-control" id="txt_posicion_opcion" name="txt_posicion_opcion" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Modulo Opcion</label>
                  <input class="form-control"  type="text"  id="txt_modulo_opcion" name="txt_modulo_opcion" placeholder="modulo">
                  <br>
                </div>
                <div class="col-lg-12">
                  <label for="">Ruta Opcion</label>
                  <input  class="form-control" type="text"  id="txt_ruta_opcion" name="txt_ruta_opcion" placeholder="ruta">
                  <br>
                </div>
                
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="crearopcion()"><i class="fa fa-check"><b>&nbsp;registrar</b></i></button>
            </div>
          </div>
        </div>
</div>
<div class="modal fade" id="editar_opcion"  aria-modal="true" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Editar Opcion</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true"></span>
              </button>
            </div>
            <div class="modal-body">
                <div class="col-lg-12">
                  <label for="">ID Opcion</label>
                  <input type="text" class="form-control" id="idopcion" name="idopcion" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Nombre Opcion</label>
                  <input type="text" class="form-control" id="editarnombreopcion" name="editarnombreopcion" placeholder="Ingrese usuario"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Posicion de la Opcion</label>
                  <input type="txt" class="form-control" id="editarposicion" name="editarposicion" placeholder="telefono"><br>
                </div>
                <div class="col-lg-12">
                  <label for="">Modulo Opcion</label>
                  <input class="form-control"  type="text"  id="editarmodulo" name="editarmodulo" placeholder="modulo">
                  <br>
                </div>
                <div class="col-lg-12">
                  <label for="">Ruta Opcion</label>
                  <input  class="form-control" type="text"  id="editarruta" name="editarruta" placeholder="ruta">
                  <br>
                </div>
                
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal" data-bs-dismiss="modal"><i class="fa fa-times"><b>&nbsp;cerrar</b></i></button>
              <button type="button" class="btn btn-success" onclick="actualiza_opcion()"><i class="fa fa-check"><b>&nbsp;Editar</b></i></button>
            </div>
          </div>
        </div>
</div>