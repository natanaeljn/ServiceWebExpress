package model;

import java.io.Serializable;

public class ModelPrestador implements Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String codigoPessoa;
	private String codigoItem;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getCodigoItem() {
		return codigoItem;
	}
	public void setCodigoItem(String codigoItem) {
		this.codigoItem = codigoItem;
	}
	public String getCodigoPessoa() {
		return codigoPessoa;
	}
	public void setCodigoPessoa(String codigoPessoa) {
		this.codigoPessoa = codigoPessoa;
	}
	public boolean isNovo() {

		if (this.id == null) {
			return true;

		} else if (this.id != null && this.id > 0) {
			return false;
		}
		return id == null;
	}
	

}
