prompt '+----------------------------------------+'
prompt '|    Creando esquema de base de datos    |'
prompt '+----------------------------------------+'
connect system/123

show con_name

ALTER SESSION SET CONTAINER=CDB$ROOT;
ALTER DATABASE OPEN;

DROP TABLESPACE ts_PPI2 INCLUDING CONTENTS and DATAFILES;

CREATE TABLESPACE ts_PPI2 LOGGING
DATAFILE 'C:\PPI_2024_1\carpeta de pruebas ppi\DF_ppi.dbf' size 20M
extent management local segment space management auto; 

alter session set "_ORACLE_SCRIPT"=true; 

drop user us_ppi2 cascade;

CREATE user us_ppi2 profile default 
identified by 123
default tablespace ts_PPI2
temporary tablespace temp 
account unlock;     

--privilegios
grant connect, resource,dba to us_ppi2; 

connect us_ppi2/123

show user
