--------------------------------------------------------------------------------------
------------Inician a ser declaradas las reglas de integridad de datos----------------
--------------------------------------------------------------------------------------
-------------------------------------------------------
----REGLAS PARA LA TB_ EPS-----------------------------
-------------------------------------------------------
ALTER TABLE tb_eps
	ADD CONSTRAINTS tb_eps_pk PRIMARY KEY (id);
	
ALTER TABLE tb_eps
	ADD CONSTRAINTS nn_tb_eps_nombre CHECK (nombre IS NOT NULL);

ALTER TABLE tb_eps
	ADD CONSTRAINTS nn_tb_eps_cod_superint CHECK (cod_superint IS NOT NULL);

ALTER TABLE tb_eps
	ADD CONSTRAINTS nn_tb_eps_direccion CHECK (direccion IS NOT NULL);

----------------------------------------------------------------------------
-----------reglas tb_creencias--------------
----------------------------------------------------------------------------
ALTER TABLE tb_creencias
	ADD CONSTRAINTS tb_creencias_pk PRIMARY KEY (id);
	
ALTER TABLE tb_creencias
	ADD CONSTRAINTS nn_tb_creencias_nombre CHECK (nombre IS NOT NULL);

-----------------------------------------------------------------------------
-- REGLAS ACOMPAÑANTES ---
-----------------------------------------------------------------------------
ALTER TABLE tb_acompanniantes
	ADD CONSTRAINTS tb_acompanniantes_pk PRIMARY KEY (persona.documento);

ALTER TABLE tb_acompanniantes
	ADD CONSTRAINTS nn_parentesco CHECK (parentesco IS NOT NULL);
	
-----------------------------------------------------------------------------------------
-----------reglas para tb_detalles_permisos_formularios --------------
-----------------------------------------------------------------------------------------
ALTER TABLE tb_detalles_permisos_formularios
	ADD CONSTRAINTS tb_permisos_pk PRIMARY KEY (id);

ALTER TABLE tb_detalles_permisos_formularios
	ADD CONSTRAINTS nn_leer CHECK (leer IS NOT NULL);

ALTER TABLE tb_detalles_permisos_formularios 
	add CONSTRAINTS	nn_permiso_rol  CHECK (rol.cargo.id  IS NOT NULL);
	
ALTER TABLE tb_detalles_permisos_formularios 
	add CONSTRAINTS	nn_permiso_formulario  CHECK (formulario.id  IS NOT NULL);

--------------------------------------------------------------------------------
---------reglas para tb_empleados -----
----------------------------------------------------------------------------------
ALTER TABLE tb_empleados 
	add CONSTRAINTS	nn_fecha_de_ingreso CHECK (fecha_de_ingreso IS NOT NULL);

ALTER TABLE tb_empleados 
	add CONSTRAINTS	nn_tb_empleados_jefe CHECK (jefe IS NOT NULL);
	
ALTER TABLE tb_empleados 
	add CONSTRAINTS	nn_tb_empleados_contrasennia  CHECK (contrasennia IS NOT NULL);
	
ALTER TABLE tb_empleados 
	add CONSTRAINTS	nn_tb_empleados_nombre_usuario CHECK (nombre_usuario IS NOT NULL);
		
ALTER TABLE tb_empleados
    ADD CONSTRAINTS tb_empleados_pk PRIMARY KEY ( persona.documento );
	
ALTER TABLE tb_empleados
    ADD CONSTRAINTS FK_detalles_permisos FOREIGN KEY ( detalle_permisos )
        REFERENCES tb_detalles_permisos_formularios ( id );
	
	
------------constrains de paciente--------------------------------------------------------
	
ALTER TABLE tb_pacientes
    ADD CONSTRAINTS tb_paciente_pk PRIMARY KEY (persona.documento);
	
ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_fecha_de_nacimiento  CHECK (persona.fecha_nacimiento  IS NOT NULL);

ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_RH  CHECK (RH  IS NOT NULL);
	
ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_tb_pacientes_eps CHECK (eps IS NOT NULL);	
	
ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_tb_pacientes_tipo_de_usuario CHECK (tipo_de_usuario IS NOT NULL);
	
ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_tb_pacientes_recidencia CHECK (residencia IS NOT NULL);	

ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_tb_pacientes_religion CHECK (religion IS NOT NULL);
	
ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_tb_pacientes_estatus CHECK (estatus_ac_noac IS NOT NULL);

ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_tb_pacientes_fecha_creacion  CHECK (fecha_creacion  IS NOT NULL);	
	
ALTER TABLE tb_pacientes 
	add CONSTRAINTS	nn_tb_alerta  CHECK ( alerta.amarillo  IS NOT NULL);
-------------------------------------------------------
---------------------reglas detalle acompanniantes
------------------------------------------------------- reglas contruidas linea
ALTER TABLE tb_detalle_acompanniantes
	ADD CONSTRAINTS tb_detalle_acompanniantes_pk PRIMARY KEY (id);
	
