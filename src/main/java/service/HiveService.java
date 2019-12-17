package service;

import connection.HiveConn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class HiveService {
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static Map searchByTime(Map<String, Integer> conditions){
        Map result = new HashMap<String, Object>();
        try{
            conn = HiveConn.getConn();
            StringBuilder sql = new StringBuilder("SELECT * FROM fact_movie f JOIN (SELECT timeKey FROM div_time WHERE");
            Set<Map.Entry<String, Integer>> set = conditions.entrySet();
            for (Map.Entry i:set
                 ) {
                sql.append(i.getKey());
                sql.append(" = ");
                sql.append(i.getValue());
                sql.append(" AND ");
            }
            sql.delete(sql.length()-5, sql.length()-1);
            sql.append(") d ON f.timekey = d.timekey");
            stmt = conn.createStatement();
            long startTime =  System.currentTimeMillis();
            rs = stmt.executeQuery(sql.toString());
            long endTime =  System.currentTimeMillis();
            long usedTime = (endTime-startTime)/1000;
            result.put("time", usedTime);
            List<Map> movies = new ArrayList();
            while (rs.next()){
                Map movie = new HashMap();
                movie.put("title", rs.getString("title"));
                movie.put("imdb", rs.getFloat("imdb"));
                movie.put("directorname", rs.getArray("directorname").toString());
                movie.put("actorname", rs.getArray("actorname").toString());
                movie.put("time", rs.getInt("year")+"."+rs.getInt("month")+"."+rs.getInt("timedate"));
                movies.add(movie);
            }
            rs.close();
            stmt.close();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return result;
    }

}
