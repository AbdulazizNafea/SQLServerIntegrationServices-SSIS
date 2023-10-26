using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ProductInfo
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ProductService" in both code and config file together.
    public class ProductService : IProductService
    {

        public string GetProduct(int ProductID)
        {
            SqlConnection con = new SqlConnection("data source=localhost;initial catalog=AdventureWorks;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Name AS ProductName FROM Production.Product WHERE ProductID=" + ProductID, con);
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.SequentialAccess);
            rdr.Read();
            return rdr.GetString(0);
        }
    }
}
