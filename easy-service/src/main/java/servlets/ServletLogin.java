package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelPessoa;
import util.ObjectUtil;
import static util.ObjectUtil.objetoValidacao;
import static util.ObjectUtil.objetosValidacao;
import static java.util.Objects.isNull;

import java.io.IOException;
import java.sql.Connection;
import java.util.Map;

import dao.DaoLoginRepository;
import dao.DaoPessoaRepository;

@WebServlet(urlPatterns = { "/principal/ServletLogin", "/ServletLogin" })
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoLoginRepository daoLoginRepository = new DaoLoginRepository();
	private DaoPessoaRepository daoPessoaRepository = new DaoPessoaRepository();

	public ServletLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
		if (acao.equals("registrar")) {
			RequestDispatcher redirecionar = request.getRequestDispatcher("principal/telaRegistro.jsp");
			redirecionar.forward(request, response);
		} else if (acao.equals("logout")) {
			request.getSession().invalidate();
			RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
			redirecionar.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login = request.getParameter("Login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");

		try {
			if (objetosValidacao(login, senha)) {
				var modelPessoa = new ModelPessoa(login, senha);
				if (daoLoginRepository.validarAutenticacao(modelPessoa)) {
					modelPessoa = daoPessoaRepository.consultarUsuarioLogado(login);
					request.getSession().setAttribute("pessoa", modelPessoa.getEmail());
					if (url == null || url.equals("null") || url.equals("")) {
						url = "principal/principal.jsp";
					}

					RequestDispatcher redirecionar = request.getRequestDispatcher(url);
					redirecionar.forward(request, response);
				} else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp");
					request.setAttribute("msg", "Informe o login e senha corretamente");
					redirecionar.forward(request, response);

				}

			} else {
				RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "Informe o login e senha corretamente");
				redirecionar.forward(request, response);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}

}
