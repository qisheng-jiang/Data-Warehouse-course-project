package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlConn {
    // 驱动，固定的
    private static String driverName = "";

    private static String url = "";
    private static String user = "root";
    private static String password = "root";

    // 公共使用的变量
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    private MysqlConn(){}

    public static Connection getConn()throws Exception{
        if (conn == null){
            Class.forName(driverName);
            conn = DriverManager.getConnection(url,user,password);
        }
        return conn;
    }


}
