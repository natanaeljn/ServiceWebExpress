package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import connection.SingleConnection;
import model.ModelPessoa;
import model.ModelPrestador;

public class DaoPessoaRepository implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Connection connection;
	
	
	
	 public DaoPessoaRepository() {
		connection= SingleConnection.getConn();
	}
	 
	public ModelPessoa gravarPessoa(ModelPessoa obj ) throws Exception {
		if(obj.isNovo()) {
			String sql = " INSERT INTO  PESSOAS(CODIGO , NOME , TIPO , CPF , CNPJ , UF , CEP , LOGRADOURO , NUMERO , BAIRRO , COMPLEMENTO , MUNICIPIO , DDD , TEL1 , TEL2 , TELWHATTSAPP , URL , SENHA , EMAIL ) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? ) ";
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
			preparedStatement.setString(17, obj.getUrl());
			preparedStatement.setString(18, obj.getSenha());
			preparedStatement.setString(19, obj.getEmail());
			
			preparedStatement.execute();
			connection.commit();
		}
		else {
			String sql = " UPDATE   PESSOAS SET  CODIGO=? , NOME=? , TIPO=? , CPF=? , CNPJ=? , UF=? , CEP=? , LOGRADOURO=? , NUMERO=? , BAIRRO=? , COMPLEMENTO=? , MUNICIPIO=? , DDD=? , TEL1=? , TEL2=? , TELWHATTSAPP=? , URL=? , SENHA=? , EMAIL=?  WHERE id = "
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
			preparedStatement.setString(17, obj.getUrl());
			preparedStatement.setString(18, obj.getSenha());
			preparedStatement.setString(19, obj.getEmail());
			
			preparedStatement.execute();
			connection.commit();
		}
		
		
		return obj;
		
	}
	 
	public ModelPessoa consultarUsuarioLogado ( Long id) throws Exception{
		ModelPessoa modelPessoa = new ModelPessoa();
		String sql = "select * from PESSOAS where upper(ID) = upper( '" + id + "' )  ";
		consulta(modelPessoa, sql);
		return modelPessoa;
	}
	public ModelPessoa consultarUsuarioCodigo ( String codigo) throws Exception{
		ModelPessoa modelPessoa = new ModelPessoa();
		String sql ="select * from PESSOAS where codigo =  "+ codigo +" ";
		consulta(modelPessoa, sql );
		return modelPessoa;
	}
	public ModelPessoa consultarUsuarioEmail ( String email) throws Exception{
		ModelPessoa modelPessoa = new ModelPessoa();
		String sql = "select * from PESSOAS where upper(EMAIL) = upper( '" + email + "' )  ";
		consulta(modelPessoa, sql );
		return modelPessoa;
	}
	
	public ModelPessoa consultarPorId(Long id) throws Exception{
		ModelPessoa modelPessoa =  new ModelPessoa();
		String sql  = "SELECT * FROM PESSOAS WHERE ID = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, id);
		
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
			modelPessoa.setEmail(resultSet.getString("email"));
			
			
			
		}
		
		return modelPessoa;
		
	}
	
	
	
	 
	public ModelPessoa consulta(ModelPessoa modelPessoa , String sql) throws SQLException {
		
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
			modelPessoa.setEmail(resultSet.getString("email"));
			
			
		}
		
		return modelPessoa;
		
	}
	public ModelPessoa consultaParam(ModelPessoa modelPessoa , String sql , String param) throws SQLException {
		 modelPessoa = new ModelPessoa();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, param);
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
	
	
	
	public ModelPessoa consultarUsuarioLogado(String login) throws Exception {
		ModelPessoa modelPessoa = new ModelPessoa();
		String sql = "SELECT * FROM PESSOAS WHERE UPPER(EMAIL) = UPPER( '" + login + "' )  ";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();
		while (resultado.next())/* se tiver um resultado */ {
			modelPessoa.setId(resultado.getLong("id"));
			modelPessoa.setCodigo(resultado.getString("codigo"));
			modelPessoa.setNome(resultado.getString("nome"));
			modelPessoa.setTipo(resultado.getString("tipo"));
			modelPessoa.setCpf(resultado.getString("cpf"));
			modelPessoa.setCnpj(resultado.getString("cnpj"));
			modelPessoa.setUf(resultado.getString("uf"));
			modelPessoa.setCep(resultado.getString("cep"));
			modelPessoa.setLogradouro(resultado.getString("logradouro"));
			modelPessoa.setNumero(resultado.getString("numero"));
			modelPessoa.setBairro(resultado.getString("bairro"));
			modelPessoa.setComplemento(resultado.getString("complemento"));
			modelPessoa.setMunicipio(resultado.getString("municipio"));
			modelPessoa.setDd(resultado.getString("ddd"));
			modelPessoa.setTelefoneUm(resultado.getString("tel1"));
			modelPessoa.setTelefoneDois(resultado.getString("tel2"));
			modelPessoa.setWhatsapp(resultado.getString("telwhattsapp"));
			modelPessoa.setUrl(resultado.getString("url"));
			modelPessoa.setEmail(resultado.getString("email"));
			modelPessoa.setSenha(resultado.getString("senha"));
		}

		return modelPessoa;
	}
	public List<ModelPessoa>listarPorItem( String codigoItem) throws Exception{
		List<ModelPessoa>lista =  new ArrayList<ModelPessoa>();
		String sql =  " SELECT * FROM PESSOAS  ";
		PreparedStatement statement =  connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();
		while (  resultado.next()) {
			ModelPessoa modelPessoa =  new ModelPessoa();
			modelPessoa.setId(resultado.getLong("id"));
			modelPessoa.setCodigo(resultado.getString("codigo"));
			modelPessoa.setNome(resultado.getString("nome"));
			modelPessoa.setTipo(resultado.getString("tipo"));
			modelPessoa.setCpf(resultado.getString("cpf"));
			modelPessoa.setCnpj(resultado.getString("cnpj"));
			modelPessoa.setUf(resultado.getString("uf"));
			modelPessoa.setCep(resultado.getString("cep"));
			modelPessoa.setLogradouro(resultado.getString("logradouro"));
			modelPessoa.setNumero(resultado.getString("numero"));
			modelPessoa.setBairro(resultado.getString("bairro"));
			modelPessoa.setComplemento(resultado.getString("complemento"));
			modelPessoa.setMunicipio(resultado.getString("municipio"));
			modelPessoa.setDd(resultado.getString("ddd"));
			modelPessoa.setTelefoneUm(resultado.getString("tel1"));
			modelPessoa.setTelefoneDois(resultado.getString("tel2"));
			modelPessoa.setWhatsapp(resultado.getString("telwhattsapp"));
			modelPessoa.setUrl(resultado.getString("url"));
			
			lista.add(modelPessoa);
		}
		DaoPrestadorRepository daoPrestadorRepository =  new DaoPrestadorRepository();
		List<ModelPrestador>listaItens =  daoPrestadorRepository.consultaItemPessoa(codigoItem);
		
		List<ModelPessoa>correta = new ArrayList<ModelPessoa>();
		for(ModelPessoa test : lista) {
			for(ModelPrestador testUm : listaItens) {
				if(testUm.getCodigoPessoa().equals(test.getCodigo())) {
					correta.add(test);
				}
			}
		}
		
		return correta;
	}
	
	public void deletarUser(String UserId) throws Exception {
		String sql = "DELETE FROM PESSOAS WHERE id = ?  ";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, Long.parseLong(UserId));
		statement.executeUpdate();
		connection.commit();
	}

}

