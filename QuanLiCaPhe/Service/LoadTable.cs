using QuanLiCaPhe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiCaPhe.Service
{
    internal class LoadTable
    {
        private static LoadTable instance;

        public static LoadTable Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new LoadTable();
                }
                return instance;
            }
            private set
            {
                instance = value;
            }
        }

        private LoadTable() { }

        public List<TableDTO> Load()
        {
            string query = $"SELECT * FROM TableFood";
            var listTables = new List<TableDTO>();
            DataTable data = AppDBContext.Context.GetDataFromQuery(query);
            if(data!= null)
            {
                foreach (DataRow item in data.Rows)
                {
                    var table = new TableDTO(item);
                    listTables.Add(table);
                }
            }
            return listTables;
           
        }
    }
}
