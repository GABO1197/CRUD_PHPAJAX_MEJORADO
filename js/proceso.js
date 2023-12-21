
// buscar por fecha
function informeacciones() {
    // alert("entro")
    var table = $('#tabla2').DataTable();
    var fecha1 = $('#fecha1etapa').val();
    var fecha2 = $('#fecha2etapa').val();
    var etapas = $('#etapas').val();
    var rotulo = fecha1 + " - " + fecha2 + "  | " + etapas;
    var name = [];
    var marks = [];
    var color = ['#ffe4e1', '#d8f8e1', '#fcb7af', '#b0f2c2', '#b0c2f2'];
    var bordercolor = ['#ff6961', '#77dd77', '#fdfd96', '#84b6f4', '#fdcae1'];
    var NombreProceso = "REPORTEETAPASACCIONES";
    var parametros = {
        "NombreProceso": NombreProceso,
        "etapas": etapas,
        "fecha1": fecha1,
        "fecha2": fecha2,
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
            var registros = "";
            json = JSON.parse(response);
            var totalvalores = 0;
            var promedio = 0;
            for (var i in json) {
                totalvalores = parseFloat(totalvalores) + parseFloat(json[i].CANTIDAD);
            }
            for (var i in json) {
                if (json[i].nombre == null) {
                    name.push("Sin Clasificar");
                    json[i].nombre = "Sin Clasificar";


                }
                else {
                    name.push(json[i].nombre);
                }
                marks.push(json[i].CANTIDAD);
                //  alert(json[i].CANTIDAD);
                promedio = Math.round((parseFloat(json[i].CANTIDAD) / totalvalores) * 1000) / 10;
                var registros = registros + '<tr id=' + json[i].nombre + '><td >' + json[i].nombre + '<td>' + json[i].CANTIDAD + '</td><td>' + promedio + '(%)</td></tr>';

            }
            //  alert("Guardo "+response);

            table.destroy();
            $('#tabla2 tbody').html(registros);
            $('#tabla2 ').DataTable({
                pageLength: 3,
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        text: '<i class="fa fa-clone fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn1 btn btn-primary',

                    },
                    {
                        extend: 'excel',
                        text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-success',

                    },
                    {
                        extend: 'pdf',
                        text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-danger',

                    }, {
                        extend: 'print',
                        text: '<i class="fa fa-print fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :',
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-secondary ',
                    },
                    {
                        extend: 'colvis',
                        text: 'Filtrar',
                        className: 'btn btn1 btn-secondary ',

                    }
                ]
            });
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
function informeacciones_cargarauto() {
    var name = [];
    var marks = [];
    var color = ['#ffe4e1', '#d8f8e1', '#fcb7af', '#b0f2c2', '#b0c2f2'];
    var bordercolor = ['#ff6961', '#77dd77', '#fdfd96', '#84b6f4', '#fdcae1'];
    var NombreProceso = "REPORTEETAPASACCIONES_auto";
    var parametros = {
        "NombreProceso": NombreProceso
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
            var totalvalores = 0;
            var promedio = 0;
            for (var i in json) {
                otalvalores = parseFloat(totalvalores) + parseFloat(json[i].cantidad);
            }
            for (var i in json) {
                if (json[i].nombre == null) {
                    name.push("Sin Clasificar");
                    json[i].nombre = "Sin Clasificar";
                }
                else {
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
function traerdatos() {
    // alert("entro")
    var table = $('#tabla_productos').DataTable();
    var name = [];
    var marks = [];
    //  var rotulo="";
    var NombreProceso = "CARGARDATOS";
    var parametros = {
        "NombreProceso": NombreProceso,

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
            var registros = "";
            json = JSON.parse(response);
            var totalvalores = 0;
            var promedio = 0;
            for (var i in json) {
                totalvalores = parseFloat(totalvalores) + parseFloat(json[i].vanta_cantidad);
            }
            json = JSON.parse(response);
            var registros = "<thead><tr><th scope='col'>#</th> <th scope='col'>Nombre Producto</th> <th scope='col'>Cantidad</th><th scope='col'>Stock</th><th scope='col'>Venta cantidad</th><th scope='col'>Porcentaje de ventas</th> <th scope='col'>Venta Fecha</th><th scope='col'>AC</th></tr></thead><tbody>";
            for (var i in json) {
                if (json[i].id == null || json[i].nombre == null || json[i].cantidad == null || json[i].stok == null || json[i].vanta_cantidad == null || json[i].venta_fecharegistro == null) {
                    name.push("Sin Clasificar");
                    json[i].id = "Sin Clasificar";
                    json[i].nombre = "Sin Clasificar";
                    json[i].cantidad = "Sin Clasificar";
                    json[i].stok = "Sin Clasificar";
                    json[i].vanta_cantidad = "Sin Clasificar";
                    json[i].venta_fecharegistro = "Sin Clasificar";

                }
                else {
                    name.push(json[i].id, json[i].nombre, json[i].cantidad, json[i].stok, json[i].vanta_cantidad, json[i].venta_fecharegistro);
                }
                marks.push(json[i].id, json[i].nombre, json[i].cantidad, json[i].stok, json[i].vanta_cantidad, json[i].venta_fecharegistro);

                //  alert(json[i].CANTIDAD);
                var ac_botom = [json[i].id + "||" + json[i].nombre + "||" + json[i].cantidad + "||" + json[i].stok + "||" + json[i].vanta_cantidad + "||" + json[i].venta_fecharegistro];

                promedio = Math.round((parseFloat(json[i].vanta_cantidad) / totalvalores) * 1000) / 10;
                registros += '<tr><td>' + json[i].id + '</td><td>' + json[i].nombre + '</td><td>' + json[i].cantidad + '</td><td>' + json[i].stok + '</td><td>' + json[i].vanta_cantidad + '</td><td>' + promedio + '(%)</td><td>' + json[i].venta_fecharegistro + '</td><td><button style="font-size:10px;" type="button"  class="editar btn btn-primary" onclick="editar_productos(\'' + ac_botom + '\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick=" modaleliminar(\'' + ac_botom + '\')"><i class="fa fa-times"></i></button></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-success" onclick=" modalhabilitar(\'' + ac_botom + '\')"><i class="fa fa-check"></i></button></td></tr>';


            }
            registros += '</tbody><tfoot><tr><th class="col bg-success text-light">Totales :</th><td class=" col bg-success text-light"></td><td class=" col bg-success text-light" ></td><td class="col bg-success text-light"></td><td class=" col bg-success text-light">' + totalvalores + '</td><td class=" col bg-success text-light"></td><td class=" col bg-success text-light"></td><td class=" col bg-success text-light"></td></tr></tfoot>';


            var fecha_datos = new Date();
            var fecha = fecha_datos.getFullYear() + "-" + fecha_datos.getMonth() + "-" + fecha_datos.getDay();
            table.destroy();
            $('#tabla_productos').html(registros);
            //   console.log("fecha2:  "+fecha_a);
            $('#tabla_productos').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        text: '<i class="fa fa-clone fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn1 btn btn-primary',

                    },
                    {
                        extend: 'excel',
                        text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-success',

                    },
                    {
                        extend: 'pdf',
                        text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-danger',

                    }, {
                        extend: 'print',
                        text: '<i class="fa fa-print fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-secondary ',
                    },
                    {
                        extend: 'colvis',
                        text: 'Filtrar',
                        className: 'btn btn1 btn-secondary ',

                    }

                ]
            })
        }
    });
}
// datos habilitados
function traerdatoshabilitado() {
    // alert("entro")
    var table = $('#tabla_productos_habilitados').DataTable();

    var name = [];
    var marks = [];
    //  var rotulo="";
    var NombreProceso = "CARGARDATOSHABILITADOS";
    var parametros = {
        "NombreProceso": NombreProceso,

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
            var registros = "";
            json = JSON.parse(response);
            var totalvalores = 0;
            var promedio = 0;
            var sumatoria = 0;
            var totalsum = 0;
            for (var i in json) {
                totalvalores = parseFloat(totalvalores) + parseFloat(json[i].vanta_cantidad);
            }
            json = JSON.parse(response);
            var registros = "<thead><tr><th scope='col'>#</th> <th scope='col'>Nombre Producto</th> <th scope='col'>Cantidad</th><th scope='col'>Stock</th><th scope='col'>Venta cantidad</th><th scope='col'>Porcentaje de ventas</th> <th scope='col'>Venta Fecha</th><th scope='col'>AC</th></tr></thead><tbody>";
            for (var i in json) {
                if (json[i].id == null || json[i].nombre == null || json[i].cantidad == null || json[i].stok == null || json[i].vanta_cantidad == null || json[i].venta_fecharegistro == null) {
                    name.push("Sin Clasificar");
                    json[i].id = "Sin Clasificar";
                    json[i].nombre = "Sin Clasificar";
                    json[i].cantidad = "Sin Clasificar";
                    json[i].stok = "Sin Clasificar";
                    json[i].vanta_cantidad = "Sin Clasificar";
                    json[i].venta_fecharegistro = "Sin Clasificar";
                }
                else {
                    name.push(json[i].id, json[i].nombre, json[i].cantidad, json[i].stok, json[i].vanta_cantidad, json[i].venta_fecharegistro);
                }
                marks.push(json[i].id, json[i].nombre, json[i].cantidad, json[i].stok, json[i].vanta_cantidad, json[i].venta_fecharegistro);

                //  alert(json[i].CANTIDAD);
                var ac_botom = json[i].id + "||" + json[i].nombre + "||" + json[i].cantidad + "||" + json[i].stok + "||" + json[i].vanta_cantidad + "||" + json[i].venta_fecharegistro;
                promedio = Math.round((parseFloat(json[i].vanta_cantidad) / totalvalores) * 1000) / 10;
                registros += '<tr><td>' + json[i].id + '</td><td>' + json[i].nombre + '</td><td>' + json[i].cantidad + '</td><td>' + json[i].stok + '</td><td>' + json[i].vanta_cantidad + '</td><td>' + promedio + '(%)</td><td>' + json[i].venta_fecharegistro + '</td><td><button style="font-size:10px;" type="button"  class="editar btn btn-primary" onclick="editar_productos(\'' + ac_botom + '\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick=" modaleliminar(\'' + ac_botom + '\')"><i class="fa fa-times"></i></button></td></tr>';
                var fecha_ac = json[i].fecha_p;

            }
            registros += "</tbody><tfoot><tr><th class='col bg-success'>Totales :</th><td class=' col bg-success'></td><td class=' col bg-success' ></td><td class='col bg-success'></td><td class=' col text-ligth bg-success'>" + totalvalores + "</td><td class=' col bg-success'></td><td class=' col bg-success'></td><td class=' col bg-success'></td></tr></tfoot>";
            fecha_a = fecha_ac;
            //   console.log("Guardo "+registros);

            table.destroy();
            $('#tabla_productos_habilitados').html(registros);
            $('#tabla_productos_habilitados').DataTable({
                dom: 'Bfrtip',
                //   buttons:{
                //         className:'btn btn-primary'
                //   },
                buttons: [
                    {
                        extend: 'copy',
                        text: '<i class="fa fa-clone fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn1 btn btn-primary',

                    },
                    {
                        extend: 'excel',
                        text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-success',

                    },
                    {
                        extend: 'pdf',
                        text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-danger',

                    }, {
                        extend: 'print',
                        text: '<i class="fa fa-print fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-secondary ',
                    },
                    {
                        extend: 'colvis',
                        text: 'Filtrar',
                        className: 'btn btn1 btn-secondary ',

                    }

                ]
            });
        }
    });
}

