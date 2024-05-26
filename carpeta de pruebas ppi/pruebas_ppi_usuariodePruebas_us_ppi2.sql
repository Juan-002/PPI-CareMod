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