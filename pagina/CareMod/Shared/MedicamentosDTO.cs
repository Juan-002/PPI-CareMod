using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareMod.Shared
{
    public class MedicamentosDTO
    {
        public int    id { get; set; }
        public string cod { get; set; }
        public string nomb_medica { get; set; }
        public int    cantidad { get; set; }
        public int    unidad_medida { get; set; }
    }
}
