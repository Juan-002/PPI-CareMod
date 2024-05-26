--inserts datos pre cargados--

----------tb_cargos-------------------

INSERT INTO tb_cargos(id,nombre)
VALUES (1,'Medico General');

INSERT INTO tb_cargos(id,nombre)
VALUES (2,'Enfermero Jefe');

--SELECT * FROM  tb_cargos;

----------tb_roles---
INSERT INTO tb_roles(id,id_permisos,nombre_roll)
VALUES (1,1,'Medico');

INSERT INTO tb_roles(id,id_permisos,nombre_roll)
VALUES (2,2,'Enfermero');

--SELECT * FROM   tb_roles;

----------------tb_creencias-------------------
INSERT INTO tb_creencias(id,nombre)
VALUES (1,'testigo de jeova');

INSERT INTO tb_creencias(id,nombre)
VALUES (2,'catolico');

--SELECT * FROM   tb_creencias;
-----------------tb_eps----------------------------
INSERT INTO tb_eps(id,nombre,cod_superint,direccion)
VALUES (1,'sura','20a20','cra80c·19a-52');

--SELECT * FROM   tb_eps;

--------------tb_permisos-------------------
INSERT INTO tb_formularios_permisos(id,nombre_formulario)
VALUES (1,'tb_pacientes');

INSERT INTO tb_formularios_permisos(id,nombre_formulario)
VALUES (2,'tb_formularios');


--SELECT * FROM   tb_formularios_permisos;

-------------tb_detalles_permisos--------------------
INSERT INTO tb_detalles_permisos(id,id_rol, id_formularios_permiso, crear, leer, actualizar, eliminar)
VALUES (1,1,1,1,1,1,1);

INSERT INTO tb_detalles_permisos(id,id_rol, id_formularios_permiso, crear, leer, actualizar, eliminar)
VALUES (2,2,1,1,1,1,1);


--SELECT * FROM   tb_detalles_permisos;

-----------------tb_habitaciones----------------
INSERT INTO tb_habitaciones(id,descripcion,capacidad)
VALUES (1,'uni personal',1);

--SELECT * FROM   tb_habitaciones;

--------------tb_camas--------------------------

INSERT INTO tb_camas(id,nombre_cama,descripcion,id_habitacion,estado)
VALUES (1,'a','cama grande',1,'disponible');

--SELECT * FROM  tb_camas;

------------tb_parentescos------------------------

INSERT INTO tb_parentescos(id,parentesco)
VALUES (1,'madre');
INSERT INTO tb_parentescos(id,parentesco)
VALUES (2,'padre');
INSERT INTO tb_parentescos(id,parentesco)
VALUES (3,'tutor legal');

--SELECT * FROM   TB_PARENTESCOS;

------------tb_acompanniantes---------------------
INSERT INTO tb_acompanniantes(acompanniante,id_parentesco)
VALUES (personas('1','cc','Hilda','','Bedoya','Manco',TO_DATE('12-12-2005','dd-mm-yyyy')),1);

--SELECT * FROM  tb_acompanniantes;

-------------------tb_detalle_acompanniante-------

INSERT INTO tb_detalle_acompanniantes(id,id_acompanniante)
VALUES (1,'1');

--SELECT * FROM  tb_detalle_acompanniantes;

----------tb_alerta----------------
INSERT INTO tb_alertas(id,amarillo, rojo, ciam, morado, verde)
VALUES (1,1,0,1,1,0);

----------tb_empleados----------------------------
INSERT INTO tb_empleados(empleado,fecha_de_ingreso,id_cargo,id_jefe,nombre_usuario,contrasennia,id_detalle_permisos)
VALUES (personas(1,'cc','Juan','Fernando','Rojas','Bedoya',TO_DATE('12-12-1999','dd-mm-yyyy')),TO_DATE('10-04-2024','dd-mm-yyyy'),1,1,'juan.002','1234',1);

INSERT INTO tb_empleados(empleado,fecha_de_ingreso,id_cargo,id_jefe,nombre_usuario,contrasennia,id_detalle_permisos)
VALUES (personas(2,'cc','cindy','dallana','bailarin','domico',TO_DATE('12-12-1999','dd-mm-yyyy')),TO_DATE('10-04-2024','dd-mm-yyyy'),1,1,'cindy.002','6598',2);

--SELECT * FROM  tb_empleados;

-----------------------tb_pacientes-------------------------------
INSERT INTO tb_pacientes(paciente,rh,eps,tipo_de_usuario,residencia,religion,id_acompanniante,
							estatus,fecha_creacion,fecha_edicion, id_alerta)
VALUES (personas(1010,'CC','cindy','dayanna','restrepo','higuita',TO_DATE('24-05-1980','dd-mm-yyyy')),'O+',1,'subcidiado','cra80n #12-52',1,1,1,TO_DATE('19-04-2024','dd-mm-yyyy'),'',1);

INSERT INTO tb_pacientes(paciente,rh,eps,tipo_de_usuario,residencia,religion,id_acompanniante,
							estatus,fecha_creacion,fecha_edicion, id_alerta)
VALUES (personas(1038,'CC','Juan','Fernando','Rojas','Velazco',TO_DATE('24-05-1995','dd-mm-yyyy')),'O+',1,'subcidiado','cra80n #12-52',1,1,1,TO_DATE('19-04-2024','dd-mm-yyyy'),'',1);

--SELECT * FROM  tb_pacientes;
--UPDATE tb_pacientes set primer_apellido = 'Rojas';

------------------tb_registro_ocupaciones--------------------------
INSERT INTO tb_registro_ocupaciones(id,fecha_ingreso,fecha_salida,id_paciente,id_cama)
VALUES (1,TO_DATE('17-04-2024','dd-mm-yyyy'),'',1010,1);

--SELECT * FROM  tb_registro_ocupaciones;

-----------tb_medicamentos---------------
INSERT INTO tb_medicamentos(id,cod,nomb_medica,cantidad,unidad_medida)
VALUES (1,'1a','acetaminofen',30,500);

--SELECT * FROM   tb_medicamentos;

-------------------------tb_formulas--------------------------------
INSERT INTO tb_formulas(id,fecha,id_paciente,id_empleado,fecha_actualizacion)
VALUES (1,TO_DATE('19-04-2024','dd-mm-yyyy'),'1010',1,'');

--SELECT * FROM  tb_formulas;

--------------------detalle formula------------------------------
INSERT INTO tb_detalle_formulas(id,id_medicamento,id_formula,cantidad,obserb,fecha_actualizacion)
VALUES (1,1,1,12,'prueba','');

--SELECT * FROM  tb_detalle_formulas;


-----------------------------------DELETE----------------------
--DELETE  FROM tb_pacientes WHERE documento_paciente = '1038';

--------------------Consulta de datos registrados en la auditoria por tablas-----

--SELECT * FROM tb_auditorias;
