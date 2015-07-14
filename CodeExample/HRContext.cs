using Oracle.ManagedDataAccess.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Game.Models.Test
{
    //[DbConfigurationType(typeof(ModelConfiguration))]
    public class HRContext : DbContext
    {
        //public HRContext()
        //    : base("name=HRContext")
        //{
        //    //Database.SetInitializer<HRContext>(new CreateDatabaseIfNotExists<HRContext>());
        //}

        public DbSet<Player> Players { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
           // base.OnModelCreating(modelBuilder);

            modelBuilder.HasDefaultSchema("HR");

            //modelBuilder.Entity<Player>();
            //modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            //modelBuilder.Configurations.Add(new PlayerMap()); 

            //modelBuilder.Entity<Player>().HasKey(t => t.Id);
            //modelBuilder.Entity<Player>().Property(t => t.Name);
            //modelBuilder.Entity<Player>().Property(t => t.CreatedDate);

        }

        //public class ModelConfiguration : DbConfiguration
        //{
        //    public ModelConfiguration()
        //    {
        //        SetProviderServices("Oracle.ManagedDataAccess.Client", EFOracleProviderServices.Instance);
        //    }
        //}
    }

    public class PlayerMap
        : EntityTypeConfiguration<Player>
    {
        public PlayerMap()
        {
            // Primary Key
            HasKey(t => t.Id);

            Property(t => t.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);  
            Property(t => t.Name)
                .IsRequired()
                .HasMaxLength(250);

            Property(t => t.CreatedDate);
        }
    }
}
