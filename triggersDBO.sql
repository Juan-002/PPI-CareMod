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

---------------------------restar_medicamentos-------------
/*cada vez que se usen medicamentos estos se van a restar del inventario de medicamentos existentes*/
CREATE OR REPLACE TRIGGER restar_medicamentos
AFTER INSERT OR UPDATE ON TB_FORMULAS
FOR EACH ROW
BEGIN
    UPDATE tb_medicamentos
    SET cantidad = cantidad - :new.cantidad
    WHERE ID = :new.id_medicamento;
END;
/
----------------------------------------------------------------------------------------------
/********************************************************************************************/
-------**********************trigger para realizar auditorias por tablas ************--
/********************************************************************************************/
----------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER paciente_auditoria
AFTER INSERT OR UPDATE OR DELETE ON TB_PACIENTES
FOR EACH ROW
DECLARE
 accion  VARCHAR2(4000);
 detalle VARCHAR2 (100);
BEGIN
	IF inserting THEN
		accion  := ' I ';
	ELSIF updating THEN
		accion  := 'UPD: ';
        IF :OLD.persona.documento != :NEW.persona.documento THEN
			detalle := detalle || 'documento: '  ||  :OLD.persona.documento || ' -> ' || :NEW.persona.documento || '; ';
		END IF;
				
		IF :OLD.persona.tipo_documento != :NEW.persona.tipo_documento THEN
			detalle := detalle || 'tipo_documento: ' ||  :OLD.persona.tipo_documento || ' -> ' || :NEW.persona.tipo_documento || '; ';
		END IF;

		IF :OLD.persona.primer_nombre != :NEW.persona.primer_nombre THEN
			detalle := detalle || 'primer_nombre: '  ||  :OLD.persona.primer_nombre || ' -> ' || :NEW.persona.primer_nombre || '; ';
		END IF;
		
        IF :OLD.persona.segundo_nombre != :NEW.persona.segundo_nombre THEN
			detalle := detalle || 'segundo_nombre: ' ||  :OLD.persona.segundo_nombre || ' -> ' || :NEW.persona.segundo_nombre || '; ';
		END IF;
				
		IF :OLD.persona.primer_apellido != :NEW.persona.primer_apellido THEN
			detalle := detalle || 'primer_apellido: ' ||  :OLD.persona.primer_apellido || ' -> ' || :NEW.persona.primer_apellido || '; ';
		END IF;
		
		IF :OLD.persona.segundo_apellido != :NEW.persona.segundo_apellido THEN
			detalle := detalle || 'segundo_apellido: ' ||  :OLD.persona.segundo_apellido || ' -> ' || :NEW.persona.segundo_apellido || '; ';
		END IF;
		
		IF :OLD.persona.fecha_nacimiento != :NEW.persona.fecha_nacimiento THEN
			detalle := detalle || 'fecha_nacimiento: ' ||  :OLD.persona.fecha_nacimiento || ' -> ' || :NEW.persona.fecha_nacimiento || '; ';
		END IF;

		IF :OLD.RH != :NEW.RH THEN
			detalle := detalle || 'RH: ' ||  :OLD.RH || ' -> ' || :NEW.RH || '; ';
		END IF;
		
		IF :OLD.eps != :NEW.eps THEN
			detalle := detalle || 'eps: ' ||  :OLD.eps || ' -> ' || :NEW.eps || '; ';
		END IF;
		
		IF :OLD.tipo_de_usuario != :NEW.tipo_de_usuario THEN
			detalle := detalle || 'tipo_de_usuario: ' ||  :OLD.tipo_de_usuario || ' -> ' || :NEW.tipo_de_usuario || '; ';
		END IF;
		
		IF :OLD.residencia  != :NEW.residencia  THEN
			detalle := detalle || 'residencia: ' ||  :OLD.residencia  || ' -> ' || :NEW.residencia  || '; ';
		END IF;
		
		IF :OLD.religion != :NEW.religion THEN
			detalle := detalle || 'religion: ' ||  :OLD.religion || ' -> ' || :NEW.religion || '; ';
		END IF;
		
		IF :OLD.estatus_ac_noac != :NEW.estatus_ac_noac THEN
			detalle := detalle || 'Estado del paciente: ' ||  :OLD.estatus_ac_noac || ' -> ' || :NEW.estatus_ac_noac || '; ';
		END IF;

	ELSE
		accion  := ' E ';
	END IF;
	
	INSERT INTO tb_auditorias(usuario, fecha, accion, detalle)
	VALUES (USER, SYSDATE, accion, detalle );
END;
/
-----------------------------------------------------------------
/*Auditoria  para tabla acompañantes*/
-----------------------------------------------------------------

CREATE OR REPLACE TRIGGER acompañante_auditoria
AFTER INSERT OR UPDATE OR DELETE ON tb_acompanniantes
FOR EACH ROW
DECLARE
 accion  VARCHAR2(4000);
 detalle VARCHAR2 (100);
