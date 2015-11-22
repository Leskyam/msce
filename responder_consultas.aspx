<%@ Page language="c#" Codebehind="responder_consultas.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfResponderConsultas" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Responder consultas</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="estilos/main.css" type="text/css" rel="stylesheet">
		<link rel="shortcut icon" href="imagenes/favicon.ico" />
		<!-- Cargar el fichero principal de scripts del lado del cliente -->
		<script src="includes/main.js" type="text/javascript"></script>
		<script src="includes/dates.js" type="text/javascript"></script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"><!-- PAGE TABLE; BEGIN -->
		<form id="frm_Consultar" method="post" runat="server">
			<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr>
					<td><!-- CONTROL PARA EL ENCABEZADO, QUE INCLUYE LOS CONTROLES PARA IDENTIFICACIÓN DE USUARIO --><uc1:wucheader id="ctlHeader" runat="server"></uc1:wucheader></td></tr>
				<tr>
					<td><!-- CONTROL PARA LA BARRA DE OPCIONES DEL ENCABEZADO --><uc1:wucheadernavbar id="ctlHeaderNavBar" runat="server"></uc1:wucheadernavbar></td></tr></table>
			<table id="Table2" cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr id="tr_Notify" style="DISPLAY: none" height="0" runat="server">
					<td width="750"><span class="spErrorNotification" id="sp_Notify" style="MARGIN-BOTTOM: 1px" runat="server"></span></td></tr>
				<tr valign="top">
					<td> <!-- BODY TABLE; BEGIN -->
						<table id="Table3" cellspacing="0" cellpadding="0" width="750" border="0">
							<tr valign="top">
								<td valign="top" align="right">
									<!-- Control Web para las opciones de la izquierda --><uc1:wucleftoptions id="ctlLeftOptions" runat="server"></uc1:wucleftoptions></td>
								<td> <!-- MAIN WINDOW; BEGIN -->
									<table id="Table4" cellspacing="0" cellpadding="0" width="545" border="0">
										<tr valign="top">
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">RESPONDER
													CONSULTAS</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Edit" width="100%" align="center" border="0" style="DISPLAY: none">
																<!-- txtMaestrante -->
																<tr valign="middle">
																	<td align="left" width="15%" nowrap>A nombre de: </td>
																	<td align="left"><input id="txtMaestrante" type="text" class="frmTextInput_disabled" readonly style="WIDTH: 100%"></td></tr>
																<!-- txtTema -->
																<tr valign="middle">
																	<td align="left" width="15%" nowrap>Tema: </td>
																	<td align="left"><input id="txtTema" type="text" class="frmTextInput_disabled" readonly style="WIDTH: 100%"></td></tr>
																<!-- Consulta -->
																<tr valign="bottom">
																	<td align="left" width="15%" nowrap colspan="2">Consulta: </td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<textarea class="frmTextInput_disabled" id="txtConsulta" rows="4" style="WIDTH: 100%" readonly></textarea>
																	</td>
																</tr>
																<!-- Respuesta -->
																<tr valign="bottom">
																	<td align="left" width="15%" nowrap>Respuesta: </td>
																	<td align="right"><span id="spLeftCharsRespuesta" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2"><textarea class="frmTextInput" id="txtRespuesta" rows="8" style="WIDTH: 100%" onkeydown="JavaScript:document.getElementById('spLeftCharsRespuesta').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValRespuesta'), 'El campo \'Respuesta\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsRespuesta').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);"></textarea><span class="spErrorNotification" id="spValRespuesta"></span> </td></tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr></table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<tr valign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left"></span></td>
																	<td align="right">
																		<a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																		<a id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">&nbsp;<img id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
																		<div id="dvLista"></div></td></tr></table></td></tr></table></td></tr></table>
									<!-- MAIN WINDOW; END --></td></tr></table>
						<!-- BODY TABLE; END --></td></tr></table></form>
		<!-- PAGE TABLE; END -->
		<script language="javascript">
		<!--

		/* 
			PARA LA DECLARACIÓN DE LAS IMÁGENES DE FONDO DE LAS CELDAS, LO HACEMOS POR SCRIPT
			PORQUE FireFox NO INTREPRETA BIEN LO QUE NECESITAMOS SI UTILIZAMOS ESTILOS.
		*/
		document.getElementById('td_body_bg').style.backgroundImage = "url(imagenes/body_bg.gif)";
		document.getElementById('td_body_bg').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_navBarLeft').style.backgroundImage = "url(imagenes/side_nav_bg.gif)";
		document.getElementById('td_navBarLeft').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_bodyHeader').style.backgroundImage = "url(imagenes/body_header.gif)";
		document.getElementById('td_bodyHeader').style.backgroundRepeat = "no-repeat";

		// LLENA LOS DATOS QUE CORRESPONDEN A LA PÁGINA.
		function getConsultas()
		{
			// Si el cboDocente ó el cboTema no tiene elementos en la lista, entonces ni intentar un roundtrip al servidor.
			//if(document.getElementById('cboSede').options.length==0 || document.getElementById('cboMencion').options.length==0){return;}
			// Obtener los datos de los módulos.
			var res = ISPCFG.Msce.clswfResponderConsultas.getConsultas();
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			else
			{
				if (res.value == null || typeof(res.value) != "object")
				{
					boError = true;
				}
			}
			if(boError==true)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de las consultas por responder que le corresponden.");
				res=null;
				return;
			}
			
			var dvConsultas = res.value;
			res = null;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divLista = document.getElementById('dvLista')
			// Si no existen registros de módulos.
			if(dvConsultas.Rows.length==0)
			{
				dvConsultas = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divLista.innerHTML = "<b>USTED NO TIENE CONSULTAS PENDIENTES POR RESPONDER.</b>";
				// Poner el webForm para ingresar Nuevo registro.
				//Nuevo();
				return;
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
			}
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td width=\"15%\"><b>Acciones</b></td>\n";
					strHTML_Header += "\t\t<td><b>A nombre de</b></td>\n";
					strHTML_Header += "\t\t<td><b>Fecha</b></td>\n";
					strHTML_Header += "\t\t<td><b>Tema</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvConsultas.Rows.length-1); i++)
			{
				var Id = dvConsultas.Rows[i].Id;
				var Maestrante = dvConsultas.Rows[i].NombreMaestrante;
				var Fecha = dvConsultas.Rows[i].datFechaHora;
				var Tema = dvConsultas.Rows[i].Tema;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"trConsulta" + Id + "\" valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" width=\"15%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Responder(" + Id + ");\">Responder</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Maestrante" + Id + "\">" + Maestrante + "</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" nowrap id=\"Fecha" + Id + "\">" + getStringFromDate(Fecha) + "</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Tema" + Id + "\">" + Tema + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			
			strHTML_Foot = "</table>\n";
			
			divLista.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			dvConsultas=null; 
		}

		function Responder(Id)
		{
			stopEditing();
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
			// Establecer el modo de este webFrom.
			strMode = 'Editar';
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Hacer visible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder el tr que ocntiene los datos que se van a editar.
			document.getElementById('trConsulta'+Id).style.display='none';
			document.body.scrollTop = 0;
			IdEditado = Id;
			var res = ISPCFG.Msce.clswfResponderConsultas.getConsulta(IdEditado);
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			else
			{
				if (res.value == null || typeof(res.value) != "object")
				{
					boError = true;
				}
			}
			if(boError==true)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible poner en edición la consulta seleccionada.");
				res=null;
				return;
			}
			
			var Consulta = res.value;
			document.getElementById('txtMaestrante').value = Consulta.Rows[0].NombreMaestrante;
			document.getElementById('txtTema').value = Consulta.Rows[0].Tema;
			document.getElementById('txtConsulta').value = Consulta.Rows[0].Consulta;
			document.getElementById('spLeftCharsRespuesta').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtRespuesta'), 1000);
			document.getElementById('txtRespuesta').focus();
		}
		
		function Actualizar()
		{
 			// Si no son válidos los datos, entonces retornar.
			if(!valDocument()){return;}
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Obtener la clase clsMódulo.
			var Respuesta = ISPCFG.Msce.clswfResponderConsultas.getRespuestaClass().value;
			if(Respuesta==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar la respuesta a la consulta seleccionada. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				return;
			}
			
			// Obtener los valores de los campos.
			Respuesta.IdConsulta = IdEditado;
			Respuesta.Respuesta = document.getElementById('txtRespuesta').value;
			Respuesta.Leida = false;
			var boResult = false;
			
			//Modulo.Id = null; Esto no es necesario, la clase clsModulo lo hace sola.
			document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando respuesta...';
			ISPCFG.Msce.clswfResponderConsultas.Agregar(Respuesta, Actualizar_CallBack);
			Respuesta = null;
			return;
		}

		function Actualizar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar la respuesta a la consulta seleccionada. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido agregar la respuesta a la consulta, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
				}
				else
				{
					stopEditing();
					getConsultas();
					strMode = 'Lista';
					setButtomsVisibility();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Actualización efectuada.';
				}
			}				
			res=null;
		}
		
		function Cancelar()
		{
			stopEditing();
			strMode = 'Lista';
			setButtomsVisibility();
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
		}

		function resetAllValMessages()
		{	
			document.getElementById('spValRespuesta').innerHTML = '';
			document.getElementById('spValRespuesta').style.display = 'none';
		}
		
		/*
			SI SE ESTÁ EN MODO DE EDICIÓN DE ALGÚN MÓDULO ENTONCES 
			SE HACEN VISIBLES LOS DATOS DEL MISMO EN LA LISTA, PERO
			EN CUALQUIER CASO, ESCONDE LA TABLA PARA LAS EDICIONES
			Y EL BOTÓN "Actualizar".
		*/
		function stopEditing()
		{
			// Si ya se estaba editando algún módulo.
			if(strMode=='Editar')
			{
				// Hacer visible el módulo que se estaba editando.
				if(document.getElementById('trConsulta'+IdEditado)!=null)
				{
					document.getElementById('trConsulta'+IdEditado).style.display='';
				}
			}
			// Hacer invisible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';
		}
		
		/*
			VALIDACIONES
		*/
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)

		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			// Validar txtConsulta.
			var validRespuesta = valEmptyString(document.getElementById('txtRespuesta'), document.getElementById('spValRespuesta'), "El campo \"Respuesta\" no puede estar vacío.");
			return validRespuesta;
		}

		function setButtomsVisibility()
		{
			//var btnNuevo = document.getElementById('lnkNuevo');
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			switch(strMode)
			{
				case 'Editar':
				{
					//btnNuevo.style.display='none';
					btnActualizar.style.display='inline';
					btnCancelar.style.display='inline';
					break;					
				}
				// Para cuando no existan Sedes y/o Menciones registradas, este webForm no es válido.
				case 'Disabled':
				{
					//btnNuevo.style.display='none';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
					break;
				}
				// default es igual a 'Lista'
				default:
				{
					//btnNuevo.style.display='inline';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
				}
			}
		}

		function disableForm()
		{
			stopEditing();
			strMode = 'Disabled';
			setButtomsVisibility();
			var strMessage	= MSG_PROCESSING_BEGTAG;
					strMessage += "<b>PARA QUE ESTE FORMULARIO SEA COMPLETAMENTE FUNCIONAL ES ";
					strMessage += "NECESARIO QUE ESTEN REGISTRADOS DE ANTEMANO LOS <a href=\"lista_usuarios.aspx?role=Docente\">Docentes</a> ";
					strMessage += "Y LOS Temas QUE CORRESPONDAN.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('dvLista').innerHTML = strMessage;
		}
		
		/*
			VARIABLES LOCALES DE ESTA PÁGINA		
		*/	
		var strMode = 'Lista'; // Los valores pueden ser: 'Lista', 'Editar', 'Nuevo' ó 'Disabled'.
		var IdEditado; // Para saber cual es el Id del módulo que se está editando.

		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		getConsultas();
		setButtomsVisibility();

		//-->
		</script>

	</body>
</html>
