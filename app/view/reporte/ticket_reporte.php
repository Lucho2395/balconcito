<?php
/**
 * Created by PhpStorm
 * User: LuisSalazar
 * Date: 29/04/2021
 * Time: 11:18 p. m.
 */

require 'app/models/autoload.php'; //Nota: si renombraste la carpeta a algo diferente de "ticket" cambia el nombre en esta línea
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;



$nombre_impresora = "Ticketera";


$connector = new WindowsPrintConnector($nombre_impresora);
$printer = new Printer($connector);


/*
	Vamos a imprimir un logotipo
	opcional. Recuerda que esto
	no funcionará en todas las
	impresoras

	Pequeña nota: Es recomendable que la imagen no sea
	transparente (aunque sea png hay que quitar el canal alfa)
	y que tenga una resolución baja. En mi caso
	la imagen que uso es de 250 x 250
*/
/* Initialize */
$printer -> initialize();
# Vamos a alinear al centro lo próximo que imprimamos
$printer->setJustification(Printer::JUSTIFY_CENTER);

/*
	Intentaremos cargar e imprimir
	el logo
*/
try{
    $logo = EscposImage::load("media/logo/logo_ruta_ticket.png", false);
    $printer->bitImage($logo);
}catch(Exception $e){/*No hacemos nada si hay error*/}
/*
	Ahora vamos a imprimir un encabezado
*/
$printer->setFont(Printer::FONT_B);
$printer->setTextSize(2,2);
$printer->text("REPORTE GENERAL" . "\n");
$printer->setFont(Printer::FONT_A);
$printer->setTextSize(1,1);
//$printer->text("$dato_pago->empresa_nombre" . "\n");
$printer->text("DEL DIA : " . "$fecha_i AL $fecha_f\n");//AQUI IRIA LA FECHA

//$printer->text("PADRES:       $padre1" . "\n" . "           $padre2" . "\n");
# Vamos a alinear al centro lo próximo que imprimamos
$printer->setJustification(Printer::JUSTIFY_CENTER);
$printer->text("------------------------------------------------" . "\n");
/*
	Ahora vamos a imprimir los
	productos
*/

