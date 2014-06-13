using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Collections;
using System.IO;
using System.Xml;
using System.Xml.Xsl;

namespace Display
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        internal void ReadFiles()
        {
            ConvertXMLtoHTML.ReadAllXMLFiles();
        }

        internal void MakeHTML()
        {
            if (ConvertXMLtoHTML.TransformXMLToHTML() < 1)
            {
                MessageBox.Show("All files converted");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Thread readThread = new Thread(new ThreadStart(ReadFiles));
            readThread.Start();
            Thread writeThread = new Thread(new ThreadStart(MakeHTML));
            writeThread.Start();
        }
    }
}
