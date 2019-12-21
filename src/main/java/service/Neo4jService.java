package service;

import connection.HiveConn;
import connection.Neo4jConn;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class Neo4jService {
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static double searchByTime(Map<String, Integer> conditions){
        StringBuilder sql = null;
        if (conditions.size() == 0){
            sql = new StringBuilder("MATCH(film:Film) RETURN film.title,film.IMDb LIMIT 100");
        }else {
            sql = new StringBuilder("MATCH(film:Film) WHERE date({ ");
            Set<Map.Entry<String, Integer>> set = conditions.entrySet();
            for (Map.Entry i:set
            ) {
                sql.append(i.getKey());
                sql.append(":");
                sql.append(i.getValue());
                sql.append(",");
            }
            sql.deleteCharAt(sql.length() - 1);
            sql.append("}) return film");
        }
        System.out.println(sql);
        return getTime(sql.toString());
    }

    private static double getTime(String sql){
        double usedTime;
        try{
            conn = Neo4jConn.getConn();
            stmt = conn.createStatement();
            long startTime =  System.currentTimeMillis();
            rs = stmt.executeQuery(sql);
            long endTime =  System.currentTimeMillis();
            usedTime = (endTime-startTime)/1000;
            rs.close();
            stmt.close();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
        return usedTime;
    }


    /**
     * 输入电影名字，返回电影的版本数
     * @param title 电影名字
     * @return 电影版本数量
     */
    public static double searchByTitle(String title){
        String sql ="math(film:Film{name:"+title+"})<-[:VERSIONS]-(product) return product,count(VERSIONS)";
        return getTime(sql);
    }

    /**
     * 输入导演名字，返回导演指导过的电影数目
     * @param name 导演名字
     * @return 电影数量
     */
    public double getMovieByDirectorName(String name){
        String sql = "match(director:Director{name:"+name+"})-[:DIRECTED]->(film) return film,count(film)";
        return getTime(sql);
    }

    /**
     * 输入演员名字，返回演员主演电影数目
     * @param name 演员名字
     * @return 电影数量
     */
    public double getStarMovieByActorName(String name){
        String sql = "match(actor:Actor{name:"+name+"})-[:ACTEDIN{role:starring}]->(film) return film,count(film)";
        return getTime(sql);
    }

    /**
     * 输入演员名字，返回演员参演电影数目
     * @param name 演员名字
     * @return 电影数量
     */
    public double getSupportMovieByActorName(String name){
        String sql = "match(actor:Actor{name:"+name+"})-[:ACTEDIN{role:supporting}]->(film) return film,count(film)";
        return getTime(sql);
    }

    /**
     * 输入电影类型，返回该类型的电影数目
     * @param name 电影类型
     * @return 电影数量
     */
    public double getMovieByGenre(String name){
        String sql = "match (genre:Genre {name:"+name+"}) return size((genre)-[]->())";
        return getTime(sql);
    }

    /**
     * 输入某人的名字以及角色，返回合作数目
     * @param name 名字 role 角色
     * @return 合作数量
     */
    public static double searchPartner(String name, String role){

        String sql1 = null;
        String sql2 = null;
        if (role.equals("1")){
            sql1 = "match(actor:Actor{name:"+name+"})-[:ACTEDIN]->()<-[:ACTEDIN]-(coactor:Actor) return actor.name,coactor.name,count(*) as Times order by times desc";
            sql2 = "match(actor:Actor{name:"+name+"})-[:ACTEDIN]->()<-[:Directed]-(director:Director) return actor.name,director.name,count(*) as Times order by times desc";
            return getTime(sql1)+getTime(sql2);
        }else {
            sql2 = "match(actor:Actor})-[:ACTEDIN]->()<-[:Directed]-(director:Director{name:"+name+"}) return actor.name,director.name,count(*) as Times order by times desc";
            return getTime(sql2);
        }
    }

    /**
     * 输入演员名字和某人名字及角色，返回合作数目
     * @param actor 演员名字 cooperator 某人名字 role 某人角色
     * @return 合作数量
     */
    public static double searchCooperation(String actor,String cooperator,String role ){
        String sql = null;
        if (role.equals("0")) {
            sql = "match(actor:Actor{name:"+actor+"})-[:ACTEDIN]->(film)<-[:ACTEDIN]-(coactor:Actor{name:"+cooperator+") return film,count(*)";
        } else {
            sql ="match(actor:Actor{name:"+actor+"})-[:ACTEDIN]->(film)<-[:DIRECTED]-(director:Director{name:"+cooperator+") return film,count(*)";
            }
        return getTime(sql);
    }

    public static double searchByReview(Map<String, String> conditions) {
        StringBuilder sql = new StringBuilder();
        if (conditions.containsKey("profilename")) {
            sql.append("match(audience:Audience{name:" + conditions.get("profilename") + "})");
        }
        if (conditions.containsKey("emotion")) {
            sql.append("with audience match(audience:Audience)-[:WROTE]->[positive:Positive] return positive");
        }
        return getTime(sql.toString());
    }
}
