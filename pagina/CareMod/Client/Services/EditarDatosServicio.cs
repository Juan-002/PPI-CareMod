using System.Net.Http.Json;
using CareMod.Shared;

namespace CareMod.Client.Services
{
    public class EditarDatosServicio : IEditarDatosServicio
        {
            private readonly HttpClient _httpClient;
        public EditarDatosServicio(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }


        public async Task EditarPaciente(Pacientes pacientes)
        {
            try
            {
                var data = await _httpClient.PutAsJsonAsync($"api/Editar/Paciente({pacientes.RH})", pacientes);
                if (!data.IsSuccessStatusCode)
                {
                    throw new Exception($"ERROR: {data.Content.ToString}");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task EditarEmpleado(EmpleadosDTO empleadosDTO)
        {
            try
            {
                var data = await _httpClient.PutAsJsonAsync($"api/Editar/Empleados({empleadosDTO.nombre_usuario})", empleadosDTO);
                if (!data.IsSuccessStatusCode)
                {
                    throw new Exception($"ERROR: {data.Content.ToString}");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Task EditarEmpleados(EmpleadosDTO empleadosDTO)
        {
            throw new NotImplementedException();
        }




        public async Task EditarRegistro_ocupacion(Registro_ocupacionesDTO registro_OcupacionesDTO)
        {
            try
            {
                var data = await _httpClient.PutAsJsonAsync($"api/Editar/Registro_ocupacionesDTO({registro_OcupacionesDTO.cama})", registro_OcupacionesDTO);
                if (!data.IsSuccessStatusCode)
                {
                    throw new Exception($"ERROR: {data.Content.ToString}");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Task EditarRegistro_ocupaciones(Registro_ocupacionesDTO registro_OcupacionesDTO)
        {
            throw new NotImplementedException();
        }

    }
}
