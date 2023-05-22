package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




import connection.SingleConnection;
import model.ModelPessoa;

public class DaoPessoaRepository implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Connection connection;
	
	 public DaoPessoaRepository() {
		connection= SingleConnection.getConn();
	}
	 
	public ModelPessoa gravarPessoa(ModelPessoa obj ) throws Exception {
		if(obj.isNovo()) {
			String sql = " INSERT INTO  PESSOAS(codigo , nome, tipo , cpf , cnpj , uf , cep , logradouro , numero , bairro , complemento , municipio , ddd , tel1 , tel2 , telwhattsapp , url ) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? ) ";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, obj.getCodigo());
			preparedStatement.setString(2, obj.getNome());
			preparedStatement.setString(3, obj.getTipo());
			preparedStatement.setString(4, obj.getCpf());
			preparedStatement.setString(5, obj.getCnpj());
			preparedStatement.setString(6, obj.getUf());
			preparedStatement.setString(7, obj.getCep());
			preparedStatement.setString(8, obj.getLogradouro());
			preparedStatement.setString(9, obj.getNumero());
			preparedStatement.setString(10, obj.getBairro());
			preparedStatement.setString(11, obj.getComplemento());
			preparedStatement.setString(12, obj.getMunicipio());
			preparedStatement.setString(13, obj.getDd());
			preparedStatement.setString(14, obj.getTelefoneUm());
			preparedStatement.setString(15, obj.getTelefoneDois());
			preparedStatement.setString(16, obj.getWhatsapp());
			preparedStatement.setString(16, obj.getUrl());
			
			preparedStatement.execute();
			connection.commit();
		}
		else {
			String sql = " UPDATE   PESSOAS SET  codigo=? , nome=? , tipo=? , cpf=? , cnpj=? , uf=? , cep=? , logradouro=? , numero=? , bairro=? , complemento=? , municipio=? , ddd=? , tel1=? , tel2=? , telwhattsapp=? , url=?  WHERE id = "
					+ obj.getId();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, obj.getCodigo());
			preparedStatement.setString(2, obj.getNome());
			preparedStatement.setString(3, obj.getTipo());
			preparedStatement.setString(4, obj.getCpf());
			preparedStatement.setString(5, obj.getCnpj());
			preparedStatement.setString(6, obj.getUf());
			preparedStatement.setString(7, obj.getCep());
			preparedStatement.setString(8, obj.getLogradouro());
			preparedStatement.setString(9, obj.getNumero());
			preparedStatement.setString(10, obj.getBairro());
			preparedStatement.setString(11, obj.getComplemento());
			preparedStatement.setString(12, obj.getMunicipio());
			preparedStatement.setString(13, obj.getDd());
			preparedStatement.setString(14, obj.getTelefoneUm());
			preparedStatement.setString(15, obj.getTelefoneDois());
			preparedStatement.setString(16, obj.getWhatsapp());
			preparedStatement.setString(16, obj.getUrl());
			
			preparedStatement.execute();
			connection.commit();
		}
		return this.consultarUsuarioLogado(obj.getId()) ;
	}
	 
	public ModelPessoa consultarUsuarioLogado ( Long id) throws Exception{
		ModelPessoa modelPessoa = new ModelPessoa();
		String sql = "select * from PESSOAS where upper(id) = upper( '" + id + "' )  ";
		consulta(modelPessoa, sql);
		return modelPessoa;
	}
	
	public ModelPessoa consultarPorId(Long id) throws Exception{
		ModelPessoa modelPessoa =  new ModelPessoa();
		String sql = " select * from PESSOAS where id = ? " ;
		consulta(modelPessoa,  sql);
		return modelPessoa;
	}
	public ModelPessoa consultarPorNome(String nome)throws Exception{
		ModelPessoa modelPessoa = new ModelPessoa();
		String sql = " select * from PESSOAS WHERE UPPER(nome) = upper( '" + nome + "' ) ";
		consulta(modelPessoa, sql);
		return modelPessoa;
		
	}
	
	
	 
	public ModelPessoa consulta(ModelPessoa modelPessoa , String sql) throws SQLException {
		 modelPessoa = new ModelPessoa();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			modelPessoa.setId(resultSet.getLong("id"));
			modelPessoa.setCodigo(resultSet.getString("codigo"));
			modelPessoa.setNome(resultSet.getString("nome"));
			modelPessoa.setTipo(resultSet.getString("tipo"));
			modelPessoa.setCpf(resultSet.getString("cpf"));
			modelPessoa.setCnpj(resultSet.getString("cnpj"));
			modelPessoa.setUf(resultSet.getString("uf"));
			modelPessoa.setCep(resultSet.getString("cep"));
			modelPessoa.setLogradouro(resultSet.getString("logradouro"));
			modelPessoa.setNumero(resultSet.getString("numero"));
			modelPessoa.setBairro(resultSet.getString("bairro"));
			modelPessoa.setComplemento(resultSet.getString("complemento"));
			modelPessoa.setMunicipio(resultSet.getString("municipio"));
			modelPessoa.setDd(resultSet.getString("ddd"));
			modelPessoa.setTelefoneUm(resultSet.getString("tel1"));
			modelPessoa.setTelefoneDois(resultSet.getString("tel2"));
			modelPessoa.setWhatsapp(resultSet.getString("telwhattsapp"));
			modelPessoa.setUrl(resultSet.getString("url"));
			
			
			
		}
		
		return modelPessoa;
		
	}
	
	 

}

