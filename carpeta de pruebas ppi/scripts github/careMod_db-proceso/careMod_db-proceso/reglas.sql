--- creacion de Reglas de integridad de datos entre las cuales estan llaves primarias, datos que no pueden ser nulos
--- llaves foraneas, indices unicos,  establecimiento de formato de fechas  entre otros

prompt +--------------------------------+
prompt |    Aplicacion de las reglas    |
prompt +--------------------------------+

prompt ----------tb_medicamentos-------

ALTER TABLE tb_medicamentos
    ADD CONSTRAINT nn_cod_med    		  CHECK(cod IS NOT NULL);

ALTER TABLE tb_medicamentos
    ADD CONSTRAINT nn_nomb_medic_med 	  CHECK(nomb_medica IS NOT NULL);

ALTER TABLE tb_medicamentos
    ADD CONSTRAINT nn_cantidad_med  	  CHECK(cantidad IS NOT NULL);

ALTER TABLE tb_medicamentos
    ADD CONSTRAINT nn_unidad_medida_med  CHECK(unidad_medida IS NOT NULL);

ALTER TABLE tb_medicamentos
    ADD CONSTRAINT tb_medicamentos_pk PRIMARY KEY ( id );

CREATE UNIQUE INDEX idx_cod_unique ON tb_medicamentos (cod);

prompt ----------tb_habitaciones-------

ALTER TABLE tb_habitaciones
    ADD CONSTRAINT nn_capacidad_hab CHECK(capacidad IS NOT NULL);

ALTER TABLE tb_habitaciones
    ADD CONSTRAINT tb_habitaciones_pk PRIMARY KEY ( id );

prompt ----------tb_eps----------------

ALTER TABLE tb_eps
    ADD CONSTRAINT nn_nombre_eps CHECK(nombre IS NOT NULL);

ALTER TABLE tb_eps
    ADD CONSTRAINT nn_cod_superint_eps CHECK(cod_superint IS NOT NULL);

ALTER TABLE tb_eps
    ADD CONSTRAINT nn_direccion_eps CHECK(direccion IS NOT NULL);

ALTER TABLE tb_eps
    ADD CONSTRAINT tb_eps_pk PRIMARY KEY ( id );

prompt ----------tb_formularios_permisos------------

ALTER TABLE tb_formularios_permisos
    ADD CONSTRAINTS nn_nombre_formulario CHECK(nombre_formulario IS NOT NULL);

ALTER TABLE tb_formularios_permisos
    ADD CONSTRAINT tb_permisos_pk PRIMARY KEY ( id );

prompt ----------tb_creencias----------

ALTER TABLE tb_creencias
	ADD CONSTRAINT nn_nombre_cre CHECK(nombre IS NOT NULL);
	
ALTER TABLE tb_creencias
	ADD CONSTRAINT tb_creencias_pk PRIMARY KEY ( id );
	
prompt ----------reglas aplicadas a la TABLA tb_parentescos------------------------

ALTER TABLE tb_parentescos
    ADD CONSTRAINT nn_parentezco CHECK(parentesco IS NOT NULL);	
	
ALTER TABLE tb_parentescos
    ADD CONSTRAINT tb_parentesco_pk PRIMARY KEY ( id );
	
prompt ----------TB_ACOMPANNIANTES----------

ALTER TABLE tb_acompanniantes
    ADD CONSTRAINT nn_primer_nombre_aco   CHECK(acompanniante.primer_nombre  IS NOT NULL);
	
ALTER TABLE tb_acompanniantes
    ADD CONSTRAINT nn_primer_apellido_aco CHECK(acompanniante.primer_apellido IS NOT NULL);

ALTER TABLE tb_acompanniantes
    ADD CONSTRAINT nn_id_parentesco_aco   CHECK(id_parentesco  IS NOT NULL);

ALTER TABLE tb_acompanniantes
    ADD CONSTRAINT nn_acompanniante_obj CHECK(acompanniante IS NOT NULL);

ALTER TABLE tb_acompanniantes
    ADD CONSTRAINT tb_acompanniantes_pk PRIMARY KEY ( acompanniante.documento );

ALTER TABLE tb_acompanniantes
    ADD CONSTRAINT fk_acompanniantes_parentescos FOREIGN KEY ( id_parentesco )
        REFERENCES tb_parentescos ( id );
	
prompt ----------tb_detalle_acompanniantes----------	

ALTER TABLE tb_detalle_acompanniantes
    ADD CONSTRAINT nn_id_acompanniante_det_aco CHECK(id_acompanniante IS NOT NULL);

ALTER TABLE tb_detalle_acompanniantes
    ADD CONSTRAINT tb_detalle_acompanniantes_pk PRIMARY KEY ( id );

