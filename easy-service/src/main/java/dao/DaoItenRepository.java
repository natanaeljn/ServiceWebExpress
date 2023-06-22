package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import model.ModelIten;
import model.ModelPessoa;

public class DaoItenRepository implements Serializable{

	
	private static final long serialVersionUID = 1L;
    private Connection connection; 
    
    public DaoItenRepository() {
    	connection=  SingleConnection.getConn();
    }
	
    public List<ModelIten> buscarPorCodigoItem(String codigoItem) throws Exception{
    	List<ModelIten> modelItens =  new ArrayList<ModelIten>() ;
    	String sql ="select * from ITENS where codigo =  "+ codigoItem +" ";
    	PreparedStatement statement =  connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();
		while (  resultado.next()) {
			ModelIten modelItem =  new ModelIten();
			modelItem.setId(resultado.getLong("id"));
			modelItem.setGrupo(resultado.getString("grupo"));
			modelItem.setDescricaoB(resultado.getString("descricaob"));
			modelItem.setDescricaoE(resultado.getString("descricaoe"));
			modelItem.setCodigo(codigoItem);
			modelItens.add(modelItem);
		}
		return modelItens;
    }
    
    
	
			
}
