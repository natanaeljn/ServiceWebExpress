package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;



import connection.SingleConnection;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/principal/*"})
public class FilterAutenticator implements Filter {
       

	private static final long serialVersionUID = 1L;
	private  Connection connection;
   
    public FilterAutenticator() {
        
    }

	
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			String usuarioLogado = (String) session.getAttribute("pessoa");
			String urlParaAutenticar = req.getServletPath();
			if ( !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")&&!urlParaAutenticar.equalsIgnoreCase("/principal/ServletRegistro")&&!urlParaAutenticar.equalsIgnoreCase("principal/telaRegistro.jsp")) {
				/*
				 * vai ser passado a url para a tela de login e depois que ele realizar o login,
				 * vai continuar para levar o login para a url q estava sendo acessada antes
				 */
				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor realize o Login");
				
				redireciona.forward(request, response);
				return; 
			} else {
				chain.doFilter(request, response);
			}
			connection.commit();/* Comitando as operaçoes ja que tudo ocorreu certo */
			}
		catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnection.getConn();
	}

}
