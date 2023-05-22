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

@WebServlet(urlPatterns = {"/principal/ServletLogin", "/ServletLogin"})
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static Connection connection;
    
    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String urlUm = request.getParameter("telaRegistro");
		if(urlUm.equals("Registrar") ) {
			response.sendRedirect("principal/telaRegistro.jsp");
			}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");
		try {
			if( url.equals("null")) {
				url ="principal/telaRegistro.jsp";
				RequestDispatcher redirecionar = request.getRequestDispatcher(url);
				redirecionar.forward(request, response);
			}
		}
		catch (Exception e) {
			
		}
		
		/*
		try {
			if(objetosValidacao(login,senha)) {
				var modelLogin = new ModelPessoa(login,senha);
				if(daoLoginRepository.validarAutenticacao(modelLogin)) {
					modelLogin = daoPessoaRepository.buscarUsuarioLogado();
					request.getSession("pessoa", modelLogin.getLogin());
					request.getSession("isPrestador", modelLogin.isPrestador());
					if (url == null || url.equals("null")) {
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
			}}
			
		catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		*/
		
		
		
		
	}

}
