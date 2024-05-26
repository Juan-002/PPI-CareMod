using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareMod.Shared
{
    public class Detalle_Permisos_formulariosDTO
    {
        public int id { get; set; }
        public bool? crear { get; set; }
        public bool? leer { get; set; }
        public bool? actualizar { get; set; }
        public bool? eliminar { get; set; }
        public string rol { get; set; }
        public string formulario { get; set; }
    }
}
