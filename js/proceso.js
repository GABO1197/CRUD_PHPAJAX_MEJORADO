
// buscar por fecha
function informeacciones()
{
        // alert("entro")
        var table=$('#tabla2').DataTable();
        var fecha1=$('#fecha1etapa').val();                   
        var fecha2=$('#fecha2etapa').val();                   
        var etapas=$('#etapas').val();                   
        var rotulo=fecha1+" - "+fecha2+"  | "+etapas;
        var name = [];
        var marks = [];
        var color = ['#ffe4e1','#d8f8e1','#fcb7af', '#b0f2c2', '#b0c2f2'];
        var bordercolor = ['#ff6961', '#77dd77','#fdfd96', '#84b6f4', '#fdcae1'];
           var NombreProceso = "REPORTEETAPASACCIONES";
           var parametros = {  
           "NombreProceso":NombreProceso,
           "etapas":etapas,
           "fecha1":fecha1,
           "fecha2":fecha2,
           };
        // alert("aqer"+estado);
                     $.ajax({
                             data: parametros,
                             url: '../php/proceso.php',
                             type: 'post',
                             beforeSend: function () {
                                // alert("si ");
                             },
                             success: function (response) {
                                var registros ="";     
                                json = JSON.parse(response);
                                var totalvalores=0;
                                var promedio=0;
                                for (var i in json) {
                                        totalvalores=parseFloat(totalvalores)+parseFloat(json[i].CANTIDAD);
                                        }
                                for (var i in json) {
                                                if(json[i].nombre==null )
                                                {
                                                name.push("Sin Clasificar");
                                                json[i].nombre="Sin Clasificar";
                                                

                                                }
                                                else{
                                                name.push(json[i].nombre);
                                                }
                                marks.push(json[i].CANTIDAD);
                            //  alert(json[i].CANTIDAD);
                                promedio=Math.round((parseFloat(json[i].CANTIDAD)/totalvalores)*1000)/10;
                                    var registros =registros+'<tr id=' + json[i].nombre + '><td >' + json[i].nombre + '<td>'+json[i].CANTIDAD+'</td><td>'+promedio+'(%)</td></tr>';
                                   
                                }
                            //  alert("Guardo "+response);
                                      
                                     table.destroy();
                                     $('#tabla2 tbody').html(registros);
                                     $('#tabla2 ').DataTable( {
                                            pageLength : 3,
                                             dom: 'Bfrtip',
                                             buttons: [
                                                {
                                                extend: 'copy', 
                                                text:'<i class="fa fa-clone fa-2x"></i>',
                                                title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                                                filename: 'REPORTE PRODCUTOS',
                                                exportOptions: {
                                                   columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                               },
                                               className: 'btn1 btn btn-primary',
                                                
                                              }, 
                                              {
                                                     extend: 'excel', 
                                                     text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-success',
                                                     
                                                   },
                                                   {
                                                    extend: 'pdf',
                                                    text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                                                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                                                    filename: 'REPORTE PRODCUTOS',
                                                    exportOptions: {
                                                       columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                   },
                                                   className: 'btn btn1 btn-danger',
                                                    
                                                  },  {
                                                     extend: 'print',
                                                     text:'<i class="fa fa-print fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-secondary ',
                                                   },
                                                   {
                                                    extend: 'colvis',
                                                    text:'Filtrar',
                                                    className: 'btn btn1 btn-secondary ',
                                                   
                                                  } 
                                          ]
                                         } );   
                                                     // //*** grafica */
                                                var chartdata = {
                                                        labels: name,
                                                        datasets: [
                                                            {
                                                                label: 'ACCIONES ESTADOS',
                                                                backgroundColor: color,
                                                                borderColor: color,
                                                                borderWidth: 2,
                                                                hoverBackgroundColor: color,
                                                                hoverBorderColor: bordercolor,
                                                                data: marks
                                                            }
                                                        ]
                                                    };
                                                    
                                
                                                    var graphTarget = $("#graphCanvasacciones");
                                                    // var graphTargetbar = $("#graphCanvasaccionesbar");


                                                    var barGraph = new Chart(graphTarget, {
                                                        type: 'doughnut',
                                                        data: chartdata
                                                    });
                                                    // var barGraphbar = new Chart(graphTargetbar, {
                                                    //     type: 'bar',
                                                    //     data: chartdata
                                                    // });     
                                                     //         //***fin grafica */
                             
                             }
                 });
}
// graficos
function informeacciones_cargarauto(){
        var name = [];
        var marks = [];
        var sum=[];
        var color = ['#ffe4e1','#d8f8e1','#fcb7af', '#b0f2c2', '#b0c2f2'];
        var bordercolor = ['#ff6961', '#77dd77','#fdfd96', '#84b6f4', '#fdcae1'];
           var NombreProceso = "REPORTEETAPASACCIONES_auto";
           var parametros = {  
           "NombreProceso":NombreProceso
           };
        // alert("aqer"+estado);
        $.ajax({
            data: parametros,
            url: '../php/proceso.php',
            type: 'post',
            beforeSend: function () {
            },
            success: function (response) {
                // alert(response)
                // var registros ="";     
                json = JSON.parse(response);
                var totalvalores=0;
                var promedio=0;
                for (var i in json) {
                    otalvalores=parseFloat(totalvalores)+parseFloat(json[i].cantidad);
                }
                for (var i in json) {
                    if(json[i].nombre==null)
                    {
                    name.push("Sin Clasificar");
                    json[i].nombre="Sin Clasificar";
                        }
                    else{
                    name.push(json[i].nombre);
                    }
                     marks.push(json[i].cantidad);
                //     promedio=Math.round((parseFloat(json[i].cantidad)/totalvalores)*1000)/10;
                //     var registros =registros+'<tr id=' + json[i].nombre + '><td >' + json[i].nombre + '<td>'+jsoncantidad+'</td><td>'+promedio+'(%)</td></tr>';
                //  }
                // grafica //
                 var chartdata1 = {
                    labels: name,
                    datasets: [
                        {
                             label: 'ACCIONES ESTADOS',
                            backgroundColor: color,
                            borderColor: color,
                             borderWidth: 2,
                            hoverBackgroundColor: color,
                            hoverBorderColor: bordercolor,
                            data: marks
                        }
                    ]
                    };          
                var graphTarget1 = $("#graphCanvasacciones_auto");
                var graphTargetbar1 = $("#graphCanvasaccionesbar_auto");
                var barGraph1 = new Chart(graphTarget1, {
                    type: 'doughnut',                   
                     data: chartdata1
                });
                 var barGraphbar1 = new Chart(graphTargetbar1, {
                    type: 'pie',
                    data: chartdata1
                });     
            //         //***fin grafica */
            }
        }
    });
                
}
// datos generales
function traerdatos(){
     // alert("entro")
    var table=$('#tabla_productos').DataTable();
     var name = [];
     var marks = [];
    //  var rotulo="";
        var NombreProceso = "CARGARDATOS";
        var parametros = {  
        "NombreProceso":NombreProceso,
        
        };
     // alert("aqer"+estado);
                  $.ajax({
                          data: parametros,
                          url: '../php/proceso.php',
                          type: 'post',
                          beforeSend: function () {
                             // alert("si ");
                          },
                          success: function (response) {
                        //    alert(response);
                             var registros ="";    
                             json = JSON.parse(response);
                             var totalvalores=0;
                             var promedio=0;
                                for (var i in json) {
                                  totalvalores=parseFloat(totalvalores)+parseFloat(json[i].vanta_cantidad);
                                } 
                             json = JSON.parse(response);
                            var registros="<thead><tr><th scope='col'>#</th> <th scope='col'>Nombre Producto</th> <th scope='col'>Cantidad</th><th scope='col'>Stock</th><th scope='col'>Venta cantidad</th><th scope='col'>Porcentaje de ventas</th> <th scope='col'>Venta Fecha</th><th scope='col'>AC</th></tr></thead><tbody>";
                             for (var i in json) {
                                             if(json[i].id==null ||json[i].nombre==null ||json[i].cantidad==null ||json[i].stok==null||json[i].vanta_cantidad==null||json[i].venta_fecharegistro==null)
                                             {
                                             name.push("Sin Clasificar");
                                             json[i].id="Sin Clasificar";
                                             json[i].nombre="Sin Clasificar";
                                             json[i].cantidad="Sin Clasificar";
                                             json[i].stok="Sin Clasificar";
                                             json[i].vanta_cantidad="Sin Clasificar";
                                             json[i].venta_fecharegistro="Sin Clasificar";
                                            
                                             }
                                             else{
                                             name.push(json[i].id,json[i].nombre,json[i].cantidad,json[i].stok,json[i].vanta_cantidad,json[i].venta_fecharegistro);
                                             }
                             marks.push(json[i].id,json[i].nombre,json[i].cantidad,json[i].stok,json[i].vanta_cantidad,json[i].venta_fecharegistro);

                         //  alert(json[i].CANTIDAD);
                             var ac_botom=[json[i].id+"||"+json[i].nombre +"||"+json[i].cantidad+"||"+json[i].stok+"||"+json[i].vanta_cantidad+"||"+json[i].venta_fecharegistro];

                             promedio=Math.round((parseFloat(json[i].vanta_cantidad)/totalvalores)*1000)/10;
                                registros +='<tr><td>'+json[i].id+'</td><td>' + json[i].nombre + '</td><td>'+json[i].cantidad+'</td><td>'+json[i].stok+'</td><td>'+json[i].vanta_cantidad+'</td><td>'+promedio+'(%)</td><td>'+json[i].venta_fecharegistro+'</td><td><button style="font-size:10px;" type="button"  class="editar btn btn-primary" onclick="editar_productos(\''+ac_botom+'\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick=" modaleliminar(\''+ac_botom+'\')"><i class="fa fa-times"></i></button></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-success" onclick=" modalhabilitar(\''+ac_botom+'\')"><i class="fa fa-check"></i></button></td></tr>';
                                
                                
                             }
                             registros+='</tbody><tfoot><tr><th class="col bg-success text-light">Totales :</th><td class=" col bg-success text-light"></td><td class=" col bg-success text-light" ></td><td class="col bg-success text-light"></td><td class=" col bg-success text-light">'+totalvalores+'</td><td class=" col bg-success text-light"></td><td class=" col bg-success text-light"></td><td class=" col bg-success text-light"></td></tr></tfoot>';
                           
                         
                                var fecha_datos=new Date();
                                var fecha=fecha_datos.getFullYear()+"-"+fecha_datos.getMonth()+"-"+fecha_datos.getDay();
                                  table.destroy();
                                  $('#tabla_productos').html(registros);
                                //   console.log("fecha2:  "+fecha_a);
                                  $('#tabla_productos').DataTable( {
                                          dom: 'Bfrtip',
                                          buttons: [
                                                {
                                                extend: 'copy', 
                                                text:'<i class="fa fa-clone fa-2x"></i>',
                                                title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                filename: 'REPORTE PRODCUTOS',
                                                exportOptions: {
                                                   columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                               },
                                               className: 'btn1 btn btn-primary',
                                                
                                              }, 
                                              {
                                                     extend: 'excel', 
                                                     text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-success',
                                                     
                                                   },
                                                   {
                                                    extend: 'pdf',
                                                    text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                                                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                    filename: 'REPORTE PRODCUTOS',
                                                    exportOptions: {
                                                       columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                   },
                                                   className: 'btn btn1 btn-danger',
                                                    
                                                  },  {
                                                     extend: 'print',
                                                     text:'<i class="fa fa-print fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-secondary ',
                                                   },
                                                   {
                                                    extend: 'colvis',
                                                    text:'Filtrar',
                                                    className: 'btn btn1 btn-secondary ',
                                                   
                                                  }
                                                   
                                          ]
                                      } )  
                          }
              });    
}
// datos habilitados
function traerdatoshabilitado(){
    // alert("entro")
      var table=$('#tabla_productos_habilitados').DataTable();
   
    var name = [];
    var marks = [];
   //  var rotulo="";
       var NombreProceso = "CARGARDATOSHABILITADOS";
       var parametros = {  
       "NombreProceso":NombreProceso,
       
       };
    // alert("aqer"+estado);
                 $.ajax({
                         data: parametros,
                         url: '../php/proceso.php',
                         type: 'post',
                         beforeSend: function () {
                            // alert("si ");
                         },
                         success: function (response) {
                            var registros ="";    
                            json = JSON.parse(response);
                            var totalvalores=0;
                            var promedio=0;
                            var sumatoria=0;
                            var totalsum=0;
                               for (var i in json) {
                                 totalvalores=parseFloat(totalvalores)+parseFloat(json[i].vanta_cantidad);
                               } 
                            json = JSON.parse(response);
                           var registros="<thead><tr><th scope='col'>#</th> <th scope='col'>Nombre Producto</th> <th scope='col'>Cantidad</th><th scope='col'>Stock</th><th scope='col'>Venta cantidad</th><th scope='col'>Porcentaje de ventas</th> <th scope='col'>Venta Fecha</th><th scope='col'>AC</th></tr></thead><tbody>";
                            for (var i in json) {
                                            if(json[i].id==null ||json[i].nombre==null ||json[i].cantidad==null ||json[i].stok==null||json[i].vanta_cantidad==null||json[i].venta_fecharegistro==null)
                                            {
                                            name.push("Sin Clasificar");
                                            json[i].id="Sin Clasificar";
                                            json[i].nombre="Sin Clasificar";
                                            json[i].cantidad="Sin Clasificar";
                                            json[i].stok="Sin Clasificar";
                                            json[i].vanta_cantidad="Sin Clasificar";
                                            json[i].venta_fecharegistro="Sin Clasificar";
                                            }
                                            else{
                                            name.push(json[i].id,json[i].nombre,json[i].cantidad,json[i].stok,json[i].vanta_cantidad,json[i].venta_fecharegistro);
                                            }
                            marks.push(json[i].id,json[i].nombre,json[i].cantidad,json[i].stok,json[i].vanta_cantidad,json[i].venta_fecharegistro);

                        //  alert(json[i].CANTIDAD);
                            var ac_botom=json[i].id+"||"+json[i].nombre +"||"+json[i].cantidad+"||"+json[i].stok+"||"+json[i].vanta_cantidad+"||"+json[i].venta_fecharegistro;
                            promedio=Math.round((parseFloat(json[i].vanta_cantidad)/totalvalores)*1000)/10;
                               registros +='<tr><td>'+json[i].id+'</td><td>' + json[i].nombre + '</td><td>'+json[i].cantidad+'</td><td>'+json[i].stok+'</td><td>'+json[i].vanta_cantidad+'</td><td>'+promedio+'(%)</td><td>'+json[i].venta_fecharegistro+'</td><td><button style="font-size:10px;" type="button"  class="editar btn btn-primary" onclick="editar_productos(\''+ac_botom+'\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick=" modaleliminar(\''+ac_botom+'\')"><i class="fa fa-times"></i></button></td></tr>';
                               var fecha_ac=json[i].fecha_p;

                            }
                            registros+="</tbody><tfoot><tr><th class='col bg-success'>Totales :</th><td class=' col bg-success'></td><td class=' col bg-success' ></td><td class='col bg-success'></td><td class=' col text-ligth bg-success'>"+totalvalores+"</td><td class=' col bg-success'></td><td class=' col bg-success'></td><td class=' col bg-success'></td></tr></tfoot>";
                            fecha_a=fecha_ac;
                       //   console.log("Guardo "+registros);

                                 table.destroy();
                                 $('#tabla_productos_habilitados').html(registros);
                                 $('#tabla_productos_habilitados').DataTable( {
                                         dom: 'Bfrtip',
                                       //   buttons:{
                                       //         className:'btn btn-primary'
                                       //   },
                                       buttons: [
                                        {
                                        extend: 'copy', 
                                        text:'<i class="fa fa-clone fa-2x"></i>',
                                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                        filename: 'REPORTE PRODCUTOS',
                                        exportOptions: {
                                           columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                       },
                                       className: 'btn1 btn btn-primary',
                                        
                                      }, 
                                      {
                                             extend: 'excel', 
                                             text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                                             title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                             filename: 'REPORTE PRODCUTOS',
                                             exportOptions: {
                                                columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                            },
                                            className: 'btn btn1 btn-success',
                                             
                                           },
                                           {
                                            extend: 'pdf',
                                            text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                                            title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                            filename: 'REPORTE PRODCUTOS',
                                            exportOptions: {
                                               columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                           },
                                           className: 'btn btn1 btn-danger',
                                            
                                          },  {
                                             extend: 'print',
                                             text:'<i class="fa fa-print fa-2x"></i>',
                                             title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                             filename: 'REPORTE PRODCUTOS',
                                             exportOptions: {
                                                columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                            },
                                            className: 'btn btn1 btn-secondary ',
                                           },
                                           {
                                            extend: 'colvis',
                                            text:'Filtrar',
                                            className: 'btn btn1 btn-secondary ',
                                           
                                          }
                                           
                                  ]
                                     } );   
                         }
             });    
}