function traerdatosdeshabilitado() {
    // alert("entro")
    var table = $('#tabla_productos_deshabilitados').DataTable();

    var name = [];
    var marks = [];
    //  var rotulo="";
    var NombreProceso = "CARGARDATOSDESHABILITADOS";
    var parametros = {
        "NombreProceso": NombreProceso,

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
            var registros = "";
            json = JSON.parse(response);
            var totalvalores = 0;
            var promedio = 0;
            var sumatoria = 0;
            var totalsum = 0;
            for (var i in json) {
                totalvalores = parseFloat(totalvalores) + parseFloat(json[i].vanta_cantidad);
            }
            json = JSON.parse(response);
            var registros = "<thead><tr><th scope='col'>#</th> <th scope='col'>Nombre Producto</th> <th scope='col'>Cantidad</th><th scope='col'>Stock</th><th scope='col'>Venta cantidad</th><th scope='col'>Porcentaje de ventas</th> <th scope='col'>Venta Fecha</th><th scope='col'>AC</th></tr></thead><tbody>";
            for (var i in json) {
                if (json[i].id == null || json[i].nombre == null || json[i].cantidad == null || json[i].stok == null || json[i].vanta_cantidad == null || json[i].venta_fecharegistro == null) {
                    name.push("Sin Clasificar");
                    json[i].id = "Sin Clasificar";
                    json[i].nombre = "Sin Clasificar";
                    json[i].cantidad = "Sin Clasificar";
                    json[i].stok = "Sin Clasificar";
                    json[i].vanta_cantidad = "Sin Clasificar";
                    json[i].venta_fecharegistro = "Sin Clasificar";
                }
                else {
                    name.push(json[i].id, json[i].nombre, json[i].cantidad, json[i].stok, json[i].vanta_cantidad, json[i].venta_fecharegistro);
                }
                marks.push(json[i].id, json[i].nombre, json[i].cantidad, json[i].stok, json[i].vanta_cantidad, json[i].venta_fecharegistro);

                //  alert(json[i].CANTIDAD);
                var ac_botom = json[i].id + "||" + json[i].nombre + "||" + json[i].cantidad + "||" + json[i].stok + "||" + json[i].vanta_cantidad + "||" + json[i].venta_fecharegistro;
                promedio = Math.round((parseFloat(json[i].vanta_cantidad) / totalvalores) * 1000) / 10;
                registros += '<tr><td>' + json[i].id + '</td><td>' + json[i].nombre + '</td><td>' + json[i].cantidad + '</td><td>' + json[i].stok + '</td><td>' + json[i].vanta_cantidad + '</td><td>' + promedio + '(%)</td><td>' + json[i].venta_fecharegistro + '</td><td><button style="font-size:10px;" type="button"  class="editar btn btn-primary" onclick="editar_productos(\'' + ac_botom + '\')"><i class="fa fa-edit"></i></button>&nbsp;</button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-success" onclick=" modalhabilitar(\'' + ac_botom + '\')"><i class="fa fa-check"></i></button></td></tr>';
                var fecha_ac = json[i].fecha_p;

            };
            registros += "</tbody><tfoot><tr><th class='col bg-success'>Totales :</th><td class=' col bg-success'></td><td class=' col bg-success' ></td><td class='col bg-success'></td><td class=' col text-ligth bg-success'>" + totalvalores + "</td><td class=' col bg-success'></td><td class=' col bg-success'></td><td class=' col bg-success'></td></tr></tfoot>";
            fecha_a = fecha_ac;

            //   console.log("Guardo "+registros);

            table.destroy();
            $('#tabla_productos_deshabilitados').html(registros);
            $('#tabla_productos_deshabilitados').DataTable({
                dom: 'Bfrtip',
                //   buttons:{
                //         className:'btn btn-primary'
                //   },
                buttons: [
                    {
                        extend: 'copy',
                        text: '<i class="fa fa-clone fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn1 btn btn-primary',

                    },
                    {
                        extend: 'excel',
                        text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-success',

                    },
                    {
                        extend: 'pdf',
                        text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-danger',

                    },
                    {
                        extend: 'print',
                        text: '<i class="fa fa-print fa-2x"></i>',
                        title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha_a,
                        filename: 'REPORTE PRODCUTOS',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                        },
                        className: 'btn btn1 btn-secondary ',
                    },
                    {
                        extend: 'colvis',
                        text: 'Filtrar',
                        className: 'btn btn1 btn-secondary ',

                    }

                ]
            });
        }
    });
}
// editar productos
function editar_productos(parametros) {
    alert(parametros)
    $('#tabla_productos').on('click', '.editar', function () {
        var datos = parametros.split("||");
        $('#modal_editar').modal('show');
        $('#txt_id').val(datos[0]);
        $('#txt_nombre_producto_editar').val(datos[1]);
        $('#txt_cantidad_producto_editar').val(datos[2]);
        $('#txt_cantidad_stok_producto_editar').val(datos[3]);
        $('#txt_venta_cantidad_editar').val(datos[4]);
        $('#txt_fecha_procuto_editar').val(datos[5]);
    })
}
function actualizaproductos() {
    var id = $('#txt_id').val();
    var nombre = $('#txt_nombre_producto_editar').val();
    var cantidad = $('#txt_cantidad_producto_editar').val();
    var stock = $('#txt_cantidad_stok_producto_editar').val();
    var v_cantidad = $('#txt_venta_cantidad_editar').val();
    var v_fecha = $('#txt_fecha_procuto_editar').val();
    NombreProceso = "ACTUALIZARPRODUCTOS";
    var parametros = {
        "NombreProceso": NombreProceso,
        "id": id,
        "nombre": nombre,
        "cantidad": cantidad,
        "stock": stock,
        "v_cantidad": v_cantidad,
        "v_fecha": v_fecha
    };
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'post'
    }).done(function (resp) {
        // alert(resp);
        if (resp.trim() == 1) {
            // TraerDatosUsuario();
            $("#modal_editar").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos actualizados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });

        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar la actualizacion", "error");
        }
    });

}
// ELIMINAR DATOS////////////////
function modaleliminar(id) {
    // alert(id[0]);
    var datos = id.split("||");
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
function eliminar_productos(datos) {
    // console.log(datos);
    var NombreProceso = "ELIMINARDATOS";
    var parametros = {
        "NombreProceso": NombreProceso,
        "id": datos,
    };
    $.ajax({
        data: parametros,
        url: '../php/proceso.php',
        type: 'POST',
        beforeSend: function () {
            // alert(datos)
        }
    }).done(function (resp) {
        // alert(resp);
        if (resp.trim() == 1) {
            Swal.fire("Mensaje De Confirmacion", "EL producto se elimino con exito", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar la eliminarcion", "error");
        }
    })



}
// habilitar datos
function modalhabilitar(id) {
    // alert(id[0]);
    var datos = id.split("||");
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
function habilitarar_productos(datos) {
    // console.log(datos);
    var NombreProceso = "HABILITARDATOS";
    var parametros = {
        "NombreProceso": NombreProceso,
        "id": datos,
    };
    $.ajax({
        data: parametros,
        url: '../php/proceso.php',
        type: 'POST',
        beforeSend: function () {
            // alert(datos)
        }
    }).done(function (resp) {
        // alert(resp);
        if (resp.trim() == 1) {
            Swal.fire("Mensaje De Confirmacion", "EL producto se habilito con exito", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar", "error");
        }
    })



}
// registrar productos
function registroproductos() {

    var nombre_p = $('#txt_nombre_producto').val();
    var cantidad_p = $('#txt_cantidad_producto').val();
    var stock_p = $('#txt_cantidad_stok_producto').val();
    var v_cantidad_p = $('#txt_venta_cantidad').val();
    var v_fecha_p = $('#txt_fecha_procuto').val();
    if (nombre_p.length == 0 || cantidad_p.length == 0 || stock_p.length == 0 || v_cantidad_p.length == 0 || v_fecha_p.length == 0) {
        return Swal.fire("Mensaje De Advertencia", "Llene los campos vacios", "warning");
    }
    // alert(nombre_p+"||"+cantidad_p+"||"+stock_p+"||"+v_cantidad_p+"||"+v_fecha_p);
    NombreProceso = "REGISTRARDATOS";
    var parametros = {
        "NombreProceso": NombreProceso,
        "nombre_p": nombre_p,
        "cantidad_p": cantidad_p,
        "stock_p": stock_p,
        "v_cantidad_p": v_cantidad_p,
        "v_fecha_p": v_fecha_p,

    };
    console.log(parametros);
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'POST'
    }).done(function (resp) {
        alert("envio :" + resp);
        if (resp.trim() == 1) {
            $("#modal_registrar").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos ingresados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar el registro", "error");
        }

    });

}

function sessiones() {
    var usu_nombre = $("#txt_usuario").val();
    var usu_pas = $("#txt_con").val();
    if (usu_nombre.length == 0 || usu_pas.length == 0) {
        return Swal.fire("Mensaje de abvertencia", "los campos estan vacios", "warning");
    }
    var NombreProceso = "SESSIONES";
    var data = {
        "NombreProceso": NombreProceso,
        "usu_nombre": usu_nombre,
        "usu_pass": usu_pas
    };
    $.ajax({
        data: data,
        url: "../php/proceso.php",
        type: "POST"
    }).done(function (resp) {
        // alert("recibe: "+resp);
        if (resp == 0) {
            Swal.fire("Mensaje De Error", "Usuario y/o contrase\u00f1a incorrecta", "error");
        } else {

            var data = JSON.parse(resp);
            // console.log(json);
            // if(data[0][5]==='INACTIVO'){
            //     return Swal.fire("Mensaje de abvertencia","Lo sentimos el usuario "+usu+" se encuentra inactivo","warning");
            // }
            $.ajax({
                url: '../php/crear_cession.php',
                type: 'post',
                data: {
                    "idusuario": data[0].id_user,
                    "user": data[0].nombre_user,
                    "pass": data[0].pass_user
                }
            }).done(function (resp) {

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
function traerdatos_usuario() {
    var table = $('#tabla_usuarios').DataTable();
    var name = [];
    var marks = [];
    var NombreProceso = "LISTARUSU"
    var data = {
        "NombreProceso": NombreProceso,
    }
    $.ajax({
        data: data,
        url: '../php/proceso.php',
        type: 'POST'
    }).done(function (resp) {
        // alert(resp);
        var registros = "";
        json = JSON.parse(resp);
        var registros = "<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre usuario</th><th scope='col'>Telefono</th><th scope='col'>Pass</th> <th scope='col'>Email</th> <th scope='col'>Rol</th><th scope='col'>Estatus</th><th scope='col'>AC</th></tr></thead><tbody>";
        for (var i in json) {
            if (json[i].id_user == null || json[i].nombre_user == null || json[i].cell == null || json[i].pass_user == null || json[i].correo == null || json[i].rol == null || json[i].estatus == null) {
                name.push("Sin Clasificar");
                json[i].id_user = "Sin Clasificar";
                json[i].nombre_user = "Sin Clasificar";
                json[i].cell = "Sin Clasificar";
                json[i].pass_user = "Sin Clasificar";
                json[i].correo = "Sin Clasificar";
                json[i].rol = "Sin Clasificar";
                json[i].estatus = "Sin Clasificar";
            }
            else {
                name.push(json[i].id_user, json[i].nombre_user, json[i].cell, json[i].pass_user, json[i].correo, json[i].rol, json[i].estatus);
            }
            marks.push(json[i].id_user, json[i].nombre_user, json[i].cell, json[i].pass_user, json[i].correo, json[i].rol, json[i].estatus);

            //  alert(json[i].CANTIDAD);
            var ac_botom = json[i].id_user + "||" + json[i].nombre_user + "||" + json[i].cell + "||" + json[i].pass_user + "||" + json[i].correo + "||" + json[i].rol + "||" + json[i].estatus;
            if (json[i].estatus == 'ACTIVO') {

                var estatus = "<span class='label bg-success text-light rounded m-2'>" + json[i].estatus + "</span>";
            } else {
                var estatus = "<span class='label bg-danger text-light rounded m-2'>" + json[i].estatus + "</span>";
            }

            registros += '<tr><td>' + json[i].id_user + '</td><td>' + json[i].nombre_user + '</td><td>' + json[i].cell + '</td><td>' + json[i].pass_user + '</td><td>' + json[i].correo + '</td><td>' + json[i].rol + '</td><td>' + estatus + '</td><td><button style="font-size:10px;" type="button" class="editar btn btn-primary" onclick="editar_user(\'' + ac_botom + '\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick=" modaleliminar_user(\'' + ac_botom + '\')"><i class="fa fa-times"></i></button></button>&nbsp;<button style="font-size:10px;" type="button" class=" btn btn-success" onclick=" modalhabilitarusu(\'' + ac_botom + '\')"><i class="fa fa-check"></i></button></td></tr>';
        }
        registros += "</tbody>";

        var fecha_datos = new Date();
        var fecha = fecha_datos.getFullYear() + "-" + fecha_datos.getMonth() + "-" + fecha_datos.getDay();
        table.destroy();
        $('#tabla_usuarios').html(registros);
        //   console.log("fecha2:  "+fecha_a);
        $('#tabla_usuarios').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: '<i class="fa fa-clone fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn1 btn btn-primary',

                },
                {
                    extend: 'excel',
                    text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-success',

                },
                {
                    extend: 'pdf',
                    text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-danger',

                }, {
                    extend: 'print',
                    text: '<i class="fa fa-print fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-secondary ',
                },
                {
                    extend: 'colvis',
                    text: 'Filtrar',
                    className: 'btn btn1 btn-secondary ',

                }

            ]
        })


    })
}

// registro usuario
function registroUsuario() {

    var nombre = $('#txt_nombre').val();
    var pass = $('#txt_pass').val();
    var correo = $('#txt_email').val();
    var telefono = $('#txt_telefono').val();
    var roll = $('#txt_rol').val();

    if (nombre.length == 0 || pass.length == 0 || correo.length == 0 || telefono.length == 0 || roll.length == 0) {
        return Swal.fire("Mensaje De Advertencia", "Llene los campos vacios", "warning");
    }
    // alert(nombre_p+"||"+cantidad_p+"||"+stock_p+"||"+v_cantidad_p+"||"+v_fecha_p);
    NombreProceso = "REGISTRARDATOSUSUARIO";
    var parametros = {
        "NombreProceso": NombreProceso,
        "nombre": nombre,
        "pass": pass,
        "correo": correo,
        "telefono": telefono,
        "roll": roll
    };
    console.log(parametros);
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'POST'
    }).done(function (resp) {
        alert("envio :" + resp);
        if (resp.trim() == 1) {
            $("#modal_registrar_user").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos ingresados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar el registro", "error");
        }

    });

}

//  listar usu habilitado

function traerdatos_usuario_habilitados() {
    // alert("entro")
    var table = $('#tabla_usuarios_habilitados').DataTable();

    var name = [];
    var marks = [];
    //  var rotulo="";
    var NombreProceso = "CARGARDATOSHABILITADOSUSU";
    var parametros = {
        "NombreProceso": NombreProceso,

    };
    // alert("aqer"+estado);
    $.ajax({
        data: parametros,
        url: '../php/proceso.php',
        type: 'POST'
    }).done(function (resp) {
        // alert(resp);
        var registros = "";
        json = JSON.parse(resp);
        var registros = "<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre usuario</th><th scope='col'>Telefono</th><th scope='col'>Pass</th> <th scope='col'>Email</th> <th scope='col'>Rol</th><th scope='col'>Estatus</th><th scope='col'>AC</th></tr></thead><tbody>";
        for (var i in json) {
            if (json[i].id_user == null || json[i].nombre_user == null || json[i].cell == null || json[i].pass_user == null || json[i].correo == null || json[i].rol == null || json[i].estatus == null) {
                name.push("Sin Clasificar");
                json[i].id_user = "Sin Clasificar";
                json[i].nombre_user = "Sin Clasificar";
                json[i].cell = "Sin Clasificar";
                json[i].pass_user = "Sin Calificar";
                json[i].correo = "Sin Clasificar";
                json[i].rol = "Sin Clasificar";
                json[i].estatus = "Sin Clasificar";
            }
            else {
                name.push(json[i].id_user, json[i].nombre_user, json[i].cell, json[i].pass_user, json[i].correo, json[i].rol, json[i].estatus);
            }
            marks.push(json[i].id_user, json[i].nombre_user, json[i].cell, json[i].pass_user, json[i].correo, json[i].rol, json[i].estatus);

            //  alert(json[i].CANTIDAD);
            var ac_botom = [json[i].id_user + "||" + json[i].nombre_user + "||" + json[i].cell + "||" + json[i].pass_user + "||" + json[i].correo + "||" + json[i].rol + "||" + json[i].estatus];
            if (json[i].estatus == 'ACTIVO') {

                var estatus = "<span class='label bg-success text-light rounded m-2'>" + json[i].estatus + "</span>";
            } else {
                var estatus = "<span class='label bg-danger text-light rounded m-2'>" + json[i].estatus + "</span>";
            }

            registros += "<tr><td>" + json[i].id_user + "</td><td>" + json[i].nombre_user + "</td><td>" + json[i].cell + "</td><td>" + json[i].pass_user + "</td><td>" + json[i].correo + "</td><td>" + json[i].rol + "</td><td>" + estatus + "</td><td><button style='font-size:10px;' type='button'  class='editar btn btn-primary' onclick='editar_productos(\'" + ac_botom + "\')'><i class='fa fa-edit'></i></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-danger' onclick=' modaleliminar(\'" + ac_botom + "\')'><i class='fa fa-times'></i></button></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-success' onclick=' modalhabilitar(\'" + ac_botom + "\')'><i class='fa fa-check'></i></button></td></tr>";
        }
        registros += "</tbody>";
        var fecha_datos = new Date();
        var fecha = fecha_datos.getFullYear() + "-" + fecha_datos.getMonth() + "-" + fecha_datos.getDay();
        table.destroy();
        $('#tabla_usuarios_habilitados').html(registros);
        //   console.log("fecha2:  "+fecha_a);
        $('#tabla_usuarios_habilitados').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: '<i class="fa fa-clone fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn1 btn btn-primary',

                },
                {
                    extend: 'excel',
                    text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-success',

                },
                {
                    extend: 'pdf',
                    text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-danger',

                }, {
                    extend: 'print',
                    text: '<i class="fa fa-print fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-secondary ',
                },
                {
                    extend: 'colvis',
                    text: 'Filtrar',
                    className: 'btn btn1 btn-secondary ',

                }

            ]
        })


    })
}

