using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RBI.DAL.MSSQL
{
    class MSSQLDBUtils
    {
        public static SqlConnection GetDBConnection()
        {
            String serverName = @"ROCKETGAMER\SQLEXPRESS";
            //String serverName = @"DESKTOP-L1AFIQR";
            String DbName = "rbi";
            return SQL_DBConnectUtils.GetDBConnect(serverName, DbName);
        }       
    }
}
