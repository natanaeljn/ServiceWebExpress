package servlets;

import java.io.IOException;

import dao.DaoPessoaRepository;
import dao.DaoPrestadorRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelPessoa;
import util.ObjectUtil;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoPessoaRepository daoPessoaRepository = new DaoPessoaRepository();
	DaoPrestadorRepository daoPrestadorRepository = new DaoPrestadorRepository();

	public ServletUsuario() {
		super();

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String acao = req.getParameter("acao");
		try {
			if (acao.equalsIgnoreCase("paginaUsuario")) {

				String email = (String) req.getSession().getAttribute("pessoa");
				ModelPessoa pessoaLogada = daoPessoaRepository.consultarUsuarioLogado(email);
				req.setAttribute("pessoalogada", pessoaLogada);
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/paginaUsuario.jsp");
				redirecionar.forward(req, resp);

			} else if (acao.equalsIgnoreCase("deletar")) {
				String id = req.getParameter("id");
				daoPessoaRepository.deletarUser(id);
				String codigoPessoa = req.getParameter("codigo");
				daoPrestadorRepository.deletarUserPrest(codigoPessoa);
				resp.sendRedirect(req.getContextPath() + "/index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("principal/erroUsuario.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg = "Atualizado com sucesso!";
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

			ModelPessoa testeCodigo = daoPessoaRepository.consultarPorId(Long.parseLong(id));

			if (email.equals(testeCodigo.getEmail())) {
				daoPessoaRepository.gravarPessoa(modelPessoa);
				RequestDispatcher redireciona = req.getRequestDispatcher("principal/paginaUsuario.jsp");
				req.setAttribute("pessoalogada", modelPessoa);
				req.setAttribute("msg", msg);
				redireciona.forward(req, resp);
			} else {
				ModelPessoa teste = daoPessoaRepository.consultarUsuarioEmail(email);
				if (email.equalsIgnoreCase(teste.getEmail())) {
					RequestDispatcher redireciona = req.getRequestDispatcher("principal/paginaUsuario.jsp");
					req.setAttribute("pessoalogada", modelPessoa);
					req.setAttribute("msg", "Insira um email diferente  ou logue com este , ele ja esta em Uso");
					redireciona.forward(req, resp);
				} else {
					daoPessoaRepository.gravarPessoa(modelPessoa);
					RequestDispatcher redireciona = req.getRequestDispatcher("principal/paginaUsuario.jsp");
					req.setAttribute("pessoalogada", modelPessoa);
					req.setAttribute("msg", msg);
					redireciona.forward(req, resp);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("principal/erroUsuario.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}
	}

}
