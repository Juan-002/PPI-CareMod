using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CareMod.Shared
{

    public class Pacientes
    {
        [Key]
        [Column("RH")]
        public string RH { get; set; }
        /*[Column("EPS")]
        public int   EPS { get; set; }
        [Column("TIPO_DE_USUARIO")]
        public string TIPO_DE_USUARIO { get; set; }
        [Column("RESIDENCIA")]
        public string RESIDENCIA { get; set; }
        [Column("RELIGION")]
        public int RELIGION { get; set; }
        [Column("ESTATUS_AC_NOAC")]
        public bool? ESTATUS_AC_NOAC { get; set; }
        [Column("FECHA_CREACION")]
        public string FECHA_CREACION { get; set; }
        [Column("FECHA_EDICION")]
        public string FECHA_EDICION { get; set; }
        */
    }
}
