using CareMod.Shared;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio
{
    public class EditarRepositorio : IEditarRepositorio
    {
        private readonly IDbConnection _dbconnection;

        public EditarRepositorio(IDbConnection dbConnection)
        {
            _dbconnection = dbConnection;
        }

        public async Task<bool> EditarPaciente(Pacientes pacientes)
        {
            try
            {
                string sql = "EditarPaciente";

                var resulttado = await _dbconnection.ExecuteAsync(sql, new
                {

                    pacientes.RH,

          

                }, null, 10, CommandType.StoredProcedure);

                return resulttado > 0;
            }
            catch (Exception)
            {
                throw;
            }
            finally { _dbconnection.Close(); }
        }





        public async Task<bool> EditarEmpleado(EmpleadosDTO empleadosDTO)
        {
            try
            {
                string sql = "EditarEmpleado";

                var resulttado = await _dbconnection.ExecuteAsync(sql, new
                {
                    empleadosDTO.fecha_de_ingreso,
                    empleadosDTO.persona,
                    empleadosDTO.jefe,
                    empleadosDTO.nombre_usuario,
                    empleadosDTO.contrasennia,
                    empleadosDTO.detalle_permisos,

                }, null, 10, CommandType.StoredProcedure);

                return resulttado > 0;
            }
            catch (Exception)
            {
                throw;
            }
            finally { _dbconnection.Close(); }
        }






        public async Task<bool> EditarRegistro_ocupacion(Registro_ocupacionesDTO registro_OcupacionesDTO)
        {
            try
            {
                string sql = "EditarRegistro_ocupacion";

                var resulttado = await _dbconnection.ExecuteAsync(sql, new
                {
                    registro_OcupacionesDTO.fecha_ingreso,
                    registro_OcupacionesDTO.fecha_salida,
                    registro_OcupacionesDTO.cama,
                    registro_OcupacionesDTO.id_paciente,

                }, null, 10, CommandType.StoredProcedure);

                return resulttado > 0;
            }
            catch (Exception)
            {
                throw;
            }
            finally { _dbconnection.Close(); }
        }
    }
}