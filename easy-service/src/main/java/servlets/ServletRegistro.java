package servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import dao.DaoPessoaRepository;
import dao.DaoPrestadorRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelPessoa;
import model.ModelPrestador;
import util.ObjectUtil;

@MultipartConfig
@WebServlet(urlPatterns = { "/ServletRegistro" })
public class ServletRegistro extends HttpServlet {

	private static final long serialVersionUID = 1L;

	DaoPessoaRepository daoPessoaRepository = new DaoPessoaRepository();
	DaoPrestadorRepository daoPrestadorRepository = new DaoPrestadorRepository();

	public ServletRegistro() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String acao = req.getParameter("acao");
			if (acao.equalsIgnoreCase("voltar")) {
				resp.sendRedirect(req.getContextPath() + "/index.jsp");

			} else if (acao.equalsIgnoreCase("paginaHome")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/principal.jsp");
				redirecionar.forward(req, resp);
			} else if (acao.equalsIgnoreCase("paginaUsuario")) {

				String email = (String) req.getSession().getAttribute("pessoa");
				ModelPessoa pessoaLogada = daoPessoaRepository.consultarUsuarioLogado(email);
				req.setAttribute("pessoalogada", pessoaLogada);
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/paginaUsuario.jsp");
				redirecionar.forward(req, resp);

			}

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("erro.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg = "Registro feito com sucesso!";
			String id = req.getParameter("id");
			String codigo = req.getParameter("codigo");
			String nome = req.getParameter("nome");
			String tipo = req.getParameter("tipo");
			String cpf = req.getParameter("cpf");
			String cnpj = req.getParameter("cnpj");
			String uf = req.getParameter("uf");
			String cep = req.getParameter("cep");
			String logradouro = req.getParameter("logradouro");
			String numero = req.getParameter("numero");
			String bairro = req.getParameter("bairro");
			String complemento = req.getParameter("complemento");
			String municipio = req.getParameter("municipio");
			String dd = req.getParameter("dd");
			String numeroUm = req.getParameter("telefoneUm");
			String numeroDois = req.getParameter("telefoneDois");
			String whats = req.getParameter("whatsapp");
			String url = req.getParameter("url");
			String email = req.getParameter("email");
			String senha = req.getParameter("senha");

			ModelPessoa modelPessoa = new ModelPessoa();
			modelPessoa.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelPessoa.setCodigo(codigo);
			modelPessoa.setNome(nome);
			modelPessoa.setTipo(tipo);
			modelPessoa.setCpf(cpf);
			modelPessoa.setCnpj(cnpj);
			modelPessoa.setUf(uf);
			ObjectUtil.formatar(cep);
			String cepCorreto = ObjectUtil.formatar(cep);
			modelPessoa.setCep(cepCorreto);
			modelPessoa.setLogradouro(logradouro);
			modelPessoa.setNumero(numero);
			modelPessoa.setBairro(bairro);
			modelPessoa.setComplemento(complemento);
			modelPessoa.setMunicipio(municipio);
			modelPessoa.setDd(dd);
			modelPessoa.setTelefoneUm(numeroUm);
			modelPessoa.setTelefoneDois(numeroDois);
			modelPessoa.setWhatsapp(whats);
			modelPessoa.setUrl(url);
			modelPessoa.setEmail(email);
			modelPessoa.setSenha(senha);

			ModelPessoa teste = daoPessoaRepository.consultarUsuarioEmail(email);
			ModelPessoa testeCodigo = daoPessoaRepository.consultarUsuarioCodigo(codigo);
			if (email.equalsIgnoreCase(teste.getEmail())) {
				RequestDispatcher redireciona = req.getRequestDispatcher("principal/telaRegistro.jsp");
				req.setAttribute("modelPessoa", modelPessoa);
				req.setAttribute("msg", "Insira um email diferente  ou logue com este , ele ja esta em Uso");
				redireciona.forward(req, resp);
			} else if (codigo.equalsIgnoreCase(testeCodigo.getCodigo())) {
				RequestDispatcher redireciona = req.getRequestDispatcher("principal/telaRegistro.jsp");
				req.setAttribute("modelPessoa", modelPessoa);
				req.setAttribute("msg", "Insira um codigo diferente , este codigo ja esta em Uso por outro usuario");
				redireciona.forward(req, resp);
			}

			else {
				daoPessoaRepository.gravarPessoa(modelPessoa);

				RequestDispatcher redireciona = req.getRequestDispatcher("principal/telaRegistro.jsp");
				req.setAttribute("modelPessoa", modelPessoa);
				req.setAttribute("msg", msg);
				redireciona.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("erro.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}

	}

}
