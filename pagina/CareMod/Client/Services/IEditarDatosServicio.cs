using CareMod.Shared;

namespace CareMod.Client.Services
{
    public interface IEditarDatosServicio
    {
        Task EditarPaciente(Pacientes pacientes);
        Task EditarEmpleados(EmpleadosDTO empleadosDTO);
        Task EditarRegistro_ocupaciones(Registro_ocupacionesDTO registro_OcupacionesDTO);
    }
}
