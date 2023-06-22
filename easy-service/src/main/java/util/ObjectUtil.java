package util;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.DaoPessoaRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelPessoa;

public class ObjectUtil {
	DaoPessoaRepository daoPessoaRepository = new DaoPessoaRepository();

	private ObjectUtil() {
	}

	public static boolean objetoValidacao(Object object) {
		return nonNull(object) && !object.toString().isEmpty();
	}

	public static boolean objetosValidacao(Object... objects) {
		for (Object obj : objects) {
			if (isNull(obj) || obj.toString().isEmpty()) {
				return false;
			}
		}
		return true;
	}

	public static boolean isObjectsNotValid(Object... objects) {
		return !objetosValidacao(objects);
	}

	public static String formatar(String dado) {
		String correta = dado.replaceAll("-", "");
		return correta;
	}

	public static String codigoItemVerificacao(String acao) {

		String codigoItem = "";

		switch (acao) {
		case "paginaAlvenaria":
			codigoItem = "000100010001";
			break;

		case "paginaConstrucao":
			codigoItem = "000100010002";
			break;

		case "paginaAzulejista":
			codigoItem = "000100010002";
			break;

		case "paginaPorcelanato":
			codigoItem = "000100010002";
			break;

		case "paginaManicure":
			codigoItem = "000200020001";
			break;
		case "paginaPedicure":
			codigoItem = "000200020002";
			break;
		case "paginaPodologia":
			codigoItem = "000200020003";
			break;
		case "paginaNailDesigner":
			codigoItem = "000200020004";
			break;
		case "paginaQuiropraxia":
			codigoItem = "000200020005";
			break;
		case "paginaCabeleleiro":
			codigoItem = "000200020006";
			break;
		case "paginaMassagem":
			codigoItem = "000200020006";
			break;
		case "paginaMecanica":
			codigoItem = "000300030001";
			break;
		case "paginaEletrica":
			codigoItem = "000300030002";
			break;
		case "paginaBorracharia":
			codigoItem = "000300030003";
			break;
		case "paginaLavacao":
			codigoItem = "000300030004";
			break;
		case "paginaFront":
			codigoItem = "000400040001";
			break;
		case "paginaBack":
			codigoItem = "000400040002";
			break;
		case "paginaFull":
			codigoItem = "000400040003";
			break;
		case "paginaMetalurgica":
			codigoItem = "000500050001";
			break;
		case "paginaCeramica":
			codigoItem = "000500050002";
			break;
		case "paginaArtesanal":
			codigoItem = "000500050003";
			break;
		case "paginaBanho":
			codigoItem = "000600060001";
			break;
		case "paginaWalker":
			codigoItem = "000600060002";
			break;
		case "paginaVeterinaria":
			codigoItem = "000600060003";
			break;

		default:
			break;
		}
		return codigoItem;
	}

}
