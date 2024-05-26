using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareMod.Shared
{
    public class EmpleadosDTO
    {
        public string fecha_de_ingreso { get; set; }
        public string persona { get; set; }
        public string jefe { get; set; }
        public string nombre_usuario { get; set; }
        public string contrasennia { get; set; }
        public int detalle_permisos { get; set; }
    }
}