// listar usu deshabilitados
function traerdatos_usuario_deshabilitados() {
    // alert("entro")
    var table = $('#tabla_usuarios_deshabilitados').DataTable();

    var name = [];
    var marks = [];
    //  var rotulo="";
    var NombreProceso = "CARGARDATOSDESHABILITADOSUSU";
    var parametros = {
        "NombreProceso": NombreProceso,

    };
    // alert("aqer"+estado);
    $.ajax({
        data: parametros,
        url: '../php/proceso.php',
        type: 'POST'
    }).done(function (resp) {
        // alert(resp);
        var registros = "";
        json = JSON.parse(resp);
        var registros = "<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre usuario</th><th scope='col'>Telefono</th><th scope='col'>Pass</th> <th scope='col'>Email</th> <th scope='col'>Rol</th><th scope='col'>Estatus</th><th scope='col'>AC</th></tr></thead><tbody>";
        for (var i in json) {
            if (json[i].id_user == null || json[i].nombre_user == null || json[i].cell == null || json[i].pass_user == null || json[i].correo == null || json[i].rol == null || json[i].estatus == null) {
                name.push("Sin Clasificar");
                json[i].id_user = "Sin Clasificar";
                json[i].nombre_user = "Sin Clasificar";
                json[i].cell = "Sin Clasificar";
                json[i].pass_user = "Sin Calificar";
                json[i].correo = "Sin Clasificar";
                json[i].rol = "Sin Clasificar";
                json[i].estatus = "Sin Clasificar";
            }
            else {
                name.push(json[i].id_user, json[i].nombre_user, json[i].cell, json[i].pass_user, json[i].correo, json[i].rol, json[i].estatus);
            }

            console.log("esto es estatus" + estatus);
            marks.push(json[i].id_user, json[i].nombre_user, json[i].cell, json[i].pass_user, json[i].correo, json[i].rol, json[i].estatus);

            //  alert(json[i].CANTIDAD);
            var ac_botom = [json[i].id_user + "||" + json[i].nombre_user + "||" + json[i].cell + "||" + json[i].pass_user + "||" + json[i].correo + "||" + json[i].rol + "||" + json[i].estatus];
            if (json[i].estatus == 'ACTIVO') {

                var estatus = "<span class='label bg-success text-light rounded m-2'>" + json[i].estatus + "</span>";
            } else {
                var estatus = "<span class='label bg-danger text-light rounded m-2'>" + json[i].estatus + "</span>";
            }

            registros += "<tr><td>" + json[i].id_user + "</td><td>" + json[i].nombre_user + "</td><td>" + json[i].cell + "</td><td>" + json[i].pass_user + "</td><td>" + json[i].correo + "</td><td>" + json[i].rol + "</td><td>" + estatus + "</td><td><button style='font-size:10px;' type='button'  class='editar btn btn-primary' onclick='editar_productos(\'" + ac_botom + "\')'><i class='fa fa-edit'></i></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-danger' onclick=' modaleliminar(\'" + ac_botom + "\')'><i class='fa fa-times'></i></button></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-success' onclick=' modalhabilitar(\'" + ac_botom + "\')'><i class='fa fa-check'></i></button></td></tr>";
        }
        registros += "</tbody>";
        var fecha_datos = new Date();
        var fecha = fecha_datos.getFullYear() + "-" + fecha_datos.getMonth() + "-" + fecha_datos.getDay();
        table.destroy();
        $('#tabla_usuarios_deshabilitados').html(registros);
        //   console.log("fecha2:  "+fecha_a);
        $('#tabla_usuarios_deshabilitados').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: '<i class="fa fa-clone fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn1 btn btn-primary',

                },
                {
                    extend: 'excel',
                    text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-success',

                },
                {
                    extend: 'pdf',
                    text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-danger',

                }, {
                    extend: 'print',
                    text: '<i class="fa fa-print fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-secondary ',
                },
                {
                    extend: 'colvis',
                    text: 'Filtrar',
                    className: 'btn btn1 btn-secondary ',

                }

            ]
        })


    })
}
// editar productos
function editar_user(parametros) {
    alert(parametros);
    $('#tabla_usuarios').on('click', '.editar', function () {
        var datos = parametros.split("||");
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
function actualiza_user() {
    var id = $('#txt_id_editar_usu').val();
    var nombreusu = $('#txt_nombre_editar').val();
    var pass = $('#txt_pass_editar').val();
    var email = $('#txt_email_editar').val();
    var cell = $('#txt_telefono_editar').val();
    var rol = $('#txt_rol_editar').val();
    // var estatus=$('#txt_estatus_editar').val();
    NombreProceso = "ACTUALIZAUSUARIO";
    var parametros = {
        "NombreProceso": NombreProceso,
        "id": id,
        "nombreusu": nombreusu,
        "pass": pass,
        "email": email,
        "cell": cell,
        "rol": rol
        // "estatus":estatus
    };
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'post'
    }).done(function (resp) {
        alert(resp);
        if (resp.trim() == 1) {
            // TraerDatosUsuario();
            $("#modal_editar_user").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos actualizados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });

        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar la actualizacion", "error");
        }
    });

}
// ELIMINAR DATOS////////////////
function modaleliminar_user(id) {
    // alert("midal habilitar:"+id[0]);
    var datos = id.split("||");
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
            Modificar_Estatus(datos[0], 'INACTIVO');
        }
    })
}

