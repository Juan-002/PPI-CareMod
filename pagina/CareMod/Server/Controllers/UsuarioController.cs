using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


using CareMod.Shared;

namespace CareMod.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

/*
    public class UsuarioController : ControllerBase
    {
        private readonly EmpleadosDTO _dbconnection;

        public UsuarioController(EmpleadosDTO context)
        {
            _dbconnection = context;
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] EmpleadosDTO login)
        {
            var empleado = await _dbconnection.SeleccionarEmpleados
                .Include(e => e.detalle_permisos)
                .FirstOrDefaultAsync(e => e.nombre_usuario == login.nombre_usuario && e.contrasennia == login.contrasennia);

            if (empleado == null)
            {
                return Unauthorized("Usuario o contraseña incorrectos");
            }

            SesionDTO sesionDTO = new SesionDTO
            {
                Nombre = empleado.nombre_usuario,
                nombre_usuario = empleado.nombre_usuario,
                Rol = empleado.detalle_permisos.Rol
            };

            return Ok(sesionDTO);
        }
    }

    public class SesionDTO
    {
        public string Nombre { get; set; }
        public string nombre_usuario { get; set; }
        public string Rol { get; set; }
    }
    */
    public class UsuarioController : ControllerBase
     {
         [HttpPost]
         [Route("Login")]
         public async Task<IActionResult> Login([FromBody] LoginDTO login)
         {
             SesionDTO sesionDTO = new SesionDTO();

             if (login.nombre_usuario == "admin" && login.contrasennia == "admin")
             {
                 sesionDTO.Nombre = "admin";
                 sesionDTO.nombre_usuario = login.nombre_usuario;
                 sesionDTO.Rol = "Administrador";
             }
             else
             {
                 sesionDTO.Nombre = "empleado";
                 sesionDTO.nombre_usuario = login.nombre_usuario;
                 sesionDTO.Rol = "Empleado";
             }

             return StatusCode(StatusCodes.Status200OK, sesionDTO);
         }

     }
}
