package Conexao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class Conexao {

    private Connection conn = null;
    private final String db = "buscaCep";
    private final String user = "root";
    private final String pass = "";

    
     public Connection conectar() throws Exception {
    try {
        // Carrega o driver manualmente
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/" + db + "?useTimezone=true&serverTimezone=UTC";
        this.conn = DriverManager.getConnection(url, user, pass);

    } catch (ClassNotFoundException e) {
        throw new Exception("Driver JDBC não encontrado: " + e.getMessage());
    } catch (SQLException e) {
        throw new Exception("Erro ao conectar com banco: " + e.getMessage());
    }

    return this.conn;
}


    
    public void fecharConexao() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("Erro ao fechar a conexão: " + e.getMessage());
        }
    }
}