// habilitar datos
function modalhabilitarusu(id) {
    // alert("midal habilitar:"+id[0]);
    var datos = id.split("||");
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
            Modificar_Estatus(datos[0], 'ACTIVO');
        }
    })
}


// combo rol

function listar_combo_rol() {
    var name = [];
    var marks = [];
    NombreProceso = "LISTARROL";
    var proceso = {
        "NombreProceso": NombreProceso,
    }
    $.ajax({
        data: proceso,
        url: "../php/proceso.php",
        type: 'post'
    }).done(function (resp) {
        // alert(resp);
        var json = JSON.parse(resp);
        var cadena = "";
        for (var i in json) {
            if (json[i].id_rol == null || json[i].nombre_rol == null) {
                name.push("Sin Clasificar");
                json[i].id_rol = "Sin Clasificar";
                json[i].nombre_rol = "Sin Clasificar";
            }
            else {
                name.push(json[i].id_rol, json[i].nombre_rol);
            }
            // marks.push(json[i].id_rol,json[i].nombre_rol);

            if (json.length > 0) {
                cadena += "<option value='" + json[i].nombre_rol + "'>" + json[i].nombre_rol + "</option>";
                $("#txt_rol").html(cadena);
                $("#txt_rol_editar").html(cadena);

            } else {
                cadena += "<option value=''>NO SE ENCONTRARON REGISTROS</option>";
                $("#txt_rol").html(cadena);
                $("#txt_rol_editar").html(cadena);
            }
        }
    })
}

