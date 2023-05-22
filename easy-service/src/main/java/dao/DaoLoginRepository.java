package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnection;
import model.ModelPessoa;

public class DaoLoginRepository  implements Serializable{

	private static final long serialVersionUID = 1L;
	private Connection connection;
	
	public DaoLoginRepository() {
		connection = SingleConnection.getConn();
	}
	
	/*metodo para validar nosso login*/
	public boolean validarAutenticacao(ModelPessoa modelPessoa) throws Exception{
		String sql =  "select * from PESSOAS where upper(login) =  upper(?) and upper(senha) = upper(?)" ;
		PreparedStatement preparedStatement =  connection.prepareStatement(sql);
		preparedStatement.setString(1, modelPessoa.getLogin());
		preparedStatement.setString(2, modelPessoa.getSenha());
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) {
			return true;
		}
		return false;
	}
	
	

}
