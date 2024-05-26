using Microsoft.AspNetCore.Mvc;
using CareMod.Shared;
using Repositorio;

namespace CareMod.Server.Controllers
{
    //
    [Route("api/[controller]")]
    [ApiController]
    public class InsertarController : Controller
    {
        private readonly IInsertarRepositorio _IInsertarRepositorio;

        public InsertarController(IInsertarRepositorio insertarRepositorio)
        {
            _IInsertarRepositorio = insertarRepositorio;
        }


        [HttpPost("InsertarPaciente")]
        public async Task<IActionResult> PostPersona([FromBody] Pacientes pacientes)
        {
            if (pacientes == null)
            {
                return BadRequest();
            }

            if (string.IsNullOrEmpty(pacientes.RH))
                ModelState.AddModelError("RH", "Documento no puede estar en blanco");

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _IInsertarRepositorio.InsertarPaciente(pacientes);

            return NoContent();
            //return Ok();
        }

        /*[HttpPost("InsertarEspecie")]
        public async Task<IActionResult> PostEspecie([FromBody] Especies especies)
        {
            if (especies == null)
            {
                return BadRequest();
            }

            if (string.IsNullOrEmpty(especies.Nombre))
                ModelState.AddModelError("Nombre", "Nombre de raza no puede estar en blanco");

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _IInsertarRepositorio.InsertarEspecie(especies);

            return NoContent();
            //return Ok();
        }

        [HttpPost("InsertarPersona")]
        public async Task<IActionResult> PostPersona([FromBody] Personas personas)
        {
            if (personas == null)
            {
                return BadRequest();
            }

            if (string.IsNullOrEmpty(personas.nit.ToString()))
                ModelState.AddModelError("nit", "nit no puede estar en blanco");
            if (string.IsNullOrEmpty(personas.Nombre))
                ModelState.AddModelError("Nombre", "Nombre no puede estar en blanco");
            if (string.IsNullOrEmpty(personas.Apellido1))
                ModelState.AddModelError("Apellido1", "Primer Apellido no puede estar en blanco");
            if (string.IsNullOrEmpty(personas.Telefono.ToString()))
                ModelState.AddModelError("Telefono", "Teléfono no puede estar en blanco");
            if (string.IsNullOrEmpty(personas.Direccion))
                ModelState.AddModelError("Direccion", "Direccion no puede estar en blanco");
            if (string.IsNullOrEmpty(personas.Correo_electronico))
                ModelState.AddModelError("correo", "email no puede estar en blanco");

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _IInsertarRepositorio.InsertarPersona(personas);

            return NoContent();
            //return Ok();
        }

        [HttpPost("InsertarUsuario")]
        public async Task<IActionResult> PostUsuario([FromBody] Usuarios usuario)
        {
            if (usuario == null)
            {
                return BadRequest();
            }

            if (string.IsNullOrEmpty(usuario.nick_usuario))
                ModelState.AddModelError("Nombre", "Nombre de raza no puede estar en blanco");
            if (string.IsNullOrEmpty(usuario.Contraseña))
                ModelState.AddModelError("Nombre", "Nombre de raza no puede estar en blanco");
            if (usuario.nit_persona == null || usuario.nit_persona <= 0)
                ModelState.AddModelError("ID_especie", "Tipo de especie no puede estar en blanco");
            if (usuario.ID_rol == null || usuario.ID_rol <= 0)
                ModelState.AddModelError("ID_especie", "Tipo de especie no puede estar en blanco");
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _IInsertarRepositorio.InsertarUsuario(usuario);

            return NoContent();
            //return Ok();
        }

        [HttpPost("InsertarMascota")]
        public async Task<IActionResult> PostMascota([FromBody] Mascotas mascota)
        {
            if (mascota == null)
            {
                return BadRequest();
            }

            if (string.IsNullOrEmpty(mascota.Nombre))
                ModelState.AddModelError("Nombre", "Nombre de la mascota no puede estar en blanco");
            if (mascota.Fecha_Nacimiento == null)
                ModelState.AddModelError("Fecha de nacimiento", "Tipo de especie no puede estar en blanco");
            if (mascota.Nit_Cliente == null || mascota.Nit_Cliente <= 0)
                ModelState.AddModelError("ID_especie", "Tipo de especie no puede estar en blanco");
            if (mascota.Nit_Cliente == null || mascota.ID_raza <= 0)
                ModelState.AddModelError("ID_especie", "Tipo de especie no puede estar en blanco");
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _IInsertarRepositorio.InsertarMascota(mascota);

            return NoContent();
            //return Ok();
        }*/
    }
}
