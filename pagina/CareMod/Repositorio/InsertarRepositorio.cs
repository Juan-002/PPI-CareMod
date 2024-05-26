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
    public class InsertarRepositorio : IInsertarRepositorio
    {
        private readonly IDbConnection _dbconnection;

        public InsertarRepositorio(IDbConnection dbConnection)
        {
            _dbconnection = dbConnection;
        }

        /// <summary>
        /// Inserta una nueva raza en la base de datos.
        /// </summary>
        /// <param name="pacientes">La instancia de la clase Razas que contiene la información de la raza a insertar.</param>
        /// <returns>Devuelve true si la inserción fue exitosa, de lo contrario, false.</returns>
        public async Task<bool> InsertarPaciente(Pacientes pacientes)
        {
            try
            {
                string sql = "InsertarPaciente";

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

        /// <summary>
        /// Inserta una nueva especie en la base de datos.
        /// </summary>
        /// <param name="empleadosDTO">La instancia de la clase Especies que contiene la información de la especie a insertar.</param>
        /// <returns>Devuelve true si la inserción fue exitosa, de lo contrario, false.</returns>
        public async Task<bool> InsertarEmpleado(EmpleadosDTO empleadosDTO)
        {
            try
            {
                string sql = "InsertarEmpleado";

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

        /// <summary>
        /// Inserta una nueva persona en la base de datos.
        /// </summary>
        /// <param name="registro_OcupacionesDTO">La instancia de la clase Personas que contiene la información de la persona a insertar.</param>
        /// <returns>Devuelve true si la inserción fue exitosa, de lo contrario, false.</returns>
        public async Task<bool> InsertarRegistro_ocupaciones(Registro_ocupacionesDTO registro_OcupacionesDTO)
        {
            try
            {
                string sql = "InsertarRegistro_ocupaciones";

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
