$(function() {
	$( "form#contactoForm" ).submit(function( event ) {
		showLoader();
		if ( !errores() )
			return;
		event.preventDefault();
		hideLoader();
	});
});

function errores(){
	eliminaErrores();
	var errorTap = false;
	errorTap = (vaciosTxt($('.validaTxt')) ? true : errorTap);
	
	return errorTap;
}

/* Validaciones */

/**
 * Valida info de grupo de inputs
 * 
 * @param {HTMLInputElement} campos
 */
function vaciosTxt(campos) {
	var errores = false;
	$.each(campos, function(index, value) {
		if ( valIsNullOrEmpty($(value).val()) ) {
			errores = true;
			$(value).addClass('invalid');
			$(value).parent().append(
				"<div class=\"alert alert-danger\" role=\"alert\"> <span class=\"glyphicon glyphicon-ban-circle\"></span>" + " "
				+ $('#txtJSErrorCampoRequerido').val() + "</div>");
		}
	});
	return errores;
}

/**
 * Valida val select
 * 
 * @param {HTMLSelectElement} campos
 */
function noSelect(campos) {
	var errores = false;
	$.each(campos, function(index, value) {
		if ( valIsInvalidSelect($(value).val()) ) {
			errores = true;
			$(value).siblings("input").addClass('invalid');
			$(value).parent().append(
				"<div class=\"alert alert-danger\"> <span class=\"glyphicon glyphicon-ban-circle\"></span> " + " " + $('#txtJSErrorCampoRequerido').val()
				+ "</div>");
		}
	});
	return errores;
}

/**
 * @param {String} value
 */
function valIsNullOrEmpty(value) {
	value = value.trim();
	return (value == null || value == "null" || value === "");
}

/**
 * @param {String} value
 */
function valIsInvalidSelect(value) {
	return (value === '');
}

function eliminaErrores() {
	$(".alert-danger").remove();
	$('.invalid').removeClass('invalid');
}