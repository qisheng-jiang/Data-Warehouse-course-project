package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Neo4jConn {

    private static final String URL = "jdbc:neo4j://121.36.110.12:7687";

    private static final String name = "neo4j";
    private static final String pwd = "neo4j";

    private static Connection connection;

    public static Connection getConn() throws SQLException {
        if (connection == null){
            connection = DriverManager.getConnection(URL, name, pwd);
        }
        return connection;
    }

}