function Modificar_Estatus(idusuario, estatus) {
    // alert(idusuario+"||"+estatus);
    NombreProceso = "MODIFICAR_ESTATUS";
    var mensaje = "";
    if (estatus == 'INACTIVO') {
        mensaje = "desactivo";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        "url": "../php/proceso.php",
        type: 'POST',
        data: {
            "NombreProceso": NombreProceso,
            idusuario: idusuario,
            estatus: estatus
        }
    }).done(function (resp) {
        // alert("modificar estatus"+resp);
        if (resp > 0) {
            Swal.fire("Mensaje De Confirmacion", "EL usuario se " + mensaje + " con exito", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        }
    })
}

// FUNCIONES DE MODULOS

// CREAR NODULO
function crearmodulo() {
    var nombre_modulo = $('#txt_nombre_modulo').val();
    var posicion_modulo = $('#txt_posicion_modulo').val();
    var icono = $('#txt_icono').val();

    if (nombre_modulo.length == 0 || posicion_modulo.length == 0 || icono.length == 0) {
        return Swal.fire("Mensaje De Advertencia", "Llene los campos vacios", "warning");
    }
    // alert(nombre_p+"||"+cantidad_p+"||"+stock_p+"||"+v_cantidad_p+"||"+v_fecha_p);
    NombreProceso = "CREARMODULO";
    var parametros = {
        "NombreProceso": NombreProceso,
        "nombre_modulo": nombre_modulo,
        "posicion_modulo": posicion_modulo,
        "icono": icono,
    }
    // console.log(parametros);
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'POST'
    }).done(function (resp) {
        alert("envio :" + resp);
        if (resp.trim() == 1) {
            $("#registrar_modulo").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos ingresados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar el registro", "error");
        }

    });
}
// TRAER DATOS MODULOS
function traerdatos_modulo() {
    var table = $('#tabla_modulo').DataTable();
    var name = [];
    var marks = [];
    var NombreProceso = "TABLAMODULO"
    var data = {
        "NombreProceso": NombreProceso,
    }
    $.ajax({
        data: data,
        url: '../php/proceso.php',
        type: 'POST'
    }).done(function (resp) {
        // alert(resp);
        var registros = "";
        json = JSON.parse(resp);
        var registros = "<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre modulo</th><th scope='col'>Posicion</th><th scope='col'>estatus</th><th scope='col'>icono</th><th scope='col'>AC</th></tr></thead><tbody>";
        for (var i in json) {
            if (json[i].idmodulo == null || json[i].nombre_modulo == null || json[i].orden == null || json[i].estatus == null || json[i].icono == null) {
                name.push("Sin Clasificar");
                json[i].idmodulo = "Sin Clasificar";
                json[i].nombre_modulo = "Sin Clasificar";
                json[i].orden = "Sin Clasificar";
                json[i].estatus = "Sin Clasificar";
                json[i].icono = "Sin Clasificar";

            }
            else {
                name.push(json[i].idmodulo, json[i].nombre_modulo, json[i].orden, json[i].estatus, json[i].icono);
            }
            marks.push(json[i].idmodulo, json[i].nombre_modulo, json[i].orden, json[i].estatus, json[i].icono);

            //  alert(json[i].CANTIDAD);
            var ac_botom = json[i].idmodulo + "||" + json[i].nombre_modulo + "||" + json[i].orden + "||" + json[i].estatus + "||" + json[i].icono;
            if (json[i].estatus == 'S') {
                var estatus = "<span class='label bg-success text-light rounded m-2'>" + json[i].estatus + "</span>";
            } else {
                var estatus = "<span class='label bg-danger text-light rounded m-2'>" + json[i].estatus + "</span>";
            }

            registros += '<tr><td>' + json[i].idmodulo + '</td><td>' + json[i].nombre_modulo + '</td><td>' + json[i].orden + '</td><td>' + estatus + '</td><td><i class="' + json[i].icono + '"></i></td><td><button style="font-size:10px;" type="button"  class="editar btn btn-primary" onclick="editar_modulo(\'' + ac_botom + '\')"><i class="fa fa-edit"></i></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-danger" onclick="modaleliminarmodulo(\'' + ac_botom + '\')"><i class="fa fa-times"></i></button></button>&nbsp;<button style="font-size:10px;" type="button" class="eliminar btn btn-success" onclick="modalhabilitarmodulo(\'' + ac_botom + '\')"><i class="fa fa-check"></i></button></td></tr>';
        }
        registros += "</tbody>";

        var fecha_datos = new Date();
        var fecha = fecha_datos.getFullYear() + "-" + fecha_datos.getMonth() + "-" + fecha_datos.getDay();
        table.destroy();
        $('#tabla_modulo').html(registros);
        //   console.log("fecha2:  "+fecha_a);
        $('#tabla_modulo').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: '<i class="fa fa-clone fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn1 btn btn-primary',

                },
                {
                    extend: 'excel',
                    text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-success',

                },
                {
                    extend: 'pdf',
                    text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-danger',

                }, {
                    extend: 'print',
                    text: '<i class="fa fa-print fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-secondary ',
                },
                {
                    extend: 'colvis',
                    text: 'Filtrar',
                    className: 'btn btn1 btn-secondary ',

                }

            ]
        })


    })
}
// ACTUALIZAR MODULOS
function editar_modulo(parametros) {

    // alert(parametros);
    $('#tabla_modulo').on('click', '.editar', function () {
        var datos = parametros.split("||");
        $('#modificar_modulo').modal('show');
        $('#idmodulo').val(datos[0]);
        $('#nombremodulo').val(datos[1]);
        $('#ordenmodulo').val(datos[2]);
        $('#icono').val(datos[4]);

    })
}
function actualiza_modulo() {
    var idmodulo = $('#idmodulo').val();
    var nombremodulo = $('#nombremodulo').val();
    var ordenmodulo = $('#ordenmodulo').val();
    var icono = $('#icono').val();

    // var estatus=$('#txt_estatus_editar').val();
    NombreProceso = "ACTUALIZARMODULO";
    var parametros = {
        "NombreProceso": NombreProceso,
        "idmodulo": idmodulo,
        "nombremodulo": nombremodulo,
        "ordenmodulo": ordenmodulo,
        "icono": icono,

        // "estatus":estatus
    };
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'post'
    }).done(function (resp) {
        // alert(resp);
        if (resp.trim() == 1) {
            // TraerDatosUsuario();
            $("#modal_editar_user").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos actualizados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });

        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar la actualizacion", "error");
        }
    });

}
// DESHABILITAR MODULO
function modaleliminarmodulo(id) {
    // alert("midal habilitar:"+id[0]);
    var datos = id.split("||");
    Swal.fire({
        title: 'Esta seguro de desactivar el modulo?',
        text: "Una vez hecho esto el modulo no aparecera en el menu",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.value) {
            Modificar_Estatus_Modulo(datos[0], 'N');
        }
    })
}
// HABILITAR MODULO
function modalhabilitarmodulo(id) {
    // alert("midal habilitar:"+id[0]);
    var datos = id.split("||");
    Swal.fire({
        title: 'Esta seguro de activar el modulo?',
        text: "Una vez hecho esto el modulo  aparecera en el menu",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.value) {
            Modificar_Estatus_Modulo(datos[0], 'S');
        }
    })
}
// MODIFICAR EL ESTATUS DEL MODULO
function Modificar_Estatus_Modulo(idmodulo, estatus) {
    // alert(idmodulo+"||"+estatus);
    NombreProceso = "MODIFICAR_MODULO";
    var mensaje = "";
    if (estatus == 'N') {
        mensaje = "inactivo";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        "url": "../php/proceso.php",
        type: 'POST',
        data: {
            "NombreProceso": NombreProceso,
            idmodulo: idmodulo,
            estatus: estatus
        }
    }).done(function (resp) {
        // alert("modificar estatus"+resp);
        if (resp > 0) {
            Swal.fire("Mensaje De Confirmacion", "EL usuario se " + mensaje + " con exito", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        }
    })
}



