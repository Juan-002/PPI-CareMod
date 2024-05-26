using CareMod.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio
{
    public interface ISeleccionarRepositorio
    {
        Task<IEnumerable<Pacientes>> GetPacientes();
        //Task<Pacientes> GetPacientePorNombre(string persona);
        Task<IEnumerable<EmpleadosDTO>> GetEmpleadosDTO();
        Task<EmpleadosDTO> GetEmpleadosDTOPorNombre_usuario(string nombre_usuario);
        Task<EmpleadosDTO> GetEmpleadosDTOPorNombre(string persona);
        Task<IEnumerable<Registro_ocupacionesDTO>> GetRegistro_ocupacionesDTO();
 
    }
}