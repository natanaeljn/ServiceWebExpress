package model;
import java.io.Serializable;

public class ModelPessoa  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String codigo;
	private String nome;
	private String tipo;
	private String cpf;
	private String cnpj;
	private String uf;
	private String cep;
	private String logradouro;
	private String  numero;
	private String bairro;
	private String complemento;
	private String municipio;
	private String dd;
	private String telefoneUm;
	private String telefoneDois;
	private String whatsapp;
	private String url;
	
	
	
	
	
	
	
	
	
	/*login*/
	private String login;
	private String senha;
	private boolean isPrestador;
	
	
	
	
	public ModelPessoa(String login, String senha) {
		super();
		this.login = login;
		this.senha = senha;
	}
	public ModelPessoa() {
		// TODO Auto-generated constructor stub
	}
	public boolean isNovo() {

		if (this.id == null) {
			return true;

		} else if (this.id != null && this.id > 0) {
			return false;
		}
		return id == null;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getCnpj() {
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getMunicipio() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public String getTelefoneUm() {
		return telefoneUm;
	}
	public void setTelefoneUm(String telefoneUm) {
		this.telefoneUm = telefoneUm;
	}
	public String getTelefoneDois() {
		return telefoneDois;
	}
	public void setTelefoneDois(String telefoneDois) {
		this.telefoneDois = telefoneDois;
	}
	public String getWhatsapp() {
		return whatsapp;
	}
	public void setWhatsapp(String whatsapp) {
		this.whatsapp = whatsapp;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean isPrestador() {
		return isPrestador;
	}
	public void setPrestador(boolean isPrestador) {
		this.isPrestador = isPrestador;
	}
	
	
	

}
