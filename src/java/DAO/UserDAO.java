package DAO;

import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import Conexao.Conexao;
import DTO.UserDTO;
import java.util.ArrayList;


public class UserDAO {

    private Connection conn = null;  
    private UserDTO usuario = null;

    public UserDAO() throws Exception {
        Conexao conexao = new Conexao();
        this.conn = conexao.conectar();
    }

    public void criarUsuario(String nome, String senha) throws Exception {

        String sql = "INSERT INTO usuario(nome,senha) VALUES (?,?)";

        try (PreparedStatement stmt = this.conn.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setString(2, senha);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception("Erro ao criar usuário " + e.getMessage());
        }
    }

    public ArrayList<UserDTO> listarUsuario() throws Exception {
        String sql = "SELECT * FROM usuario";
        ArrayList<UserDTO> lista = new ArrayList<>();

        try (PreparedStatement stmt = this.conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) { // Fechando ResultSet no try-with-resources
            while (rs.next()) {
                UserDTO usuarioEncontrado = new UserDTO();
                usuarioEncontrado.setNome(rs.getString("nome"));
                usuarioEncontrado.setSenha(rs.getString("senha"));
                lista.add(usuarioEncontrado);
            }
        } catch (SQLException e) {
            throw new Exception("Erro ao listar Usuário: " + e.getMessage());
        }

        return lista;
    }
    
    public void atualizarUsuario(int id, String nome, String senha) throws Exception {
   
    String sql = "UPDATE usuario SET nome = ?, senha = ? WHERE id = ?";
    try  (PreparedStatement stmt = conn.prepareStatement(sql)){

        stmt.setString(1, nome);
        stmt.setString(2, senha);
        stmt.setInt(3, id);

        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated == 0) {
            throw new Exception("Usuário não encontrado ou não foi possível atualizar.");
        }
    } catch (SQLException e) {
        throw new Exception("Erro ao atualizar o usuário: " + e.getMessage(), e);
    }
}

    
  public boolean deletarUsuario(int id) throws Exception {
    String sql = "DELETE FROM usuario WHERE id = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        int rowsAffected = stmt.executeUpdate();

        return rowsAffected > 0; // Retorna true se a exclusão for bem-sucedida
    } catch (SQLException e) {
        throw new Exception("Erro ao deletar o usuário: " + e.getMessage(), e);
    }
}

    
  public UserDTO buscarPorId(int id) throws Exception {
    String sql = "SELECT * FROM usuario WHERE id = ?";
    UserDTO user = null;

    try (PreparedStatement stmt = this.conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery(); // Agora executamos a query!

        if (rs.next()) { // Se encontrou o usuário
            user = new UserDTO();
            user.setId(rs.getInt("id"));
            user.setNome(rs.getString("nome"));
            user.setSenha(rs.getString("senha"));
        }
    } catch (SQLException e) {
        throw new Exception("Erro ao buscar usuário específico: " + e.getMessage());
    }

    return user; // Retorna o usuário encontrado ou null se não existir
}

// Modifique o método realizarLogin para retornar o UserDTO
public UserDTO realizarLogin(String nome, String senha) throws Exception {
    String sql = "SELECT * FROM usuario WHERE nome = ? AND senha = ?";
    UserDTO user = null;

    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, nome);  // Define o nome do usuário na consulta
        stmt.setString(2, senha);  // Define a senha do usuário na consulta

        ResultSet rs = stmt.executeQuery();  // Executa a consulta

        if (rs.next()) {
            // Se o usuário for encontrado, cria o objeto UserDTO
            user = new UserDTO();
            user.setId(rs.getInt("id"));  // Pega o ID do usuário
            user.setNome(rs.getString("nome"));
            user.setSenha(rs.getString("senha"));
        }
    } catch (SQLException e) {
        throw new Exception("Erro ao realizar login: " + e.getMessage(), e);
    }

    return user;  // Retorna o UserDTO ou null se não encontrado
}




}
