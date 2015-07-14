using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Game.Models.Test
{
    public class Player
    {
        public virtual long? Id { get; set; }

        public virtual string Name { get; set; }

        public virtual DateTimeOffset CreatedDate { get; set; }
    }
}
