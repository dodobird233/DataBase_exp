import java.sql.*;

public class Transform {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sparsedb?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=UTF8&useSSL=false&serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "123123";

    /**
     * 向sc表中插入数据
     *
     */

    public static int insertSC(String sno,String name,String value,Connection connection) throws SQLException{
        String sql="insert sc values(?,?,?)";
        PreparedStatement pps=connection.prepareStatement(sql);
        pps.setString(1,sno);
        pps.setString(2,name);
        pps.setString(3,value);
        int n=pps.executeUpdate();
        return n;
    }

    public static void main(String[] args) throws Exception{
        Connection connection=DriverManager.getConnection(DB_URL, USER, PASS);
        String sql="select * from entrance_exam";
        Statement st=connection.createStatement();
        ResultSet resultSet=st.executeQuery(sql);
        while(resultSet.next()){
            String sno=resultSet.getString("sno");
            String chinese=resultSet.getString("chinese");
            if(chinese!=null){
                insertSC(sno,"chinese",chinese,connection);
            }
            String math=resultSet.getString("math");
            if(math!=null){
                insertSC(sno,"math",math,connection);
            }
            String English=resultSet.getString("English");
            if(English!=null){
                insertSC(sno,"english",English,connection);
            }
            String physics=resultSet.getString("physics");
            if(physics!=null){
                insertSC(sno,"physics",physics,connection);
            }
            String chemistry=resultSet.getString("chemistry");
            if(chemistry!=null){
                insertSC(sno,"chemistry",chemistry,connection);
            }
            String biology=resultSet.getString("biology");
            if(biology!=null){
                insertSC(sno,"biology",biology,connection);
            }
            String history=resultSet.getString("history");
            if(history!=null){
                insertSC(sno,"history",history,connection);
            }
            String geography=resultSet.getString("geography");
            if(geography!=null){
                insertSC(sno,"geography",geography,connection);
            }
            String politics=resultSet.getString("politics");
            if(politics!=null){
                insertSC(sno,"politics",politics,connection);
            }
        }

    }
}