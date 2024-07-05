using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLiCaPhe.Service;
using QuanLiCaPhe.Helper;

namespace QuanLiCaPhe
{
    public partial class FAdmin : Form
    {
        public FAdmin()
        {
            InitializeComponent();
            LoadDataUser();
        }

        void LoadDataUser()
        {
           
            dataGridViewUser.DataSource = UserService.Instance.Load();
        }

        private void btnAddUser_Click(object sender, EventArgs e)
        {
            //Validate
            var listTextBox = new List<TextBox>() { userPassword, userName, userRole, userDisplay };
            if(!ValidateHelper.Instance.ValidateEmpty(listTextBox))
            {
                MessageBox.Show("Vui lòng nhập đủ thông tin");
                return;
            }

            //Add User
            string query = $"INSERT INTO Account (DisplayName, UserName, Password, Type) VALUES ('{userDisplay.Text}','{userName.Text}', '{userPassword.Text}', '{userRole.Text}')";
            MessageBox.Show(UserService.Instance.CreateUser(query));
        }
    }
}
