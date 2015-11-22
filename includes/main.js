/*
	FICHERO CON FUNCIONES DE UTILIDAD PARA EJECUCIÓN DEL LADO DEL CLIENTE
	APLICACIÓN: Maestrías a distancia
	AUTOR: Lesky Alfonos M.
	FECHA: 07 de Junio del 2006
*/

/*
	CONSTANTES PARA FORMATOS EN LA PARTE DEL CLIENTE, SOBRE TODO PARA
	MÉTODOS Ajax.
*/

// Mensaje temporal para informar de algún proceso que se está realizando.
var MSG_PROCESSING_BEGTAG = "<font style=\"padding-top: 1px; padding-bottom: 1px; padding-right: 2px; padding-left: 2px;	font-weight: normal; font-size: 7pt; color: #47639a; font-family: Verdana\">";
// Mensaje para informar de algún error sucedido.
var MSG_ERROR_BEGTAG = "<font color=\"#dc143c\" style=\"padding-top: 1px; padding-bottom: 1px; padding-right: 2px; padding-left: 2px;	font-weight: normal; font-size: 7pt; color: #dc143c; font-family: Verdana; background-color: #ffefd5;\">"; // Texto en color del texto rojo oscuro y del fondo color mierda bien clarita.
var MSG_ENDTAG = "</font>";
// Flag para saber si se muestran mensajes de depuración (debugging).
var debug = {"isEnabled": true, "strDebugMessage": ''};
// Expresión regular para validar direcciones de correo electrónico.
var EMAIL_PATERN = "^[A-Za-z0-9_-]{1,16}[\@]{1}([A-Za-z0-9_-]{1,16}[\.]{1}([A-Za-z]{2,3}){1}){1,}$";
// Expresión regular para validar nombres de ficheros para los Maletines de los maestrantes.
var BRIEFCASE_FILENAME_PATERN = "^[A-Za-z0-9_]{1,}([.zip]|[.rar]){4}$";
// Expresión regular para validar nombres de ficheros para la documentación audiovisual.
var MEDIA_FILENAME_PATERN = "^[A-Za-z0-9_]{1,}([.zip]|[.rar]){4}$";
// Expresión regular para validar direcciones de Internet para los protocolos HTTP, HTTPS ó FTP.
var HTTPADDR_PATERN = "^[http://]{7}([A-Za-z0-9_-]{1,16}[\.]{1}){1,5}[A-Za-z]{2,3}[/]{1}([A-Za-z0-9_-]{1,50}[/]{1}){1,10}$";
var HTTPSADDR_PATERN = "^[https://]{8}([A-Za-z0-9_-]{1,16}[\.]{1}){1,5}[A-Za-z]{2,3}[/]{1}([A-Za-z0-9_-]{1,50}[/]{1}){1,10}$";
var FTPADDR_PATERN = "^[ftp://]{6}([A-Za-z0-9_-]{1,16}[\.]{1}){1,5}[A-Za-z]{2,3}[/]{1}([A-Za-z0-9_-]{1,50}[/]{1}){1,10}$";
// Expresión regular para validar el formato de direcciones IP.

// Expresión regular para validar el formato permitido del Id de usuario (UserId).
var USERID_PATERN = "^[A-Za-z0-9_]{5,}$";
// Es Internet Explorer el navegador
var msie = (navigator.userAgent.indexOf("MSIE")>-1)
/*
	Esta variable se utiliza en el fichero multifile.js, para indicar el número máximo de
	ficheros permitidos para subir al servidor en la página de registro de nueva bibliografía.
*/
var maxUploadFiles = 3;
/*
	Arreglo para los tipos de extensiones permitidas para los uploads de ficheros
*/
var AllowedExtUploadFiles = new Array(".rar",".zip");
	