# Para mostrar el total
$total = 0;
foreach ($cajas_totales as $ct){
    $datitos = $this->reporte->datitos_caja($ct->id_caja);

    $fecha_ini_caja = $datitos->caja_fecha_apertura;
    if ($datitos->caja_fecha_cierre == NULL) {
        $fecha_fin_caja = date('Y-m-d H:i:s');
    } else {
        $fecha_fin_caja = $datitos->caja_fecha_cierre;
    }

    $monto_caja_apertura = $this->reporte->reporte_caja_x_caja($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
    $ingreso_caja_chica = $this->reporte->ingreso_caja_chica_x_caja($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
    $ventas_efectivo = $this->reporte->ventas_efectivo($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
    $ventas_trans = $this->reporte->ventas_trans($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
    $ventas_tarjeta = $this->reporte->ventas_tarjeta($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);
    $salida_caja_chica = $this->reporte->salida_caja_chica_x_caja($ct->id_caja, $fecha_ini_caja, $fecha_fin_caja);

    $monto_caja_apertura = $monto_caja_apertura->total;
    $ingreso_caja_chica = $ingreso_caja_chica->total;
    $ventas_efectivo  = $ventas_efectivo->total;
    $ventas_trans  = $ventas_trans->total;
    $ventas_tarjeta  = $ventas_tarjeta->total;
    $salida_caja_chica = $salida_caja_chica->total;

    $diferencia = $monto_caja_apertura + $ingreso_caja_chica + $ventas_efectivo - $salida_caja_chica;
    $ingresos_total =  $monto_caja_apertura + $ingreso_caja_chica + $ventas_efectivo + $ventas_trans + $ventas_tarjeta;
    ($salida_caja_chica==NULL)?$sa_ca_chi='0.00':$sa_ca_chi=$salida_caja_chica;
    ($ingreso_caja_chica==NULL)?$in_ca_chi='0.00':$in_ca_chi=$ingreso_caja_chica;
    ($ventas_trans==NULL)?$ve_tras='0.00':$ve_tras=$ventas_trans;

    /*Alinear a la izquierda para la cantidad y el nombre*/
    $printer->setJustification(Printer::JUSTIFY_LEFT);
    $printer->text('INGRESOS'. '                            S/ ' . $ingresos_total . "\n");
    $printer->text('APERTURA DE CAJA'.'                   S/ ' . $monto_caja_apertura  . "\n");
    $printer->text('INGRESOS DE CAJA CHICA' .'              S/ ' . $in_ca_chi  . "\n");
    $printer->text("------------------------------------------------\n");
    $printer->text('VENTAS' .'                              S/ ' . $ventas_efectivo  . "\n");
    $printer->text('PAGOS EFECTIVO' .'                      S/ ' . $ventas_efectivo  . "\n");
    $printer->text('PAGOS TARJETA' . '                        S/ ' . $ventas_tarjeta  ."\n");
    $printer->text('PAGOS TRANSFERENCIA' . '                  S/ ' . $ve_tras  ."\n");
    $printer->text("------------------------------------------------\n");
    $printer->text('EGRESOS' .'                             S/ ' . $sa_ca_chi  . "\n");
    $printer->text('SALIDAS CAJA CHICA' .'                  S/ ' . $sa_ca_chi  . "\n");
    $printer->text("------------------------------------------------\n");
    $printer->text('TOTAL EFECTIVO' . '                      S/ ' . $diferencia  . "\n");

    /*Y a la derecha para el importe*/
    //$printer->setJustification(Printer::JUSTIFY_CENTER);
    //$printer->text($dp->venta_detalle_cantidad . "   x   " .$dp->venta_detalle_valor_unitario.'  S/ ' . $dp->venta_detalle_valor_total . "\n");
}

/*
	Terminamos de imprimir
	los productos, ahora va el total
*/
$printer->text("------------------------------------------------\n");


/*Alinear a la izquierda para la cantidad y el nombre*/
//$printer->setJustification(Printer::JUSTIFY_LEFT);
//if($venta->venta_totalgratuita > 0){
//    $printer->text("   OP. GRAT: S/ ". $venta->venta_totalgratuita ."\n");
//
//}
//$printer->text("   OP. EXON: S/ ". $venta->venta_totalexonerada ."\n");
//if($venta->venta_totalinafecta > 0){
//    $printer->text("   OP. INAF: S/ ". $venta->venta_totalinafecta ."\n");
//}
//$printer->text("    OP. GRAV: S/ ". $venta->venta_totalgravada ."\n");
//$printer->text("    IGV: S/ ". $venta->venta_totaligv ."\n");
//if($venta->venta_icbper > 0){
//    $printer->text("    ICBPER: S/ ". $venta->venta_icbper ."\n");
//}
//
//$printer->text("    TOTAL: S/ ". $venta->venta_total ."\n");
//if($venta->venta_pago_cliente > 0){
//    $printer->setFont(Printer::FONT_B);
//    $printer->setTextSize(1,1);
//    $printer->text("    PAGÓ CON: S/ ". $venta->venta_pago_cliente ."\n");
//    $printer->text("    Vuelto: S/ ". $venta->venta_vuelto ."\n");
//}
//$printer->setFont(Printer::FONT_A);
//$printer->setTextSize(1,1);
//$printer->setJustification(Printer::JUSTIFY_CENTER);
//$printer->text(CantidadEnLetra($venta->venta_total) ."\n");
//$printer->text("------------------------------------------------" . "\n");
//if($venta->venta_tipo == "07" || $venta->venta_tipo == "08"){
//    if($venta->tipo_documento_modificar == "03"){
//        $documento = "BOLETA";
//    }else{
//        $documento = "FACTURA";
//    }
//    $printer->setJustification(Printer::JUSTIFY_LEFT);
//    $printer->text("DOCUMENTO:              $documento" . "\n");
//    $printer->text("SERIE MODIFICADA:       $venta->serie_modificar" . "\n");
//    $printer->text("CORRELATIVO MODIFICADO: $venta->correlativo_modificar" . "\n");
//    $printer->text("MOTIVO: $motivo->tipo_nota_descripcion" . "\n");
//}
//try{
//    $logo = EscposImage::load("$ruta_qr", false);
//    $printer->bitImage($logo);
//}catch(Exception $e){/*No hacemos nada si hay error*/}
//
//
///*
//	Podemos poner también un pie de página
//*/
//$printer->setJustification(Printer::JUSTIFY_CENTER);
//$printer->setFont(Printer::FONT_C);
//$printer->setTextSize(1,1);
//$printer->text("BIENES TRANSFERIDOS EN LA AMAZONIA PARA" . "\n");
//$printer->text("SER CONSUMIDOS EN LA MISMA" . "\n");
//$printer->setJustification(Printer::JUSTIFY_CENTER);
//$printer->text("------------------------------------------------" . "\n");
//$printer->setFont(Printer::FONT_B);
//$printer->setTextSize(1,1);
//$printer->text("Digitaliza tu negocio, sistemas a medida" . "\n");
//$printer->text("con Facturación Electrónica... Whatsapp" . "\n");
//$printer->text("Business +51925642418 / bufeotec.com" . "\n");


/*Alimentamos el papel 3 veces*/
$printer->feed(2);

/*
	Cortamos el papel. Si nuestra impresora
	no tiene soporte para ello, no generará
	ningún error
*/
$printer->cut();

/*
	Por medio de la impresora mandamos un pulso.
	Esto es útil cuando la tenemos conectada
	por ejemplo a un cajón
*/
$printer->pulse();

/*
	Para imprimir realmente, tenemos que "cerrar"
	la conexión con la impresora. Recuerda incluir esto al final de todos los archivos
*/
$printer->close();

?>