ALTER TABLE tb_detalle_acompanniantes
    ADD CONSTRAINTS fk_detalle_acompanniantes FOREIGN KEY ( id_acompanniante )
        REFERENCES tb_acompanniantes ( persona.documento );

ALTER TABLE tb_detalle_acompanniantes
    ADD CONSTRAINTS fk_detalle_paciente FOREIGN KEY ( id_paciente )
        REFERENCES tb_acompanniantes ( persona.documento );
		
--------------------------------------------------------------------------------
------reglas tb_medicamentos----------------------------------------------------
--------------------------------------------------------------------------------
ALTER TABLE tb_medicamentos
	ADD CONSTRAINTS tb_medicamentos_pk PRIMARY KEY (id);

ALTER TABLE tb_medicamentos
	add CONSTRAINTS	nn_tb_medicamentos_cod CHECK (cod IS NOT NULL);	
	
ALTER TABLE tb_medicamentos
	add CONSTRAINTS	nn_medicamentos_nomb_medica CHECK (nomb_medica IS NOT NULL);
	
ALTER TABLE tb_medicamentos
	add CONSTRAINTS	nn_medicamentos_cantidad CHECK (cantidad IS NOT NULL);
ALTER TABLE tb_medicamentos
	add CONSTRAINTS	nn_medicamentos_unidad_medida CHECK (unidad_medida IS NOT NULL);

-------------------------------------------------------------------------------------
---------------------Reglas Tb_formulas----------
-------------------------------------------------------------------------------------
ALTER TABLE tb_formulas
	ADD CONSTRAINTS tb_formulas_pk PRIMARY KEY (id);
	
ALTER TABLE tb_formulas
	add CONSTRAINTS	nn_tb_formulas_fecha CHECK (fecha IS NOT NULL);

ALTER TABLE tb_formulas
    ADD CONSTRAINTS fk_formulass_paciente FOREIGN KEY ( id_paciente )
        REFERENCES tb_pacientes ( persona.documento );	
		
ALTER TABLE tb_formulas
	add CONSTRAINTS	nn_tb_formulas_paciente CHECK (id_paciente IS NOT NULL);	
	
ALTER TABLE tb_formulas
    ADD CONSTRAINTS fk_formulass_empleado FOREIGN KEY ( id_empleado )
        REFERENCES tb_empleados ( persona.documento );	

ALTER TABLE tb_formulas
	add CONSTRAINTS	nn_tb_formulas_empleado CHECK (id_empleado IS NOT NULL);

ALTER TABLE tb_formulas
	add CONSTRAINTS	nn_tb_formulas_cant_med CHECK (cantidad IS NOT NULL);	
	
-------------------------------------------------------------------------------
----------------Reglas para la tabla camas----------
-------------------------------------------------------------------------------
ALTER TABLE tb_camas
	ADD CONSTRAINTS tb_camas_pk PRIMARY KEY (id);

ALTER TABLE tb_camas
	add CONSTRAINTS	nn_tb_camas_nombre_cama CHECK (nombre_cama IS NOT NULL);
	
ALTER TABLE tb_camas
	add CONSTRAINTS	nn_tb_camas_habitacion CHECK (habitacion.id IS NOT NULL);

ALTER TABLE tb_camas
	add CONSTRAINTS	nn_tb_camas_estado CHECK (estado IS NOT NULL);
-------------------------------------------------------------------------------
----------------Reglas para tb_registro_ocupaciones------
-------------------------------------------------------------------------------
ALTER TABLE tb_registro_ocupaciones
	ADD CONSTRAINTS tb_ocupaciones_pk PRIMARY KEY (id);

ALTER TABLE tb_registro_ocupaciones
	add CONSTRAINTS	nn_tb_registro_fecha CHECK (fecha_ingreso IS NOT NULL);

ALTER TABLE tb_registro_ocupaciones
    ADD CONSTRAINTS fk_cama FOREIGN KEY ( cama )
        REFERENCES tb_camas ( id );

ALTER TABLE tb_registro_ocupaciones
	add CONSTRAINTS	nn_tb_ocupacion_cama CHECK (cama IS NOT NULL);
	
ALTER TABLE tb_registro_ocupaciones
    ADD CONSTRAINTS fk_ocupacio_paciente FOREIGN KEY ( id_paciente )
        REFERENCES tb_pacientes ( persona.documento );

ALTER TABLE tb_registro_ocupaciones
	add CONSTRAINTS	nn_tb_ocupaciones_paciente CHECK (id_paciente IS NOT NULL);	
	
------------------------------------------------------------------------------------------
---------------- tb_turnos ------------
------------------------------------------------------------------------------------------
ALTER TABLE tb_turnos
	ADD CONSTRAINTS tb_turnos_pk PRIMARY KEY (id);

ALTER TABLE tb_turnos
    ADD CONSTRAINTS fk_turnos_empleado FOREIGN KEY ( id_empleado )
        REFERENCES tb_pacientes ( persona.documento );

ALTER TABLE tb_turnos
	add CONSTRAINTS	nn_turnos_empleado CHECK (id_empleado IS NOT NULL);
