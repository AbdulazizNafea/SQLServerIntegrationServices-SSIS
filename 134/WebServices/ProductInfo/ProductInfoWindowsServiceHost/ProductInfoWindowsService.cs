﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

namespace ProductInfoWindowsServiceHost
{
    public partial class ProductInfoWindowsService : ServiceBase
    {
        ServiceHost host;
        public ProductInfoWindowsService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            host = new ServiceHost(typeof(ProductInfo.ProductService));
            host.Open();
        }

        protected override void OnStop()
        {
            host.Close();
        }
    }
}
