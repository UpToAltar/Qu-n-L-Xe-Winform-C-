using QuanLiCaPhe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiCaPhe.Service
{
    internal class UserService
    {
        private static UserService instance;

        public static UserService Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new UserService();
                }
                return instance;
            }
            private set
            {
                instance = value;
            }
        }

        private UserService() { }

        public DataTable Load()
        {
            string query = $"SELECT TOP (100) * FROM Account";
            
            return AppDBContext.Context.GetDataFromQuery(query);
            

        }

        public string CreateUser(string query)
        {
            int check = AppDBContext.Context.NonQuery(query);
            if(check > 0)
            {
                return "Tạo tài khoản thành công";
            }
            else
            {
                return "Tạo tài khoản thất bại";
            }
        }
    }
}
