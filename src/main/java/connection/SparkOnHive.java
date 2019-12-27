package connection;

import org.apache.spark.SparkConf;
import org.apache.spark.sql.SparkSession;

public class SparkOnHive {
//    //数据库名称
//    val database ="hivetest"
//    //表名称
//    val table = "tb_his_zy_fee_detail"
//    //hive warehouse在hdfs上的存储目录
//    val warehouse = "/user/hive/warehouse"
//
//    val path = "/user/hdfs/test/hivespark"
//    val spark = SparkSession
//            .builder()
//            .appName("Spark Hive Example")
//            .config("spark.sql.warehouse.dir", warehouse)
//            .enableHiveSupport()
//            .getOrCreate()
//
//    val sql="select * from hivetest.tb_his_zy_fee_detail where tb_his_zy_fee_detail."
//
//    val data=spark.sql(sql)
//    //显示查询结果
//    data.show
//    //将结果保存只HDFS
//    data.coalesce(1).write.save(path)
//            spark.stop()
//
//    public static void main(String[] args) {
//        SparkConf conf = new SparkConf().setAppName("appName").setMaster("local[*]");
//
//        SparkSession spark = SparkSession
//                .builder()
//                .appName("Java Spark SQL basic example hive")
//                .config(conf)
//                .enableHiveSupport()  //支持hive
//                .getOrCreate();
//
//        SparkSession spark = ESMysqlSpark.getSession();
//        String querySql = "SELECT * FROM test.table";
//        spark.sql(querySql);
//
//    }


}