BEGIN
	IF inserting THEN
		accion  := ' I ';
	ELSIF updating THEN
		accion  := 'UPD: ';
        IF :OLD.persona.documento != :NEW.persona.documento THEN
			detalle := detalle || 'documento: '  ||  :OLD.persona.documento || ' -> ' || :NEW.persona.documento || '; ';
		END IF;
        IF :OLD.persona.primer_nombre != :NEW.persona.primer_nombre THEN
			detalle := detalle || 'primer_nombre: ' ||  :OLD.persona.primer_nombre || ' -> ' || :NEW.persona.primer_nombre || '; ';
		END IF;
        IF :OLD.persona.segundo_nombre != :NEW.persona.segundo_nombre THEN
			detalle := detalle || 'segundo_nombre: ' ||  :OLD.persona.segundo_nombre || ' -> ' || :NEW.persona.segundo_nombre || '; ';
		END IF;
		
		IF :OLD.persona.primer_apellido != :NEW.persona.primer_apellido THEN
			detalle := detalle || 'primer_apellido: ' ||  :OLD.persona.primer_apellido || ' -> ' || :NEW.persona.primer_apellido || '; ';
		END IF;
		
		IF :OLD.persona.segundo_apellido != :NEW.persona.segundo_apellido THEN
			detalle := detalle || 'segundo_apellido: ' ||  :OLD.persona.segundo_apellido || ' -> ' || :NEW.persona.segundo_apellido || '; ';
		END IF;
	ELSE
		accion  := ' E ';
	END IF;
	
	INSERT INTO tb_auditorias(usuario, fecha, accion, detalle)
	VALUES (USER, SYSDATE, accion, detalle );
END;
/

-----------------------------------------------------------------
/*Auditoria  para tabla formulas*/
-----------------------------------------------------------------

CREATE OR REPLACE TRIGGER formulas_auditoria
AFTER INSERT OR UPDATE OR DELETE ON tb_formulas
FOR EACH ROW
DECLARE
 accion  VARCHAR2(4000);
 detalle VARCHAR2 (100);
BEGIN
	IF inserting THEN
		accion  := ' I ';
	ELSIF updating THEN
		accion  := 'UPD: ';
		IF :OLD.id != :NEW.id THEN
			detalle := detalle || 'id:  '  ||  :OLD.id || ' -> ' || :NEW.id || '; ';
		END IF;
        IF :OLD.fecha != :NEW.fecha THEN
			detalle := detalle || 'fecha: '  ||  :OLD.fecha || ' -> ' || :NEW.fecha || '; ';
		END IF;
        IF :OLD.id_paciente != :NEW.id_paciente THEN
			detalle := detalle || 'id_paciente: ' ||  :OLD.id_paciente|| ' -> ' || :NEW.id_paciente|| '; ';
		END IF;
        IF :OLD.id_empleado != :NEW.id_empleado THEN
			detalle := detalle || 'id_empleado: ' ||  :OLD.id_empleado || ' -> ' || :NEW.id_empleado || '; ';
		END IF;
		IF :OLD.id_medicamento != :NEW.id_medicamento THEN
			detalle := detalle || 'id_medicamento: ' ||  :OLD.id_medicamento || ' -> ' || :NEW.id_medicamento || '; ';
		END IF;
	ELSE
		accion  := ' E ';
	END IF;
	
	INSERT INTO tb_auditorias(usuario, fecha, accion, detalle)
	VALUES (USER, SYSDATE, accion, detalle );
END;
/

-----------------------------------------------------------------
/*Auditoria  para tabla medicamentos*/
-----------------------------------------------------------------

CREATE OR REPLACE TRIGGER medicamentos_auditoria
AFTER INSERT OR UPDATE OR DELETE ON tb_medicamentos
FOR EACH ROW
DECLARE
 accion  VARCHAR2(4000);
 detalle VARCHAR2 (100);
BEGIN
	IF inserting THEN
		accion  := ' I ';
	ELSIF updating THEN
		accion  := 'UPD: ';
        IF :OLD.id != :NEW.id THEN
			detalle := detalle || 'id: '  ||  :OLD.id || ' -> ' || :NEW.id || '; ';
		END IF;
        IF :OLD.cod != :NEW.cod THEN
			detalle := detalle || 'cod: ' ||  :OLD.cod || ' -> ' || :NEW.cod || '; ';
		END IF;
        IF :OLD.nomb_medica != :NEW.nomb_medica THEN
			detalle := detalle || 'nomb_medica: ' ||  :OLD.nomb_medica || ' -> ' || :NEW.nomb_medica || '; ';
		END IF;
		IF :OLD.cantidad != :NEW.cantidad THEN
			detalle := detalle || 'cantidad: ' ||  :OLD.cantidad || ' -> ' || :NEW.cantidad || '; ';
		END IF;
		IF :OLD.unidad_medida != :NEW.unidad_medida THEN
			detalle := detalle || 'unidad_medida: ' ||  :OLD.unidad_medida || ' -> ' || :NEW.unidad_medida || '; ';
		END IF;
	ELSE
		accion  := ' E ';
	END IF;
	
	INSERT INTO tb_auditorias(usuario, fecha, accion, detalle)
	VALUES (USER, SYSDATE, accion, detalle );
END;
/

