using Microsoft.AspNetCore.Mvc;
using Repositorio;
using CareMod.Shared;
using System.Data;
using System.Collections.Generic;
using System.Reflection.Emit;

namespace CareMod.Server.Controllers
{

        [Route("api/[controller]")]
        [ApiController]
        public class SeleccionarController : Controller
        {
            private readonly ISeleccionarRepositorio _ISeleccionarRepositorio;

            public SeleccionarController(ISeleccionarRepositorio seleccionarRepositorio)
            {
                _ISeleccionarRepositorio = seleccionarRepositorio;
            }

        /*  [HttpGet("Pacientes")]
         *  
           public async Task<IEnumerable<Pacientes>> GetAllPacientes()
           {
           //return await _ISeleccionarRepositorio.GetPacientes();
           return (IEnumerable<Pacientes>)Ok("Hola Mundo");

           } 
        */
        [HttpGet("Pacientes")]
        public IActionResult GetAllPacientes()
        {
            var pacientes = _ISeleccionarRepositorio.GetPacientes();
            return Ok("Hola Mundo");
        }


    }
}
