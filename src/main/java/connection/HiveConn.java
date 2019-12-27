package connection;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class HiveConn {
    // 驱动，固定的
    private static String driverName = "org.apache.hive.jdbc.HiveDriver";
    // 默认就是10000端口，ip地址使用hive服务器的 HiveServer2
    private static String url = "jdbc:hive2://119.3.21.54:10000/datawarehouse";
    //ThriftServer
//    private static String url = "jdbc:hive2://119.3.21.54:10000/filetest";
//    private static String url = "jdbc:hive2://119.3.21.54:10000/filetest";
    // hive连接的用户名和密码，默认就算是下面这两个
    private static String user = "hive";
    private static String password = "hive";

    // 公共使用的变量
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    private HiveConn(){}

    public static Connection getConn()throws Exception{
        if (conn == null){
            Class.forName(driverName);
            conn = DriverManager.getConnection(url,user,password);
        }
        return conn;
    }

    public static void main(String[] args) throws Exception{
        conn = getConn();
        stmt = conn.createStatement();
        BufferedReader reader = new BufferedReader((new FileReader("/Users/jiang/Downloads/movie-product.csv")));
        reader.readLine();
        String line = null;
        while ((line = reader.readLine())!=null){
            String[] item = line.split(",");
            stmt.executeUpdate("UPDATE reviewall SET movieid = "+item[0]+" where productid = '"+item[1]+"'");
            System.out.println("");
        }

    }

}