// FUNCIONES OPCIONES/////////////////////////////////

// CREAR OPCIONES
function crearopcion() {
    var nombre_opcion = $('#txt_nombre_opcion').val();
    var posicion_opcion = $('#txt_posicion_opcion').val();
    var modulo_opcion = $('#txt_modulo_opcion').val();
    var ruta_opcion = $('#txt_ruta_opcion').val();


    if (nombre_opcion.length == 0 || posicion_opcion.length == 0 || modulo_opcion.length == 0 || ruta_opcion.length == 0) {
        return Swal.fire("Mensaje De Advertencia", "Llene los campos vacios", "warning");
    }
    //  onclick="cargar_contenido('cargar_tablas','crear_modulos/resumen.php')"
    alert(nombre_opcion + "||" + posicion_opcion + "||" + modulo_opcion + "||" + ruta_opcion);
    NombreProceso = "CREAROPCION";
    var parametros = {
        "NombreProceso": NombreProceso,
        "nombre_opcion": nombre_opcion,
        "posicion_opcion": posicion_opcion,
        "modulo_opcion": modulo_opcion,
        "ruta_opcion": ruta_opcion,

    }
    alert(parametros);
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'POST'
    }).done(function (resp) {
        alert("envio :" + resp);
        if (resp.trim() == 1) {
            $("#registrar_opcion").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos ingresados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar el registro", "error");
        }

    });
}

