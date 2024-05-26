using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareMod.Shared
{
    public class Registro_ocupacionesDTO
    {
        public int    id { get; set; }
        public string fecha_ingreso { get; set; }
        public string fecha_salida { get; set; }
        public int    cama { get; set; }
        public string id_paciente { get; set; }

    }
}
