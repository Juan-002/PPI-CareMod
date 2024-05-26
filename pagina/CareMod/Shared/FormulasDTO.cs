using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareMod.Shared
{
    public class FormulasDTO
    {
        public int    id { get; set; }
        public string fecha { get; set; }
        public string id_paciente { get; set; }
        public string id_empleado { get; set; }
        public int    id_medicamento { get; set; }
        public int    cantidad { get; set; }
        public string? obserb { get; set; }
        public string fecha_actualizacion { get; set; }
    }
}
