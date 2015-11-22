<%@ Page language="c#" Codebehind="consultar.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfConsultar" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Consultar</title>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">CONSULTAR</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LAS CONSULTAS SIN RESPUESTA AÚN -->
															<table id="tbl_Edit" width="100%" align="center" border="0" style="DISPLAY: none">
																<tr valign="middle">
																	<td align="left" colspan="2">
																		<b>Editando consulta sin respuesta.</b>
																	</td>
																</tr>
																<!-- cboDocente -->
																<tr valign="middle">
																	<td align="left" width="15%" nowrap>Dirigida a: </td>
																	<td align="left"><select class="frmTextInput" id="cboDocente"></select></td></tr>
																<!-- cboMencion -->
																<tr valign="middle">
																	<td align="left" width="15%" nowrap>Tema: </td>
																	<td align="left"><select class="frmTextInput" id="cboTema"></select></td></tr>
																<!-- Nombre -->
																<tr valign="bottom">
																	<td align="left" width="15%" nowrap>Consulta: </td>
																	<td align="right"><span id="spLeftCharsConsulta" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2"><textarea class="frmTextInput" id="txtConsulta" rows="4" style="WIDTH: 100%" onkeydown="JavaScript:document.getElementById('spLeftCharsConsulta').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValConsulta'), 'El campo \'Consulta\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsConsulta').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);"></textarea><span class="spErrorNotification" id="spValConsulta"></span> </td></tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr></table>
															<!-- TABLA PARA LEER LAS CONSULTAS RESPONDIDAS QUE NO HAN SIDO LEÍDAS-->
															<table id="tbl_Leer" width="100%" align="center" border="0" style="DISPLAY: none">
																<!-- txtTema y txtFechaConsulta-->
																<tr valign="middle">
																	<td align="left">
																		<b>Examinando consulta con respuesta no leída hasta ahora.</b>
																	</td>
																</tr>
																<tr valign="middle">
																	<td align="left">
																		Tema:&nbsp;<input type="text" id="txtTema" class="frmTextInput_disabled" readonly maxlength="80" size="60">
																		Fecha:&nbsp;<input type="text" id="txtFechaConsulta" class="frmTextInput_disabled" readonly maxlength="11" size="15">
																	</td>
																</tr>
																<!-- txtConsulta -->
																<tr valign="top">
																	<td align="left">
																		Consulta:<br><textarea id="txtConsultaNoLeida" class="frmTextInput_disabled" readonly style="width: 100%" rows="4"></textarea>
																	</td>
																</tr>
																<!-- txtDocente y txtFechaRespuesta -->
																<tr valign="middle">
																	<td align="left" nowrap>
																		Responde:&nbsp;<input type="text" id="txtDocente" class="frmTextInput_disabled" readonly maxlength="85" size="55">
																		Fecha:&nbsp;<input type="text" id="txtFechaRespuesta" class="frmTextInput_disabled" readonly maxlength="11" size="15">
																	</td>
																</tr>
																<!-- txtRespuesta -->
																<tr valign="top">
																	<td align="left">
																		Respuesta:<br><textarea id="txtRespuesta" class="frmTextInput_disabled" readonly style="width: 100%" rows="6"></textarea>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr></table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<tr valign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left"></span></td>
																	<td align="right">
																		<a id="lnkNuevo" title="Agregar un nuevo módulo." href="JavaScript:Nuevo();"><img id="imgNuevo" title="Agregar un nuevo módulo." alt="Nuevo" src="imagenes/btn_nuevo.gif" border="0"></a>
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
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA LISTA DE LAS CONSULTAS SIN RESPUESTA. -->
																		<div id="dvLista"></div>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA LISTA DE LAS CONSULTAS CON RESPUESTA, PERO NO LEÍDAS. -->
																		<div id="dvListaNoLeidas"></div>
																	</td>
																</tr>
															</table></td></tr></table></td></tr></table>
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
			var res = ISPCFG.Msce.clswfConsultar.getConsultas();
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
			
			// CONSULTAS NO RESPONDIDAS AÚN
			var dvSinRespuesta = res.value[0];
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divLista = document.getElementById('dvLista')
			// Si no existen registros de módulos.
			if(dvSinRespuesta.Rows.length==0)
			{
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divLista.innerHTML = "<b>NO EXISTEN CONSULTAS SUYAS PENDIENTES POR RESPONDER.</b>";
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
				var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
						strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
						strHTML_Header += "\t<tr valign=\"middle\">\n";
						strHTML_Header += "\t\t<td colspan=\"4\"><b>Mis consultas que no han sido respondidas (" + dvSinRespuesta.Rows.length + ")</b></td>\n";
						strHTML_Header += "\t</tr>\n";
						strHTML_Header += "\t<tr valign=\"middle\">\n";
						strHTML_Header += "\t\t<td width=\"15%\"><b>Acciones</b></td>\n";
						strHTML_Header += "\t\t<td><b>Dirigida a</b></td>\n";
						strHTML_Header += "\t\t<td><b>Fecha</b></td>\n";
						strHTML_Header += "\t\t<td><b>Tema</b></td>\n";
						strHTML_Header += "\t</tr>\n";
				
				var strHTML_Body = '';
				for(var i=0; i<=(dvSinRespuesta.Rows.length-1); i++)
				{
					var Id = dvSinRespuesta.Rows[i].Id;
					var Docente = dvSinRespuesta.Rows[i].NombreDocente;
					var Fecha = dvSinRespuesta.Rows[i].datFechaHora;
					var Tema = dvSinRespuesta.Rows[i].Tema;
					// Formar el cuerpo del registro actual.
					//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
					strHTML_Body += "\t\t<tr id=\"trConsulta" + Id + "\" valign=\"top\">\n";
					strHTML_Body += "\t\t\t<td valign=\"top\" width=\"15%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
					strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Docente" + Id + "\">" + Docente + "</td>\n";
					strHTML_Body += "\t\t\t<td valign=\"top\" nowrap id=\"Fecha" + Id + "\">" + getStringFromDate(Fecha) + "</td>\n";
					strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Tema" + Id + "\">" + Tema + "</td>\n";
					strHTML_Body += "\t\t</tr>\n";
				}
				
				strHTML_Foot = "</table>\n";
				
				divLista.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
				document.getElementById('spEstadoActualizacion').innerHTML = '';
			}
			
			// CONSULTAS CON RESPUESTA, PERO NO LAÍDAS AÚN.
			var dvNoLeidas = res.value[1];
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divLista = document.getElementById('dvListaNoLeidas')
			// Si no existen registros de módulos.
			if(dvNoLeidas.Rows.length==0)
			{
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divLista.innerHTML = "<b>USTED NO TIENE CONSULTAS PENDIENTES POR LEER.</b>";
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
				var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
						strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
						strHTML_Header += "\t<tr valign=\"middle\">\n";
						strHTML_Header += "\t\t<td colspan=\"4\"><b>Mis consultas respondidas que no han sido leídas (" + dvNoLeidas.Rows.length + ")</b></td>\n";
						strHTML_Header += "\t</tr>\n";
						strHTML_Header += "\t<tr valign=\"middle\">\n";
						strHTML_Header += "\t\t<td width=\"15%\"><b>Acciones</b></td>\n";
						strHTML_Header += "\t\t<td><b>Respondida por</b></td>\n";
						strHTML_Header += "\t\t<td><b>Fecha</b></td>\n";
						strHTML_Header += "\t\t<td><b>Tema</b></td>\n";
						strHTML_Header += "\t</tr>\n";
				
				var strHTML_Body = '';
				for(var i=0; i<=(dvNoLeidas.Rows.length-1); i++)
				{
					var Id = dvNoLeidas.Rows[i].Id;
					var Docente = dvNoLeidas.Rows[i].NombreDocente;
					var Fecha = dvNoLeidas.Rows[i].datFechaHora;
					var Tema = dvNoLeidas.Rows[i].Tema;
					var Consulta = dvNoLeidas.Rows[i].Consulta;
					var Respuesta = dvNoLeidas.Rows[i].Respuesta;
					// Formar el cuerpo del registro actual.
					//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
					strHTML_Body += "\t\t<tr id=\"trNoLeida" + Id + "\" valign=\"top\">\n";
					strHTML_Body += "\t\t\t<td valign=\"top\" width=\"10%\"><a id=\"lnkLeer" + Id + "\" style=\"text-Decoration: underline\" href=\"JavaScript:Leer(" + Id + ");\">Leer</a>&nbsp;</td>\n";
					strHTML_Body += "\t\t\t<td valign=\"top\">" + Docente + "</td>\n";
					strHTML_Body += "\t\t\t<td valign=\"top\" nowrap>" + getStringFromDate(Fecha) + "</td>\n";
					strHTML_Body += "\t\t\t<td valign=\"top\">" + Tema + "</td>\n";
					strHTML_Body += "\t\t</tr>\n";
				}
				
				strHTML_Foot = "</table>\n";
				
				divLista.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
				document.getElementById('spEstadoActualizacion').innerHTML = '';
			}

			/*
				Poner el webForm para ingresar Nuevo registro si no existen 
				consultas sin responder, ni consultas respondidas sin leer.
			*/
			if(dvSinRespuesta.Rows.length==0 & dvNoLeidas.Rows.length==0){Nuevo();}
			res = null;
			dvSinRespuesta = null; 
			dvNoLeidas = null;
		}

		function Editar(Id)
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
			document.getElementById('tbl_Leer').style.display='none';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder el tr que ocntiene los datos que se van a editar.
			document.getElementById('trConsulta'+Id).style.display='none';
			document.body.scrollTop = 0;
			IdEditado = Id;
			var res = ISPCFG.Msce.clswfConsultar.getConsulta(IdEditado);
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
			// Llenar el cboDocente, donde también se maneja la posición del valor seleccionado de esta lista.
			fillListaDocentes(Consulta.IdUsuarioDocente);
			// Llenar el cboTema, donde también se maneja la posición del valor seleccionado de esta lista.
			fillListaTemas(Consulta.IdTema);
			document.getElementById('txtConsulta').value = Consulta.Consulta;
			document.getElementById('spLeftCharsConsulta').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtConsulta'), 500);
			document.getElementById('txtConsulta').focus();
		}
		
		function Leer(Id)
		{
			stopEditing();
			// Esconder todos los mensajes de error en datos de los controles.
			//resetAllValMessages();
			// Establecer el modo de este webFrom.
			strMode = 'Leer';
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Hacer visible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';
			document.getElementById('tbl_Leer').style.display='';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder el tr que ocntiene los datos que se van a editar.
			document.getElementById('lnkLeer'+Id).innerHTML = "Leer&nbsp;<sup style=\"background-color: #ffffcc\">Leída</sup>";
			document.getElementById('lnkLeer'+Id).title = "La próxima vez que se actualice esta página, esta consulta no aparecerá.";
			document.getElementById('lnkLeer'+Id).href = "JavaScript:msgConsultaLeida();";
			document.getElementById('trNoLeida'+Id).style.display='none';
			document.body.scrollTop = 0;
			IdLeido = Id;
			var res = ISPCFG.Msce.clswfConsultar.getRespondidaSinLeer(IdLeido);
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
				ProcessPageError(trNotify, spNotify, "Imposible leer la consulta seleccionada.");
				res=null;
				return;
			}
			
			var dvConsulta = res.value;
			// Consulta
			document.getElementById('txtTema').value = dvConsulta.Rows[0].Tema;
			document.getElementById('txtFechaConsulta').value = getStringFromDate(dvConsulta.Rows[0].datFechaHoraConsulta);
			document.getElementById('txtConsultaNoLeida').value = dvConsulta.Rows[0].Consulta;
			// Respuesta
			document.getElementById('txtDocente').value = dvConsulta.Rows[0].Docente;
			document.getElementById('txtFechaRespuesta').value = getStringFromDate(dvConsulta.Rows[0].datFechaHoraRespuesta);
			document.getElementById('txtRespuesta').value = dvConsulta.Rows[0].Respuesta;
			
			// Establecer la cantidad de líneas de los cuadros Consulta y Respuesta según la cantidad de caracteres de los mismos.
			document.getElementById('txtConsultaNoLeida').rows = Math.round((dvConsulta.Rows[0].Consulta.length/95)+1);
			document.getElementById('txtRespuesta').rows = Math.round((dvConsulta.Rows[0].Respuesta.length/95)+1);
			
			res = null;
			dvConsulta = null;
			
		}

		function msgConsultaLeida()
		{
			alert("Esta consulta ya ha sido leída, para volver a revisarla utilice el buscador de consultas.");
			return;
		}
		 
		function Nuevo()
		{
			strMode = 'Nuevo';
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Hacer visible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='';
			document.body.scrollTop = 0;
			// Limpiar los valores de los demás controles.
			document.getElementById('txtConsulta').value='';
			// Si alguno de los CBOs de Sedes y de Menciones no tiene elementos, entonces el webForm no es funcional.
			if(!((fillListaDocentes(0)==true)&(fillListaTemas(0)==true))){return;};
			// Llenar el cboMenciones, donde también se maneja la posición del valor seleccionado de esta lista.
			document.getElementById('spLeftCharsConsulta').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtConsulta'), 500);
			document.getElementById('cboDocente').focus();
		}

		// Llenar el cbo de los Docentes.
		function fillListaDocentes(IdDocente)
		{
			var refCbo = document.getElementById('cboDocente');
			// Si el cbo ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfConsultar.getListaDocentes();
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los Docentes.");
					res=null;
					return false;
				}
				
				dataView = res.value;
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCbo.options[refCbo.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
				}
				return true;
				res=null;			
			}

			// Establecer el valor de selectedIndex del cboDocente para que 
			// se corresponda con el grupo que se esté editando.
			if(strMode=='Editar'||strMode=='Nuevo'){setIndexIncboDocente(IdDocente);}
		}
		
		// Establecer el valor de selectedIndex del cboSede para que 
		// se corresponda con el grupo que se esté editando.
		function setIndexIncboDocente(IdDocente)
		{
			var refCbo = document.getElementById('cboDocente');
			if(refCbo.options.length==0){return;}
			for(var i = 0; i<=(refCbo.options.length-1); i++)
			{
				if(refCbo.options[i].value==IdDocente){refCbo.selectedIndex=i;return;}
			}
		}
		
		// Llenar el cbo de las menciones.
		function fillListaTemas(IdTema)
		{
			var refCbo = document.getElementById('cboTema');
			// Si el cboSede ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfConsultar.getListaTemas();
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los temas.");
					res=null;
					return false;
				}
				
				dataView = res.value;  
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					//refCbo.options[refCbo.options.length] = new Option(dataView.Rows[i].Modulo + ' ' + dataView.Rows[i].Curso + ' ' + dataView.Rows[i].Tema, dataView.Rows[i].Id);
					refCbo.options[refCbo.options.length] = new Option(getAbr(dataView.Rows[i].Modulo,15) + ": " + getAbr(dataView.Rows[i].Curso,40) + ": " + getAbr(dataView.Rows[i].Tema,10), dataView.Rows[i].Id);
				}
				return true;
				res=null;			
			}

			// Establecer el valor de selectedIndex del cboMencion para que 
			// se corresponda con el grupo que se esté editando.
			if(strMode=='Editar'||strMode=='Nuevo'){setIndexInCboTema(IdTema);}
		}
		
		// Establecer el valor de selectedIndex del cboMencion para que 
		// se corresponda con el grupo que se esté editando.
		function setIndexInCboTema(IdTema)
		{
			var refCbo = document.getElementById('cboTema');
			if(refCbo.options.length==0){return;}
			for(var i = 0; i<=(refCbo.options.length-1); i++)
			{
				if(refCbo.options[i].value==IdTema){refCbo.selectedIndex=i;return;}
			}
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
			var Consulta = ISPCFG.Msce.clswfConsultar.getConsultaClass().value;
			if(Consulta==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar su consulta. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				return;
			}
			
			// Obtener los valores de los campos.
			Consulta.IdUsuarioDocente = document.getElementById('cboDocente').value;
			Consulta.IdTema = document.getElementById('cboTema').value;
			Consulta.Consulta = document.getElementById('txtConsulta').value;
			var boResult = false;
			
			if(strMode=='Nuevo')
			{
				//Modulo.Id = null; Esto no es necesario, la clase clsModulo lo hace sola.
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando Consulta...';
				ISPCFG.Msce.clswfConsultar.Agregar(Consulta, Actualizar_CallBack);
				Consulta = null;
				return;
			}
			if(strMode=='Editar')
			{
				Consulta.Id = IdEditado;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando Consulta...';
				ISPCFG.Msce.clswfConsultar.Actualizar(Consulta, Actualizar_CallBack);
				Consulta = null;
			}
		}

		function Actualizar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strMode=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar su consulta. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos de su consulta. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
				}
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos de su consulta, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
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
		
		function Eliminar(Id)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar la zona de notificación de actualización efectuada.
			document.getElementById('spEstadoActualizacion').innerHTML = '';

			var res = ISPCFG.Msce.clswfConsultar.canBeDeleted(Id);
			if(res.value==null)
			{
				var strErrorMessage = "No se pudo comprobar si esta consulta puede ser eliminada.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = ISPCFG.Msce.clswfConsultar.WhyCanNotBeDeleted(Id).value;
				if(strWarning!=null)
				{
					// Ciclo para mostrar los errores.
					for(x=0; x<=(strWarning.length-1); x++)
					{
						boOmitirCloseButton = (x==(strWarning.length-2));
						ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Esta consulta no puede ser eliminada por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
					}
					res = null;
					strWarning = null;
					return;
				}
				else
				{
					var strErrorMessage = "No se han podido obtener las causas que impiden eliminar esta consulta.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				}				
			}
			else
			{
				if(!window.confirm("Se eliminarán los datos de la consulta seleccionada.")){return;}
				ISPCFG.Msce.clswfConsultar.Eliminar(Id, Eliminar_CallBack);
				res = null;
			}
		}
		
		function Eliminar_CallBack(res)
		{
			if(res.error!=null)
			{
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar la consulta seleccionada. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = "Estimado usuario, no se ha podido eliminar la consulta seleccionada, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				getConsultas();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Consulta eliminada.';
			}
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
			document.getElementById('spValConsulta').innerHTML = '';
			document.getElementById('spValConsulta').style.display = 'none';
		}
		
		/*
			SI SE ESTÁ EN MODO DE EDICIÓN DE ALGÚN MÓDULO ENTONCES 
			SE HACEN VISIBLES LOS DATOS DEL MISMO EN LA LISTA, PERO
			EN CUALQUIER CASO, ESCONDE LA TABLA PARA LAS EDICIONES
			Y EL BOTÓN "Actualizar".
		*/
		function stopEditing()
		{
			// Si ya se estaba editando algún registro.
			if(strMode=='Editar')
			{
				// Hacer visible el registro que se estaba editando.
				if(document.getElementById('trConsulta'+IdEditado)!=null)
				{
					document.getElementById('trConsulta'+IdEditado).style.display='';
				}
			}
			// Siempre ocultar la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';

			if(strMode=='Leer')
			{
			
				// Hacer visible el módulo que se estaba editando.
				if(document.getElementById('trNoLeida'+IdLeido)!=null)
				{
					document.getElementById('trNoLeida'+IdLeido).style.display='';
				}
			// Hacer invisible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Leer').style.display='none';
			}
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
			var validConsulta = valEmptyString(document.getElementById('txtConsulta'), document.getElementById('spValConsulta'), "El campo \"Consulta\" no puede estar vacío.");
			return validConsulta;
		}

		function setButtomsVisibility()
		{
			var btnNuevo = document.getElementById('lnkNuevo');
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			switch(strMode)
			{
				case 'Nuevo':
				case 'Editar':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='inline';
					btnCancelar.style.display='inline';
					break;					
				}
				case 'Leer':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='none';
					btnCancelar.style.display='inline';
					break;					
				}
				// Para cuando no existan Sedes y/o Menciones registradas, este webForm no es válido.
				case 'Disabled':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
					break;
				}
				// default es igual a 'Lista'
				default:
				{
					btnNuevo.style.display='inline';
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
