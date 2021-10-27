

<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800"><?= $_SESSION['controlador'] . ' / ' . $_SESSION['accion'];?></h1>
            </div>

            <form method="post" action="<?= _SERVER_ ?>Reporte/reporte_general">
                <input type="hidden" id="enviar_fecha" name="enviar_fecha" value="1">
                <div class="row">
                    <div class="col-lg-2">
                        <label for="">Caja</label>
                        <select class="form-control" name="id_caja_numero" id="id_caja_numero">
                            <?php
                            (isset($caja_))?$cajita=$caja_->id_caja_numero:$cajita=0;
                            foreach($caja as $l){
                                ($l->id_caja_numero == $cajita)?$sele='selected':$sele='';
                                ?>
                                <option value="<?php echo $l->id_caja_numero;?>" <?= $sele; ?>><?php echo $l->caja_numero_nombre;?></option>
                                <?php
                            }
                            ?>
                        </select>
                    </div>
                    <div class="col-lg-3">
                        <label for="turno">Desde:</label>
                        <input type="date" class="form-control" id="fecha_filtro" name="fecha_filtro" step="1" value="<?php echo $fecha_i;?>">
                    </div>
                    <div class="col-lg-3">
                        <label for="turno">Hasta:</label>
                        <input type="date" class="form-control" id="fecha_filtro_fin" name="fecha_filtro_fin" value="<?php echo $fecha_f;?>">
                    </div>
                    <div class="col-lg-3">
                        <button style="margin-top: 35px;" class="btn btn-success" ><i class="fa fa-search"></i> Buscar Registro</button>
                    </div>
                </div>
            </form>
            <br>

            <div class="row">
                <?php
                foreach ($cajas_totales as $ct){
                $datitos = $this->reporte->datitos_caja($ct->id_caja);
                ?>
                <div class="col-lg-6">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table">
                                <p>Apertura : <?= $datitos->caja_fecha_apertura;?> // Cierre : <?= $datitos->caja_fecha_cierre?> // Monto Cierre : <?= $datitos->caja_cierre;?></p>
                                <?php
                                if($datos){
                                    $fecha_ini_caja = $datitos->caja_fecha_apertura;
                                    if($datitos->caja_fecha_cierre==NULL){
                                        $fecha_fin_caja = date('Y-m-d H:i:s');
                                    }else{
                                        $fecha_fin_caja = $datitos->caja_fecha_cierre;
                                    }

                                    $reporte_ingresos = $this->reporte->reporte_ingresos_x_caja($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
                                    $monto_caja_apertura = $this->reporte->reporte_caja_x_caja($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
                                    $ingreso_caja_chica = $this->reporte->ingreso_caja_chica_x_caja($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
                                    $ventas_efectivo = $this->reporte->ventas_efectivo($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
                                    $ventas_trans = $this->reporte->ventas_trans($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
                                    $ventas_tarjeta = $this->reporte->ventas_tarjeta($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
                                    $salida_caja_chica = $this->reporte->salida_caja_chica_x_caja($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);

                                    $ingresos = $reporte_ingresos->total;
                                    $monto_caja_apertura = $monto_caja_apertura->total;
                                    $ingreso_caja_chica = $ingreso_caja_chica->total;
                                    $ventas_efectivo  = $ventas_efectivo->total;
                                    $ventas_trans  = $ventas_trans->total;
                                    $ventas_tarjeta  = $ventas_tarjeta->total;
                                    $salida_caja_chica = $salida_caja_chica->total;

                                    $diferencia = $monto_caja_apertura + $ingreso_caja_chica + $ventas_efectivo - $salida_caja_chica;
                                    $ingresos_total =  $monto_caja_apertura + $ingreso_caja_chica + $ventas_efectivo + $ventas_trans + $ventas_tarjeta;
                                }

                                ?>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- INGRESOS :</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right"> S/.<?= $ingresos_totales ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Apertura de Caja</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right"> S/.<?= $monto_caja_apertura ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Ingresos caja chica</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ingreso_caja_chica ?? 0?></label>
                                    </div>
                                </div>
                                <p style="border-bottom: 1px solid red"></p>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- VENTAS :</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ventas_efectivo ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Pagos Efectivo:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ventas_efectivo ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Pagos Tarjeta:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ventas_tarjeta ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Pagos Transferencia:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ventas_trans ?? 0?></label>
                                    </div>
                                </div>
                                <p style="border-bottom: 1px solid red"></p>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- EGRESOS :</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $salida_caja_chica ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Salida caja chica :</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $salida_caja_chica ?? 0?></label>
                                    </div>
                                </div>
                                <p style="border-bottom: 1px solid red"></p>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- TOTAL EFECTIVO :</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $diferencia ?? 0?></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <?php
                }
                ?>
                <div class="col-lg-6">
                    <div class="card shadow mb-4">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" style="border-color: black">
                                <thead>
                                <tr style="background-color: #ebebeb">
                                    <th>PRODUCTO</th>
                                    <th>FECHAS</th>
                                    <th>CANT.</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach ($productos as $p){
                                    ?>
                                    <tr>
                                        <td><?= $p->producto_nombre?></td>
                                        <td><?= $fecha_i?> / <?= $fecha_f?></td>
                                        <td><?= $p->total?></td>
                                    </tr>
                                    <?php
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12" style="text-align: center">
                    <a id="imprimir_ticket" style="color: white;" class="btn btn-primary" target="_blank" onclick="ticket_venta('<?= $fecha_i; ?>','<?= $fecha_f?>')"><i class="fa fa-print"></i> Imprimir</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo _SERVER_ . _JS_;?>domain.js"></script>
<script>
    function ticket_venta(fecha_i,fecha_f){
        var boton = 'imprimir_ticket';

        $.ajax({
            type: 'POST',
            url: urlweb + "api/Reporte/ticket_reporte",
            data: "fecha_i=" + fecha_i + "&fecha_f=" + fecha_f,
            dataType: 'json',
            beforeSend: function () {
                cambiar_estado_boton(boton, 'imprimiendo...', true);
            },
            success:function (r) {
                cambiar_estado_boton(boton, "<i class=\"fa fa-print\"></i> Imprimir", false);
                switch (r.result.code) {
                    case 1:
                        respuesta('¡Éxito!...', 'success');
                        setTimeout(function () {
                            location.reload();
                        }, 800);
                        break;
                    default:
                        respuesta('¡Algo catastrofico ha ocurrido!', 'error');
                        break;
                }
            }
        });
    }
</script>