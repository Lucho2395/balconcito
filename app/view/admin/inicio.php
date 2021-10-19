<?php
/**
 * Created by PhpStorm
 * User: CESARJOSE39
 * Date: 09/03/2021
 * Time: 16:18
 */
?>
<!--CONTENIDO-->
<!-- MAIN CONTENT-->



    <div class="main-content">
        <div class="section__content section__content--p30">
        <?php
        if($role == 2 || $role == 3 || $role == 5){
            ?>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">Datos de Ventas</h2>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c1">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                    <div class="text">
                                        <h2><?= count($venta_dia);?></h2>
                                        <span>Ventas del Día</span>
                                    </div>
                                </div>
                                <div class="overview-chart">
                                    <canvas id="widgetChart1"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c2">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                    <div class="text">
                                        <h2><?= number_format($total_dia, 2); ?></h2>
                                        <span>Ingresos del Día</span>
                                    </div>
                                </div>
                                <div class="overview-chart">
                                    <canvas id="widgetChart2"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c3">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                    <div class="text">
                                        <h2><?= $total_venta_mes;?></h2>
                                        <span>Ventas del Mes</span>
                                    </div>
                                </div>
                                <div class="overview-chart">
                                    <canvas id="widgetChart3"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c4">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i style="font-size: 25px;">S/.</i>
                                    </div>
                                    <div class="text">
                                        <h2><?= number_format($total_mes, 2);?></h2>
                                        <span>Ingreso del Mes</span>
                                    </div>
                                </div>
                                <div class="overview-chart">
                                    <canvas id="widgetChart4"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <?php if(!$fecha_open){ ?>
                        <div class="card-header py-3">
                            <h3 style="text-align: center;" class="font-weight-bold">APERTURA DE CAJA - DÍA DE HOY</h3>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-xs-6 col-sm-6 col-md-6">
                                <label>Turno:</label>
                                <select class="form-control" id= "id_turno" name="id_turno">
                                    <option value="">Elegir Turno</option>
                                    <?php
                                    foreach($turnos as $l){
                                        ?>
                                        <option value="<?php echo $l->id_turno;?>"><?php echo $l->turno_nombre;?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-lg-6 col-xs-6 col-sm-6 col-md-6">
                                <label>Caja:</label>
                                <select class="form-control" id= "id_caja_numero" name="id_caja_numero">
                                    <option value="">Elegir Caja</option>
                                    <?php
                                    foreach($caja as $l){
                                        ?>
                                        <option value="<?php echo $l->id_caja_numero;?>"><?php echo $l->caja_numero_nombre;?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6" style="text-align: center">
                                <label >MONTO APERTURA CAJA - Para HOY <?php echo date('Y-m-d');?></label>
                                <input type="text" class="form-control" id="caja_apertura" name="caja_apertura" onkeyup="validar_numeros_decimales_dos(this.id)" >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-3 col-sm-3 col-md-3"></div>
                            <div class="col-lg-6 col-sm-6 col-md-6" >
                                <button id="btn-agregar-apertura" class="btn btn-primary" style="align-content: center;width: 100%" onclick="apertura()"><i class="fa fa-save fa-sm text-white-50"></i> APERTURAR CAJA</button>
                            </div>
                            <div class="col-lg-3 col-sm-3 col-md-3"></div>
                        </div>
                        <?php
                        } else {
                            $monto_apertura = $this->caja->mostrar_valor_apertura($fecha_hoy);
                            $jalar_turno = $this->caja->jalar_turno($fecha_hoy);
                            ?>
                            <br> <br> <br> <br> <br> <br> <br>

                                <div class="col-lg-12" style="text-align: center;">
                                    <h3>El Monto de Apertura de Caja para Hoy Día es: S/. <?php echo $monto_apertura;?></h3>
                                    <h3>Correspondiente al : <?php echo $jalar_turno;?></h3>
                                </div>
                            <?php
                        }
                        ?>
                    </div>

                    <div class="col-lg-6" style="text-align: center; padding-bottom:5px; "><h2>Recordatorio de Insumos </h2>
                        <div class="col-lg-12">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable2">
                                        <thead class="text-capitalize">
                                        <tr>
                                            <th>Recurso</th>
                                            <th>Stock Actual</th>
                                            <th>Stock Minimo</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                        $nuevo_valor = 0;
                                        foreach ($recurso_sede as $ar){
                                                $recurso_actual = $ar->recurso_sede_stock;
                                                $recurso_limite = $ar->recurso_sede_stock_minimo;
                                                $nuevo_valor = $recurso_limite + 20;

                                                if($recurso_actual <= $recurso_limite){
                                                    $estilo_ = "style=\"background-color: lightcoral\"";
                                                }else{
                                                    $estilo_ = "style=\"background-color: yellow\"";
                                                }

                                                if($recurso_actual <= $nuevo_valor){

                                                    ?>
                                                    <tr <?= $estilo_;?>>
                                                        <td><?= $ar->recurso_nombre;?></td>
                                                        <td><?= $ar->recurso_sede_stock;?></td>
                                                        <td><?= $ar->recurso_sede_stock_minimo;?></td>
                                                    </tr>
                                                        <?php
                                                }
                                                ?>

                                            <?php
                                            $a++;
                                        }
                                        ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <!--<div class="row">
                    <div class="col-lg-6">
                        <div class="au-card recent-report">
                            <div class="au-card-inner">
                                <h3 class="title-2">recent reports</h3>
                                <div class="chart-info">
                                    <div class="chart-info__left">
                                        <div class="chart-note">
                                            <span class="dot dot--blue"></span>
                                            <span>products</span>
                                        </div>
                                        <div class="chart-note mr-0">
                                            <span class="dot dot--green"></span>
                                            <span>services</span>
                                        </div>
                                    </div>
                                    <div class="chart-info__right">
                                        <div class="chart-statis">
                                                        <span class="index incre">
                                                            <i class="zmdi zmdi-long-arrow-up"></i>25%</span>
                                            <span class="label">products</span>
                                        </div>
                                        <div class="chart-statis mr-0">
                                                        <span class="index decre">
                                                            <i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                            <span class="label">services</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="recent-report__chart">
                                    <canvas id="recent-rep-chart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="au-card chart-percent-card">
                            <div class="au-card-inner">
                                <h3 class="title-2 tm-b-5">char by %</h3>
                                <div class="row no-gutters">
                                    <div class="col-xl-6">
                                        <div class="chart-note-wrap">
                                            <div class="chart-note mr-0 d-block">
                                                <span class="dot dot--blue"></span>
                                                <span>products</span>
                                            </div>
                                            <div class="chart-note mr-0 d-block">
                                                <span class="dot dot--red"></span>
                                                <span>services</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="percent-chart">
                                            <canvas id="percent-chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                            <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
                                <div class="bg-overlay bg-overlay--blue"></div>
                                <h3>
                                    <i class="zmdi zmdi-account-calendar"></i>26 April, 2018</h3>
                                <button class="au-btn-plus">
                                    <i class="zmdi zmdi-plus"></i>
                                </button>
                            </div>
                            <div class="au-task js-list-load">
                                <div class="au-task__title">
                                    <p>Tasks for John Doe</p>
                                </div>
                                <div class="au-task-list js-scrollbar3">
                                    <div class="au-task__item au-task__item--danger">
                                        <div class="au-task__item-inner">
                                            <h5 class="task">
                                                <a href="#">Meeting about plan for Admin Template 2018</a>
                                            </h5>
                                            <span class="time">10:00 AM</span>
                                        </div>
                                    </div>
                                    <div class="au-task__item au-task__item--warning">
                                        <div class="au-task__item-inner">
                                            <h5 class="task">
                                                <a href="#">Create new task for Dashboard</a>
                                            </h5>
                                            <span class="time">11:00 AM</span>
                                        </div>
                                    </div>
                                    <div class="au-task__item au-task__item--primary">
                                        <div class="au-task__item-inner">
                                            <h5 class="task">
                                                <a href="#">Meeting about plan for Admin Template 2018</a>
                                            </h5>
                                            <span class="time">02:00 PM</span>
                                        </div>
                                    </div>
                                    <div class="au-task__item au-task__item--success">
                                        <div class="au-task__item-inner">
                                            <h5 class="task">
                                                <a href="#">Create new task for Dashboard</a>
                                            </h5>
                                            <span class="time">03:30 PM</span>
                                        </div>
                                    </div>
                                    <div class="au-task__item au-task__item--danger js-load-item">
                                        <div class="au-task__item-inner">
                                            <h5 class="task">
                                                <a href="#">Meeting about plan for Admin Template 2018</a>
                                            </h5>
                                            <span class="time">10:00 AM</span>
                                        </div>
                                    </div>
                                    <div class="au-task__item au-task__item--warning js-load-item">
                                        <div class="au-task__item-inner">
                                            <h5 class="task">
                                                <a href="#">Create new task for Dashboard</a>
                                            </h5>
                                            <span class="time">11:00 AM</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="au-task__footer">
                                    <button class="au-btn au-btn-load js-load-btn">load more</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                            <div class="au-card-title" style="background-image:url('images/bg-title-02.jpg');">
                                <div class="bg-overlay bg-overlay--blue"></div>
                                <h3>
                                    <i class="zmdi zmdi-comment-text"></i>New Messages</h3>
                                <button class="au-btn-plus">
                                    <i class="zmdi zmdi-plus"></i>
                                </button>
                            </div>
                            <div class="au-inbox-wrap js-inbox-wrap">
                                <div class="au-message js-list-load">
                                    <div class="au-message__noti">
                                        <p>You Have
                                            <span>2</span>

                                            new messages
                                        </p>
                                    </div>
                                    <div class="au-message-list">
                                        <div class="au-message__item unread">
                                            <div class="au-message__item-inner">
                                                <div class="au-message__item-text">
                                                    <div class="avatar-wrap">
                                                        <div class="avatar">
                                                            <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                                        </div>
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">John Smith</h5>
                                                        <p>Have sent a photo</p>
                                                    </div>
                                                </div>
                                                <div class="au-message__item-time">
                                                    <span>12 Min ago</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-message__item unread">
                                            <div class="au-message__item-inner">
                                                <div class="au-message__item-text">
                                                    <div class="avatar-wrap online">
                                                        <div class="avatar">
                                                            <img src="images/icon/avatar-03.jpg" alt="Nicholas Martinez">
                                                        </div>
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">Nicholas Martinez</h5>
                                                        <p>You are now connected on message</p>
                                                    </div>
                                                </div>
                                                <div class="au-message__item-time">
                                                    <span>11:00 PM</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-message__item">
                                            <div class="au-message__item-inner">
                                                <div class="au-message__item-text">
                                                    <div class="avatar-wrap online">
                                                        <div class="avatar">
                                                            <img src="images/icon/avatar-04.jpg" alt="Michelle Sims">
                                                        </div>
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">Michelle Sims</h5>
                                                        <p>Lorem ipsum dolor sit amet</p>
                                                    </div>
                                                </div>
                                                <div class="au-message__item-time">
                                                    <span>Yesterday</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-message__item">
                                            <div class="au-message__item-inner">
                                                <div class="au-message__item-text">
                                                    <div class="avatar-wrap">
                                                        <div class="avatar">
                                                            <img src="images/icon/avatar-05.jpg" alt="Michelle Sims">
                                                        </div>
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">Michelle Sims</h5>
                                                        <p>Purus feugiat finibus</p>
                                                    </div>
                                                </div>
                                                <div class="au-message__item-time">
                                                    <span>Sunday</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-message__item js-load-item">
                                            <div class="au-message__item-inner">
                                                <div class="au-message__item-text">
                                                    <div class="avatar-wrap online">
                                                        <div class="avatar">
                                                            <img src="images/icon/avatar-04.jpg" alt="Michelle Sims">
                                                        </div>
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">Michelle Sims</h5>
                                                        <p>Lorem ipsum dolor sit amet</p>
                                                    </div>
                                                </div>
                                                <div class="au-message__item-time">
                                                    <span>Yesterday</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-message__item js-load-item">
                                            <div class="au-message__item-inner">
                                                <div class="au-message__item-text">
                                                    <div class="avatar-wrap">
                                                        <div class="avatar">
                                                            <img src="images/icon/avatar-05.jpg" alt="Michelle Sims">
                                                        </div>
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">Michelle Sims</h5>
                                                        <p>Purus feugiat finibus</p>
                                                    </div>
                                                </div>
                                                <div class="au-message__item-time">
                                                    <span>Sunday</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="au-message__footer">
                                        <button class="au-btn au-btn-load js-load-btn">load more</button>
                                    </div>
                                </div>
                                <div class="au-chat">
                                    <div class="au-chat__title">
                                        <div class="au-chat-info">
                                            <div class="avatar-wrap online">
                                                <div class="avatar avatar--small">
                                                    <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                                </div>
                                            </div>
                                            <span class="nick">
                                                            <a href="#">John Smith</a>
                                                        </span>
                                        </div>
                                    </div>
                                    <div class="au-chat__content">
                                        <div class="recei-mess-wrap">
                                            <span class="mess-time">12 Min ago</span>
                                            <div class="recei-mess__inner">
                                                <div class="avatar avatar--tiny">
                                                    <img src="images/icon/avatar-02.jpg" alt="John Smith">
                                                </div>
                                                <div class="recei-mess-list">
                                                    <div class="recei-mess">Lorem ipsum dolor sit amet, consectetur adipiscing elit non iaculis</div>
                                                    <div class="recei-mess">Donec tempor, sapien ac viverra</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="send-mess-wrap">
                                            <span class="mess-time">30 Sec ago</span>
                                            <div class="send-mess__inner">
                                                <div class="send-mess-list">
                                                    <div class="send-mess">Lorem ipsum dolor sit amet, consectetur adipiscing elit non iaculis</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="au-chat-textfield">
                                        <form class="au-form-icon">
                                            <input class="au-input au-input--full au-input--h65" type="text" placeholder="Type a message">
                                            <button class="au-input-icon">
                                                <i class="zmdi zmdi-camera"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
        <?php
        }else{ ?>
            <div class="container-fluid">
                <div class="row">
                     <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="text-align: center">
                         <h1 style="color: darkred">BIENVENID0(A) AL SISTEMA :</h1>
                         <h1 style="color: darkred"> <?= $usuario->persona_nombre;?> <?= $usuario->persona_apellido_paterno?></h1>
                         <br><br>
                         <h1 style="color: black">Su Rol es : <?=$usuario->rol_nombre?></h1>
                     </div>
                </div>
            </div>
        <?php
        }
        ?>
    </div>
    <!-- END MAIN CONTENT-->
    <!-- END PAGE CONTAINER-->
<!-- End of Main Content -->
<script src="<?php echo _SERVER_ . _JS_;?>domain.js"></script>
<script>
    function apertura(){
        var valor = true;
        //Extraemos las variable según los valores del campo consultado
        var caja_apertura = $('#caja_apertura').val();
        var id_caja_numero = $('#id_caja_numero').val();
        var id_turno = $('#id_turno').val();

        //Validamos si los campos a usar no se encuentran vacios
        valor = validar_campo_vacio('caja_apertura', caja_apertura, valor);
        valor = validar_campo_vacio('id_caja_numero', id_caja_numero, valor);
        valor = validar_campo_vacio('id_turno', id_turno, valor);

        if(valor){
            //Definimos el mensaje y boton a afectar
            var boton = "btn-agregar-apertura";
            //Cadena donde enviaremos los parametros por POST
            var cadena = "caja_apertura=" + caja_apertura +
                "&id_caja_numero=" + id_caja_numero +
                "&id_turno=" + id_turno;
            $.ajax({
                type: "POST",
                url: urlweb + "api/Admin/guardar_apertura_caja",
                data: cadena,
                dataType: 'json',
                beforeSend: function () {
                    cambiar_estado_boton(boton, "Guardando...", true);
                },
                success:function (r) {
                    cambiar_estado_boton(boton, "<i class=\"fa fa-save fa-sm text-white-50\"></i>  Aperturar Caja", false);
                    switch (r.result.code) {
                        case 1:
                            respuesta('¡Ingreso de Apertura Exitoso!', 'success');
                            setTimeout(function () {
                                location.reload();
                            }, 1000);
                            break;
                        case 2:
                            respuesta('Error al ingresar la apertura de la caja', 'error');
                            break;
                        default:
                            respuesta('¡Algo catastrofico ha ocurrido!', 'error');
                            break;
                    }
                }
            });
        }
    }
</script>