
<script src="../../js/proceso.js"></script>
<div class="row">
          
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="far fa-chart-bar"></i>
                  Productos mas vendidos
                </h3>
                
              </div>
              <div class="card-body">
                <div class="row">
                <div class="row grid_graficos">
                    <?php 
                    include "../../php/conexion.php";
                    $procentaje="";
                    $sql="SELECT p.id,p.nombre AS nombre_producto,v.venta_id,SUM(p.cantidad) AS cantidad_productos,
                        SUM(v.vanta_cantidad) as venta_cantidad  FROM productos p  JOIN
                    venta v ON p.id = v.venta_id GROUP BY  p.id, nombre_producto, v.venta_id ORDER BY
                    cantidad_productos DESC LIMIT 5";
                    $resultado=$conexion->query($sql);
                          while($fila=$resultado->fetch_array())
                          {
                            $procentaje=number_format(($fila[4]/$fila[3])*100,2,'.','');
                            $resultado1=$procentaje*100;
                            $fnal=$resultado1;
                            
                            //  echo "<div class='col-6 col-md-3 text-center'>
                            //       <input type='text' class='knob' value='".number_format($fnal/100,2)."%'  data-skin='tron' data-thickness='' data-width='90'
                            //       data-height='90'  data-readonly='true'>
                            //       <div class='knob-label'>".$fila[1]."</div>
                            //     </div> "; 
                                echo "<div class='text-center'>
                                <div class='skill'>
                                <svg>
                                  <circle cx='100' cy='100' r='60'></circle>
                                  <circle  cx='100' cy='100'  r='60'  class='progress'  data-value='".number_format($fnal/100)."'  data-stroke='#fe0000'
                                    data-time='80'
                                  ></circle>
                                </svg>
                                <span class='data-progress'   data-value='".number_format($fnal/100)."'></span>
                                </div>
                                <strong>".$fila[1]."</strong>
                              </div>";
                         } 
                   
                  ?>
                   
                </div>
              </div>
              </div>
            </div>
          </div>
        </div>
       