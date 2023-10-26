using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProductServiceWinClient
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ProductServiceProxy.ProductServiceClient client = new ProductServiceProxy.ProductServiceClient("NetTcpBinding_IProductService");
            label1.Text = client.GetProduct(Int32.Parse(textBox1.Text));
        }
    }
}
