using CareMod.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio
{
    public interface IEditarRepositorio
    {
        Task<bool> EditarPaciente(Pacientes pacientes);
        Task<bool> EditarEmpleado(EmpleadosDTO empleadosDTO);
        Task<bool> EditarRegistro_ocupacion(Registro_ocupacionesDTO registro_OcupacionesDTO);
    }
}
