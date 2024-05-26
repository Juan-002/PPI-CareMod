prompt +--------------------------+
prompt |    Creacion de tablas    |
prompt +--------------------------+
prompt 
prompt ----Eliminando tablas----

DROP TABLE tb_auditorias;
DROP TABLE tb_turnos;
DROP TABLE tb_detalle_formulas;
DROP TABLE tb_formulas;
DROP TABLE tb_medicamentos;
DROP TABLE tb_registro_ocupaciones;
DROP TABLE tb_empleados;
DROP TABLE tb_registro_alertas;
DROP TABLE tb_alertas;
DROP TABLE tb_pacientes;
DROP TABLE tb_detalle_acompanniantes;
DROP TABLE tb_acompanniantes;
DROP TABLE tb_parentescos;
DROP TABLE tb_camas;
DROP TABLE tb_habitaciones;
DROP TABLE tb_detalles_permisos;
DROP TABLE tb_formularios_permisos;
DROP TABLE tb_eps;
DROP TABLE tb_creencias;
DROP TABLE tb_roles;
DROP TABLE tb_cargos;
DROP TABLE constantes;

prompt 
prompt ----Creando tablas----

CREATE TABLE tb_pacientes (
    paciente              PERSONAS,
	RH					  VARCHAR2(3),
    eps                   NUMBER,
    tipo_de_usuario       VARCHAR2(20),
    residencia            VARCHAR2(50),
    religion              NUMBER(11),
    id_acompanniante      VARCHAR2(50),
    estatus       NUMBER(1),
    fecha_creacion        DATE,
    fecha_edicion         DATE,
	id_alerta			  NUMBER
)TABLESPACE ts_PPI;


CREATE TABLE tb_acompanniantes (
    acompanniante   PERSONAS,
    id_parentesco    NUMBER(11)
)TABLESPACE ts_PPI;


CREATE TABLE tb_detalle_acompanniantes (
    id               NUMBER,
    id_acompanniante VARCHAR2(20)
)TABLESPACE ts_PPI;



CREATE TABLE tb_parentescos (
    id         NUMBER(11),
    parentesco VARCHAR2(20)
)TABLESPACE ts_PPI;


CREATE TABLE tb_camas (
    id            NUMBER(6),
    nombre_cama   VARCHAR2(20),
    descripcion   VARCHAR2(100),
    id_habitacion NUMBER(6),
    estado        VARCHAR2(30)
)TABLESPACE ts_PPI;


CREATE TABLE tb_creencias (
    id     NUMBER(11),
    nombre VARCHAR2(50)
)TABLESPACE ts_PPI;


CREATE TABLE tb_detalles_permisos (
    id         				NUMBER,
    id_rol     				NUMBER(11),
    id_formularios_permiso  NUMBER(11),
	crear      				NUMBER(1),
	leer	   				NUMBER(1),
	actualizar 				NUMBER(1),
	eliminar   				NUMBER(1)
)TABLESPACE ts_PPI;

CREATE TABLE tb_formularios_permisos (
    id     			  NUMBER(11),
    nombre_formulario VARCHAR2(50)
)TABLESPACE ts_PPI;

CREATE TABLE tb_eps (
    id           NUMBER,
    nombre       VARCHAR2(50),
    cod_superint VARCHAR2(20),
    direccion    VARCHAR2(20)
)TABLESPACE ts_PPI;

CREATE TABLE tb_formulas (
    id                  NUMBER,
    fecha               DATE,
    id_paciente         VARCHAR2(20),
    id_empleado         VARCHAR2(20),
    fecha_actualizacion DATE
)TABLESPACE ts_PPI;

CREATE TABLE tb_detalle_formulas (
    id                     NUMBER,
    id_medicamento         NUMBER,
    id_formula             NUMBER,
    cantidad               NUMBER(2),
    obserb                 VARCHAR2(100),
	fecha_actualizacion	   DATE
)TABLESPACE ts_PPI;


CREATE TABLE tb_habitaciones (
    id          NUMBER(11),
    descripcion VARCHAR2(50),
    capacidad   NUMBER(1)
)TABLESPACE ts_PPI;

CREATE TABLE tb_medicamentos (
    id            NUMBER,
    cod           VARCHAR2(50),
    nomb_medica   VARCHAR2(50),
    cantidad      NUMBER(20),
    unidad_medida NUMBER (30)
)TABLESPACE ts_PPI;

	
CREATE TABLE tb_registro_ocupaciones (
    id               NUMBER,
    fecha_ingreso    DATE,
    fecha_salida     DATE,
    id_cama        	 NUMBER(2),
	id_paciente      VARCHAR2(20)
)TABLESPACE ts_PPI;


CREATE TABLE tb_empleados (
    empleado                        PERSONAS,
    fecha_de_ingreso 				TIMESTAMP,
    id_cargo         				NUMBER(11),
    id_jefe          				VARCHAR2(20),
	nombre_usuario					VARCHAR2(20),
	contrasennia					VARCHAR2(20),
    id_detalle_permisos         	NUMBER
)TABLESPACE ts_PPI;

CREATE TABLE tb_cargos (
    id          NUMBER,
    nombre      VARCHAR2(50)
)TABLESPACE ts_PPI;


CREATE TABLE tb_roles (
    id          NUMBER(11),
    id_permisos NUMBER(3),
    nombre_roll VARCHAR2(50)
)TABLESPACE ts_PPI;


CREATE TABLE tb_alertas (
	id			NUMBER,
	amarillo 	NUMBER(1),
    rojo		NUMBER(1),
    ciam		NUMBER(1),
    morado		NUMBER(1),
    verde		NUMBER(1)
)TABLESPACE ts_PPI;

CREATE TABLE tb_registro_alertas (
    id          NUMBER,
    id_paciente VARCHAR2(20),
    id_alerta   NUMBER
)TABLESPACE ts_PPI;

create table tb_turnos(
    id 			 		number,
    documento_empleado  varchar2(20),
    inicio 				timestamp,
    fin 				timestamp
) TABLESPACE ts_PPI;

CREATE TABLE tb_auditorias (
	usuario VARCHAR2(50),
	fecha   DATE,
	accion  VARCHAR2(1),
	detalle VARCHAR2(500)
)TABLESPACE ts_PPI;

CREATE TABLE constantes (
    nombre varchar2(50),
    valor varchar2(100)
) TABLESPACE ts_ppi;