using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

namespace ProductServiceHost
{
    class Program
    {
        static void Main()
        {
            using(ServiceHost host = new ServiceHost(typeof(ProductInfo.ProductService)))
            {
                host.Open();
                Console.WriteLine("Host started at " + DateTime.Now.ToString());
                Console.ReadLine();
            }
        }
    }
}
