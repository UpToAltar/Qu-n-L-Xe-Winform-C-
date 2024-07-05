using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLiCaPhe.DTO;
using QuanLiCaPhe.Service;
using System.Drawing;

namespace QuanLiCaPhe
{
    public partial class FTableManager : Form
    {
        public FTableManager()
        {
            InitializeComponent();
            LoadTableData();
        }

        void LoadTableData()
        {
            List<TableDTO> listTables = LoadTable.Instance.Load();

            foreach (var item in listTables)
            {
                var btn = new Button()
                {
                    Width = item.width,
                    Height = item.height
                   
                };
                btn.Text = item.Name + Environment.NewLine + item.Status;
                if (item.Status == "Trống")
                {
                    btn.BackColor = ColorTranslator.FromHtml(item.colorEmpty);
                }
                else
                {
                    btn.BackColor = ColorTranslator.FromHtml(item.colorFull);
                }
                flowPanelTable.Controls.Add(btn);

            }
        }

        private void numericUpDown2_ValueChanged(object sender, EventArgs e)
        {

        }

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var formUserInfo = new FUserInfo();
            formUserInfo.ShowDialog();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            var formAdmin = new FAdmin();
            formAdmin.ShowDialog();
        }

      
    }
}