/*
	Redirecciona al portal donde está hosteada la aplicación
*/
	function RedirectToPortal()
	{
		//alert(document.location); // camino completo de la página en ejecución.
		//alert(document.location.protocol); // devuelve http: ó https: segúncomo sea el caso.
		//alert(document.domain); // devuelve localhost ó el nombre del http server o alias.
		window.open(document.location.protocol + "//" + document.domain,"_self", null, false);
	}
	
	function RedirectToInicio()
	{
		//alert(document.location); // camino completo de la página en ejecución.
		//alert(document.location.protocol); // devuelve http: ó https: segúncomo sea el caso.
		//alert(document.domain); // devuelve localhost ó el nombre del http server o alias.
		var strAppPath = window.document.location.toString();
		strAppPath = strAppPath.substring(0, strAppPath.lastIndexOf("/"));
		window.open(strAppPath + "/index.aspx","_self", null, false);
	}

	/*
		FUNCIONES GENÉRICAS PARA VALIDACIONES
	*/
	/*
		VALIDAR CUANDO LOS CAMPOS ESTÁN VACÍOS Ó SÓLO CON ESPACIOS EN BLANCO.
	*/
	function valEmptyString(sender, objMessageLabel, strMessage)
	{
		var regExp = new RegExp("^[ ]{1,}$"); // Espacios en blanco (desde 1...n).
		if(sender.value=='' || regExp.test(sender.value))
		{
			objMessageLabel.style.display = 'block';
			objMessageLabel.innerHTML = strMessage;
			return false;
		}
		objMessageLabel.innerHTML = '';
		objMessageLabel.style.display = 'none';
		return true;
	}
	
	/*
		VALIDAR POR EXPRESIÓN REGULAR ()
		Devuelve true si la cadena pasada coincide con 
		la expresión regular que se pasa como valor del
		parámetro strPatern.
	*/
	function valByPatern(sender, strPatern)
	{
		var regExp = new RegExp(strPatern);
		return (sender.value.match(regExp));
	}

	function getInputCharLeft(oTextField, intMaxChars)
	{
		if(oTextField != null)
		{
			// Recortar el valor si es mayor que el permitido
			if(oTextField.value.length > intMaxChars) {oTextField.value = oTextField.value.substring(0, intMaxChars)}
				
			return (intMaxChars - oTextField.value.length);
		}

	} // Fin de getInputCharLeft()

	/*
		DEVUELVE EL TEXTO QUE SE PASE COMO PARÁMETRO RECORTADO POR
		LA POSICIÓN DEL PRÓXIMO ESPACIO SI EL MISMO ES MAYOR 
		QUE EL VALOR DE intLong PASADO COMO PARÁMETRO.
	*/
	function getAbr(strFullText, intLong)
	{
		if(strFullText.length>intLong)
		{
			var i = strFullText.indexOf(' ', intLong);
			i = i>-1?i:strFullText.length-1;
			return strFullText.substring(0, i) + "...";
		}
		else
		{
			return strFullText
		}
	}

		/****************************************
			PROCESAMIENTO DE ERRORES EN EL CLIENTE.
		****************************************/
		// Procesar error de página. Fundamentalmente, durante la carga de los datos a través 
		// de procedimientos Ajax.
		function ProcessPageError(objTableRow, objSpan, strErrorMessage, boOmitirCloseButton)
		{
			if(boOmitirCloseButton==undefined){boOmitirCloseButton=false;}
			objSpan.className = 'spErrorNotification';
			objTableRow.style.display = '';
			objSpan.style.display = 'block';	
			if(objSpan.innerHTML=='')
			{
				objSpan.innerHTML += "<ul style='padding-left: 1px; padding-bottom: 1px; margin-bottom: 0px; margin-left: 1px; margin-top: 1px'>ERRORE(S): ";
			}
			objSpan.innerHTML += "<li style='list-style-position: outside; margin-left: 20px;'>" + strErrorMessage + "</li>";
			
			if(boOmitirCloseButton!=true)
			{
				objSpan.innerHTML += "<span style=\"display: block; width: 100%; text-align: right\"><span style=\"cursor: pointer; color: #072660; padding-top: 2px; padding-right: 2px; padding-bottom: 2px; padding-left: 2px; margin-top: 2px; margin-right: 10px; margin-bottom: 2px; margin-left: 10px; text-decoration: underline\" onclick=\"JavaScript:ClearPageAnyNotification(document.getElementById('" + objTableRow.id + "'), document.getElementById('" + objSpan.id + "'));\">Cerrar</span></span>";
			}
			error=null;
		}

		// Procesar error de página. Fundamentalmente, durante la carga de los datos a través 
		// de procedimientos Ajax.
		function ProcessPageWarning(objTableRow, objSpan, strErrorHeader, strErrorMessage, boOmitirCloseButton)
		{
			if(boOmitirCloseButton==undefined){boOmitirCloseButton=false;}
			objSpan.className = 'spWarningNotification';
			objTableRow.style.display = '';
			objSpan.style.display = 'block';	
			if(objSpan.innerHTML=='')
			{
				//alert(strErrorHeader);
				if(strErrorHeader==null || strErrorHeader=='undefined')
				{
					objSpan.innerHTML += "<ul style='padding-left: 1px; padding-bottom: 1px; margin-bottom: 0px; margin-left: 1px; margin-top: 1px'>ADVERTENCIA(S): ";
				}
				else
				{
					objSpan.innerHTML += "<ul style='padding-left: 1px; padding-bottom: 1px; margin-bottom: 0px; margin-left: 1px; margin-top: 1px'>ADVERTENCIA(S): " + strErrorHeader;
				}
			}
			objSpan.innerHTML += "<li style='list-style-position: outside; margin-left: 20px;'>" + strErrorMessage + "</li>";

			if(boOmitirCloseButton!=true)
			{
				objSpan.innerHTML += "<span style=\"display: block; width: 100%; text-align: right\"><span style=\"cursor: pointer; color: #072660; padding-top: 2px; padding-right: 2px; padding-bottom: 2px; padding-left: 2px; margin-top: 2px; margin-right: 10px; margin-bottom: 2px; margin-left: 10px; text-decoration: underline\" onclick=\"JavaScript:ClearPageAnyNotification(document.getElementById('" + objTableRow.id + "'), document.getElementById('" + objSpan.id + "'));\">Cerrar</span></span>";
			}
			error=null;
		}

		// Limpiar el área de notificación de errores.
		function ClearPageAnyNotification(objTableRow, objSpan)
		{
			objSpan.innerHTML = '';
			objTableRow.style.display = 'none';
			objSpan.style.display = 'none';
		}
		
		// Procesar errores y devolver el mensaje y el tipo de exception
		// para los procedimeintos Ajax cuando boDebugging sea = true. 
		function processAjaxDebugError(objError)
		{	
			debug.strDebugMessage = '';
			if(debug.isEnabled & (objError!=null))
			{
				debug.strDebugMessage += '<br>INFORMACIÓN DE DEPURACIÓN:<br>';
				debug.strDebugMessage += '&nbsp;&nbsp;Mensaje de error:&nbsp;' + objError.Message.toString + '<br>';
				debug.strDebugMessage += '&nbsp;&nbsp;Nombre de exception:&nbsp;' + objError.Type.toString;
				debug.strDebugMessage += '<br>FIN DE LA INFORMACIÓN DE DEPURACIÓN';
			}
			return debug.strDebugMessage ;		
		}

		/**********************************************
			FIN DE PROCESAMIENTO DE ERRORES EN EL CLIENTE.
		**********************************************/
		