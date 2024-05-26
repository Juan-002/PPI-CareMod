using CareMod.Shared;

namespace CareMod.Client.Services
{
    public interface IInsertarDatosServicio
    {
        Task InsertarPaciente(Pacientes obj);
        Task InsertarEmpleado(EmpleadosDTO obj);
        Task InsertarRegistro_ocupaciones(Registro_ocupacionesDTO obj);
    }
}
