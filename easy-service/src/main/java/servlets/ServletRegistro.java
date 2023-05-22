package servlets;

import java.io.IOException;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static util.ObjectUtil.objetoValidacao;
import static util.ObjectUtil.objetosValidacao;
import static java.util.Objects.isNull;


@WebServlet(urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private Connection connection ;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String acao= req.getParameter("acao");
			if(objetosValidacao(acao)&&acao.equalsIgnoreCase("registrarNovo")){
				req.getRequestDispatcher("principal/telaRegistro.jsp").forward(req, resp);
			}
			
			
			
		}
		catch (Exception e) {
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