// TRAER DATOS OPCIONES
function Traer_opcion() {
    var table = $('#tabla_opcion').DataTable();
    var name = [];
    var marks = [];
    var NombreProceso = "TABLAOPCION"
    var data = {
        "NombreProceso": NombreProceso,
    }
    $.ajax({
        data: data,
        url: '../php/proceso.php',
        type: 'POST'
    }).done(function (resp) {
        // alert(resp);
        var registros = "";
        json = JSON.parse(resp);
        var registros = "<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre</th><th scope='col'>Posicion</th><th scope='col'>Modulo</th><th scope='col'>Ruta</th><th scope='col'>Estatus</th><th scope='col'>AC</th></tr></thead><tbody>";
        for (var i in json) {
            if (json[i].idopcion == null || json[i].nombre_opcion == null || json[i].modulo == null || json[i].ruta == null || json[i].orden == null || json[i].estatus == null) {
                name.push("Sin Clasificar");
                json[i].idopcion = "Sin Clasificar";
                json[i].nombre_opcion = "Sin Clasificar";
                json[i].modulo = "Sin Clasificar";
                json[i].ruta = "Sin Clasificar";
                json[i].orden = "Sin Clasificar";
                json[i].estatus = "Sin Clasificar";
            }
            else {
                name.push(json[i].idopcion, json[i].nombre_opcion, json[i].modulo, json[i].ruta, json[i].orden, json[i].estatus);
            }
            marks.push(json[i].idopcion, json[i].nombre_opcion, json[i].modulo, json[i].ruta, json[i].orden, json[i].estatus);

            var ac_botom = json[i].idopcion + "||" + json[i].nombre_opcion + "||" + json[i].orden + "||" + json[i].modulo + "||" + json[i].ruta + "||" + json[i].estatus;
            if (json[i].estatus == 'S') {
                var estatus = "<span class='label bg-success text-light rounded m-2'>" + json[i].estatus + "</span>";
            } else {
                var estatus = "<span class='label bg-danger text-light rounded m-2'>" + json[i].estatus + "</span>";
            }

            registros += "<tr><td>" + json[i].idopcion + "</td><td>" + json[i].nombre_opcion + "</td><td>" + json[i].orden + "</td><td>" + json[i].modulo + "</td><td>" + json[i].ruta + "</td><td>" + estatus + "</td><td><button style='font-size:10px;' type='button'  class='editar btn btn-primary' onclick='editar_opcion(\"" + ac_botom + "\")'><i class='fa fa-edit'></i></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-danger' onclick='modaleliminaropcion(\"" + ac_botom + "\")'><i class='fa fa-times'></i></button></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-success' onclick='habilitararopcion(\"" + ac_botom + "\")'><i class='fa fa-check'></i></button></td></tr>";
        }
        registros += "</tbody>";
        // alert(registros);

        var fecha_datos = new Date();
        var fecha = fecha_datos.getFullYear() + "-" + fecha_datos.getMonth() + "-" + fecha_datos.getDay();
        table.destroy();
        $('#tabla_opcion').html(registros);
        //   console.log("fecha2:  "+fecha_a);
        $('#tabla_opcion').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: '<i class="fa fa-clone fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn1 btn btn-primary',

                },
                {
                    extend: 'excel',
                    text: '<i class="fas fa-regular fa-file-excel fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-success',

                },
                {
                    extend: 'pdf',
                    text: '<i class="fas fa-solid fa-file-pdf fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-danger',

                }, {
                    extend: 'print',
                    text: '<i class="fa fa-print fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-secondary ',
                },
                {
                    extend: 'colvis',
                    text: 'Filtrar',
                    className: 'btn btn1 btn-secondary ',

                }

            ]
        })


    })
}
// ACTUALIZAR OPCIONES editar_opcion
function editar_opcion(parametros) {

    // alert(parametros);
    $('#tabla_opcion').on('click', '.editar', function () {
        var datos = parametros.split("||");
        $('#editar_opcion').modal('show');
        $('#idopcion').val(datos[0]);
        $('#editarnombreopcion').val(datos[1]);
        $('#editarposicion').val(datos[2]);
        $('#editarmodulo').val(datos[3]);
        $('#editarruta').val(datos[4]);
    })
}
function actualiza_opcion() {
    var idopcion = $('#idopcion').val();
    var editarnombreopcion = $('#editarnombreopcion').val();
    var editarposicion = $('#editarposicion').val();
    var editarmodulo = $('#editarmodulo').val();
    var editarruta = $('#editarruta').val();


    // var estatus=$('#txt_estatus_editar').val();
    NombreProceso = "ACTUALIZAROPCION";
    var parametros = {
        "NombreProceso": NombreProceso,
        "idopcion": idopcion,
        "editarnombreopcion": editarnombreopcion,
        "editarposicion": editarposicion,
        "editarmodulo": editarmodulo,
        "editarruta": editarruta
    };
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'post'
    }).done(function (resp) {
        console.log(resp);
        if (resp.trim() == 1) {
            // TraerDatosUsuario();
            $("#editar_opcion").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos actualizados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });

        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar la actualizacion", "error");
        }
    });

}

// MODIFICAR EL ESTATUS DEL OPCION
function Modificar_Estatus_opcion(idopcion, estatus) {
    // alert(idmodulo+"||"+estatus);
    NombreProceso = "MODIFICAR_ESTATUS_OPCION";
    var mensaje = "";
    if (estatus == 'N') {
        mensaje = "inactivo";
    } else {
        mensaje = "activo";
    }
    $.ajax({
        "url": "../php/proceso.php",
        type: 'POST',
        data: {
            "NombreProceso": NombreProceso,
            idopcion: idopcion,
            estatus: estatus
        }
    }).done(function (resp) {
        // alert("modificar estatus"+resp);
        if (resp > 0) {
            Swal.fire("Mensaje De Confirmacion", "EL usuario se " + mensaje + " con exito", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        }
    })
}

function modaleliminaropcion(id) {
    // alert("midal habilitar:"+id[0]);
    var datos = id.split("||");
    Swal.fire({
        title: 'Esta seguro de desactivar la opcion?',
        text: "Una vez hecho esto la opcion no aparecera en el submenu",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.value) {
            Modificar_Estatus_opcion(datos[0], 'N');
        }
    })
}
function habilitararopcion(id) {
    // alert("midal habilitar:"+id[0]);
    var datos = id.split("||");
    Swal.fire({
        title: 'Esta seguro de activar la opcion?',
        text: "Una vez hecho esto la opcion aparecera en el submenu",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si'
    }).then((result) => {
        if (result.value) {
            Modificar_Estatus_opcion(datos[0], 'S');
        }
    })
}


function graficos_sm() {

    $(function () {
        $('.knob').knob({
            draw: function () {
                // "tron" case
                if (this.$.data('skin') == 'tron') {

                    var a = this.angle(this.cv)  // Angle
                        ,
                        sa = this.startAngle          // Previous start angle
                        ,
                        sat = this.startAngle         // Start angle
                        ,
                        ea                            // Previous end angle
                        ,
                        eat = sat + a                 // End angle
                        ,
                        r = true
                    this.g.lineWidth = this.lineWidth
                    this.o.cursor
                        && (sat = eat - 0.3)
                        && (eat = eat + 0.3)

                    if (this.o.displayPrevious) {
                        ea = this.startAngle + this.angle(this.value)
                        this.o.cursor
                            && (sa = ea - 0.3)
                            && (ea = ea + 0.3)
                        this.g.beginPath()
                        this.g.strokeStyle = this.previousColor
                        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false)
                        this.g.stroke()
                    }

                    this.g.beginPath()
                    this.g.strokeStyle = r ? this.o.fgColor : this.fgColor
                    this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false)
                    this.g.stroke()

                    this.g.lineWidth = 2
                    this.g.beginPath()
                    this.g.strokeStyle = this.o.fgColor
                    this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false)
                    this.g.stroke()

                    return false
                }
            },
            'draw': function () {
                let v = parseInt(this.i[0].value);
                if (v <= 6) this.o.fgColor = '#59BD05';
                else if (v <= 30) this.o.fgColor = '#59BD05';
                else if (v <= 40) this.o.fgColor = '#abbd05';
                else if (v <= 50) this.o.fgColor = '#bd6a05';
                else if (v <= 60) this.o.fgColor = '#bd4205';
                else if (v <= 70) this.o.fgColor = '#bd3005';
                else if (v <= 80) this.o.fgColor = '#bd2105';
                else if (v <= 90) this.o.fgColor = '#bd2105';
                else if (v <= 100) this.o.fgColor = '#bd0505';
                else this.o.fgColor = '#F33A08';
            },

        })

        /* END JQUERY KNOB */

        //INITIALIZE SPARKLINE CHARTS
        // var sparkline1 = new Sparkline($('#sparkline-1')[0], { width: 240, height: 70, lineColor: '#92c1dc', endColor: '#92c1dc' })
        // var sparkline2 = new Sparkline($('#sparkline-2')[0], { width: 240, height: 70, lineColor: '#f56954', endColor: '#f56954' })
        // var sparkline3 = new Sparkline($('#sparkline-3')[0], { width: 240, height: 70, lineColor: '#3af221', endColor: '#3af221' })

        // sparkline1.draw([1000, 1200, 920, 927, 931, 1027, 819, 930, 1021])
        // sparkline2.draw([515, 519, 520, 522, 652, 810, 370, 627, 319, 630, 921])
        // sparkline3.draw([15, 19, 20, 22, 33, 27, 31, 27, 19, 30, 21])

    })

}

