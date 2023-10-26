using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductServiceWebClient
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ProductServiceProxy.ProductServiceClient client = new ProductServiceProxy.ProductServiceClient("BasicHttpBinding_IProductService");
            Label1.Text = client.GetProduct(Int32.Parse(TextBox1.Text));
        }
    }
}