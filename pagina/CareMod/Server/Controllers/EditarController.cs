using Microsoft.AspNetCore.Mvc;
using CareMod.Shared;
using Repositorio;
using Blazorise.Extensions;
namespace CareMod.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EditarController : Controller
    {
        private readonly IEditarRepositorio _IEditarRepositorio;

        public EditarController(IEditarRepositorio editarRepositorio)
        {
            _IEditarRepositorio = editarRepositorio;
        }

        [HttpPut("tb_pacientes({persona})")]
        public async Task<IActionResult> PutPaciente([FromRoute] String rh, [FromBody] Pacientes pacientes)
        {
            if (pacientes == null || rh != "")
            {
                return BadRequest();
            }


            if (string.IsNullOrEmpty(pacientes.RH))
                ModelState.AddModelError("rh", "Primer Apellido no puede estar en blanco");

           /* if (string.IsNullOrEmpty(pacientes.EPS.ToString()))
                ModelState.AddModelError("eps", "eps no puede estar en blanco");

            if (string.IsNullOrEmpty(pacientes.TIPO_DE_USUARIO))
                ModelState.AddModelError("tipo_de_usuario", "tipo_de_usuario no puede estar en blanco");

            if (string.IsNullOrEmpty(pacientes.RESIDENCIA))
                ModelState.AddModelError("residencia", "residencia no puede estar en blanco");

            if (string.IsNullOrEmpty(pacientes.ESTATUS_AC_NOAC.ToString()))
                ModelState.AddModelError("estatus_ac_noac", "estatus no puede estar en blanco");

            if (string.IsNullOrEmpty(pacientes.FECHA_CREACION))
                ModelState.AddModelError("fecha_creacion", "fecha de creacion no puede estar en blanco");*/

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            pacientes.RH = rh;

            var result = await _IEditarRepositorio.EditarPaciente(pacientes);

            return NoContent();
            //return Ok();
        }
    }
}