

<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800"><?= $_SESSION['controlador'] . ' / ' . $_SESSION['accion'];?></h1>
            </div>

            <form method="post" action="<?= _SERVER_ ?>Reporte/reporte_general">
                <input type="hidden" id="enviar_fecha" name="enviar_fecha" value="1">
                <div class="row">
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
                <div class="col-lg-6">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table">
                                <?php
                                if($datos){
                                    $caja_total = 0;
                                    $ingresos_total = 0;
                                    $egresos_totales = 0;
                                    $ingresos_tarjeta_total = 0;
                                    $ingresos_trans_total = 0;
                                    $ingresos_totales = 0;
                                    $movimientos_caja_chica = 0;
                                    $salida_caja_chica = 0;
                                    $orden_pedido_total = 0;
                                    for($i=$fecha_filtro;$i<=$fecha_filtro_fin;$i+=86400){

                                        $reporte_ingresos = $this->reporte->listar_datos_ingresos(date("Y-m-d",$i));
                                        $reporte_orden_pedido = $this->reporte->listar_monto_op(date("Y-m-d",$i));
                                        $reporte_ingresos_tarjeta = $this->reporte->listar_datos_ingresos_tarjeta(date("Y-m-d",$i));
                                        $reporte_ngresos_transferencia = $this->reporte->listar_datos_ingresos_transferencia(date("Y-m-d",$i));
                                        $caja = $this->reporte->sumar_caja(date("Y-m-d",$i));
                                        $reporte_egresos_movi = $this->reporte->listar_datos_egresos(date("Y-m-d",$i));
                                        $reporte_ingresos_movi = $this->reporte->listar_datos_ingresos_caja(date("Y-m-d",$i));

                                        $reporte_ingresos_movi = $reporte_ingresos_movi->total;
                                        $reporte_egresos_movi = $reporte_egresos_movi->total;
                                        $caja = $caja->total;
                                        $reporte_ingresos_tarjeta = $reporte_ingresos_tarjeta->total;
                                        $reporte_ngresos_transferencia = $reporte_ngresos_transferencia->total;
                                        $ingresos = $reporte_ingresos->total;
                                        $reporte_orden_pedido = $reporte_orden_pedido->total;

                                        $caja_total = $caja_total + $caja;
                                        $ingresos_total = $ingresos_total + $ingresos;
                                        $orden_pedido_total = $orden_pedido_total + $reporte_orden_pedido;
                                        $ingresos_tarjeta_total = $ingresos_tarjeta_total + $reporte_ingresos_tarjeta;
                                        $ingresos_trans_total = $ingresos_trans_total + $reporte_ngresos_transferencia;
                                        $movimientos_caja_chica = $movimientos_caja_chica + $reporte_ingresos_movi;
                                        $salida_caja_chica = $salida_caja_chica + $reporte_egresos_movi;


                                        //$fecha = date("d-m-Y",$i);
                                    }
                                    $egresos_totales = $egresos_totales + $salida_caja_chica + $orden_pedido_total;
                                    $ingresos_totales = $ingresos_totales + $ingresos_tarjeta_total + $ingresos_trans_total + $ingresos_total + $caja_total + $movimientos_caja_chica;
                                    $diferencia = $caja_total + $movimientos_caja_chica + $ingresos_total - $salida_caja_chica - $orden_pedido_total;

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
                                        <label style="text-align: right"> S/.<?= $caja_total ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Ingresos caja chica</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $movimientos_caja_chica ?? 0?></label>
                                    </div>
                                </div>
                                <p style="border-bottom: 1px solid red"></p>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- VENTAS :</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ingresos_total ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Pagos Efectivo:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ingresos_total ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Pagos Tarjeta:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ingresos_tarjeta_total ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Pagos Transferencia:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $ingresos_trans_total ?? 0?></label>
                                    </div>
                                </div>
                                <p style="border-bottom: 1px solid red"></p>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- EGRESOS :</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $egresos_totales ?? 0?></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>- Orden de Compras:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align: right;"> S/.<?= $orden_pedido_total ?? 0?></label>
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
                    <a href="<?= _SERVER_ ; ?>index.php?c=Reporte&a=reporte_general_pdf&fecha_filtro=<?= $_POST['fecha_filtro']?>&fecha_filtro_fin=<?= $_POST['fecha_filtro_fin']?>" target="_blank" class="btn btn-primary"><i class="fa fa-print"></i> Imprimir</a>
                </div>
            </div>
        </div>
    </div>
</div>