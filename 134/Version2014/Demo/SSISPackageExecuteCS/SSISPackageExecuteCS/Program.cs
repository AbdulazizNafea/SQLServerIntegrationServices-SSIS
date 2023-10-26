using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Dts.Runtime;

namespace SSISPackageExecuteCS
{
    class Program
    {
        static void Main(string[] args)
        {
            Microsoft.SqlServer.Dts.Runtime.Application oApp;  //full reference to avoid ambiguous reference with System.Windows.Forms.Application
            Package oPackage;
            DTSExecResult oResults;
            try
            {
                oApp = new Microsoft.SqlServer.Dts.Runtime.Application();
                oPackage = oApp.LoadPackage("c:\\134\\DataMigration\\DataMigration\\Package1.dtsx", null);
                oResults = oPackage.Execute();
                Console.WriteLine(oResults.ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                Console.ReadLine();
            }

        }
    }
}