-----------------------------------------------------------------
/*Auditoria  para tabla registro_ocupaciones*/
-----------------------------------------------------------------

CREATE OR REPLACE TRIGGER registro_ocupaciones_auditoria
AFTER INSERT OR UPDATE OR DELETE ON tb_registro_ocupaciones
FOR EACH ROW
DECLARE
 accion  VARCHAR2(4000);
 detalle VARCHAR2 (100);
BEGIN
	IF inserting THEN
		accion  := 'I';
	ELSIF updating THEN
		accion  := 'UPD';
        IF :OLD.id != :NEW.id THEN
			detalle := detalle || 'id: ' ||  :OLD.id || ' -> ' || :NEW.id || '; ';
		END IF;
        IF :OLD.fecha_ingreso != :NEW.fecha_ingreso THEN
			detalle := detalle || 'fecha_ingreso: ' ||  :OLD.fecha_ingreso || ' -> ' || :NEW.fecha_ingreso || '; ';
		END IF;
        IF :OLD.fecha_salida != :NEW.fecha_salida THEN
			detalle := detalle || 'fecha_salida: ' ||  :OLD.fecha_salida || ' -> ' || :NEW.fecha_salida || '; ';
		END IF;
        IF :OLD.cama != :NEW.cama THEN
			detalle := detalle || 'cama: ' ||  :OLD.cama || ' -> ' || :NEW.cama || '; ';
		END IF;
		IF :OLD.id_paciente != :NEW.id_paciente THEN
			detalle := detalle || 'id_paciente: ' ||  :OLD.id_paciente || ' -> ' || :NEW.id_paciente || '; ';
		END IF;
	ELSE
		accion  := 'E';
	END IF;
	
	INSERT INTO tb_auditorias(usuario, fecha, accion, detalle)
	VALUES (USER, SYSDATE, accion, detalle );
END;
/

-----------------------------------------------------------------
/*Auditoria  para tabla empleados*/
-----------------------------------------------------------------
CREATE OR REPLACE TRIGGER empleados_auditoria
AFTER INSERT OR UPDATE OR DELETE ON tb_empleados
FOR EACH ROW
DECLARE
 accion  VARCHAR2(4000);
 detalle VARCHAR2 (100);
BEGIN
	IF inserting THEN
		accion  := ' I ';
	ELSIF updating THEN
		accion  := 'UPD: ';
        IF :OLD.persona.documento != :NEW.persona.documento THEN
			detalle := detalle || 'documento: '  ||  :OLD.persona.documento || ' -> ' || :NEW.persona.documento || '; ';
		END IF;
        IF :OLD.persona.primer_nombre != :NEW.persona.primer_nombre THEN
			detalle := detalle || 'primer_nombre: ' ||  :OLD.persona.primer_nombre || ' -> ' || :NEW.persona.primer_nombre || '; ';
		END IF;
        IF :OLD.persona.segundo_nombre != :NEW.persona.segundo_nombre THEN
			detalle := detalle || 'segundo_nombre: ' ||  :OLD.persona.segundo_nombre || ' -> ' || :NEW.persona.segundo_nombre || '; ';
		END IF;
		IF :OLD.persona.primer_apellido != :NEW.persona.primer_apellido THEN
			detalle := detalle || 'primer_apellido: ' ||  :OLD.persona.primer_apellido || ' -> ' || :NEW.persona.primer_apellido || '; ';
		END IF;
		IF :OLD.persona.segundo_apellido != :NEW.persona.segundo_apellido THEN
			detalle := detalle || 'segundo_apellido: ' ||  :OLD.persona.segundo_apellido || ' -> ' || :NEW.persona.segundo_apellido || '; ';
		END IF;
		IF :OLD.fecha_de_ingreso != :NEW.fecha_de_ingreso THEN
			detalle := detalle || 'fecha_de_ingreso: ' ||  :OLD.fecha_de_ingreso || ' -> ' || :NEW.fecha_de_ingreso || '; ';
		END IF;
		IF :OLD.jefe != :NEW.jefe THEN
			detalle := detalle || 'jefe: ' ||  :OLD.jefe || ' -> ' || :NEW.jefe || '; ';
		END IF;
		IF :OLD.nombre_usuario != :NEW.nombre_usuario THEN
			detalle := detalle || 'nombre_usuario: ' ||  :OLD.nombre_usuario || ' -> ' || :NEW.nombre_usuario || '; ';
		END IF;
		IF :OLD.contrasennia != :NEW.contrasennia THEN
			detalle := detalle || 'contraseña: ' ||  :OLD.contrasennia || ' -> ' || :NEW.contrasennia || '; ';
		END IF;
		IF :OLD.detalle_permisos != :NEW.detalle_permisos THEN
			detalle := detalle || 'detalle_permisos: ' ||  :OLD.detalle_permisos || ' -> ' || :NEW.detalle_permisos || '; ';
		END IF;
	ELSE
		accion  := ' E ';
	END IF;
	
	INSERT INTO tb_auditorias(usuario, fecha, accion, detalle)
	VALUES (USER, SYSDATE, accion, detalle );
END;
/