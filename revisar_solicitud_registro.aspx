<%@ Page language="c#" Codebehind="revisar_solicitud_registro.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfRevisarSolicitudRegistro" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Revisar solicitudes de tema para proyecto</title>
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
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0"><!-- PAGE TABLE; BEGIN -->
		<form id="frm_Maestria" method="post" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">REVISIÓN
													DE SOLICITUDES DE REGISTRO DE MAESTRANTES</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Edit" style="DISPLAY: none" width="100%" align="center" border="0">
																<tr valign="middle">
																	<td>Maestrante: </td>
																	<td width="75%" align="left">
																		<input type="text" id="txtMaestrante" class="frmTextInput_disabled" readonly style="WIDTH: 100%">
																	</td>
																</tr>
																<tr valign="middle">
																	<td>Carnet de identidad: </td>
 																	<td align="left">
 																		<input type="text" id="txtNoCI" class="frmTextInput_disabled" readonly style="WIDTH: 100%">
 																	</td>
																</tr>
																<tr valign="middle">
																	<td>Sexo: </td>
 																	<td align="left">
 																		<input type="text" id="txtSexo" class="frmTextInput_disabled" readonly style="WIDTH: 100%">
 																	</td>
																</tr>
																<tr valign="middle">
																	<td>Centro de trabajo: </td>
																	<td align="left">
																		<input type="text" id="txtCentroTrabajo" class="frmTextInput_disabled" readonly style="WIDTH: 100%">
																	</td>
																</tr>
																<tr valign="middle">
																	<td>Función: </td>
																	<td align="left">
																		<input type="text" id="txtFuncion" class="frmTextInput_disabled" readonly style="WIDTH: 100%">
																	</td>
																</tr>
																<tr valign="middle">
																	<td>Sede: </td>
																	<td align="left">
																		<input type="text" id="txtSede" class="frmTextInput_disabled" readonly style="WIDTH: 100%">
																	</td>
																</tr>
																<tr valign="middle">
																	<td>Grupo: </td>
																	<td align="left">
																		<input type="text" id="txtGrupo" class="frmTextInput_disabled" readonly style="WIDTH: 100%">
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
																<tr>
																	<td colspan="2">
																		<table width="100%" border="0">
																			<tr valign="top">
																				<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left"></span></td>
																				<td align="right">
																					<a id="lnkAprobar" title="Aprobar solicitud." href="JavaScript:Aprobar();">&nbsp;<img title="Aprobar solicitud." alt="Aprobar" src="imagenes/btn_aprobar.gif" border="0"></a>
																					<a id="lnkEliminar" title="Eliminar solicitud." href="JavaScript:Eliminar();">&nbsp;<img title="Eliminar solicitud." alt="Eliminar" src="imagenes/btn_eliminar.gif" border="0"></a>
																					<a id="lnkCancelar" title="Cancelar." href="JavaScript:Cancelar();">&nbsp;<img title="Cancelar." alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																				</td></tr>
																			<tr valign="top">
																				<td colspan="2" height="1">
																					<hr width="100%" color="#47639a" size="1">
																					</hr></td></tr>
																		</table>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
																		<div id="dvListaSolicitudes">
																		</div>
																	</td>
																</tr>
															</table>
														</td></tr></table></td></tr></table>
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
		function getLista()
		{
			var dvLista = ISPCFG.Msce.clswfRevisarSolicitudRegistro.getList().value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divLista = document.getElementById('dvListaSolicitudes')
			// Si no existen registros de módulos.
			if(dvLista.Rows.length==0)
			{
				dvLista = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divLista.innerHTML = "<b>NO EXISTEN SOLICITUDES DE REGISTRO PENDIENTES A SER REVISADAS.</b>";
				return;
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
			}
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table id=\"tbl_ListaDetalles\" border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td width=\"15%\"><b>Acciones</b></td>\n";
					strHTML_Header += "\t\t<td><b>Maestrante</b></td>\n";
					strHTML_Header += "\t\t<td><b>Sede</b></td>\n";
					strHTML_Header += "\t\t<td><b>Grupo</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvLista.Rows.length-1); i++)
			{
				var Id = dvLista.Rows[i].Id;
				var Maestrante = dvLista.Rows[i].Maestrante;
				var Sede = dvLista.Rows[i].Sede;
				var Grupo = dvLista.Rows[i].Grupo;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"tr" + Id + "\" valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" width=\"15%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Revisar(" + Id + ");\">Revisar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Aprobar(" + Id + ");\">Aprobar</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\">" + Maestrante + "</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\">" + Sede + "</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\">" + Grupo + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			
			strHTML_Foot = "</table>\n";
			divLista.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			dvLista=null; 
		}

		function Revisar(IdUsuario)
		{
			stopEditing();
			// Establecer el modo de este webFrom.
			strMode = 'Revisar';
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Esconder el table que ocntiene los datos que se van a editar.
			document.getElementById('tbl_List').style.display='none';
			// Hacer visible la tabla para los controles de edición del tema.
			document.getElementById('tbl_Edit').style.display='';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			document.body.scrollTop = 0;
			var dvSolicitud = ISPCFG.Msce.clswfRevisarSolicitudRegistro.getSolicitud(IdUsuario).value;
			document.getElementById('txtMaestrante').value = dvSolicitud.Rows[0].Maestrante;
			document.getElementById('txtNoCI').value = dvSolicitud.Rows[0].NoCI;
			document.getElementById('txtSexo').value = dvSolicitud.Rows[0].Sexo=='F'?'Feminino':'Masculino';
			document.getElementById('txtCentroTrabajo').value = dvSolicitud.Rows[0].CentroTrabajo;
			document.getElementById('txtFuncion').value = dvSolicitud.Rows[0].Funcion;
			document.getElementById('txtSede').value = dvSolicitud.Rows[0].Sede;
			document.getElementById('txtGrupo').value = dvSolicitud.Rows[0].Grupo;
			document.getElementById('lnkAprobar').href = "JavaScript:Aprobar(" + IdUsuario + ");";
			document.getElementById('lnkEliminar').href = "JavaScript:Eliminar(" + IdUsuario + ");";
			document.getElementById('lnkAprobar').focus();
		}
		
		function Aprobar(IdUsuario)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando estado...';
			ISPCFG.Msce.clswfRevisarSolicitudRegistro.AprobarSolicitud(IdUsuario, Aprobar_CallBack);
		}

		function Aprobar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar el estado de la solicitud actual. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				return;
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar el estado de la solicitud actual, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
					document.getElementById('spEstadoActualizacion').innerHTML = '';
					return;
				}
				else
				{
					stopEditing();
					strMode = 'Lista';
					getLista();
					setButtomsVisibility();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Registro aprobado.';
				}
			}				
			res=null;
		}
		
		function Eliminar(IdUsuario)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			if(!window.confirm("Se eliminarán los datos de esta solicitud de registro.")){return;}
			document.getElementById('spEstadoActualizacion').innerHTML = 'Eliminando solicitud...';
			ISPCFG.Msce.clswfRevisarSolicitudRegistro.EliminarSolicitud(IdUsuario, Eliminar_CallBack);
		}

		function Eliminar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar la solicitud actual. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				return;
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido eliminar la solicitud actual, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
					document.getElementById('spEstadoActualizacion').innerHTML = '';
					return;
				}
				else
				{
					stopEditing();
					strMode = 'Lista';
					getLista();
					setButtomsVisibility();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Solicitud eliminada.';
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
			if(strMode=='Revisar')
			{
				// Hacer visible el módulo que se estaba editando.
				if(document.getElementById('tbl_List')!=null)
				{
					document.getElementById('tbl_List').style.display='block';
				}
			}
			// Hacer invisible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';
		}
		
		function setButtomsVisibility()
		{
			//var btnNuevo = document.getElementById('lnkNuevo');
			var btnAprobar = document.getElementById('lnkAprobar');
			var btnEliminar = document.getElementById('lnkEliminar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			switch(strMode)
			{
				case 'Revisar':
				{
					//btnNuevo.style.display='none';
					btnAprobar.style.display='inline';
					btnEliminar.style.display='inline';
					btnCancelar.style.display='inline';
					break;
				}
				// Para cuando no existan Sedes y/o Menciones registradas, este webForm no es válido.
				case 'Disabled':
				{
					btnAprobar.style.display='none';
					btnEliminar.style.display='none';
					btnCancelar.style.display='none';
					break;
				}
				// default es igual a 'Lista'
				default:
				{
					btnAprobar.style.display='none';
					btnEliminar.style.display='none';
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
					strMessage += "NECESARIO QUE ESTEN REGISTRADOS DE ANTEMANO LOS \"temas para proyecto de investigación\", ";
					strMessage += "TAREA QUE LE CORRESPONDE A LOS ACADÉMICOS DE ESTA MAESTRÍA.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('dvListaMiTemaProyecto').innerHTML = strMessage;
		}
		
		/*
			VARIABLES LOCALES DE ESTA PÁGINA		
		*/	
		var strMode = 'Lista'; // Los valores pueden ser: 'Lista', 'Editar', 'Nuevo' ó 'Disabled'.
		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		//fillListaEstados(0);
		getLista(0);
		setButtomsVisibility();

		//-->
		</script>


	</body>
</html>
