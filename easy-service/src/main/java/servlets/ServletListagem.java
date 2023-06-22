package servlets;

import java.io.IOException;
import java.util.List;

import dao.DaoItenRepository;
import dao.DaoPessoaRepository;
import dao.DaoPrestadorRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelIten;
import model.ModelPessoa;
import util.ObjectUtil;

@jakarta.servlet.annotation.WebServlet("/ServletListagem")
public class ServletListagem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DaoPessoaRepository daoPessoaRepository = new DaoPessoaRepository();
	DaoPrestadorRepository daoPrestadorRepository = new DaoPrestadorRepository();
	DaoItenRepository daoItenRepository = new DaoItenRepository();

	public ServletListagem() {
		super();

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String acao = req.getParameter("acao");
			String codigoItem = ObjectUtil.codigoItemVerificacao(acao);

			if (acao.equalsIgnoreCase("paginaHome")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/principal.jsp");
				req.getParameter(codigoItem);
				String email = (String) req.getSession().getAttribute("pessoa");
				req.getSession().setAttribute("pessoa", email);
				redirecionar.forward(req, resp);
			}

			else if (acao.equalsIgnoreCase("buscarEditar")) {
				String id = req.getParameter("id");
				String codigo = req.getParameter("itemCerto");
				Long idCerto = Long.parseLong(id);
				ModelPessoa modelPessoa = daoPessoaRepository.consultarPorId(idCerto);
				List<ModelIten> items = daoItenRepository.buscarPorCodigoItem(codigo);
				req.setAttribute("prestador", modelPessoa);
				req.setAttribute("ModelIten", items);
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaPrestador.jsp");
				redirecionar.forward(req, resp);
			} else if (acao.equalsIgnoreCase("catConstrucao")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaConstrucao.jsp");
				redirecionar.forward(req, resp);
			} else if (acao.equalsIgnoreCase("catSaude")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaSaude.jsp");
				redirecionar.forward(req, resp);
			} else if (acao.equalsIgnoreCase("catPets")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaPets.jsp");
				redirecionar.forward(req, resp);
			} else if (acao.equalsIgnoreCase("catVeiculos")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaVeiculos.jsp");
				redirecionar.forward(req, resp);
			} else if (acao.equalsIgnoreCase("catProgramacao")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaProgramacao.jsp");
				redirecionar.forward(req, resp);
			} else if (acao.equalsIgnoreCase("catInd")) {
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaIndustria.jsp");
				redirecionar.forward(req, resp);
			} else {

				List<ModelPessoa> list = daoPessoaRepository.listarPorItem(codigoItem);
				req.setAttribute("item", codigoItem);
				req.setAttribute("modelPessoa", list);
				RequestDispatcher redirecionar = req.getRequestDispatcher("principal/telaDeListagem.jsp");
				redirecionar.forward(req, resp);

			}

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("principal/erroUsuario.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
