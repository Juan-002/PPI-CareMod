using System.Net.Http.Json;
using CareMod.Shared;

namespace CareMod.Client.Services
{
    public class InsertarDatosServicio : IInsertarDatosServicio
    {
        private readonly HttpClient _httpClient;
        public InsertarDatosServicio(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task InsertarPaciente(Pacientes pacientes)
        {
            try
            {
                var data = await _httpClient.PostAsJsonAsync($"api/Insertar/InsertarPaciente", pacientes);
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

        public async Task InsertarEmpleado(EmpleadosDTO empleadosDTO)
        {
            try
            {
                var data = await _httpClient.PostAsJsonAsync($"api/Insertar/InsertarEmpleado", empleadosDTO);
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

        public async Task InsertarRegistro_ocupaciones(Registro_ocupacionesDTO registro_OcupacionesDTO)
        {
            try
            {
                var data = await _httpClient.PostAsJsonAsync($"api/Insertar/InsertarRegistro_ocupaciones", registro_OcupacionesDTO);
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

    }
}
