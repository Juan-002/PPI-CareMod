--inserts datos pre cargados--
----insert en tabla detaññes_permisos_formularios
INSERT INTO tb_detalles_permisos_formularios ( id, crear, leer, actualizar, eliminar, rol, formulario ) 
	VALUES (1, 1, 1, 1, 1, objeto_roles(1, 'Super admin', objeto_cargos(1, 'administrador de aplicacion')), objeto_formularios(1, 'tb_pacientes'));
INSERT INTO tb_detalles_permisos_formularios ( id, crear, leer, actualizar, eliminar, rol, formulario ) 
	VALUES (2, 1, 1, 1, 1, objeto_roles(1, 'Super admin', objeto_cargos(1, 'administrador de aplicacion')), objeto_formularios(1, 'tb_acompanniantes'));

INSERT INTO tb_detalles_permisos_formularios ( id, crear, leer, actualizar, eliminar, rol, formulario ) 
	VALUES (3, 1, 1, 1, 0, objeto_roles(1, 'medico', objeto_cargos(1, 'Cirujano')), objeto_formularios(1, 'tb_acompanniantes'));
INSERT INTO tb_detalles_permisos_formularios ( id, crear, leer, actualizar, eliminar, rol, formulario ) 
	VALUES (4, 1, 1, 1, 0, objeto_roles(1, 'medico', objeto_cargos(1, 'Cirujano')), objeto_formularios(1, 'tb_pacientes'));
	
INSERT INTO tb_detalles_permisos_formularios ( id, crear, leer, actualizar, eliminar, rol, formulario ) 
	VALUES (5, 0, 1, 0, 0, objeto_roles(1, 'Enfermero', objeto_cargos(1, 'Enfermero')), objeto_formularios(1, 'tb_acompanniantes'));
INSERT INTO tb_detalles_permisos_formularios ( id, crear, leer, actualizar, eliminar, rol, formulario ) 
	VALUES (6, 0, 1, 1, 0, objeto_roles(1, 'Jefe de Enfermeros', objeto_cargos(1, 'Jefe de Enfermeria')), objeto_formularios(1, 'tb_pacientes'));

select * from tb_detalles_permisos_formularios;

----------------tb_creencias-------------------
INSERT INTO tb_creencias(id,nombre)
VALUES (1,'testigo de jeova');

INSERT INTO tb_creencias(id,nombre)
VALUES (2,'catolico');

INSERT INTO tb_creencias(id,nombre)
VALUES (3,'pentecostes');

SELECT * FROM   tb_creencias;
-----------------tb_eps----------------------------
INSERT INTO tb_eps(id,nombre,cod_superint,direccion)
VALUES (1,'sura','20a20','cra80c·19a-52');

INSERT INTO tb_eps(id,nombre,cod_superint,direccion)
VALUES (2,'medimax','29B20','cra80c·32a-52');

SELECT * FROM   tb_eps;

------------tb_acompanniantes---------------------

INSERT INTO tb_acompanniantes ( persona, parentesco ) 
	VALUES (objeto_Personas('1038816736','CC', 'Juan', 'Fernando','Rojas','Bedoya','21/05/1995'),'Padre');
INSERT INTO tb_acompanniantes ( persona, parentesco ) 
	VALUES (objeto_Personas('1038816738','CC', 'Cindy', 'Dayanna','Restrepo','Higuita','21/05/1985'),'Madre');
	

SELECT * FROM  tb_acompanniantes;

----------tb_empleados----------------------------
INSERT INTO tb_empleados (fecha_de_ingreso, persona, jefe, nombre_usuario, contrasennia, detalle_permisos ) 
	VALUES (SYSDATE,objeto_Personas('1038816739','CC', 'Luis', 'Alberto','Rojas','Bedoya','21/05/1995'),'1038816739','luis01','123456',1);

INSERT INTO tb_empleados (fecha_de_ingreso, persona, jefe, nombre_usuario, contrasennia, detalle_permisos ) 
	VALUES (SYSDATE,objeto_Personas('1010','CC', 'Juan', 'Felipe','Ejemplo','Bedoya','21/05/1995'),'1038816739','juan','123456',2);

SELECT * FROM  tb_empleados;

-----------------------tb_pacientes-------------------------------
INSERT INTO tb_pacientes (persona, RH, eps, tipo_de_usuario, residencia, religion, estatus_ac_noac, fecha_creacion , fecha_edicion, alerta) 
	VALUES (objeto_Personas('1010','TI', 'cindy','dayanna','restrepo','higuita','21/05/2018'),'O+', 1, 'contributivo', 'cra80c #19a-52', 1, 1, SYSDATE, '', objeto_alertas(1,0,1,0,1));

