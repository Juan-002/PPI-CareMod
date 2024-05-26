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
    public class SeleccionarRepositorio : ISeleccionarRepositorio
    {

        private readonly IDbConnection _dbconnection;

        public SeleccionarRepositorio(IDbConnection dbConnection)
        {
            _dbconnection = dbConnection;
        }

        /// <summary>
        /// Obtiene todos los pacientes almacenados en la base de datos.
        /// </summary>
        /// <returns>Una colección de objetos pacientes.</returns>
        /// 
        public async Task<IEnumerable<Pacientes>> GetPacientes()
 {
             try
             {
                 var sql = @"SELECT RH FROM TB_PACIENTES";
                return await _dbconnection.QueryAsync<Pacientes>(sql, null, null, null, CommandType.StoredProcedure);
            }
            catch (Exception)
             {
                 throw;
             }
         } 

        /// <summary>
        /// Obtiene todos los empleados almacenados en la base de datos.
        /// </summary>
        /// <returns>Una colección de objetos empleado.</returns>
        public async Task<IEnumerable<EmpleadosDTO>> GetEmpleadosDTO()
        {
            try
            {
                var sql = @"SeleccionarEmpleados";

                return await _dbconnection.QueryAsync<EmpleadosDTO>(sql, null, null, null, CommandType.StoredProcedure);
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// Obtiene todos los registros ocupaciones almacenados en la base de datos.
        /// </summary>
        /// <returns>Una colección de objetos Registro_ocupacionesDTO.</returns>
        public async Task<IEnumerable<Registro_ocupacionesDTO>> GetRegistro_ocupacionesDTO()
        {
            try
            {
                var sql = @"SeleccionarRegistro_ocupaciones";

                return await _dbconnection.QueryAsync<Registro_ocupacionesDTO>(sql, null, null, null, CommandType.StoredProcedure);
            }
            catch (Exception)
            {
                throw;
            }
        }


        /// <summary>
        /// Obtiene un usuario de la base de datos mediante su nickname.
        /// </summary>
        /// <param name="persona">el nombre del paciente a buscar.</param>
        /// <returns>Una colección de objetos Usuarios que coinciden con el nickname proporcionado.</returns>
      /*  public async Task<Pacientes> GetPacientePorNombre(string persona)
        {
            try
            {
                var sql = @"SeleccionarPacientes";
                var objectP = new { persona };
                var result = await _dbconnection.QueryAsync<Pacientes>(sql, objectP, null, null, CommandType.StoredProcedure);
                return result.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }
      */



        /// <summary>
        /// Obtiene un usuario de la base de datos mediante su nickname.
        /// </summary>
        /// <param name="Nombre">El nombre del empleado a buscar.</param>
        /// <returns>Una colección de objetos EmpleadosDTO que coinciden con el nombre proporcionado.</returns>
        public async Task<EmpleadosDTO> GetEmpleadosDTOPorNombre(string persona)
        {
            try
            {
                var sql = @"SeleccionarEmpleados";
                var objectP = new { persona };
                var result = await _dbconnection.QueryAsync<EmpleadosDTO>(sql, objectP, null, null, CommandType.StoredProcedure);
                return result.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }
        /// <summary>
        /// Obtiene un usuario de la base de datos mediante su nickname.
        /// </summary>
        /// <param name="Nombre_usuario">El nombre de usuario del empleado a buscar.</param>
        /// <returns>Una colección de objetos EmpleadosDTO que coinciden con el nombre proporcionado.</returns>

        public async Task<EmpleadosDTO> GetEmpleadosDTOPorNombre_usuario(string nombre_usuario)
        {
            try
            {
                var sql = @"SeleccionarEmpleadosPorNombre_usuario";
                var objectP = new { nombre_usuario };
                var result = await _dbconnection.QueryAsync<EmpleadosDTO>(sql, objectP, null, null, CommandType.StoredProcedure);
                return result.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
