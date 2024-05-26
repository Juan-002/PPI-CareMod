using CareMod.Shared;
using System.Data;
namespace CareMod.Client.Services
{
    public interface ISeleccionarDatosServicio
    {
        Task<IEnumerable<Pacientes>> GetAllPacientes();
        Task<IEnumerable<EmpleadosDTO>> GetAllEmpleados();
        Task<IEnumerable<Registro_ocupacionesDTO>> GetAllRegistro_ocupacione();
        Task<Pacientes> GetPacientePorNombre(string persona);
        Task<EmpleadosDTO> GetEmpleadosDTOPorNombre(string persona);
        Task<EmpleadosDTO> GetEmpleadosDTOPorNombre_usuario(string nombre_usuario);
    }
}
