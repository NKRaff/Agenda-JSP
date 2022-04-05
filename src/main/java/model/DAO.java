package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Result;

public class DAO {
	
	/** CONEXÃO **/
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/dbagenda?useTimeZone=true&serverTimeZone=UTC";
	private String user = "root";
	private String password = "Nescal_81485831";
	
	private Connection conectar() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	/** CRUD CREATE **/
	public void addContato(JavaBeans contato) {
		String create = "insert into contatos (nome,email,fone) values (?,?,?)";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(create);
			
			pst.setString(1, contato.getNome());
			pst.setString(2, contato.getEmail());
			pst.setString(3, contato.getFone());
			
			pst.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);	
		}
	}
	
	/** CRUD READ **/
	public ArrayList<JavaBeans> listarContatos(){
		ArrayList<JavaBeans> contatos = new ArrayList<>();
		String read = "select * from contatos order by id";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String nome = rs.getString(2);
				String email = rs.getString(3);
				String fone = rs.getString(4);
				
				contatos.add(new JavaBeans(id,nome,email,fone));
			}
			con.close();
			return contatos;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	/** CRUD UPDATE **/
	public void selecionarContato(JavaBeans contato) {
		String read = "select * from contatos where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			pst.setString(1, contato.getId());
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				contato.setId(rs.getString(1));
				contato.setNome(rs.getString(2));
				contato.setEmail(rs.getString(3));
				contato.setFone(rs.getString(4));
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void editarContato(JavaBeans contato) {
		String create = "update contatos set nome=?,email=?,fone=? where id=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(create);
			pst.setString(1, contato.getNome());
			pst.setString(2, contato.getEmail());
			pst.setString(3, contato.getFone());
			pst.setString(4, contato.getId());
			pst.executeUpdate();
			pst.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	/** CRUD DELETE **/
	public void deletarContato(JavaBeans contato) {
		String delete = "delete from contatos where id=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setString(1, contato.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
