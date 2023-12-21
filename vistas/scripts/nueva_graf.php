<div class="row contenedor3  ">
  <div class="col-lg-6">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Browser Usage</h3>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-card-widget="collapse">
            <i class="fas fa-minus"></i>
          </button>
          <button type="button" class="btn btn-tool" data-card-widget="remove">
            <i class="fas fa-times"></i>
          </button>
        </div>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <div class="chart-responsive">
              <canvas id="pieChart" height="150"></canvas>
            </div>
            <!-- ./chart-responsive -->
          </div>
          <!-- /.col -->

          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <div class="accordion" id="accordionExample">
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
              Accordion Item #1
            </button>
          </h2>
          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <div class="card-footer bg-white p-0">
                <ul class="nav nav-pills flex-column">
                  <?php
                  // include "../../php/conexion.php";
                  $sql = "SELECT productos.nombre,  productos.cantidad, productos.id, venta.venta_id, venta.vanta_cantidad, productos.stok FROM  venta
                        INNER JOIN  productos ON venta.venta_id = productos.id AND venta.v_estatus = productos.p_estatus";
                  $resultado = $conexion->query($sql);

                  while ($fila = $resultado->fetch_array()) {
                    $resta = $fila[5] - $fila[4];
                    $dividir = $resta / $fila[1];
                    $multi = number_format($dividir * 100, 2, '.', '');

                    echo '<li class="nav-item">';
                    echo '<div class="nav-link">' . $fila[0];

                    if ($multi <= 66.66 && $multi >= 34.99) {
                      echo '<span class="float-right text-warning">
                      <i class="fas fa-arrow-left text-sm"></i>' . $multi . '% </span>';
                    } elseif ($multi > 70.00) {
                      echo '<span class="float-right text-success">
                      <i class="fas fa-arrow-up text-sm"></i>' . $multi . '%</span>';
                    } elseif ($multi < 33.33) {
                      echo '<span class="float-right text-danger">
                      <i class="fas fa-arrow-left text-sm"></i>' . $multi . '% </span>';
                  ?>
                      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                      <script>
                        function modal() {
                          // alert("entro");
                          Swal.fire({
                            title: "SUMINISTROS AGOTADOS",
                            // text: "VUELVA A INICIAR SESION",
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#3085d6",
                            confirmButtonText: "Si",
                            backdrop: false // Evita cerrar haciendo clic fuera
                          });
                        }
                        modal();
                        // You might want to call the function immediately if needed
                      </script>
                    <?php
                    }
                    echo '</div></li>';
                    ?>
                  <?php
                  }
                  ?>

                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /.card-body -->

      <!-- /.footer -->
    </div>
  </div>
  <div class="col-lg-6">
    <div class="card">
      <div class="card-header">
        <h3 class="card-title">Browser Usage</h3>

        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-card-widget="collapse">
            <i class="fas fa-minus"></i>
          </button>
          <button type="button" class="btn btn-tool" data-card-widget="remove">
            <i class="fas fa-times"></i>
          </button>
        </div>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <div class="chart-responsive">
              <canvas id="dougpieChart" height="150"></canvas>
            </div>
            <!-- ./chart-responsive -->
          </div>
          <!-- /.col -->

          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <div class="accordion" id="accordionExample1">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne1">
        Accordion Item #1
      </button>
    </h2>
    <div id="collapseOne1" class="accordion-collapse collapse show" data-bs-parent="#accordionExample1">
      <div class="accordion-body">
        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Accordion Item #3
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>
      <!-- /.card-body -->

      <!-- ACA VA EL ACORDION  -->

      <!-- ACA TERMINA EL ACORDEON -->

    </div>

  </div>

  </ul>
</div>
<!-- /.foote
    <!-- /.footer -->
</div>
</div>
</div>
<script>
  

</script>