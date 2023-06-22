package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import model.ModelPrestador;

public class DaoPrestadorRepository implements Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private Connection connection;
	
	DaoPessoaRepository daoPessoaRepository = new DaoPessoaRepository();
	
	 public DaoPrestadorRepository() {
		connection= SingleConnection.getConn();
	}

	
	 public List<ModelPrestador>consultaItemPessoa(String codigoItem) throws Exception{
		 List<ModelPrestador> retorno = new ArrayList<ModelPrestador>();
		 String sql ="select * from PRESTADORES where CODIGO_ITEM =  "+ codigoItem +" ";
		 PreparedStatement statement = connection.prepareStatement(sql);
		 
		 ResultSet resultSet = statement.executeQuery();
		 while(resultSet.next()) {
			 ModelPrestador modelPrestador = new ModelPrestador();
			 modelPrestador.setId(resultSet.getLong("id"));
			 modelPrestador.setCodigoPessoa(resultSet.getString("codigo_pessoa"));
			 modelPrestador.setCodigoItem(resultSet.getString("codigo_item"));
			 retorno.add(modelPrestador);
		 }
		 return retorno;
	 }
	 
	 public ModelPrestador  gravarPrestador(ModelPrestador prestador) throws Exception{
		 if(prestador.isNovo()) {
			 String sql =" insert into PRESTADORES(CODIGO_PESSOA,CODIGO_ITEM) VALUES ( ? , ? ) ";
			 PreparedStatement preparedStatement = connection.prepareStatement(sql);
			 preparedStatement.setString(1, prestador.getCodigoPessoa());
			 preparedStatement.setString(2, prestador.getCodigoItem());
			 preparedStatement.execute();
			 connection.commit();
			 
		 }
		 return prestador;
	 }
	 
	 public void deletarUserPrest(String codigoItem) throws Exception {
			String sql = "DELETE FROM PRESTADORES WHERE codigo_pessoa = ?  ";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setLong(1, Long.parseLong(codigoItem));
			statement.executeUpdate();
			connection.commit();
		}
	

	 
		
	}
	 

