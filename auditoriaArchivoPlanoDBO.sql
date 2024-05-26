clear screen

prompt '-----------------------------------'
prompt '-    BORRADO DIRECTORIO LÓGICO    -'
PROMPT '-----------------------------------'

DROP directory dir_tmp;

prompt '-----------------------------------'
prompt '-  CREACIÓN DE DIRECTORIO LÓGICO  -'
PROMPT '-----------------------------------'

create directory dir_tmp as 'C:\PPI_2024_1\BD_ppi\scripts\dbo\archivoplanoPlanoAuditoria';


prompt '-----------------------------------'
prompt '-       ASIGNAR PERMISOS          -'
PROMPT '-----------------------------------'
grant read, write on directory dir_tmp to us_ppi2;

prompt '-----------------------------------'
prompt '-  PROCEDURE REGISTRAR EVENTO     -'
PROMPT '-----------------------------------' 
/***************************************************/

create or replace procedure escribir is
  v_archivo utl_file.file_type;
 
begin
DECLARE
    TYPE tb_auditorias_table IS TABLE OF us_ppi2.TB_AUDITORIAS%ROWTYPE;
    datos tb_auditorias_table; 
	v_line VARCHAR2(4000);
begin
SELECT * BULK COLLECT INTO datos FROM us_ppi2.TB_AUDITORIAS;

  v_archivo := utl_file.fopen ('DIR_TMP', 'test_utl_file.txt', 'w');
  
	
	FOR i IN datos.FIRST .. datos.LAST LOOP
        -- Conversión de cada fila a una cadena de texto
        v_line := 'usuario: ' || datos(i).usuario || ', fecha: ' || datos(i).fecha ||'accion:' ||datos(i).accion || 'detalle: ' || datos(i).detalle;
        -- Reemplaza 'column1' y 'column2' con los nombres reales de las columnas de tu tabla
        
        -- Escribir la línea en el archivo
        UTL_FILE.PUT_LINE(v_archivo, v_line);
    END LOOP;
	
  utl_file.put_line (v_archivo, 'datos');

  utl_file.put (v_archivo, 'Texto sin fin de línea');
  utl_file.put_line (v_archivo, ' que sigue y termina acá.');

  utl_file.fclose(v_archivo); 
 end;
end;
/
/********************************************/
prompt '-----------------------------------'
prompt '- IMPRIMIR EL REGISTRO DE EVENTO  -'
PROMPT '-----------------------------------' 
create or replace procedure leer is
  v_archivo utl_file.file_type;
  v_linea varchar2(1024);
begin
  v_archivo := utl_file.fopen ('DIR_TMP', 'test_utl_file.txt', 'r');
  loop
    utl_file.get_line (v_archivo, v_linea);
    dbms_output.put_line (v_linea);
  end loop; 
 --utl_file.fclose(v_archivo);
exception
  when no_data_found then
--Debemos cerrar, el archivo aqui ya que en el momento que no encuentre lineas salta directamente a la la execpción y no lo cerraría.
  utl_file.fclose(v_archivo);
    dbms_output.put_line ('Fin del archivo');
end;
/


prompt '-----------------------------------'
prompt '-       MANEJO DE EXCEPTION       -'
PROMPT '-----------------------------------' 
create or replace procedure abrir_bloqueado is
  v_archivo utl_file.file_type;
begin
  v_archivo := utl_file.fopen ('DIR_TMP', 'test_utl_file.txt', 'w');
  utl_file.fclose(v_archivo); 
  dbms_output.put_line ('Ok');

exception
  when utl_file.invalid_operation then
    dbms_output.put_line ('Error: utl_file.invalid_operation');
end;
/

create or replace procedure abrir_no_lectura is
  v_archivo utl_file.file_type;
begin
  v_archivo := utl_file.fopen ('DIR_TMP', 'test_utl_file.txt', 'r');
  utl_file.fclose(v_archivo); 
  dbms_output.put_line ('Ok');

exception
  when utl_file.access_denied then
    dbms_output.put_line ('Error: utl_file.access_denied');
end;
/

create or replace procedure abrir_no_existe is
  v_archivo utl_file.file_type;
begin
  v_archivo := utl_file.fopen ('DIR_TMP', 'test_no_existe.txt', 'r');
  utl_file.fclose(v_archivo); 
  dbms_output.put_line ('Ok');

exception
  when utl_file.invalid_operation then
    dbms_output.put_line ('Error: utl_file.invalid_operation');
end;
/ 
 EXECUTE escribir;