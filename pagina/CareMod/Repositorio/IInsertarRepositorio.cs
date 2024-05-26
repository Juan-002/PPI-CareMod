using CareMod.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositorio
{
    public interface IInsertarRepositorio
    {
        Task<bool> InsertarPaciente(Pacientes pacientes);
        Task<bool> InsertarEmpleado(EmpleadosDTO empleadosDTO);
        Task<bool> InsertarRegistro_ocupaciones(Registro_ocupacionesDTO registro_OcupacionesDTO);
    }
}
