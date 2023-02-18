package com.tokio.cotizador.AtencionClientesPortlet.portlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.tokio.cotizador.CotizadorService;
import com.tokio.cotizador.AtencionClientesPortlet.constants.AtencionClientesPortletKeys;
import com.tokio.cotizador.Bean.ValidaResponse;

@Component(
		immediate = true, 
		property = { 
				"javax.portlet.name=" + AtencionClientesPortletKeys.PORTLET_NAME,
				"mvc.command.name=/atencion/sendMessage" 
				}, 
		service = MVCActionCommand.class
		)

public class SendMessageActionCommand extends BaseMVCActionCommand {
	private static Log _log = LogFactoryUtil.getLog(SendMessageActionCommand.class);

	@Reference
	CotizadorService _CotizadorService;

	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
		User user = (User) actionRequest.getAttribute(WebKeys.USER);
		String p_usuario = user.getScreenName();
		
		String poliza = ParamUtil.getString(actionRequest, "poliza");
		int tipoMsg = ParamUtil.getInteger(actionRequest, "tipomsg");
		int producto = ParamUtil.getInteger(actionRequest, "producto");
		String clienteName = ParamUtil.getString(actionRequest, "cliente-name");
		int clienteId = ParamUtil.getInteger(actionRequest, "cliente-id");
		String message = ParamUtil.getString(actionRequest, "message");
		
		
		ParamUtil.print(actionRequest);
//		System.out.println("tipomsg:    " + tipoMsg );
		
		try{
		ValidaResponse response = _CotizadorService.addMensajeCliente(tipoMsg, poliza, producto, clienteId, message, p_usuario, "atencion clientes");
		
        SessionMessages.add(actionRequest, "request_processed", response.getMsg());
		} catch (Exception e) {
			 SessionErrors.add(actionRequest , "errorEnvio");
			e.printStackTrace();
		}
	}
	
}
