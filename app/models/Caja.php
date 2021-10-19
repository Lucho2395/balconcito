<?php
class Caja
{
    private $pdo;
    private $log;

    public function __construct()
    {
        $this->pdo = Database::getConnection();
        $this->log = new Log();
    }

    public function listar_cajas(){
        try{
            $sql = 'select * from caja_numero where caja_numero_estado = 1';
            $stm = $this->pdo->prepare($sql);
            $stm->execute();
            return $stm->fetchAll();
        } catch (Throwable $e){
            $this->log->insertar($e->getMessage(), get_class($this).'|'.__FUNCTION__);
            return [];
        }
    }

    public function guardar_apertura_caja($model){
        try{
            $sql = 'insert into caja (id_turno,id_caja_numero, caja_fecha, id_usuario_apertura, caja_apertura, caja_fecha_apertura, caja_estado) 
                    values (?,?,?,?,?,?,?)';
            $stm = $this->pdo->prepare($sql);
            $stm->execute([
                $model->id_turno,
                $model->id_caja_numero,
                $model->caja_fecha,
                $model->id_usuario_apertura,
                $model->caja_apertura,
                $model->caja_fecha_apertura,
                $model->caja_estado
            ]);
            return 1;
        }catch (Throwable $e){
            $this->log->insertar($e->getMessage(), get_class($this).'|'.__FUNCTION__);
            return 2;
        }
    }

    public function mostrar_valor_apertura($fecha_hoy){
        try{
            $sql = 'select caja_apertura, turno_nombre from caja c inner join turno t on c.id_turno = t.id_turno where date(caja_fecha_apertura) = ? and 
                    t.turno_estado = 1 limit 1';
            $stm = $this->pdo->prepare($sql);
            $stm->execute([$fecha_hoy]);
            $ret = $stm->fetch();
            $return = $ret->caja_apertura;
        } catch (Throwable $e){
            $this->log->insertar($e->getMessage(), get_class($this).'|'.__FUNCTION__);
            $return = 0;
        }
        return $return;
    }

    public function jalar_turno($fecha_hoy){
        try{
            $sql = 'select turno_nombre from caja c inner join turno t on c.id_turno = t.id_turno where date(caja_fecha_apertura) = ? and 
                    t.turno_estado = 1 limit 1';
            $stm = $this->pdo->prepare($sql);
            $stm->execute([$fecha_hoy]);
            $ret = $stm->fetch();
            $return = $ret->turno_nombre;
        } catch (Throwable $e){
            $this->log->insertar($e->getMessage(), get_class($this).'|'.__FUNCTION__);
            $return = 0;
        }
        return $return;
    }

    public function listar_ultima_fecha($fecha_hoy){
        try{
            $sql = 'select * from caja where date(caja_fecha_apertura) = ?';
            $stm = $this->pdo->prepare($sql);
            $stm->execute([$fecha_hoy]);
            $result = $stm->fetchAll();
            if(count($result) == 1){
                $result = true;
            } else {
                $result = false;
            }
        } catch (Throwable $e){
            $this->log->insertar($e->getMessage(), get_class($this).'|'.__FUNCTION__);
            $result = false;
        }
        return $result;
    }

    public function listar_turnos(){
        try{
            $sql = 'select * from turno where turno_estado = 1';
            $stm = $this->pdo->prepare($sql);
            $stm->execute();
            return $stm->fetchAll();
        } catch (Throwable $e){
            $this->log->insertar($e->getMessage(), get_class($this).'|'.__FUNCTION__);
            return [];
        }
    }


}
