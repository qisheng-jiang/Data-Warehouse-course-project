package service;

import connection.HiveConn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class HiveService {
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
//    private static Lock lock = new ReentrantLock();


    public static Map searchByTime(Map<String, Integer> conditions){
        StringBuilder sql = null;
        if (conditions.size() == 0){
            sql = new StringBuilder("SELECT * FROM fact_movie f JOIN  div_time d ON f.timekey = d.timekey limit 100");
        }else {
            sql = new StringBuilder("SELECT * FROM fact_movie f JOIN (SELECT * FROM div_time WHERE ");
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
        }
        System.out.println(sql);
        return getMovies(sql.toString());
    }

    public static Map searchByTitle(String title){
        Map result = new HashMap();
        String sql = "SELECT * FROM fact_product WHERE movieid IN (SELECT movieid FROM fact_movie WHERE title = '"+title+"')";
        try{
//            lock.lock();
            conn = HiveConn.getConn();
            stmt = conn.createStatement();
            long startTime =  System.currentTimeMillis();
            rs = stmt.executeQuery(sql);
            long endTime =  System.currentTimeMillis();
            double usedTime = (endTime-startTime)/1000;
            result.put("time", usedTime);
            List<Map> movies = new ArrayList();
            while (rs.next()){
                Map movie = new HashMap();
                movie.put("title", rs.getString("title"));
                movie.put("productid", rs.getFloat("productid"));
                movie.put("rate", rs.getString("rate"));
                movie.put("studio", rs.getString("studio"));
                movie.put("runtime", rs.getString("runtime"));
                movies.add(movie);
            }
            result.put("movies", movies);
            result.put("num", movies.size());
            rs.close();
            stmt.close();
//            lock.unlock();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return result;
    }

    public static Map searchByDirector(String director){
//        String sql = "SELECT f.movieid, f.title, f.imdb, f.actorname, f.directorname FROM fact_movie f JOIN " +
//                     " (SELECT name, movieid FROM div_director JOIN bridge_direct ON div_director.directorkey = bridge_direct.directorkey WHERE div_director.name = '"+director+"') d "+
//                     " ON f.movieid = d.movieid;";

        String sql = "SELECT f.movieid, f.title, f.imdb, f.actorname, f.directorname FROM fact_movie f JOIN " +
                     "(SELECT movieid FROM bridge_direct JOIN (SELECT directorkey FROM div_director WHERE name = '" + director + "' ) n ON n.directorkey = bridge_direct.directorkey) d " +
                     "ON f.movieid = d.movieid ";
        System.out.println(sql);
        return getMovies(sql);

    }

    public static Map searchByGenre(String genreKey){
//        String sql = "SELECT f.movieid, f.title, f.imdb, f.actorname, f.directorname FROM fact_movie f JOIN " +
//                     "(SELECT movieid FROM bridge_is_genre JOIN (SELECT genreskey FROM div_genres WHERE type = '" + genre + "' ) n ON n.genreskey = bridge_is_genre.genreskey) d " +
//                     "ON f.movieid = d.movieid;";
        String sql = "SELECT f.movieid, f.title, f.imdb, f.actorname, f.directorname FROM fact_movie f JOIN " +
                "(SELECT movieid FROM bridge_is_genre WHERE bridge_is_genre.genreskey = "+genreKey+" ) d " +
                "ON f.movieid = d.movieid ";
        System.out.println(sql);
        return getMovies(sql);

    }

    private static Map getMovies(String sql){
        Map result = new HashMap<String, Object>();
//        String count = sql.replaceFirst("\\*", "count(*)");
        try{
//            lock.lock();
            conn = HiveConn.getConn();
            stmt = conn.createStatement();
            long startTime =  System.currentTimeMillis();
            rs = stmt.executeQuery(sql);
            long endTime =  System.currentTimeMillis();
            double usedTime = (endTime-startTime)/1000;
            result.put("time", usedTime);
            List<Map> movies = new ArrayList();
            while (rs.next()){
                Map movie = new HashMap();
                movie.put("title", rs.getString("title"));
                movie.put("imdb", rs.getFloat("imdb"));
                movie.put("directorname", rs.getString("directorname"));
                movie.put("actorname", rs.getString("actorname"));
                movies.add(movie);
            }
            result.put("movies", movies);
            result.put("num", movies.size());
            rs.close();
            stmt.close();
//            stmt = conn.createStatement();
//            rs = stmt.executeQuery(count);
//            result.put("num", rs.getInt(0));
//            rs.close();
//            stmt.close();
//            lock.unlock();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return result;
    }

    public static Map searchByReview(Map<String, String> conditions){
        Map result = new HashMap<String, Object>();
        StringBuilder sql = new StringBuilder(
                " SELECT m.title, d.text, d.summary, d.emotion, d.score, d.profilename  FROM fact_movie m " +
                " JOIN (SELECT r.text, r.summary, r.emotion, s.score, r.movieid, u.profilename FROM fact_review r " +
                " JOIN (SELECT userkey, profilename FROM div_user "
                );
        if (conditions.containsKey("profilename")){
            sql.append(" WHERE profilename = '"+conditions.get("profilename")+"' ");
        }
        sql.append( " ) u "+
                    " JOIN (SELECT score, scorekey FROM div_score ");
        if (conditions.containsKey("score")){
            switch (conditions.get("score")){
                case "0":
                    sql.append(" WHERE up5 = 1 ");
                    break;
                case "1":
                    sql.append(" WHERE up4 = 1 ");
                    break;
                case "2":
                    sql.append(" WHERE up3 = 1 ");
                    break;
                case "3":
                    sql.append(" WHERE up2 = 1 ");
                    break;
                case "4":
                    sql.append(" WHERE down4 = 1 ");
                    break;
                case "5":
                    sql.append(" WHERE down3 = 1 ");
                    break;
                case "6":
                    sql.append(" WHERE down2 = 1 ");
                    break;
                case "7":
                    sql.append(" WHERE down1 = 1 ");
                    break;
            }
        }
        sql.append( " ) s " +
                    " on r.userkey = u.userkey AND r.scorekey = s.scorekey ");
        if (conditions.containsKey("emotion")){
            sql.append(" WHERE r.emotion = "+conditions.get("emotion"));
        }
        sql.append( " ) d " +
                    " ON m.movieid = d.movieid ");
        System.out.println(sql);
        try{
            conn = HiveConn.getConn();
            stmt = conn.createStatement();
            long startTime =  System.currentTimeMillis();
            rs = stmt.executeQuery(sql.toString());
            long endTime =  System.currentTimeMillis();
            double usedTime = (endTime-startTime)/1000;
            result.put("time", usedTime);
            List<Map> movies = new ArrayList();
            while (rs.next()){
                Map movie = new HashMap();
                movie.put("title", rs.getString("title"));
                movie.put("text", rs.getFloat("text"));
                movie.put("summary", rs.getString("summary"));
                if (rs.getInt("emotion") == 1){
                    movie.put("attitude", "Positive");
                }else {
                    movie.put("attitude", "Negative");
                }
                movie.put("score", rs.getString("score"));
                movie.put("profilename", rs.getString("profilename"));
                movies.add(movie);
            }
            result.put("movies", movies);
            result.put("num", movies.size());
            rs.close();
            stmt.close();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return result;
    }

    public static Map searchPartner(String name, String role){
        Map result = new HashMap<String, Object>();
        String sql = null;
        if (role.equals("1")){
            sql = "SElECT a.name, count(a.actorkey) as num FROM " +
                    "(  " +
                    "    SELECT div_actor.name, div_actor.actorkey, bridge_star.movieid as movieid FROM div_actor JOIN bridge_star ON div_actor.actorkey=bridge_star.actorkey " +
                    "    UNION DISTINCT " +
                    "    SELECT div_actor.name, div_actor.actorkey, bridge_support.movieid as movieid FROM div_actor JOIN bridge_support ON div_actor.actorkey=bridge_support.actorkey " +
                    ") a " +
                    "JOIN( " +
                    "SELECT movieid FROM bridge_direct WHERE directorkey IN (SELECT directorkey From div_director WHERE name = '"+name+"' ) )d " +
                    "ON a.movieid=d.movieid " +
                    "group by a.name";
        }else {
            sql = "SElECT a.name, count(a.directorkey) as num FROM( " +
                    "SELECT div_director.name, bridge_direct.movieid, bridge_direct.directorkey FROM bridge_direct JOIN div_director ON bridge_direct.directorkey = div_director.directorkey " +
                    ") a " +
                    "JOIN( " +
                    "    SELECT bridge_star.movieid as movieid FROM bridge_star WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+name+"') " +
                    "    UNION DISTINCT " +
                    "    SElECT bridge_support.movieid as movieid FROM bridge_support WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+name+"') " +
                    ")d " +
                    "ON a.movieid=d.movieid " +
                    "group by a.name";
        }
        System.out.println(sql);
        try{
            conn = HiveConn.getConn();
            stmt = conn.createStatement();
            long startTime =  System.currentTimeMillis();
            rs = stmt.executeQuery(sql);
            long endTime =  System.currentTimeMillis();
            double usedTime = (endTime-startTime)/1000;
            result.put("time", usedTime);
            List<Map> partners = new ArrayList();
            while (rs.next()){
                Map partner = new HashMap();
                partner.put("name", rs.getString("name"));
                partner.put("num", rs.getFloat("num"));
                partners.add(partner);
            }
            result.put("partner", partners);
            result.put("num", partners.size());
            rs.close();
            stmt.close();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return result;
    }

    public static Map searchByActor(String name, String role){
        String sql = null;
        if (role.equals("0")){
            sql = "SELECT * FROM fact_movie JOIN " +
                    "(   SELECT bridge_star.movieid as movieid FROM bridge_star WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+name+"') " +
                    "    UNION DISTINCT\n" +
                    "    SElECT bridge_support.movieid as movieid FROM bridge_support WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+name+"') " +
                    ") a " +
                    "    ON fact_movie.movieid = a.movieid";
        }else if (role.equals("1")){
            sql = "SELECT * FROM fact_movie JOIN " +
                    "(   SELECT bridge_star.movieid as movieid FROM bridge_star WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+name+"') " +
                    ") a " +
                    "    ON fact_movie.movieid = a.movieid";
        }else {
            sql = "SELECT * FROM fact_movie JOIN " +
                    "(   SElECT bridge_support.movieid as movieid FROM bridge_support WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+name+"') " +
                    ") a " +
                    "    ON fact_movie.movieid = a.movieid";
        }
        System.out.println(sql);
        return getMovies(sql);
    }

    public static Map searchCooperation(String actor, String cooperator, String role){
        String sql = null;
        if (role.equals("0")){
            sql = "SELECT * FROM fact_movie WHERE movieid IN (\n" +
                    "SELECT movieid FROM \n" +
                    "(   SELECT bridge_star.movieid as movieid FROM bridge_star WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+actor+"')\n" +
                    "    UNION DISTINCT\n" +
                    "    SElECT bridge_support.movieid as movieid FROM bridge_support WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+actor+"')\n" +
                    ") a LEFT SEMI JOIN\n" +
                    "(   SELECT bridge_star.movieid as movieid FROM bridge_star WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+cooperator+"')\n" +
                    "    UNION DISTINCT\n" +
                    "    SElECT bridge_support.movieid as movieid FROM bridge_support WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+cooperator+"')\n" +
                    ") b ON a.movieid = b.movieid\n" +
                    ")";
        }else {
            sql = "SELECT * FROM fact_movie WHERE movieid IN (\n" +
                    "SELECT movieid FROM \n" +
                    "(   SELECT bridge_star.movieid as movieid FROM bridge_star WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+actor+"')\n" +
                    "    UNION DISTINCT\n" +
                    "    SElECT bridge_support.movieid as movieid FROM bridge_support WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+actor+"')\n" +
                    ") a LEFT SEMI JOIN\n" +
                    "(   SELECT bridge_direct.movieid as movieid FROM bridge_direct WHERE directorkey IN (SELECT directorkey FROM div_director WHERE name = '"+cooperator+"')\n" +
                    ") b ON a.movieid = b.movieid\n" +
                    ")";
        }
        System.out.println(sql);
        return getMovies(sql);
    }

    public static Map searchIntergrated(Map<String, String> conditions){
        StringBuilder sql = new StringBuilder("SELECT * FROM fact_movie JOIN ( SELECT timekey FROM div_time WHERE ");
        if (conditions.containsKey("year")){
            sql.append(" year = "+conditions.get("year")+" AND ");
        }
        if (conditions.containsKey("month")){
            sql.append(" month = "+conditions.get("month")+" AND");
        }
        if (conditions.containsKey("quarter")){
            sql.append(" quarter = "+conditions.get("quarter")+" AND ");
        }
        sql.replace(sql.length()-5, sql.length()-1, ") t JOIN ( ");
        if (conditions.containsKey("genre")){
            sql.append("SELECT movieid FROM bridge_is_genre WHERE bridge_is_genre.genreskey = "+conditions.get("genre")+" ");
        }
        if (conditions.containsKey("role")){
            if (conditions.containsKey("genre")){
                sql.append(" UNION DISTINCT ");
            }
            if (conditions.get("role").equals("0")){
                sql.append(" SELECT bridge_star.movieid as movieid FROM bridge_star WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+conditions.get("name")+"')\n" +
                        "    UNION DISTINCT \n" +
                        "    SElECT bridge_support.movieid as movieid FROM bridge_support WHERE actorkey IN (SELECT actorkey FROM div_actor WHERE name = '"+conditions.get("name")+"')");
            }else {
                sql.append(" SELECT movieid FROM bridge_direct JOIN (SELECT directorkey FROM div_director WHERE name = '" + conditions.get("name") + "' ) n ON n.directorkey = bridge_direct.directorkey ");
            }
        }
        sql.append(") a ON a.movieid = fact_movie.movieid AND t.timekey = fact_movie.timekey ");
        System.out.println(sql);
        return getMovies(sql.toString());
    }
}
