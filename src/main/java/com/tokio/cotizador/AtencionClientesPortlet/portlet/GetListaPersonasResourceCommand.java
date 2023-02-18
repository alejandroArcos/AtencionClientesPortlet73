package com.tokio.cotizador.AtencionClientesPortlet.portlet;

import com.google.gson.Gson;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCResourceCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.tokio.cotizador.CotizadorService;
import com.tokio.cotizador.AtencionClientesPortlet.constants.AtencionClientesPortletKeys;
import com.tokio.cotizador.Bean.PersonaResponse;
import com.tokio.cotizador.Exception.CotizadorException;

import java.io.PrintWriter;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(immediate = true, property = { "javax.portlet.name=" + AtencionClientesPortletKeys.PORTLET_NAME,
				"mvc.command.name=/getListaPersonas" }, service = MVCResourceCommand.class)

public class GetListaPersonasResourceCommand extends BaseMVCResourceCommand {
	private static Log _log = LogFactoryUtil.getLog(GetListaPersonasResourceCommand.class);

	@Reference
	CotizadorService _CotizadorService;

	@Override
	protected void doServeResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse) throws Exception {
User user = (User) resourceRequest.getAttribute(WebKeys.USER);
		
		String usuario = user.getScreenName();
		String nombreCliente = ParamUtil.getString(resourceRequest, "term");
		int tipo = ParamUtil.getInteger(resourceRequest, "tipo");
		
		PersonaResponse respuesta = _CotizadorService.getListaPersonas(nombreCliente, tipo, usuario, "CONTACTO");
		
		if(respuesta.getCode() ==0 ){
			Gson gson = new Gson();
			String jsonString = gson.toJson(respuesta.getListaPersona());
			PrintWriter writer = resourceResponse.getWriter();
			writer.write(jsonString);
			
		}
	}
}
