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
import model.ModelPrestador;


@WebServlet("/ServletPrestador")
public class ServletPrestador extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DaoPrestadorRepository daoPrestadorRepository = new DaoPrestadorRepository();
    DaoPessoaRepository daoPessoaRepository = new DaoPessoaRepository();
    public ServletPrestador() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		}
		catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("erro.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg = "Salvo com Sucesso";
			String id = req.getParameter("id");
			String codigoPessoa = req.getParameter("codigoPessoa");
			String codigoItem = req.getParameter("codigoItem");
			String email = (String)req.getSession().getAttribute("pessoa");
			ModelPessoa pessoaLogada =  daoPessoaRepository.consultarUsuarioLogado(email);
			
			ModelPrestador modelPrestador =  new ModelPrestador();
			modelPrestador.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelPrestador.setCodigoPessoa(codigoPessoa);
			modelPrestador.setCodigoItem(codigoItem);
			
			daoPrestadorRepository.gravarPrestador(modelPrestador);
			
			
			RequestDispatcher redireciona = req.getRequestDispatcher("principal/paginaUsuario.jsp");
			req.setAttribute("modelPrestador", modelPrestador);
			req.setAttribute("pessoalogada", pessoaLogada);
			req.setAttribute("msg", msg);
			redireciona.forward(req, resp);
			
		}
		catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("principal/erroUsuario.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}
		
	}

}
