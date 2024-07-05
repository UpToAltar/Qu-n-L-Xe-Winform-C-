using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiCaPhe.Service
{
    internal class CheckLogin
    {
        private static CheckLogin checkLogin;

        public static CheckLogin Instance
        {
            get
            {
                if (checkLogin == null)
                {
                    checkLogin = new CheckLogin();
                }
                return checkLogin;
            }
            private set
            {
                checkLogin = value;
            }
        }

        private CheckLogin() { }

        public bool Check(string username, string password)
        {
            string query = $"SELECT * FROM Account WHERE UserName = '{username}' AND PassWord = '{password}'";
            var data = AppDBContext.Context.GetDataTypeIntFromQuery(query);
            if (data == 0)
            {
                return false;
            }
            return true;
        }
    }
}
