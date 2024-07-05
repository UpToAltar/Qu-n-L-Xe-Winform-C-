using QuanLiCaPhe.DTO;
using QuanLiCaPhe.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLiCaPhe.Helper
{
    internal class ValidateHelper
    {
        private static ValidateHelper instance;

        public static ValidateHelper Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new ValidateHelper();
                }
                return instance;
            }
            private set
            {
                instance = value;
            }
        }

        private ValidateHelper() { }

        public bool ValidateEmpty(List<TextBox> listTextBox)
        {
            foreach (var item in listTextBox)
            {
                if (string.IsNullOrEmpty(item.Text)) return false;
            }
            return true;
        }
    }
}
