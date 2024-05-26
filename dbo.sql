----- revisar el tema re relaciones entre alertas y pacientes  ************* tambien camas y habitaciones
DROP TABLE tb_camas;
DROP TABLE tb_eps;
DROP TABLE tb_creencias;
DROP TABLE tb_acompanniantes;
DROP TABLE tb_detalle_acompanniantes;
DROP TABLE tb_registro_ocupaciones;
DROP TABLE tb_medicamentos;
DROP TABLE tb_formulas;
DROP TABLE tb_detalles_permisos_formularios;
DROP TABLE tb_empleados;
DROP TABLE tb_pacientes;
DROP TABLE tb_turnos;
DROP TABLE tb_auditorias;
DROP TYPE objeto_habitaciones;
DROP TYPE objeto_roles;
DROP TYPE objeto_cargos;
DROP TYPE objeto_alertas;
DROP TYPE objeto_Personas;
DROP TYPE objeto_formularios;

------- objeto_persona--------
CREATE TYPE objeto_Personas AS OBJECT (
    documento        VARCHAR2(20),
	tipo_documento	 VARCHAR2(3),
	primer_nombre    VARCHAR2(50),
	segundo_nombre   VARCHAR2(50),
	primer_apellido  VARCHAR2(50),
	segundo_apellido VARCHAR2(50),
	fecha_nacimiento DATE	
);
/

-------Objeto habitaciones-------
CREATE TYPE objeto_habitaciones AS OBJECT(
    id          NUMBER(11),
    descripcion VARCHAR2(50),
    capacidad   NUMBER(1)
);
/

-------tb_CAMAS---------- regla construidas en la linea:350
CREATE TABLE tb_camas (
    id            NUMBER(6),
    nombre_cama   VARCHAR2(1),
    descripcion   VARCHAR2(100),
    habitacion 	  objeto_habitaciones, 
    estado        VARCHAR2(30)
)TABLESPACE ts_PPI2;

-------tb_eps---------------- regla construidas en la linea:188
CREATE TABLE tb_eps(
    id           NUMBER(11),
    nombre       VARCHAR2(50),
    cod_superint VARCHAR2(20),
    direccion    VARCHAR2(20)
)TABLESPACE ts_PPI2;


-------tb_creencias----------- regla construidas en la linea: 203
CREATE TABLE tb_creencias(
    id     NUMBER(11),
    nombre VARCHAR2(50)
)TABLESPACE ts_PPI2;

-------tabla ACOMPANNIANTES---------- reglas contruidas linea 212
CREATE TABLE tb_acompanniantes (
	persona			 objeto_Personas,
    parentesco       VARCHAR2(20)
)TABLESPACE ts_PPI2;

-------objeto formularios------------
CREATE TYPE objeto_formularios AS OBJECT(
    id     			  NUMBER(11),
    nombre_formulario VARCHAR2(50)
);
/

-------objeto CARGOS------------------
CREATE TYPE objeto_cargos AS OBJECT(
    id          	  NUMBER(11),
    nombre_cargo      VARCHAR2(50)
);
/
-------objeto ROLES------------------
CREATE TYPE objeto_roles AS OBJECT (
    id          NUMBER(11),
    nombre_roll VARCHAR2(50),
	cargo		objeto_cargos
);
/
-------tb DETALLES_PERMISOS--------- regla construida en la linea: 221
CREATE TABLE tb_detalles_permisos_formularios(
    id         				NUMBER(11),
	crear      				NUMBER(1),
	leer	   				NUMBER(1),
	actualizar 				NUMBER(1),
	eliminar   				NUMBER(1),
	rol        				objeto_roles,
	formulario  			objeto_formularios
)TABLESPACE ts_PPI2;

-------TABLA_EMPLEADOS-------------- reglas contruidas linea 236
CREATE TABLE tb_empleados(
    fecha_de_ingreso  TIMESTAMP,
	persona 		  objeto_Personas,
    jefe          	  VARCHAR2(20),
	nombre_usuario	  VARCHAR2(20),
	contrasennia      VARCHAR2(20),
    detalle_permisos  NUMBER(11)
)TABLESPACE ts_PPI2;

---------- Objeto_alertas-------------------
CREATE TYPE objeto_alertas AS OBJECT(
	amarillo 	NUMBER(1),
    rojo		NUMBER(1),
    ciam		NUMBER(1),
    morado		NUMBER(1),
    verde		NUMBER(1)
);
/

-------identificacion TABLA TB_PACIENTES---------- reglas contruidas linea 261

CREATE TABLE tb_pacientes(
	persona               objeto_Personas,
	RH					  VARCHAR2(3),
    eps                   NUMBER(11), 					--fk
    tipo_de_usuario       VARCHAR2(20),
    residencia            VARCHAR2(50),
    religion              NUMBER(11), 					--fk
    estatus_ac_noac       NUMBER(1),
    fecha_creacion        DATE,
    fecha_edicion         DATE,
	alerta			  	  objeto_alertas
)TABLESPACE ts_PPI2;

-------tabla detalle_acompanniantes---------- reglas contruidas linea 293
CREATE TABLE tb_detalle_acompanniantes ( 
    id                   NUMBER,
    id_acompanniante 	 VARCHAR2(20),
	id_paciente			 VARCHAR2(20)
)TABLESPACE ts_PPI2;

-------tb REGISTRO_OCUPACIONES---------- reglas contruidas en la linea 364
CREATE TABLE tb_registro_ocupaciones ( 
    id               NUMBER(11),
    fecha_ingreso    DATE,
    fecha_salida     DATE,
    cama        	 NUMBER(11),
	id_paciente      VARCHAR2(20)
)TABLESPACE ts_PPI2;

-------tb_medicamentos------- reglas contruidas linea 307
CREATE TABLE tb_medicamentos(
    id            NUMBER(11),
    cod           VARCHAR2(50),
    nomb_medica   VARCHAR2(50),
    cantidad      NUMBER(20),
    unidad_medida NUMBER (30)
)TABLESPACE ts_PPI2;

-------tb FORMULAS---------- reglas inciadas en la linia 324
CREATE TABLE tb_formulas(
    id                  NUMBER(11),
    fecha               DATE,
    id_paciente         VARCHAR2(20), 
    id_empleado         VARCHAR2(20),
	id_medicamento		NUMBER(11),
	cantidad            NUMBER(2),
	obserb              VARCHAR2(100),
    fecha_actualizacion DATE
)TABLESPACE ts_PPI2;

-------------tb_TURNOS-------------
CREATE TABLE tb_turnos(
    id 			 		number,
    id_empleado  		VARCHAR2(20),
    inicio 				timestamp,
    fin 				timestamp
) TABLESPACE ts_PPI2;

-----------------------------------------------------------------------------------------------------
--------************Tabla para realizar Auditorias**********----------------------
-----------------------------------------------------------------------------------------------------
CREATE TABLE tb_auditorias (
	usuario VARCHAR2(50),
	fecha   DATE,
	accion  VARCHAR2(4000),
	detalle VARCHAR2 (100)
)TABLESPACE ts_PPI;