INSERT INTO tb_pacientes (persona, RH, eps, tipo_de_usuario, residencia, religion, estatus_ac_noac, fecha_creacion , fecha_edicion, alerta) 
	VALUES (objeto_Personas('1038','CC', 'Juan','Alejandro','restrepo','higuita','21/05/1995'),'AB+', 2, 'subcidiado', 'cra80c #19a-52', 1, 1, SYSDATE, '', objeto_alertas(1,1,1,0,1) );

INSERT INTO tb_pacientes (persona, RH, eps, tipo_de_usuario, residencia, religion, estatus_ac_noac, fecha_creacion , fecha_edicion, alerta) 
	VALUES (objeto_Personas('2020','TI', 'Luis','Perez','restrepo','higuita','21/05/2017'),'AB+', 2, 'subcidiado', 'cra80c #19a-52', 1, 1, SYSDATE, '', objeto_alertas(1,1,1,0,1) );

SELECT * FROM  tb_pacientes;

UPDATE tb_pacientes p SET p.persona.primer_apellido = 'rojas' WHERE p.persona.documento = '1038';

---------tb_camas------------------------------
INSERT INTO tb_camas(id,nombre_cama,descripcion,habitacion,estado)
VALUES (1,'a','Cama Grande',objeto_habitaciones(1,'habitacion doble', 2),'Disponible');
INSERT INTO tb_camas(id,nombre_cama,descripcion,habitacion,estado)
VALUES (2,'b','Cama pequeña',objeto_habitaciones(1,'habitacion doble', 2),'Ocupada');
INSERT INTO tb_camas(id,nombre_cama,descripcion,habitacion,estado)
VALUES (3,'a','Cama Grande',objeto_habitaciones(2,'habitacion Unipersonal', 1),'Disponible');

SELECT * FROM tb_camas;

------------------tb_registro_ocupaciones--------------------------
INSERT INTO tb_registro_ocupaciones(id,fecha_ingreso,fecha_salida,cama,id_paciente)
VALUES (1,'17-04-2024','',1,'1010');

INSERT INTO tb_registro_ocupaciones(id,fecha_ingreso,fecha_salida,cama,id_paciente)
VALUES (2,'17-05-2024','',2,'1038');

SELECT * FROM  tb_registro_ocupaciones;
-------------------------------------------------------------------------------------------------------------------------------
--***************** hasta aqui llevo los inserts ******************************
-------------------------------------------------------------------------------------------------------------------------------
-----------tb_medicamentos---------------
INSERT INTO tb_medicamentos(id,cod,nomb_medica,cantidad,unidad_medida)
VALUES (1,'acet','acetaminofen',300,500);

INSERT INTO tb_medicamentos(id,cod,nomb_medica,cantidad,unidad_medida)
VALUES (2,'asp','Aspirina',600,250);

INSERT INTO tb_medicamentos(id,cod,nomb_medica,cantidad,unidad_medida)
VALUES (3,'morf','Morfina',250,100);

INSERT INTO tb_medicamentos(id,cod,nomb_medica,cantidad,unidad_medida)
VALUES (4,'mielter','Mieltertos',250,100);

SELECT * FROM   tb_medicamentos;

-------------------------tb_formulas--------------------------------
INSERT INTO tb_formulas(id,fecha,id_paciente,id_empleado,id_medicamento,cantidad,obserb,fecha_actualizacion)
VALUES (1,'19-04-2024','1010','1038816739',1,30,'tomese una cada 8 horas',SYSDATE);

INSERT INTO tb_formulas(id,fecha,id_paciente,id_empleado,id_medicamento,cantidad,obserb,fecha_actualizacion)
VALUES (2,'19-04-2024','1038','1010',2,30,'tomese una cada 8 horas',SYSDATE);

SELECT * FROM  tb_formulas;

-----------------------------------DELETE----------------------
CREATE VIEW vw_tb_pacientes AS
SELECT p.persona.documento AS documento,
       p.RH,
       p.eps,
       p.tipo_de_usuario,
       p.residencia,
       p.religion,
       p.estatus_ac_noac,
       p.fecha_creacion,
       p.fecha_edicion,
       p.alerta.amarillo AS alerta_amarillo,
       p.alerta.rojo AS alerta_rojo,
       p.alerta.ciam AS alerta_ciam,
       p.alerta.morado AS alerta_morado,
       p.alerta.verde AS alerta_verde
FROM tb_pacientes p;

DELETE FROM tb_pacientes
WHERE persona.documento = '2020';

CREATE GLOBAL TEMPORARY TABLE temp_tb_pacientes AS
SELECT *
FROM tb_pacientes
WHERE 1 = 0;

INSERT INTO temp_tb_pacientes
SELECT *
FROM tb_pacientes
WHERE persona.documento != '2020';

TRUNCATE TABLE tb_pacientes;

INSERT INTO tb_pacientes
SELECT *
FROM temp_tb_pacientes;
TRUNCATE TABLE temp_tb_pacientes;
--------------------Consulta de datos registrados en la auditoria por tablas-----

SELECT * FROM tb_auditorias;