ALTER TABLE tb_detalle_acompanniantes
    ADD CONSTRAINT fk_detalle_acompanniantes_acompanniantes FOREIGN KEY ( id_acompanniante )
        REFERENCES tb_acompanniantes ( acompanniante.documento );

--ALTER TABLE tb_detalle_acompanniantes ADD CREATE SEQUENCE sec_id_detalle_acompanniantes START WITH 1 INCREMENT by 1 NOMAXVALUE;

prompt ----------TB_CAMAS----------

ALTER TABLE tb_camas
    ADD CONSTRAINT nn_nombre_cama CHECK(nombre_cama IS NOT NULL);

ALTER TABLE tb_camas
    ADD CONSTRAINT nn_id_habitacion_cam CHECK(id_habitacion IS NOT NULL);

ALTER TABLE tb_camas
    ADD CONSTRAINT tb_camas_pk PRIMARY KEY (id);

ALTER TABLE tb_camas
    ADD CONSTRAINT tb_camas_tb_habitaciones_fk FOREIGN KEY ( id_habitacion )
        REFERENCES tb_habitaciones ( id );

prompt ----------TB_PACIENTES----------
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_rh_pa      			 CHECK(RH IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_primer_nombre_pa 	  	 CHECK(paciente.primer_nombre IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_primer_apellido_pa	 CHECK(paciente.primer_apellido IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_fecha_de_nacimiento_pa CHECK(paciente.fecha_nacimiento IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_eps_pa 				 CHECK(eps IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_tipo_de_usuario_pa	 CHECK(tipo_de_usuario IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_residencia_pa          CHECK(residencia  IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_religion_pa            CHECK(religion   IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_id_acompa_pa           CHECK(id_acompanniante IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_estatus     CHECK(estatus IS NOT NULL);

ALTER TABLE tb_pacientes
	ADD CONSTRAINT true_false_estatus CHECK(estatus >= 0 AND estatus <= 1);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT nn_fecha_creacion_pa      CHECK(fecha_creacion IS NOT NULL);
	
ALTER TABLE tb_pacientes
	ADD CONSTRAINT tb_pacientes_pk PRIMARY KEY ( paciente.documento );
	
ALTER TABLE tb_pacientes
    ADD CONSTRAINT fk_pacientes_acompanniantes FOREIGN KEY ( id_acompanniante )
        REFERENCES tb_acompanniantes ( acompanniante.documento );
		
ALTER TABLE tb_pacientes
    ADD CONSTRAINT fk_pacientes_creencias FOREIGN KEY ( religion )
        REFERENCES tb_creencias ( id );

ALTER TABLE tb_pacientes
    ADD CONSTRAINT fk_pacientes_eps FOREIGN KEY ( eps )
        REFERENCES tb_eps ( id );
		
ALTER TABLE	tb_pacientes add CONSTRAINTS
	vl_fecha_creacion CHECK (fecha_creacion >= TO_DATE ('1990/01/01','yyyy/mm/dd')); 		
	
ALTER TABLE	tb_pacientes add CONSTRAINTS
	vl_fecha_edicion CHECK (fecha_edicion >= TO_DATE ('1990/01/01','yyyy/mm/dd')); 



prompt ----------TB_REGISTRO_OCUPACIONES----------

ALTER TABLE tb_registro_ocupaciones
    ADD CONSTRAINT nn_fecha_ingreso_reg_ocu   CHECK(fecha_ingreso IS NOT NULL);

ALTER TABLE tb_registro_ocupaciones
    ADD CONSTRAINT nn_id_cama_reg_ocu 		  CHECK(id_cama IS NOT NULL);

ALTER TABLE tb_registro_ocupaciones
    ADD CONSTRAINT tb_registro_ocupaciones_pk PRIMARY KEY ( id );
	
ALTER TABLE tb_registro_ocupaciones
    ADD CONSTRAINT fk_ocupaciones_paciente FOREIGN KEY ( id_paciente )
        REFERENCES tb_pacientes ( paciente.documento );

ALTER TABLE tb_registro_ocupaciones
    ADD CONSTRAINT fk_ocupaciones_camas FOREIGN KEY ( id_cama )
        REFERENCES tb_camas ( id );
		
ALTER TABLE	tb_registro_ocupaciones add CONSTRAINTS
	vl_fecha_salida CHECK (fecha_salida >= TO_DATE ('2000/01/01','yyyy/mm/dd')); 		
	
ALTER TABLE	tb_registro_ocupaciones add CONSTRAINTS
	vl_fecha_ingreso CHECK (fecha_ingreso >= TO_DATE ('2000/01/02','yyyy/mm/dd'));	
	

prompt ----------tb_alertas-------------------

ALTER TABLE tb_alertas
    ADD CONSTRAINT ft_amarillo_ale CHECK ( amarillo BETWEEN 0 AND 1  );

ALTER TABLE tb_alertas
    ADD CONSTRAINT ft_rojo_ale		CHECK ( rojo BETWEEN 0 AND 1  );

ALTER TABLE tb_alertas
    ADD CONSTRAINT ft_ciam_ale CHECK ( ciam BETWEEN 0 AND 1  );

ALTER TABLE tb_alertas
    ADD CONSTRAINT ft_morado_ale CHECK ( morado BETWEEN 0 AND 1  );

ALTER TABLE tb_alertas
    ADD CONSTRAINT ft_verde_ale CHECK ( verde BETWEEN 0 AND 1  );

ALTER TABLE tb_alertas
    ADD CONSTRAINTS nn_amarillo CHECK(amarillo IS NOT NULL);

ALTER TABLE tb_alertas
    ADD CONSTRAINT tb_alertas PRIMARY KEY (id);

prompt ----------TB_registro_alertas----------

ALTER TABLE tb_registro_alertas
    ADD CONSTRAINT nn_id_paciente_reg_ale CHECK(id_paciente IS NOT NULL);

ALTER TABLE tb_registro_alertas
    ADD CONSTRAINT nn_alerta_reg_ale	   CHECK(id_alerta IS NOT NULL);

ALTER TABLE tb_registro_alertas
    ADD CONSTRAINT tb_registro_alertas_pk PRIMARY KEY ( id );

ALTER TABLE tb_registro_alertas
    ADD CONSTRAINT fk_di_paciente FOREIGN KEY ( id_paciente )
        REFERENCES tb_pacientes ( paciente.documento );	
	
ALTER TABLE tb_registro_alertas
    ADD CONSTRAINT fk_di_alertas FOREIGN KEY ( id_alerta )
        REFERENCES tb_alertas ( id );	
		
prompt ----------TB_ROLES------------------

ALTER TABLE tb_roles
    ADD CONSTRAINT nn_id_permisos_rol CHECK(id_permisos IS NOT NULL);

ALTER TABLE tb_roles
    ADD CONSTRAINT nn_nombre_roll_rol CHECK(nombre_roll IS NOT NULL);

ALTER TABLE tb_roles
    ADD CONSTRAINT tb_roles_pk PRIMARY KEY ( id );

prompt ----------TB_DETALLES_PERMISOS----------

ALTER TABLE tb_detalles_permisos
    ADD CONSTRAINT nn_id_rol_det_per CHECK(id_rol IS NOT NULL);
	
ALTER TABLE tb_detalles_permisos
    ADD CONSTRAINT nn_id_formularios_permisos_det_per CHECK(id_formularios_permiso IS NOT NULL);
	
ALTER TABLE tb_detalles_permisos
    ADD CONSTRAINT pk_detalles_permisos  PRIMARY KEY ( id );

ALTER TABLE tb_detalles_permisos
    ADD CONSTRAINT fk_detalles_permisos_permisos FOREIGN KEY ( id_formularios_permiso  )
        REFERENCES tb_formularios_permisos ( id );


ALTER TABLE tb_detalles_permisos
    ADD CONSTRAINT fk_detalles_permisos_roles FOREIGN KEY ( id_rol )
        REFERENCES tb_roles ( id );
		
ALTER TABLE tb_detalles_permisos
	ADD	CONSTRAINT permiso_crear_act_noact CHECK ( crear BETWEEN 0 AND 1  );

ALTER TABLE tb_detalles_permisos	
	ADD	CONSTRAINT permiso_leer_act_noact CHECK ( leer BETWEEN 0 AND 1  );

ALTER TABLE tb_detalles_permisos	
	ADD	CONSTRAINT permiso_actualizar_act_noact CHECK ( actualizar BETWEEN 0 AND 1  );

ALTER TABLE tb_detalles_permisos	
	ADD	CONSTRAINT permiso_eliminar_act_noact CHECK ( eliminar BETWEEN 0 AND 1  );
	


prompt ----------TB_CARGOS------------------
		
ALTER TABLE tb_cargos
    ADD CONSTRAINT nn_nombre_car CHECK(nombre IS NOT NULL);

ALTER TABLE tb_cargos
    ADD CONSTRAINT tb_cargos_pk PRIMARY KEY ( id );

prompt ----------TB_EMPLEADOS--------------

ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_primer_nombre_emp CHECK(empleado.primer_nombre IS NOT NULL);
	
ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_primer_apellido_emp CHECK(empleado.primer_apellido IS NOT NULL);
	
ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_fecha_de_ingreso_emp CHECK(fecha_de_ingreso IS NOT NULL);
	
ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_usuario_emp CHECK(nombre_usuario IS NOT NULL);
	
ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_contrasennia_emp CHECK(contrasennia IS NOT NULL);
	
ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_id_cargo_emp CHECK(id_cargo IS NOT NULL);
	
ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_id_jefe_emp CHECK(id_jefe IS NOT NULL);
	
ALTER TABLE tb_empleados
    ADD CONSTRAINT tb_empleado_pk PRIMARY KEY (empleado.documento);

ALTER TABLE tb_empleados
    ADD CONSTRAINT nn_empleado_obj CHECK(empleado IS NOT NULL);

ALTER TABLE tb_empleados
    ADD CONSTRAINT FK_JEFE_ENPLEADO FOREIGN KEY ( id_jefe )
        REFERENCES tb_empleados ( empleado.documento );

ALTER TABLE tb_empleados
    ADD CONSTRAINT fk_empleados_cargos FOREIGN KEY ( id_cargo )
        REFERENCES tb_cargos ( id );

ALTER TABLE tb_empleados
    ADD CONSTRAINT tb_empleados_detalle_permisos_fk FOREIGN KEY ( id_detalle_permisos )
        REFERENCES tb_detalles_permisos ( id );
		
		
ALTER TABLE	tb_empleados
	ADD CONSTRAINTS vl_fecha_de_ingreso CHECK (fecha_de_ingreso >= TO_DATE ('1990/01/01','yyyy/mm/dd')); 
 	
prompt ----------TB_FORMULAS----------

ALTER TABLE tb_formulas
    ADD CONSTRAINT nn_fecha_for CHECK(fecha IS NOT NULL);

ALTER TABLE tb_formulas
    ADD CONSTRAINT nn_id_paciente_for CHECK(id_paciente IS NOT NULL);

ALTER TABLE tb_formulas
    ADD CONSTRAINT nn_id_empleado_for CHECK(id_empleado IS NOT NULL);

ALTER TABLE tb_formulas
    ADD CONSTRAINT tb_formula_pk PRIMARY KEY ( id );

ALTER TABLE tb_formulas
    ADD CONSTRAINT tb_formula_tb_empleado_fk FOREIGN KEY ( id_empleado )
        REFERENCES tb_empleados ( empleado.documento );

ALTER TABLE tb_formulas
    ADD CONSTRAINT fk_formula_paciente_ FOREIGN KEY ( id_paciente )
        REFERENCES tb_pacientes ( paciente.documento );
		

ALTER TABLE	tb_formulas
	ADD CONSTRAINTS vl_fecha CHECK (fecha >= TO_DATE ('1990/01/01','yyyy/mm/dd'));
	
ALTER TABLE	TB_FORMULAS 
	ADD CONSTRAINTS vl_fecha_actualizacion CHECK (fecha_actualizacion >= TO_DATE ('1990/01/01','yyyy/mm/dd')); 	
	
	
prompt ----------TB_DETALLE_FORMULAS----------

ALTER TABLE tb_detalle_formulas
    ADD CONSTRAINT nn_id_med_det_for  CHECK(id_medicamento  IS NOT NULL);

ALTER TABLE tb_detalle_formulas
    ADD CONSTRAINT nn_id_formula_det_for CHECK(id_formula IS NOT NULL);

ALTER TABLE tb_detalle_formulas
    ADD CONSTRAINT nn_cantidad_det_for CHECK(cantidad IS NOT NULL);

ALTER TABLE tb_detalle_formulas
    ADD CONSTRAINT nn_obserb_det_for CHECK(obserb IS NOT NULL);

ALTER TABLE tb_detalle_formulas
    ADD CONSTRAINT tb_detalle_formula_pk PRIMARY KEY ( id );
	
ALTER TABLE tb_detalle_formulas
    ADD CONSTRAINT fk_detalle_formula_formula FOREIGN KEY ( id_formula )
        REFERENCES tb_formulas ( id );


ALTER TABLE tb_detalle_formulas
    ADD CONSTRAINT fk_detalle_formula_medicamento FOREIGN KEY ( id_medicamento )
        REFERENCES tb_medicamentos ( id );

		
prompt ----------TB_TURNOS-------------

ALTER TABLE tb_turnos
	ADD constraint tb_turnos primary key (id);

ALTER TABLE tb_turnos
	ADD CONSTRAINT fk_turno_empleado FOREIGN KEY (documento_empleado) 
	REFERENCES tb_empleados(empleado.documento);
	
ALTER TABLE constantes
    ADD CONSTRAINT pk_constantes PRIMARY KEY (nombre);
