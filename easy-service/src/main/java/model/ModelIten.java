package model;

import java.io.Serializable;

public class ModelIten implements Serializable{

	
	private static final long serialVersionUID = 1L;

	
	private Long id ;
	private String grupo ;
	private String  codigo;
	private String descricaoB;
	private String descricaoE;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getGrupo() {
		return grupo;
	}
	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescricaoB() {
		return descricaoB;
	}
	public void setDescricaoB(String descricaoB) {
		this.descricaoB = descricaoB;
	}
	public String getDescricaoE() {
		return descricaoE;
	}
	public void setDescricaoE(String descricaoE) {
		this.descricaoE = descricaoE;
	}
	
	
	
}
