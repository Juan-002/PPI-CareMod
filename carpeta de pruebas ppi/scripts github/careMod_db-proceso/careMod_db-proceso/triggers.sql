prompt +----------------------------+
prompt |    Creacion de triggers    |
prompt +----------------------------+

-----FECHA DE EDICION DE LA TABLA TB_FORMULAS-----
/*Cada vez que se realice algun cambio sea un UPDATE o un DELETE 
en esta tabla, la fecha de actualizacion se cambiara de manera automatica*/
CREATE OR REPLACE TRIGGER trg_actualizar_fecha_formula
BEFORE UPDATE ON tb_formulas
FOR EACH ROW
BEGIN
    :NEW.fecha_actualizacion := SYSDATE;
END;
/

-----FECHA DE EDICION DE LA TABLA TB_PACIENTES-----
/*Cada vez que se realice algun cambio sea un UPDATE o un DELETE 
en esta tabla, la fecha de edicion se cambiara de manera automatica*/
CREATE OR REPLACE TRIGGER trg_fecha_edicion_paciente
BEFORE UPDATE ON TB_PACIENTES
FOR EACH ROW
BEGIN
    :NEW.fecha_edicion := SYSDATE;
END;
/

-----------------------actualiza cada ves que se realiza cambios a la tb tb_detalle_formulas------------------------------

CREATE OR REPLACE TRIGGER trg_fecha_edicion_formulas
BEFORE UPDATE ON tb_detalle_formulas
FOR EACH ROW
BEGIN
    :NEW.fecha_actualizacion := SYSDATE;
END;
/

---------------------------restar_medicamentos-------------
/*cada vez que se usen medicamentos estos se van a restar del inventario de medicamentos existentes*/
CREATE OR REPLACE TRIGGER restar_medicamentos
AFTER INSERT OR UPDATE ON TB_DETALLE_FORMULAS
FOR EACH ROW
BEGIN
    UPDATE tb_medicamentos
    SET cantidad = cantidad - :new.cantidad
    WHERE ID = :new.id_del_medicamento;
END;
/
--------------------------------

---Agregar trigger que no permita registrar datos de un paciente que salio para el otro dia--7



