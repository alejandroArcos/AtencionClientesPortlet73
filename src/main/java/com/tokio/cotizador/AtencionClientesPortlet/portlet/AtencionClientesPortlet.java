package com.tokio.cotizador.AtencionClientesPortlet.portlet;

import com.tokio.cotizador.CotizadorService;
import com.tokio.cotizador.AtencionClientesPortlet.constants.AtencionClientesPortletKeys;
import com.tokio.cotizador.Bean.Registro;
import com.tokio.cotizador.Exception.CotizadorException;
import com.tokio.cotizador.constants.CotizadorServiceKey;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;
import java.util.List;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

/**
 * @author martinfernandojimenezramirez
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=AtencionClientesPortlet Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user",
		"com.liferay.portlet.requires-namespaced-parameters=false"
	},
	service = Portlet.class
)
public class AtencionClientesPortlet extends MVCPortlet {
	
	@Reference
	CotizadorService _CotizadorService;
	
	@Override
	public void doView( RenderRequest renderRequest, RenderResponse renderResponse) 
			throws IOException, PortletException {
		
		try{
			User user = (User) renderRequest.getAttribute(WebKeys.USER);
			String usuario = user.getScreenName();
			String pantalla = "CONTACTO";
			int rowNum = 0;
			String transaccion = "B";
			int active = 1;
			List<Registro> productos = _CotizadorService.getCatalogo(rowNum, transaccion, CotizadorServiceKey.LISTA_PRODUCTO, active,usuario,pantalla);
			
			renderRequest.setAttribute("opcProductos", productos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.doView(renderRequest, renderResponse);
	}
}