using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Game.Models.Test
{
    using FluentNHibernate.Cfg;
    using FluentNHibernate.Cfg.Db;
    using Game.Models.Test.Conventions;
    using Game.Models.Test.Mappings;
    using MathNet.Numerics.LinearAlgebra;
    using NHibernate;
    using NHibernate.Linq;
    using NHibernate.Cfg;
    using NHibernate.Tool.hbm2ddl;
    using NUnit.Framework;
    using System.Data.Entity;

    [TestFixture]
    public class OracleTest
    {
        [Test]
        public void test_connection()
        {
            Console.WriteLine(TimeZoneInfo.Local.Id);

            using (var session = CreateLogTimesheetSessionFactory().OpenSession())
            using (var tran = session.BeginTransaction())
            {
                //var dhing = (from x in session.Query<Player>()
                //             where x.Name == "Dhing"
                //             select x).FirstOrDefault();
                var p = new Player()
                {
                    Name = "Dhing",
                    //CreatedDate = DateTime.UtcNow
                };

                session.Save(p);

                tran.Commit();
            }
        }

        [Test]
        public void test_connection_ef()
        {
            Console.WriteLine(TimeZoneInfo.Local.Id);

            Database.SetInitializer(new DropCreateDatabaseAlways<HRContext>());

            using (var hr_context = new HRContext())
            //using(var tran = hr_context.Database.BeginTransaction())
            {
                //hr_context.Database.CreateIfNotExists();
                //var dhing = (from x in hr_context.Players
                //             where x.Name == "Dhing"
                //             select x).FirstOrDefault();

                //dhing.CreatedDate = DateTime.Now;
                var p = new Player()
                {
                    Id= 3,
                    Name = "Dhing",
                    CreatedDate = DateTime.Now
                };

                hr_context.Players.Add(p);
                hr_context.SaveChanges();
                //tran.Commit();
            }
        }

        public static ISessionFactory CreateLogTimesheetSessionFactory()
        {
            var c = Fluently.Configure();
            c.Database(OracleDataClientConfiguration.Oracle10
              .ConnectionString(x => x.FromConnectionStringWithKey("default"))
              .DefaultSchema("HR"));
            c.Mappings(
                m => m.FluentMappings.AddFromAssemblyOf<OracleTest>()
                    .Conventions.Add(new DateTimeOffsetConvention()))
                .ExposeConfiguration(TreatConfiguration);
            return c.BuildSessionFactory();
        }

        public static void TreatConfiguration(Configuration configuration)
        {
            var update = new SchemaUpdate(configuration);
            update.Execute(false, true);
        }
    }
}
