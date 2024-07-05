using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiCaPhe.DTO
{
    internal class TableDTO
    {
        private string name;
        private string status;
        private int id;

        public int width = 90;
        public int height = 90;
        public string colorEmpty = "#6ac2b6";
        public string colorFull = "#ff5247";

        public string Name { get => name; set => name = value; }
        public string Status { get => status; set => status = value; }
        public int Id { get => id; set => id = value; }

        public TableDTO(DataRow data) { 
            this.Id = int.Parse(data["id"].ToString());
            this.Name = data["name"].ToString();
            this.Status = data["status"].ToString();
        }
    }
}
