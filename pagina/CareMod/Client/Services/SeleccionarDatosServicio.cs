using System.Data;
using System.Net.Http.Json;
using CareMod.Shared;

namespace CareMod.Client.Services
{
    public class SeleccionarDatosServicio : ISeleccionarDatosServicio
    {
        private readonly HttpClient _httpClient;
        public SeleccionarDatosServicio(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<IEnumerable<Pacientes>> GetAllPacientes()
        {
            return await _httpClient.GetFromJsonAsync<IEnumerable<Pacientes>>($"api/Seleccionar/Pacientes");
        }

        public async Task<IEnumerable<EmpleadosDTO>> GetAllEmpleados()
        {
            return await _httpClient.GetFromJsonAsync<IEnumerable<EmpleadosDTO>>($"api/Seleccionar/EmpleadosDTO");
        }

        public async Task<IEnumerable<Registro_ocupacionesDTO>> GetAllRegistro_ocupacione()
        {
            try
            {
                var result = await _httpClient.GetFromJsonAsync<IEnumerable<Registro_ocupacionesDTO>>($"api/Seleccionar/Registro_ocupacionesDTO");
                return result;
            }
            catch (Exception)
            {

                throw;
            }

        }


        public async Task<Pacientes> GetPacientePorNombre(string? persona)
        {
            return await _httpClient.GetFromJsonAsync<Pacientes>($"api/Seleccionar/Pacientes({persona})");
        }

        public async Task<EmpleadosDTO> GetEmpleadosDTOPorNombre(string? persona)
        {
            return await _httpClient.GetFromJsonAsync<EmpleadosDTO>($"api/Seleccionar/EmpleadosDTO({persona})");
        }


        public async Task<EmpleadosDTO> GetEmpleadosDTOPorNombre_usuario(string? nombre_usuario)
        {
            return await _httpClient.GetFromJsonAsync<EmpleadosDTO>($"api/Seleccionar/EmpleadosDTO({nombre_usuario})");
        }



    }
}