function traerdatosdeshabilitado(){
    // alert("entro")
      var table=$('#tabla_productos_deshabilitados').DataTable();
   
    var name = [];
    var marks = [];
   //  var rotulo="";
       var NombreProceso = "CARGARDATOSDESHABILITADOS";
       var parametros = {  
       "NombreProceso":NombreProceso,
       
       };
    // alert("aqer"+estado);
                 $.ajax({
                         data: parametros,
                         url: '../php/proceso.php',
                         type: 'post',
                         beforeSend: function () {
                            // alert("si ");
                         },
                         success: function (response) {
                            var registros ="";    
                            json = JSON.parse(response);
                            var totalvalores=0;
                            var promedio=0;
                            var sumatoria=0;
                            var totalsum=0;
                               for (var i in json) {
                                 totalvalores=parseFloat(totalvalores)+parseFloat(json[i].vanta_cantidad);
                               } 
                            json = JSON.parse(response);
                           var registros="<thead><tr><th scope='col'>#</th> <th scope='col'>Nombre Producto</th> <th scope='col'>Cantidad</th><th scope='col'>Stock</th><th scope='col'>Venta cantidad</th><th scope='col'>Porcentaje de ventas</th> <th scope='col'>Venta Fecha</th><th scope='col'>AC</th></tr></thead><tbody>";
                            for (var i in json) {
                                            if(json[i].id==null ||json[i].nombre==null ||json[i].cantidad==null ||json[i].stok==null||json[i].vanta_cantidad==null||json[i].venta_fecharegistro==null)
                                            {
                                            name.push("Sin Clasificar");
                                            json[i].id="Sin Clasificar";
                                            json[i].nombre="Sin Clasificar";
                                            json[i].cantidad="Sin Clasificar";
                                            json[i].stok="Sin Clasificar";
                                            json[i].vanta_cantidad="Sin Clasificar";
                                            json[i].venta_fecharegistro="Sin Clasificar";
                                            }
                                            else{
                                            name.push(json[i].id,json[i].nombre,json[i].cantidad,json[i].stok,json[i].vanta_cantidad,json[i].venta_fecharegistro);
                                            }
                            marks.push(json[i].id,json[i].nombre,json[i].cantidad,json[i].stok,json[i].vanta_cantidad,json[i].venta_fecharegistro);

                        //  alert(json[i].CANTIDAD);
                            var ac_botom=json[i].id+"||"+json[i].nombre +"||"+json[i].cantidad+"||"+json[i].stok+"||"+json[i].vanta_cantidad+"||"+json[i].venta_fecharegistro;
                            promedio=Math.round((parseFloat(json[i].vanta_cantidad)/totalvalores)*1000)/10;
                               registros +='<tr><td>'+json[i].id+'</td><td>' + json[i].nombre + '</td><td>'+json[i].cantidad+'</td><td>'+json[i].stok+'</td><td>'+json[i].vanta_cantidad+'</td><td>'+promedio+'(%)</td><td>'+json[i].venta_fecharegistro+'</td><td><button style="font-size:10px;" type="button"  class="editar btn btn-primary" onclick="editar_productos(\''+ac_botom+'\')"><i class="fa fa-edit"></i></button>&nbsp;</button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-success" onclick=" modalhabilitar(\''+ac_botom+'\')"><i class="fa fa-check"></i></button></td></tr>';
                               var fecha_ac=json[i].fecha_p;

                            };
                            registros+="</tbody><tfoot><tr><th class='col bg-success'>Totales :</th><td class=' col bg-success'></td><td class=' col bg-success' ></td><td class='col bg-success'></td><td class=' col text-ligth bg-success'>"+totalvalores+"</td><td class=' col bg-success'></td><td class=' col bg-success'></td><td class=' col bg-success'></td></tr></tfoot>";
                            fecha_a=fecha_ac;
                            
                       //   console.log("Guardo "+registros);

                                 table.destroy();
                                 $('#tabla_productos_deshabilitados').html(registros);
                                 $('#tabla_productos_deshabilitados').DataTable( {
                                         dom: 'Bfrtip',
                                       //   buttons:{
                                       //         className:'btn btn-primary'
                                       //   },
                                       buttons: [
                                        {
                                        extend: 'copy', 
                                        text:'<i class="fa fa-clone fa-2x"></i>',
                                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                        filename: 'REPORTE PRODCUTOS',
                                        exportOptions: {
                                           columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                       },
                                       className: 'btn1 btn btn-primary',
                                        
                                      }, 
                                      {
                                             extend: 'excel', 
                                             text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                                             title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                             filename: 'REPORTE PRODCUTOS',
                                             exportOptions: {
                                                columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                            },
                                            className: 'btn btn1 btn-success',
                                             
                                           },
                                           {
                                            extend: 'pdf',
                                            text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                                            title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                            filename: 'REPORTE PRODCUTOS',
                                            exportOptions: {
                                               columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                           },
                                           className: 'btn btn1 btn-danger',
                                            
                                          }, 
                                           {
                                             extend: 'print',
                                             text:'<i class="fa fa-print fa-2x"></i>',
                                             title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha_a,
                                             filename: 'REPORTE PRODCUTOS',
                                             exportOptions: {
                                                columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                            },
                                            className: 'btn btn1 btn-secondary ',
                                           },
                                           {
                                            extend: 'colvis',
                                            text:'Filtrar',
                                            className: 'btn btn1 btn-secondary ',
                                           
                                          }
                                           
                                  ]
                                     } );
                         }
             });    
}
// editar productos
function editar_productos(parametros)
{
    alert(parametros)
    $('#tabla_productos').on('click','.editar',function(){
    var datos=parametros.split("||");
         $('#modal_editar').modal('show');
        $('#txt_id').val(datos[0]);
        $('#txt_nombre_producto_editar').val(datos[1]);
    	$('#txt_cantidad_producto_editar').val(datos[2]);
    	$('#txt_cantidad_stok_producto_editar').val(datos[3]);
        $('#txt_venta_cantidad_editar').val(datos[4]);
        $('#txt_fecha_procuto_editar').val(datos[5]);
    })
}
function actualizaproductos()
{
    var id=$('#txt_id').val();
    var nombre=$('#txt_nombre_producto_editar').val();
	var cantidad=$('#txt_cantidad_producto_editar').val();
	var stock=$('#txt_cantidad_stok_producto_editar').val();
    var v_cantidad=$('#txt_venta_cantidad_editar').val();
    var v_fecha=$('#txt_fecha_procuto_editar').val();
        NombreProceso = "ACTUALIZARPRODUCTOS";
        var parametros = {  
                "NombreProceso":NombreProceso,
                "id":id,
                "nombre":nombre,
                "cantidad":cantidad,
                "stock":stock,
                "v_cantidad":v_cantidad,
                "v_fecha":v_fecha
        };
                $.ajax({
                        data: parametros,
                        url: "../php/proceso.php",
                        type: 'post'
                }).done(function(resp){
                    // alert(resp);
                    if(resp.trim()==1){
                        // TraerDatosUsuario();
                            $("#modal_editar").modal('hide');
                            Swal.fire("Mensaje De Confirmacion","Datos actualizados correctamente","success")            
                            .then ( ( value ) =>  {
                                table.ajax.reload();
                            }); 
                       
                    }else{
                        Swal.fire("Mensaje De Error","no se pudo completar la actualizacion","error");
                    }
                });
               
}
// ELIMINAR DATOS////////////////
function modaleliminar(id){
    // alert(id[0]);
        var datos=id.split("||");
        Swal.fire({
            title: 'Esta seguro de desactivar al usuario?',
            text: "Una vez hecho esto el usuario no tendra acceso al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
          }).then((result) => {
            if (result.value) {
                eliminar_productos(datos[0]);
            }
          })
}
function eliminar_productos(datos)
{
        // console.log(datos);
        var NombreProceso = "ELIMINARDATOS";
        var parametros = {  
                "NombreProceso":NombreProceso,
                "id":datos,
        };
                $.ajax({
                        data: parametros,
                        url: '../php/proceso.php',
                        type: 'POST',
                        beforeSend: function (){
                            // alert(datos)
                        }
                }).done(function(resp){
                    // alert(resp);
                    if(resp.trim()==1){
                        Swal.fire("Mensaje De Confirmacion","EL producto se elimino con exito","success")            
                            .then ( ( value ) =>  {
                                table.ajax.reload();
                            }); 
                    }else{
                        Swal.fire("Mensaje De Error","no se pudo completar la eliminarcion","error");
                    }
                })

       
               
}
// habilitar datos
function modalhabilitar(id){
    // alert(id[0]);
        var datos=id.split("||");
        Swal.fire({
            title: 'Esta seguro de activar al usuario?',
            text: "Una vez hecho esto el producto aparecera en el sistema",
            icon: 'success',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
          }).then((result) => {
            if (result.value) {
                habilitarar_productos(datos[0]);
            }
          })
}
function habilitarar_productos(datos)
{
        // console.log(datos);
        var NombreProceso = "HABILITARDATOS";
        var parametros = {  
                "NombreProceso":NombreProceso,
                "id":datos,
        };
                $.ajax({
                        data: parametros,
                        url: '../php/proceso.php',
                        type: 'POST',
                        beforeSend: function (){
                            // alert(datos)
                        }
                }).done(function(resp){
                    // alert(resp);
                    if(resp.trim()==1){
                        Swal.fire("Mensaje De Confirmacion","EL producto se habilito con exito","success")            
                            .then ( ( value ) =>  {
                                table.ajax.reload();
                            }); 
                    }else{
                        Swal.fire("Mensaje De Error","no se pudo completar","error");
                    }
                })

       
               
}
// registrar productos
 function registroproductos(){

    var nombre_p=$('#txt_nombre_producto').val();
    var cantidad_p=$('#txt_cantidad_producto').val();
    var stock_p=$('#txt_cantidad_stok_producto').val();
    var v_cantidad_p=$('#txt_venta_cantidad').val();
    var v_fecha_p=$('#txt_fecha_procuto').val();
    if(nombre_p.length==0 || cantidad_p.length==0 || stock_p.length==0 || v_cantidad_p.length==0 || v_fecha_p.length==0){
        return Swal.fire("Mensaje De Advertencia","Llene los campos vacios","warning");
    }
    // alert(nombre_p+"||"+cantidad_p+"||"+stock_p+"||"+v_cantidad_p+"||"+v_fecha_p);
     NombreProceso = "REGISTRARDATOS";
    var parametros = {
        "NombreProceso":NombreProceso,
        "nombre_p":nombre_p,
        "cantidad_p":cantidad_p,
        "stock_p":stock_p,
        "v_cantidad_p":v_cantidad_p,
        "v_fecha_p":v_fecha_p,
        
    };
    console.log(parametros);
    $.ajax({
            data : parametros,
            url : "../php/proceso.php",
            type : 'POST'
    }).done(function(resp){
        alert("envio :"+resp);
            if(resp.trim()==1){
                    $("#modal_registrar").modal('hide');
                    Swal.fire("Mensaje De Confirmacion","Datos ingresados correctamente","success")        
                    .then ( ( value ) =>{
                        table.ajax.reload();
                    }); 
            }else{
                Swal.fire("Mensaje De Error","no se pudo completar el registro","error");
            }

    });

 }

 function sessiones(){
    var usu_nombre=$("#txt_usuario").val();
    var usu_pas=$("#txt_con").val();
    if(usu_nombre.length==0 || usu_pas.length==0){
        return Swal.fire("Mensaje de abvertencia","los campos estan vacios","warning");
    }
    var NombreProceso = "SESSIONES";
    var data={
        "NombreProceso":NombreProceso,
        "usu_nombre":usu_nombre,
        "usu_pass":usu_pas
    };
    $.ajax({
        data:data,
        url:"../php/proceso.php",
        type:"POST"
    }).done(function(resp){
        // alert("recibe: "+resp);
         if(resp==0){
            Swal.fire("Mensaje De Error","Usuario y/o contrase\u00f1a incorrecta","error");
        }else{
            
            var data =JSON.parse(resp);
            // console.log(json);
            // if(data[0][5]==='INACTIVO'){
            //     return Swal.fire("Mensaje de abvertencia","Lo sentimos el usuario "+usu+" se encuentra inactivo","warning");
            // }
            $.ajax({
                url:'../php/crear_cession.php',
                type: 'post',
                data:{
                    "idusuario":data[0].id_user,
                    "user": data[0].nombre_user,
                    "pass":data[0].pass_user
                }
            }).done(function(resp){
                
                // alert(resp);
                let timerInterval
                Swal.fire({
                title: 'BIENVENIDO AL SISTEMA',
                html: 'USTED SERA REDIRECCIONADO EN <b></b> MILISEGUNDOS.',
                timer: 1000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading()
                    const b = Swal.getHtmlContainer().querySelector('b')
                    timerInterval = setInterval(() => {
                    b.textContent = Swal.getTimerLeft()
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
                }).then((result) => {
                
                if (result.dismiss === Swal.DismissReason.timer) {
                    location.reload();
                    // console.log('I was closed by the timer')
                }
                })
            })
            
        }
    })
    

 }

// FUNCIONES PARA LOS USUARIOS 
//  listar usuario
function  traerdatos_usuario(){
    var table=$('#tabla_usuarios').DataTable();
    var name=[];
    var marks=[];
    var NombreProceso="LISTARUSU"
    var data={
        "NombreProceso":NombreProceso,
    }
    $.ajax({
        data:data,
        url:'../php/proceso.php',
        type:'POST'
    }).done(function (resp){
        // alert(resp);
    var registros ="";    
    json = JSON.parse(resp);
            var registros="<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre usuario</th><th scope='col'>Telefono</th><th scope='col'>Pass</th> <th scope='col'>Email</th> <th scope='col'>Rol</th><th scope='col'>Estatus</th><th scope='col'>AC</th></tr></thead><tbody>";
    for (var i in json) {
        if(json[i].id_user==null ||json[i].nombre_user==null ||json[i].cell==null ||json[i].pass_user==null||json[i].correo==null||json[i].rol==null||json[i].estatus==null)
        {
        name.push("Sin Clasificar");
        json[i].id_user="Sin Clasificar";
        json[i].nombre_user="Sin Clasificar";
        json[i].cell="Sin Clasificar";
        json[i].pass_user="Sin Clasificar";
        json[i].correo="Sin Clasificar";
        json[i].rol="Sin Clasificar";
        json[i].estatus="Sin Clasificar";
        }
        else{
        name.push(json[i].id_user,json[i].nombre_user,json[i].cell,json[i].pass_user,json[i].correo,json[i].rol,json[i].estatus);
        }
        marks.push(json[i].id_user,json[i].nombre_user,json[i].cell,json[i].pass_user,json[i].correo,json[i].rol,json[i].estatus);

//  alert(json[i].CANTIDAD);
        var ac_botom=json[i].id_user+"||"+json[i].nombre_user +"||"+json[i].cell+"||"+json[i].pass_user+"||"+json[i].correo+"||"+json[i].rol+"||"+json[i].estatus;
        if(json[i].estatus=='ACTIVO'){
            
            var estatus ="<span class='label bg-success text-light rounded m-2'>"+json[i].estatus+"</span>";                   
        }else{
            var estatus ="<span class='label bg-danger text-light rounded m-2'>"+json[i].estatus+"</span>";                 
        }
        
     registros +='<tr><td>'+json[i].id_user+'</td><td>'+json[i].nombre_user+'</td><td>'+json[i].cell+'</td><td>'+json[i].pass_user+'</td><td>'+json[i].correo+'</td><td>'+json[i].rol+'</td><td>'+estatus+'</td><td><button style="font-size:10px;" type="button" class="editar btn btn-primary" onclick="editar_user(\''+ac_botom+'\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick=" modaleliminar_user(\''+ac_botom+'\')"><i class="fa fa-times"></i></button></button>&nbsp;<button style="font-size:10px;" type="button" class=" btn btn-success" onclick=" modalhabilitarusu(\''+ac_botom+'\')"><i class="fa fa-check"></i></button></td></tr>';
    }
    registros+="</tbody>";
    
    var fecha_datos=new Date();
    var fecha=fecha_datos.getFullYear()+"-"+fecha_datos.getMonth()+"-"+fecha_datos.getDay();
      table.destroy();
      $('#tabla_usuarios').html(registros);
    //   console.log("fecha2:  "+fecha_a);
      $('#tabla_usuarios').DataTable( {
                                          dom: 'Bfrtip',
                                          buttons: [
                                                {
                                                extend: 'copy', 
                                                text:'<i class="fa fa-clone fa-2x"></i>',
                                                title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                filename: 'REPORTE PRODCUTOS',
                                                exportOptions: {
                                                   columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                               },
                                               className: 'btn1 btn btn-primary',
                                                
                                              }, 
                                              {
                                                     extend: 'excel', 
                                                     text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-success',
                                                     
                                                   },
                                                   {
                                                    extend: 'pdf',
                                                    text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                                                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                    filename: 'REPORTE PRODCUTOS',
                                                    exportOptions: {
                                                       columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                   },
                                                   className: 'btn btn1 btn-danger',
                                                    
                                                  },  {
                                                     extend: 'print',
                                                     text:'<i class="fa fa-print fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-secondary ',
                                                   },
                                                   {
                                                    extend: 'colvis',
                                                    text:'Filtrar',
                                                    className: 'btn btn1 btn-secondary ',
                                                   
                                                  }
                                                   
                                          ]
          } ) 


})
}

// registro usuario
function registroUsuario(){

    var nombre=$('#txt_nombre').val();
    var pass=$('#txt_pass').val();
    var correo=$('#txt_email').val();
    var telefono=$('#txt_telefono').val();
    var roll=$('#txt_rol').val();
    
    if(nombre.length==0 || pass.length==0 || correo.length==0 || telefono.length==0 || roll.length==0){
        return Swal.fire("Mensaje De Advertencia","Llene los campos vacios","warning");
    }
    // alert(nombre_p+"||"+cantidad_p+"||"+stock_p+"||"+v_cantidad_p+"||"+v_fecha_p);
     NombreProceso = "REGISTRARDATOSUSUARIO";
    var parametros = {
        "NombreProceso":NombreProceso,
        "nombre":nombre,
        "pass":pass,
        "correo":correo,
        "telefono":telefono,
        "roll":roll
    };
    console.log(parametros);
    $.ajax({
            data : parametros,
            url : "../php/proceso.php",
            type : 'POST'
    }).done(function(resp){
        alert("envio :"+resp);
            if(resp.trim()==1){
                    $("#modal_registrar_user").modal('hide');
                    Swal.fire("Mensaje De Confirmacion","Datos ingresados correctamente","success")        
                    .then ( ( value ) =>{
                        table.ajax.reload();
                    }); 
            }else{
                Swal.fire("Mensaje De Error","no se pudo completar el registro","error");
            }

    });

 }

//  listar usu habilitado

function traerdatos_usuario_habilitados(){
    // alert("entro")
      var table=$('#tabla_usuarios_habilitados').DataTable();
   
    var name = [];
    var marks = [];
   //  var rotulo="";
       var NombreProceso = "CARGARDATOSHABILITADOSUSU";
       var parametros = {  
       "NombreProceso":NombreProceso,
       
       };
    // alert("aqer"+estado);
    $.ajax({
        data:parametros,
        url:'../php/proceso.php',
        type:'POST'
    }).done(function (resp){
        // alert(resp);
    var registros ="";    
    json = JSON.parse(resp);
            var registros="<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre usuario</th><th scope='col'>Telefono</th><th scope='col'>Pass</th> <th scope='col'>Email</th> <th scope='col'>Rol</th><th scope='col'>Estatus</th><th scope='col'>AC</th></tr></thead><tbody>";
    for (var i in json) {
        if(json[i].id_user==null ||json[i].nombre_user==null ||json[i].cell==null ||json[i].pass_user==null||json[i].correo==null||json[i].rol==null||json[i].estatus==null)
        {
        name.push("Sin Clasificar");
        json[i].id_user="Sin Clasificar";
        json[i].nombre_user="Sin Clasificar";
        json[i].cell="Sin Clasificar";
        json[i].pass_user="Sin Calificar";
        json[i].correo="Sin Clasificar";
        json[i].rol="Sin Clasificar";
        json[i].estatus="Sin Clasificar";
        }
        else{
        name.push(json[i].id_user,json[i].nombre_user,json[i].cell,json[i].pass_user,json[i].correo,json[i].rol,json[i].estatus);
        }
        marks.push(json[i].id_user,json[i].nombre_user,json[i].cell,json[i].pass_user,json[i].correo,json[i].rol,json[i].estatus);

//  alert(json[i].CANTIDAD);
        var ac_botom=[json[i].id_user+"||"+json[i].nombre_user +"||"+json[i].cell+"||"+json[i].pass_user+"||"+json[i].correo+"||"+json[i].rol+"||"+json[i].estatus];
        if(json[i].estatus=='ACTIVO'){
            
            var estatus ="<span class='label bg-success text-light rounded m-2'>"+json[i].estatus+"</span>";                   
        }else{
            var estatus ="<span class='label bg-danger text-light rounded m-2'>"+json[i].estatus+"</span>";                 
        }

     registros +="<tr><td>"+json[i].id_user+"</td><td>"+json[i].nombre_user+"</td><td>"+json[i].cell+"</td><td>"+json[i].pass_user+"</td><td>"+json[i].correo+"</td><td>"+json[i].rol+"</td><td>"+estatus+"</td><td><button style='font-size:10px;' type='button'  class='editar btn btn-primary' onclick='editar_productos(\'"+ac_botom+"\')'><i class='fa fa-edit'></i></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-danger' onclick=' modaleliminar(\'"+ac_botom+"\')'><i class='fa fa-times'></i></button></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-success' onclick=' modalhabilitar(\'"+ac_botom+"\')'><i class='fa fa-check'></i></button></td></tr>";
    }
    registros+="</tbody>";
                                var fecha_datos=new Date();
                                var fecha=fecha_datos.getFullYear()+"-"+fecha_datos.getMonth()+"-"+fecha_datos.getDay();
                                  table.destroy();
                                  $('#tabla_usuarios_habilitados').html(registros);
                                //   console.log("fecha2:  "+fecha_a);
                                  $('#tabla_usuarios_habilitados').DataTable( {
                                          dom: 'Bfrtip',
                                          buttons: [
                                                {
                                                extend: 'copy', 
                                                text:'<i class="fa fa-clone fa-2x"></i>',
                                                title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                filename: 'REPORTE PRODCUTOS',
                                                exportOptions: {
                                                   columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                               },
                                               className: 'btn1 btn btn-primary',
                                                
                                              }, 
                                              {
                                                     extend: 'excel', 
                                                     text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-success',
                                                     
                                                   },
                                                   {
                                                    extend: 'pdf',
                                                    text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                                                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                    filename: 'REPORTE PRODCUTOS',
                                                    exportOptions: {
                                                       columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                   },
                                                   className: 'btn btn1 btn-danger',
                                                    
                                                  },  {
                                                     extend: 'print',
                                                     text:'<i class="fa fa-print fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-secondary ',
                                                   },
                                                   {
                                                    extend: 'colvis',
                                                    text:'Filtrar',
                                                    className: 'btn btn1 btn-secondary ',
                                                   
                                                  }
                                                   
                                          ]
                                      } ) 


})
}

// listar usu deshabilitados
function traerdatos_usuario_deshabilitados(){
    // alert("entro")
      var table=$('#tabla_usuarios_deshabilitados').DataTable();
   
    var name = [];
    var marks = [];
   //  var rotulo="";
       var NombreProceso = "CARGARDATOSDESHABILITADOSUSU";
       var parametros = {  
       "NombreProceso":NombreProceso,
       
       };
    // alert("aqer"+estado);
    $.ajax({
        data:parametros,
        url:'../php/proceso.php',
        type:'POST'
    }).done(function (resp){
        // alert(resp);
    var registros ="";    
    json = JSON.parse(resp);
            var registros="<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre usuario</th><th scope='col'>Telefono</th><th scope='col'>Pass</th> <th scope='col'>Email</th> <th scope='col'>Rol</th><th scope='col'>Estatus</th><th scope='col'>AC</th></tr></thead><tbody>";
    for (var i in json) {
        if(json[i].id_user==null ||json[i].nombre_user==null ||json[i].cell==null ||json[i].pass_user==null||json[i].correo==null||json[i].rol==null||json[i].estatus==null)
        {
        name.push("Sin Clasificar");
        json[i].id_user="Sin Clasificar";
        json[i].nombre_user="Sin Clasificar";
        json[i].cell="Sin Clasificar";
        json[i].pass_user="Sin Calificar";
        json[i].correo="Sin Clasificar";
        json[i].rol="Sin Clasificar";
        json[i].estatus="Sin Clasificar";
        }
        else{
        name.push(json[i].id_user,json[i].nombre_user,json[i].cell,json[i].pass_user,json[i].correo,json[i].rol,json[i].estatus);
        }
        
        console.log("esto es estatus"+estatus);
        marks.push(json[i].id_user,json[i].nombre_user,json[i].cell,json[i].pass_user,json[i].correo,json[i].rol,json[i].estatus);

//  alert(json[i].CANTIDAD);
        var ac_botom=[json[i].id_user+"||"+json[i].nombre_user +"||"+json[i].cell+"||"+json[i].pass_user+"||"+json[i].correo+"||"+json[i].rol+"||"+json[i].estatus];
        if(json[i].estatus=='ACTIVO'){
            
            var estatus ="<span class='label bg-success text-light rounded m-2'>"+json[i].estatus+"</span>";                   
        }else{
            var estatus ="<span class='label bg-danger text-light rounded m-2'>"+json[i].estatus+"</span>";                 
        }

     registros +="<tr><td>"+json[i].id_user+"</td><td>"+json[i].nombre_user+"</td><td>"+json[i].cell+"</td><td>"+json[i].pass_user+"</td><td>"+json[i].correo+"</td><td>"+json[i].rol+"</td><td>"+estatus+"</td><td><button style='font-size:10px;' type='button'  class='editar btn btn-primary' onclick='editar_productos(\'"+ac_botom+"\')'><i class='fa fa-edit'></i></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-danger' onclick=' modaleliminar(\'"+ac_botom+"\')'><i class='fa fa-times'></i></button></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-success' onclick=' modalhabilitar(\'"+ac_botom+"\')'><i class='fa fa-check'></i></button></td></tr>";
    }
    registros+="</tbody>";
                                var fecha_datos=new Date();
                                var fecha=fecha_datos.getFullYear()+"-"+fecha_datos.getMonth()+"-"+fecha_datos.getDay();
                                  table.destroy();
                                  $('#tabla_usuarios_deshabilitados').html(registros);
                                //   console.log("fecha2:  "+fecha_a);
                                  $('#tabla_usuarios_deshabilitados').DataTable( {
                                          dom: 'Bfrtip',
                                          buttons: [
                                                {
                                                extend: 'copy', 
                                                text:'<i class="fa fa-clone fa-2x"></i>',
                                                title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                filename: 'REPORTE PRODCUTOS',
                                                exportOptions: {
                                                   columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                               },
                                               className: 'btn1 btn btn-primary',
                                                
                                              }, 
                                              {
                                                     extend: 'excel', 
                                                     text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-success',
                                                     
                                                   },
                                                   {
                                                    extend: 'pdf',
                                                    text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                                                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                    filename: 'REPORTE PRODCUTOS',
                                                    exportOptions: {
                                                       columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                   },
                                                   className: 'btn btn1 btn-danger',
                                                    
                                                  },  {
                                                     extend: 'print',
                                                     text:'<i class="fa fa-print fa-2x"></i>',
                                                     title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                                                     filename: 'REPORTE PRODCUTOS',
                                                     exportOptions: {
                                                        columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                                                    },
                                                    className: 'btn btn1 btn-secondary ',
                                                   },
                                                   {
                                                    extend: 'colvis',
                                                    text:'Filtrar',
                                                    className: 'btn btn1 btn-secondary ',
                                                   
                                                  }
                                                   
                                          ]
                                      } ) 


})
}
// editar productos
function editar_user(parametros)
{
    alert(parametros);
    $('#tabla_usuarios').on('click','.editar',function(){
    var datos=parametros.split("||");
        $('#modal_editar_user').modal('show');
        $('#txt_id_editar_usu').val(datos[0]);
        $('#txt_nombre_editar').val(datos[1]);
    	$('#txt_pass_editar').val(datos[3]);
    	$('#txt_email_editar').val(datos[4]);
        $('#txt_telefono_editar').val(datos[2]);
        $('#txt_rol_editar').val(datos[5]);
        // $('#txt_estatus_editar').val(datos[6]);
    })
}
function actualiza_user()
{
    var id=$('#txt_id_editar_usu').val();
    var nombreusu=$('#txt_nombre_editar').val();
	var pass=$('#txt_pass_editar').val();
	var email=$('#txt_email_editar').val();
    var cell=$('#txt_telefono_editar').val();
    var rol=$('#txt_rol_editar').val();
    // var estatus=$('#txt_estatus_editar').val();
        NombreProceso = "ACTUALIZAUSUARIO";
        var parametros = {  
                "NombreProceso":NombreProceso,
                "id":id,
                "nombreusu":nombreusu,
                "pass":pass,
                "email":email,
                "cell":cell,
                "rol":rol
                // "estatus":estatus
        };
                $.ajax({
                        data: parametros,
                        url: "../php/proceso.php",
                        type: 'post'
                }).done(function(resp){
                    alert(resp);
                    if(resp.trim()==1){
                        // TraerDatosUsuario();
                            $("#modal_editar_user").modal('hide');
                            Swal.fire("Mensaje De Confirmacion","Datos actualizados correctamente","success")            
                            .then ( ( value ) =>  {
                                table.ajax.reload();
                            }); 
                       
                    }else{
                        Swal.fire("Mensaje De Error","no se pudo completar la actualizacion","error");
                    }
                });
               
}
// ELIMINAR DATOS////////////////
function modaleliminar_user(id){
    // alert("midal habilitar:"+id[0]);
        var datos=id.split("||");
        Swal.fire({
            title: 'Esta seguro de desactivar al usuario?',
            text: "Una vez hecho esto el usuario no tendra acceso al sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
          }).then((result) => {
            if (result.value) {
                Modificar_Estatus(datos[0],'INACTIVO');
            }
          })
}
// function eliminar_productos(datos)
// {
//         // console.log(datos);
//         var NombreProceso = "ELIMINARDATOSUSU";
//         var parametros = {  
//                 "NombreProceso":NombreProceso,
//                 "id":datos,
//         };
//                 $.ajax({
//                         data: parametros,
//                         url: '../php/proceso.php',
//                         type: 'POST',
//                         beforeSend: function (){
//                             // alert(datos)
//                         }
//                 }).done(function(resp){
//                     // alert(resp);
//                     if(resp.trim()==1){
//                         Swal.fire("Mensaje De Confirmacion","ELUusuario se elimino con exito","success")            
//                             .then ( ( value ) =>  {
//                                 table.ajax.reload();
//                             }); 
//                     }else{
//                         Swal.fire("Mensaje De Error","no se pudo completar la eliminarcion","error");
//                     }
//                 })

       
               
// }
// habilitar datos
function modalhabilitarusu(id){
    // alert("midal habilitar:"+id[0]);
        var datos=id.split("||");
        Swal.fire({
            title: 'Esta seguro de activar al usuario?',
            text: "Una vez hecho esto el usuario aparecera en el sistema",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
          }).then((result) => {
            if (result.value) {
                Modificar_Estatus(datos[0],'ACTIVO');
            }
          })
}
// function habilitarar_usu(datos)
// {
//         // console.log(datos);
//         var NombreProceso = "HABILITARDATOSUSU";
//         var parametros = {  
//                 "NombreProceso":NombreProceso,
//                 "id":datos,
//         };
//                 $.ajax({
//                         data: parametros,
//                         url: '../php/proceso.php',
//                         type: 'POST',
//                         beforeSend: function (){
//                             // alert(datos)
//                         }
//                 }).done(function(resp){
//                     alert(resp);
//                     if(resp.trim()==1){
//                         Swal.fire("Mensaje De Confirmacion","EL producto se habilito con exito",               "success")            
//                             .then ( ( value ) =>  {
//                                 table.ajax.reload();
//                             }); 
//                     }else{
//                         Swal.fire("Mensaje De Error","no se pudo completar","error");
//                     }
//                 })
//}

// combo rol

function listar_combo_rol(){
    var name=[];
    var marks=[];
    NombreProceso="LISTARROL";
    var proceso={
        "NombreProceso":NombreProceso,
    }
    $.ajax({
        data:proceso,
        url:"../php/proceso.php",
        type:'post'
    }).done(function(resp){
        // alert(resp);
        var json= JSON.parse(resp);
        var cadena="";
        for (var i in json) {
            if(json[i].id_rol==null || json[i].nombre_rol==null )
            {
            name.push("Sin Clasificar");
            json[i].id_rol="Sin Clasificar";
            json[i].nombre_rol="Sin Clasificar";
            }
            else{
            name.push(json[i].id_rol,json[i].nombre_rol);
            }
            // marks.push(json[i].id_rol,json[i].nombre_rol);

            if(json.length>0){
                    cadena+="<option value='"+json[i].nombre_rol+"'>"+json[i].nombre_rol+"</option>";
                $("#txt_rol").html(cadena);
                $("#txt_rol_editar").html(cadena);

            } else{
                cadena+="<option value=''>NO SE ENCONTRARON REGISTROS</option>";
                $("#txt_rol").html(cadena);
                $("#txt_rol_editar").html(cadena);
            }
    }
    })
}

function Modificar_Estatus(idusuario,estatus){
    // alert(idusuario+"||"+estatus);
    NombreProceso="MODIFICAR_ESTATUS";
    var mensaje="";
    if(estatus=='INACTIVO'){
        mensaje="desactivo";
    }else{
        mensaje="activo";
    }
    $.ajax({
        "url":"../php/proceso.php",
        type:'POST',
        data:{
            "NombreProceso":NombreProceso,
            idusuario:idusuario,
            estatus:estatus
        }
    }).done(function(resp){
        // alert("modificar estatus"+resp);
        if(resp>0){
            Swal.fire("Mensaje De Confirmacion","EL usuario se "+mensaje+" con exito","success")            
                .then ( ( value ) =>  {
                    table.ajax.reload();
                }); 
        }
    })
}

// FUNCIONES DE MODULOS

// CREAR NODULO
function crearmodulo(){
    var nombre_modulo=$('#txt_nombre_modulo').val();
    var posicion_modulo=$('#txt_posicion_modulo').val();
    var icono=$('#txt_icono').val();
   
    if(nombre_modulo.length==0 || posicion_modulo.length==0 || icono.length==0 ){
        return Swal.fire("Mensaje De Advertencia","Llene los campos vacios","warning");
    }
    // alert(nombre_p+"||"+cantidad_p+"||"+stock_p+"||"+v_cantidad_p+"||"+v_fecha_p);
     NombreProceso = "CREARMODULO";
    var parametros = {
        "NombreProceso":NombreProceso,
        "nombre_modulo":nombre_modulo,
        "posicion_modulo":posicion_modulo,
        "icono":icono,
    }
    // console.log(parametros);
    $.ajax({
            data : parametros,
            url : "../php/proceso.php",
            type : 'POST'
    }).done(function(resp){
        alert("envio :"+resp);
            if(resp.trim()==1){
                    $("#registrar_modulo").modal('hide');
                    Swal.fire("Mensaje De Confirmacion","Datos ingresados correctamente","success")        
                    .then ( ( value ) =>{
                        table.ajax.reload();
                    }); 
            }else{
                Swal.fire("Mensaje De Error","no se pudo completar el registro","error");
            }

    });
}

// TRAER DATOS MODULOS
function  traerdatos_modulo(){
    var table=$('#tabla_modulo').DataTable();
    var name=[];
    var marks=[];
    var NombreProceso="TABLAMODULO"
    var data={
        "NombreProceso":NombreProceso,
    }
    $.ajax({
        data:data,
        url:'../php/proceso.php',
        type:'POST'
    }).done(function (resp){
        // alert(resp);
    var registros ="";    
    json = JSON.parse(resp);
            var registros="<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre modulo</th><th scope='col'>Posicion</th><th scope='col'>estatus</th><th scope='col'>icono</th><th scope='col'>AC</th></tr></thead><tbody>";
    for (var i in json) {
        if(json[i].idmodulo==null ||json[i].nombre_modulo==null ||json[i].orden==null ||json[i].estatus==null||json[i].icono==null)
        {
        name.push("Sin Clasificar");
        json[i].idmodulo="Sin Clasificar";
        json[i].nombre_modulo="Sin Clasificar";
        json[i].orden="Sin Clasificar";
        json[i].estatus="Sin Clasificar";
        json[i].icono="Sin Clasificar";
       
        }
        else{
        name.push(json[i].idmodulo,json[i].nombre_modulo,json[i].orden,json[i].estatus,json[i].icono);
        }
        marks.push(json[i].idmodulo,json[i].nombre_modulo,json[i].orden,json[i].estatus,json[i].icono);

//  alert(json[i].CANTIDAD);
        var ac_botom=json[i].idmodulo+"||"+json[i].nombre_modulo +"||"+json[i].orden+"||"+json[i].estatus+"||"+json[i].icono;
        // if(json[i].estatus=='ACTIVO'){
            
        //     var estatus ="<span class='label bg-success text-light rounded m-2'>"+json[i].estatus+"</span>";                   
        // }else{
        //     var estatus ="<span class='label bg-danger text-light rounded m-2'>"+json[i].estatus+"</span>";                 
        // }
        
     registros +='<tr><td>'+json[i].idmodulo+'</td><td>'+json[i].nombre_modulo+'</td><td>'+json[i].orden+'</td><td>'+json[i].estatus+'</td><td>'+json[i].icono+'</td><td><button style="font-size:10px;" type="button" class="editar btn btn-primary" onclick="editar_user(\''+ac_botom+'\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick=" modaleliminar_user(\''+ac_botom+'\')"><i class="fa fa-times"></i></button></button>&nbsp;<button style="font-size:10px;" type="button" class=" btn btn-success" onclick=" modalhabilitarusu(\''+ac_botom+'\')"><i class="fa fa-check"></i></button></td></tr>';
    }
    registros+="</tbody>";
    
    var fecha_datos=new Date();
    var fecha=fecha_datos.getFullYear()+"-"+fecha_datos.getMonth()+"-"+fecha_datos.getDay();
      table.destroy();
      $('#tabla_modulo').html(registros);
    //   console.log("fecha2:  "+fecha_a);
      $('#tabla_modulo').DataTable( {
         dom: 'Bfrtip',
         buttons: [
               {
               extend: 'copy', 
               text:'<i class="fa fa-clone fa-2x"></i>',
               title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
               filename: 'REPORTE PRODCUTOS',
               exportOptions: {
                  columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
              },
              className: 'btn1 btn btn-primary',
               
             }, 
             {
                    extend: 'excel', 
                    text:'<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                       columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                   },
                   className: 'btn btn1 btn-success',
                    
                  },
                  {
                   extend: 'pdf',
                   text:'<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                   title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                   filename: 'REPORTE PRODCUTOS',
                   exportOptions: {
                      columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                  },
                  className: 'btn btn1 btn-danger',
                   
                 },  {
                    extend: 'print',
                    text:'<i class="fa fa-print fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :'+fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                       columns: [0,1,2,3,4,5,6] //exportar solo la primera y segunda columna
                   },
                   className: 'btn btn1 btn-secondary ',
                  },
                  {
                   extend: 'colvis',
                   text:'Filtrar',
                   className: 'btn btn1 btn-secondary ',
                  
                 }
                  
         ]
          } ) 


})
}