/////VENTAAS PRODUCTOS
function vender() {
    var nombrepro = $('#producto').val();
    var valor = $('#valor').val();

    if (nombrepro.length == 0 || valor.length == 0) {
        return Swal.fire("Mensaje De Advertencia", "Llene los campos vacios", "warning");
    }
    //  onclick="cargar_contenido('cargar_tablas','crear_modulos/resumen.php')"
    // alert(nombre_opcion+"||"+posicion_opcion+"||"+modulo_opcion+"||"+ruta_opcion);
    NombreProceso = "VENDER";
    var parametros = {
        "NombreProceso": NombreProceso,
        "nombrepro": nombrepro,
        "valor": valor,
    }
    alert(parametros);
    $.ajax({
        data: parametros,
        url: "../php/proceso.php",
        type: 'POST'
    }).done(function (resp) {
        // alert("envio :"+resp);
        if (resp.trim() == 1) {
            $("#registrar_opcion").modal('hide');
            Swal.fire("Mensaje De Confirmacion", "Datos ingresados correctamente", "success")
                .then((value) => {
                    table.ajax.reload();
                });
        } else {
            Swal.fire("Mensaje De Error", "no se pudo completar el registro", "error");
        }

    });
}

function Traer_venta() {
    var table = $('#tabla_vender').DataTable();
    var name = [];
    var marks = [];
    var NombreProceso = "TABLAVENDER"
    var data = {
        "NombreProceso": NombreProceso,
    }
    $.ajax({
        data: data,
        url: '../php/proceso.php',
        type: 'POST'
    }).done(function (resp) {
        // alert(resp);
        var registros = "";
        json = JSON.parse(resp);
        var registros = "<thead><tr> <th scope='col'>#</th><th scope='col'>Nombre Producto</th><th scope='col'>valor</th><th scope='col'>ACr</th></tr></thead><tbody>";
        for (var i in json) {
            if (json[i].id_pro_vendido == null || json[i].pro_nombre == null || json[i].valor == null) {
                name.push("Sin Clasificar");
                json[i].id_pro_vendido = "Sin Clasificar";
                json[i].pro_nombre = "Sin Clasificar";
                json[i].valor = "Sin Clasificar";
            }
            else {
                name.push(json[i].id_pro_vendido, json[i].pro_nombre, json[i].valor);
            }
            marks.push(json[i].id_pro_vendido, json[i].pro_nombre, json[i].valor);

            var ac_botom = json[i].id_pro_vendido + "||" + json[i].pro_nombre + "||" + json[i].ordvaloren;
            // if(json[i].estatus =='S'){
            //     var estatus ="<span class='label bg-success text-light rounded m-2'>"+json[i].estatus+"</span>";                   
            // }else{
            //     var estatus ="<span class='label bg-danger text-light rounded m-2'>"+json[i].estatus+"</span>";                 
            // }

            registros += "<tr><td>" + json[i].id_pro_vendido + "</td><td>" + json[i].pro_nombre + "</td><td>" + json[i].valor + "</td><td><button style='font-size:10px;' type='button'  class='editar btn btn-primary' onclick='editar_opcion(\"" + ac_botom + "\")'><i class='fa fa-edit'></i></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-danger' onclick='modaleliminaropcion(\"" + ac_botom + "\")'><i class='fa fa-times'></i></button></button>&nbsp;<button style='font-size:10px;' type='button' class='eliminar btn btn-success' onclick='habilitararopcion(\"" + ac_botom + "\")'><i class='fa fa-check'></i></button></td></tr>";
        }
        registros += "</tbody>";
        // alert(registros);

        var fecha_datos = new Date();
        var fecha = fecha_datos.getFullYear() + "-" + fecha_datos.getMonth() + "-" + fecha_datos.getDay();
        table.destroy();
        $('#tabla_vender').html(registros);
        //   console.log("fecha2:  "+fecha_a);
        $('#tabla_vender').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'print',
                    text: '<i class="fa fa-print fa-2x"></i>',
                    title: 'REPORTE ACCIONES PRODCUTOS     FECHA :' + fecha,
                    filename: 'REPORTE PRODCUTOS',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6] //exportar solo la primera y segunda columna
                    },
                    className: 'btn btn1 btn-secondary ',
                },
                {
                    extend: 'colvis',
                    text: 'Filtrar',
                    className: 'btn btn1 btn-secondary ',

                }

            ]
        })


    })
}


// graf animados
function graf_animado() {
    let progress = document.querySelectorAll('.progress');
    let progress_text = document.querySelectorAll('.data-progress');

    progress.forEach((pro) => {
        let percentage = pro.getAttribute('data-value');
        let color = pro.getAttribute('data-stroke');
        let animateTime = pro.getAttribute('data-time');
        let radius = pro.r.baseVal.value;
        let circumference = radius * 2 * Math.PI;
        let stroke = circumference - (circumference * percentage) / 100;
        pro.style.setProperty('--stroke-dashoffset', stroke);
        pro.style.setProperty('--stroke-dasharray', circumference);
        pro.style.setProperty('--stroke', color);
        pro.style.setProperty('--animation-time', `${animateTime * 10}ms`);
    })

    progress_text.forEach((text) => {
        let data = text.getAttribute('data-value');
        let progress_value = 0;
        let progress_bar = setInterval(() => {
            progress_value++;
            text.innerText = `${progress_value}%`;
            if (progress_value == data) {
                clearInterval(progress_bar);
            }
        }, 10);
    })
}

function nueva_graf() {

    var name = [];
    var marks = [];
    var marks2 = [];
    var total_resta;
    var color = ['#ffe4e1', '#d8f8e1', '#fcb7af', '#b0f2c2', '#b0c2f2'];
    var bordercolor = ['#ff6961', '#77dd77', '#fdfd96', '#84b6f4', '#fdcae1'];
    var NombreProceso = "REPORTECANTIDADPRODUCTOS";
    var parametros = {
        "NombreProceso": NombreProceso
    };
    $.ajax({
        data: parametros,
        url: '../php/proceso.php',
        type: 'post',
        beforeSend: function () {
            // alert("si ");
        }, success: function (response) {
            // alert(response)
            // var registros ="";     
            json = JSON.parse(response);
            var totalvalores = 0;
            var sevendio = 0;
            for (var i in json) {
                totalvalores = parseFloat(totalvalores) + parseFloat(json[i].cantidad, json[i]);
            }
            for (var i in json) {
                sevendio = parseFloat(sevendio) + parseFloat(json[i].vanta_cantidad, json[i]);
            }

            for (var i in json) {
                if (json[i].nombre == null) {
                    name.push("Sin Clasificar");
                    json[i].nombre = "Sin Clasificar";
                }
                else {
                    name.push(json[i].nombre);
                }
                marks.push(json[i].cantidad);
                marks2.push(json[i].vanta_cantidad);
                var resultadosResta = [];
                for (var i = 0; i < marks.length; i++) {
                    var resta = parseFloat(marks[i]) - parseFloat(marks2[i]);
                    resultadosResta.push(resta);
                }

                // resultadosResta ahora contiene los resultados de la resta para cada par de valores marks y marks2
                // console.log("RESTA: "+resultadosResta);


                // console.log("valores "+marks+'.....'+marks2);
            }

            var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
            var doughnutChartCanvas = $('#dougpieChart').get(0).getContext('2d')

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
                        data: resultadosResta
                    }
                ]
            };

            var doughnutOptions = {
                legend: {
                    display: false
                }
            }
            // Create pie or douhnut chart
            // You can switch between pie and douhnut using the method below.
            // eslint-disable-next-line no-unused-vars
            var pieChart = new Chart(pieChartCanvas, {
                type: 'doughnut',
                data: chartdata1,
                options: doughnutOptions

            })
            var doughnutChart = new Chart(doughnutChartCanvas, {
                type: 'pie',
                data: chartdata1,
                options: doughnutOptions

            })
        }
    })


}


