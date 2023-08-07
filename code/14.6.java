import java.sql.*;
import java.util.Scanner;

public class Transfer {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/finance?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=UTF8&useSSL=false&serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "123123";
    /**
     * 转账操作
     *
     * @param connection 数据库连接对象
     * @param sourceCard 转出账号
     * @param destCard 转入账号
     * @param amount  转账金额
     * @return boolean
     *   true  - 转账成功
     *   false - 转账失败
     */
    public static boolean transferBalance(Connection connection,
                             String sourceCard,
                             String destCard, 
                             double amount){
        try{
            connection.setAutoCommit(false);
            String sql1="update bank_card set b_balance=b_balance-? where b_number=? and b_type='储蓄卡' and b_balance>=?";
            PreparedStatement pps=connection.prepareStatement(sql1);
            String am=amount+"";
            pps.setString(1,am);
            pps.setString(2,sourceCard);
            pps.setString(3,am);
            int n=pps.executeUpdate();
            if(n==0){
                throw new Exception();
            }
            String sql2="update bank_card set b_balance=if(b_type='储蓄卡',b_balance+?,b_balance-?) where b_number=?";
            pps=connection.prepareStatement(sql2);
            pps.setString(1,am);
            pps.setString(2,am);
            pps.setString(3,destCard);
            n=pps.executeUpdate();
            if(n==0){
                throw new Exception();
            }
            connection.commit();
        }catch(Exception e){
            try{
                connection.rollback();
            }catch(Exception e1){};
            return false;
        }
        return true;
    }

    // 不要修改main() 
    public static void main(String[] args) throws Exception {

        Scanner sc = new Scanner(System.in);
        Class.forName(JDBC_DRIVER);

        Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);

        while(sc.hasNext())
        {
            String input = sc.nextLine();
            if(input.equals(""))
                break;

            String[]commands = input.split(" ");
            if(commands.length ==0)
                break;
            String payerCard = commands[0];
            String  payeeCard = commands[1];
            double  amount = Double.parseDouble(commands[2]);
            if (transferBalance(connection, payerCard, payeeCard, amount)) {
              System.out.println("转账成功。" );
            } else {
              System.out.println("转账失败,请核对卡号，卡类型及卡余额!");
            }
        }
    }

}
