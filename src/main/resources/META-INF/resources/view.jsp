<%@ include file="/init.jsp" %>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css?v=${version}">

<portlet:resourceURL id="/getListaPersonas" var="searchPersonURL" />
<portlet:actionURL name="/atencion/sendMessage" var="sendMessageURL" />

<liferay-ui:error key="errorEnvio" message="NO se pudo enviar el mensaje por problemas con el servicio" />
<section class="site-wrapper" id="atencionClientes">
	<div class="container">    
		<div class="row justify-content-md-center">
			<div class="col-12 mt-5"> 
				<div class="view overlay mt-4 banner-atencion"> <!-- img class="card-img-top" src="<%=request.getContextPath()%>/img/atencion.jpg" alt="Sample image"-->
					<div class="carousel-caption">
						<h3 class="h3-responsive text-left"><strong></strong></h3>
					</div>
					<div class="col-12 gradiente_negro"></div>
				</div>
			</div>
	
	        <div class="col-12 masonry-item wow fadeInUp animation-delay-2 text-center mb-4">
	            <h1 style="color: #01579b;" class="font-weight-bold center-block mt-4 mb-4 animated zoomInDown animation-delay-5 footer-title"><liferay-ui:message key="ModuloAtencionClientesPortlet.title" /></h1>
	            <p class="text-center center-block mt-2 animated fadeInUp animation-delay-7"><liferay-ui:message key="ModuloAtencionClientesPortlet.message" /></p>
	        </div>
	        
			<form action="<%=sendMessageURL%>" method="post" id="contactoForm" style="margin: auto; width: 80%;">
				<div class="col-md-12 "> 
					<%--   
					<div class="row btn-group" style="width: 100%;" data-toggle="buttons">
						<label style="margin-left: 0px;" class="btn  active form-check-label col-sm-6 col-lg-3 col-md-6">
							<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="1" id="choice1" checked> <i class="ico-pdf far fa-lightbulb" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.sugerencia" />
						</label>
						<label style="margin-left: 0px;" class="btn form-check-label col-sm-6 col-lg-3 col-md-6">
							<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="2" id="choice2"> <i class="ico-pdf far fa-smile" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.felicitacion" />
						</label>
						<label style="margin-left: 0px;" class="btn form-check-label col-sm-6 col-lg-3 col-md-6">
							<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="3" id="choice3"> <i class="ico-pdf fas fa-question" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.consulta" />
						</label>
						<label style="margin-left: 0px;" class="btn form-check-label col-sm-6 col-lg-3 col-md-6">
							<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="4" id="choice4"> <i class="ico-pdf far fa-frown" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.quejas" />
						</label>    
					</div>
					 --%>
		                                  
					<div class="row btn-group" role="group" data-toggle="buttons">
						<div class="col-md-3 p-none">
							<button type="button" class="btn w-100 active">
								<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="1" id="choice1" checked> <i class="ico-pdf far fa-lightbulb" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.sugerencia" />
							</button>
						</div>
						<div class="col-md-3 p-none">
							<button type="button" class="btn w-100">
								<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="2" id="choice2"> <i class="ico-pdf far fa-smile" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.felicitacion" />
							</button>
						</div>
						<div class="col-md-3 p-none">
							<button type="button" class="btn w-100">
								<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="3" id="choice3"> <i class="ico-pdf fas fa-question" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.consulta" />
							</button>
						</div>
						<div class="col-md-3 p-none">
							<button type="button" class="btn w-100">
								<input class="form-check-input" type="radio" autocomplete="off" name="tipomsg" value="4" id="choice4"> <i class="ico-pdf far fa-frown" aria-hidden="true"></i><br><br><liferay-ui:message key="ModuloAtencionClientesPortlet.quejas" />
							</button>
						</div>
					</div>
		            <%-- <div class="clearfix"></div> --%>
		    
		            <div class="form-row paddingtop">
		                <div class="col-md-6">
		                    <div class="md-form form-group">
		                        <input type="text" name="poliza" class="form-control ">
		                        <label for="poliza" >Póliza o Folio</label>
		                    </div>
		                </div>
		                <!-- <div class="col-sm-6 col-lg-3"> -->
		                <div class="col-md-6">
		                    <div class="md-form form-group">
		                        <select id="producto" name="producto" class="mdb-select ">
									<option value="" selected>
									<liferay-ui:message key="ModuloAtencionClientesPortlet.selectOpDefoult"/>
									</option>
		                            <c:forEach items="${opcProductos}" var="producto">
										<option value="${producto.idCatalogoDetalle}">${producto.valor}</option>
									</c:forEach>
		                        </select>
		                        <label for="producto" >Producto</label>
		                        <div class="invalid-feedback">Campo obligatorio</div>
		                    </div>
		                </div>
		            </div>
		
		            <div class="md-form">
		                <input type="text" id="cliente-name" class="form-control " name="cliente-name">
		                <label for="inputMDEx"> Asegurado </label>
		                <input type="hidden" id="cliente-id" class="form-control" name="cliente-id">
		            </div>
		
		            <div class="md-form">
		                <textarea type="text" id="message" name="message" class="form-control md-textarea validaTxt" rows="3" maxlength="3000"></textarea>
		                <label for="materialFormContactMessageEx">Mensaje</label>
		            </div>
		
		            <div class="mt-4 pull-left">
		                <button class="btn btn-pink waves-effect waves-light" id="paso2_next" type="submit">Enviar</button>
		            </div>
		        </div>
			</form>
		</div>    
	</div>
</section>
<input type="hidden" id="txtJSErrorCampoRequerido" value="<liferay-ui:message key="AtencionClientesPortlet.errorCampoRequerido" />">

<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script>
$(function() {
	/* autocomplite por nombre */
	$( "#cliente-name" ).autocomplete({
	      minLength: 3,
	      source: function(request, response) {
	            $.getJSON(
	            	"<%=searchPersonURL%>",
	                { term:request.term, tipo:1 }, 
	                response
	            );
	        },
	focus : function(event, ui) {
		$("#cliente-name").val(ui.item.nombrepersona);
		$("#cliente-id").val(ui.item.idPersona);
		return false;
	},
	select : function(event, ui) {
		$("#cliente-name").val(ui.item.nombre + " " + ui.item.appMaterno + " " + ui.item.appPaterno);

		return false;
	}
	}).autocomplete("instance")._renderItem = function(ul, item) {

		return $("<li class=\"list-group-item\">").append("<div>" + item.nombre + " " + item.appPaterno + " " + item.appMaterno + "</div>")
				.appendTo(ul);
	};
	
	$("label.form-check-label").click(function(){
		$("label.form-check-label input").attr("checked", false);
		$(this).find("input").attr("checked", true);
	});
});
</script>