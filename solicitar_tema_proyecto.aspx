<%@ Page language="c#" Codebehind="solicitar_tema_proyecto.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfSolicitarTemaProyecto" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Solicitar tema para proyecto</title>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65">
												<span class="subtit_A" id="spHeaderContent">
													MI TEMA
													PARA PROYECTO DE INVESTIGACIÓN
												</span>
											</td>
										</tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Edit" width="90%" align="center" border="0" style="DISPLAY: none">
																<!-- cboTemaProyecto -->
																<tr valign="bottom">
																	<td align="left" colspan="2">Seleccione el tema para proyecto de investigación:</td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<select class="frmTextInput" id="cboTemaProyecto" onchange="JavaScript:cboTemaChange();"></select>
																	</td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<div id="dvNombreTemaProyecto"></div>
																	</td>
																</tr>
																<!-- Argumentos -->
																<tr valign="bottom">
																	<td align="left" width="40%">Argumente su selección: </td>
																	<td align="right"><span id="spLeftCharsArgumentos" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<textarea class="frmTextInput" id="txtArgumentos" onkeydown="JavaScript:document.getElementById('spLeftCharsArgumentos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValArgumentos'), 'El campo \'Argumentos\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsArgumentos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" style="WIDTH: 100%" rows="3"></textarea><span class="spErrorNotification" id="spValArgumentos"></span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr></table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="90%" align="center" border="0">
																<tr valign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left"></span></td>
																	<td align="right">
																		<a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																		<a id="lnkCancelar" title="Cancelar." href="JavaScript:Cancelar();">&nbsp;<img title="Cancelar." alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
																		<div id="dvListaMiTemaProyecto"></div>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- 
																			ELEMENTO DIV PARA LLENARLO CON LA LISTA DE LOS MAESTRANTES QUE TIENEN 
																			EL MISMO TEMA PARA PROYECTO SELECCIIONADO QUE EL USUARIO ACTUAL.
																		-->
																		<div id="dvListaOthersWithSameTema"></div>
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
		function getMiTemaProyecto()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			var dvTemaProyecto = ISPCFG.Msce.clswfSolicitarTemaProyecto.getMiTemaProyecto().value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaMiTemaProyecto = document.getElementById('dvListaMiTemaProyecto')
			// Si no existen registros de módulos.
			if(dvTemaProyecto.Rows.length==0)
			{
				dvTemaProyecto = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaMiTemaProyecto.innerHTML = "<b>USTED NO HA SELECCIONADO SU TEMA PARA PROYECTO DE INVESTIGACIÓN.</b>";
				// Poner el webForm para ingresar Nuevo registro.
				Nuevo();
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
					strHTML_Header += "\t\t<td><b>Detalles de mi solicitud</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvTemaProyecto.Rows.length-1); i++)
			{
				var IdTema = dvTemaProyecto.Rows[i].IdTema;
				var Tema = dvTemaProyecto.Rows[i].Tema;
				var Argumentos = dvTemaProyecto.Rows[i].Argumentos;
				var datSolicitud = dvTemaProyecto.Rows[i].datSolicitud;
				var Estado = dvTemaProyecto.Rows[i].Estado;
				var AcademicoRevisa = dvTemaProyecto.Rows[i].AcademicoRevisa;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"trMiTema\" valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" width=\"15%\" rowspan=\"5\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar();\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar();\">Eliminar</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Tema\"><b>Tema:</b> " + Tema + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Argumentos\"><b>Argumentos:</b> " + Argumentos + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Fecha\"><b>Fecha:</b> " + datSolicitud + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Estado\"><b>Estado:</b> " + Estado + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"AcademicoRevisa\"><b>Académico que la revisa:</b> " + AcademicoRevisa + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			// Vínculo para mostrar la lista de otros maestrantes que solicitan mi tema de proyecto también
			strHTML_Foot = "\t<tr valign=\"middle\">\n";
			strHTML_Foot += "\t\t<td colspan=\"2\" height=\"25\"><a href=\"JavaScript:getOthers();\" title=\"Mostrar la lista de quienes solicitan este tema.\">Deseo ver quienes solicitan este tema</a></td>\n";
			strHTML_Foot += "\t</tr>\n";
			strHTML_Foot += "</table>\n";
			
			divListaMiTemaProyecto.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			dvTemaProyecto = null; 
		}

		function getOthers()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Notificar sobre el intento de recuperar los datos.
			document.getElementById('dvListaOthersWithSameTema').innerHTML = "Recuperando la lista de maestrantes que comparten su solicitud de tema para proyecto. Por favor, espere...";
			ISPCFG.Msce.clswfSolicitarTemaProyecto.getOthersRequestingSameTema(getOthers_CallBack);
		}
		// LLENA LOS DATOS QUE CORRESPONDEN A LA PÁGINA.
		function getOthers_CallBack(res)
		{
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divLista = document.getElementById('dvListaOthersWithSameTema');
			
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de maestrantes que comparten su solicitud de tema para proyecto.");
				divLista.innerHTML = "";
				res=null;
				return;
			}
			
			dvLista = res.value;
						
			// Si no existen registros de módulos.
			if(dvLista.Rows.length==0)
			{
				dvLista = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divLista.innerHTML = "<b>NO EXISTEN OTROS MAESTRANTES QUE SOLICITEN EL MISMO TEMA PARA PROYECTO QUE USTED Y DICHA SOLICITUD SE ENCUENTRE EN ESTADO \"Pendiente\" Ó \"Aprobado\".</b>";
				// Poner el webForm para ingresar Nuevo registro.
				return;
			}

			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table id=\"tbl_ListaOthers\" border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td><b>Nombre</b></td>\n";
					strHTML_Header += "\t\t<td><b>Mención</b></td>\n";
					strHTML_Header += "\t\t<td><b>Fecha</b></td>\n";
					strHTML_Header += "\t\t<td><b>Estado</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvLista.Rows.length-1); i++)
			{
				var Id = dvLista.Rows[i].Id;
				var Nombre = dvLista.Rows[i].Nombre;
				var Mencion = dvLista.Rows[i].Mencion;
				var fechaSolicitud = getStringFromDate(dvLista.Rows[i].FechaSolicitud);
				var Estado = dvLista.Rows[i].Estado;
				var perfilPublico = dvLista.Rows[i].PerfilPublico==1?true:false;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				if(perfilPublico)
				{
					strHTML_Body += "\t\t\t<td><a href=\"perfil.aspx?Id=" + Id + "\">" + Nombre + "</a></td>\n";
				}
				else
				{
					strHTML_Body += "\t\t\t<td><label title=\"El perfil de este usuario no es público.\">" + Nombre + "</td>\n";
				}
				strHTML_Body += "\t\t\t<td>" + Mencion + "</td>\n";
				strHTML_Body += "\t\t\t<td>" + fechaSolicitud + "</td>\n";
				strHTML_Body += "\t\t\t<td>" + Estado + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			strHTML_Foot = "</table>\n";
			
			divLista.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			dvLista=null; 
		}

		function Editar()
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
			// Hacer visible la tabla para los controles de edición del tema.
			document.getElementById('tbl_Edit').style.display='';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder el table que ocntiene los datos que se van a editar.
			document.getElementById('tbl_ListaDetalles').style.display='none';
			//IdEditado = Id;
			document.body.scrollTop = 0;
			
			var dvTemaProyecto = ISPCFG.Msce.clswfSolicitarTemaProyecto.getMiTemaProyecto().value;
			fillListaTemas(dvTemaProyecto.Rows[0].IdTema);
			IdTemaEditado = dvTemaProyecto.Rows[0].IdTema;
			document.getElementById('txtArgumentos').value = dvTemaProyecto.Rows[0].Argumentos;
			ArgumentoEditado = dvTemaProyecto.Rows[0].Argumentos;
			EstadoActual = dvTemaProyecto.Rows[0].Estado;
			document.getElementById('spLeftCharsArgumentos').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtArgumentos'), 250);
			document.getElementById('cboTemaProyecto').focus();
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
			document.getElementById('txtArgumentos').value='';
			// Si el CBO de los temas no tiene elementos, entonces el webForm no es funcional.
			if(!(fillListaTemas(0)==true)){return;};
			// Llenar el cboMenciones, donde también se maneja la posición del valor seleccionado de esta lista.
			document.getElementById('spLeftCharsArgumentos').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtArgumentos'), 250);
			document.getElementById('cboTemaProyecto').focus();
		}

		// Llenar el cbo de los temas para proyecto.
		function fillListaTemas(IdTema)
		{
			var refCboTema = document.getElementById('cboTemaProyecto');
			// Si el cboTemaProyecto ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCboTema.options.length==0)
			{
				var res = ISPCFG.Msce.clswfSolicitarTemaProyecto.getListaTemas();
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los temas para proyecto registrados.");
					res=null;
					return;
				}
				
				dataView = res.value;
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCboTema.options[refCboTema.options.length] = new Option(getAbr(dataView.Rows[i].Nombre, 75), dataView.Rows[i].Id);
					refCboTema.options[refCboTema.options.length-1].title = dataView.Rows[i].Nombre;
				}
				dvNombreTemaProyecto.innerHTML = "<b>Tema seleccionado:</b> " + refCboTema.options[refCboTema.selectedIndex].title;
				res=null;			
			}

			// Establecer el valor de selectedIndex del cboSede para que 
			// se corresponda con el grupo que se esté editando.
			if(strMode=='Editar'||strMode=='Nuevo'){setIndexInCboTema(IdTema);}
		}

		function cboTemaChange()
		{
			var refCboTema = document.getElementById('cboTemaProyecto');
			dvNombreTemaProyecto.innerHTML = "<b>Tema seleccionado:</b> " + refCboTema.options[refCboTema.selectedIndex].title;
			document.getElementById('dvListaOthersWithSameTema').innerHTML = "";
		}
		
		// Mostrar el nombre completo del tema para proyecto seleccionado.
		function setIndexInCboTema(IdTema)
		{
			var refCboTema = document.getElementById('cboTemaProyecto');
			if(refCboTema.options.length==0){return;}
			for(var i = 0; i<=(refCboTema.options.length-1); i++)
			{
				if(refCboTema.options[i].value==IdTema){refCboTema.selectedIndex=i;return;}
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
			var TemaProyecto = ISPCFG.Msce.clswfSolicitarTemaProyecto.getTemaProyectoStruct().value;
			if(TemaProyecto==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del tema de proyecto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				return;
			}
			
			// Obtener los valores de los campos.
			TemaProyecto.IdTemaProyecto = document.getElementById('cboTemaProyecto').value;
			TemaProyecto.Argumentos = document.getElementById('txtArgumentos').value;
			//var boResult = false;
			
			if(strMode=='Nuevo')
			{
				//Modulo.Id = null; Esto no es necesario, la clase clsModulo lo hace sola.
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando selección...';
				ISPCFG.Msce.clswfSolicitarTemaProyecto.Agregar(TemaProyecto, Actualizar_CallBack);
				TemaProyecto = null;
				return;
			}
			if(strMode=='Editar')
			{
				if(IdTemaEditado==TemaProyecto.IdTemaProyecto & ArgumentoEditado==TemaProyecto.Argumentos){return;} 
				if(EstadoActual!="Pendiente")
				{
					var strWarningMsg = "El tema para proyecto y/o los argumentos para la selección del mismo han cambiado, como concecuencia ";
							strWarningMsg += "el estado de su solicitud cambiará a \"Pendiente\" hasta tanto sea revisada nuevamente. Está de acuerdo?";
					if(!confirm(strWarningMsg)){return;}
				}

				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando selección...';
				ISPCFG.Msce.clswfSolicitarTemaProyecto.Actualizar(TemaProyecto, Actualizar_CallBack);
				TemaProyecto = null;
			}
		}

		function Actualizar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strMode=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar el tema seleccionado. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del tema para proyecto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
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
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos del tema para proyecto, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
				}
				else
				{
					stopEditing();
					getMiTemaProyecto();
					strMode = 'Lista';
					setButtomsVisibility();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Actualización efectuada.';
				}
			}				
			res=null;
		}
		
		function Eliminar()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar la zona de notificación de actualización efectuada.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			if(!window.confirm("Se eliminará su selección de tema para proyecto.")){return;}
			ISPCFG.Msce.clswfSolicitarTemaProyecto.Eliminar(Eliminar_CallBack);
			res = null;
		}
		
		function Eliminar_CallBack(res)
		{
			if(res.error!=null)
			{
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar la actual selección de tema para proyecto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = "Estimado usuario, no se ha podido eliminar la selección de tema para proyecto, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				getMiTemaProyecto();
				setButtomsVisibility();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Selección eliminada.';
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
			document.getElementById('spValArgumentos').innerHTML = '';
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
				if(document.getElementById('tbl_ListaDetalles')!=null)
				{
					document.getElementById('tbl_ListaDetalles').style.display='block';
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
			// Validar txtArgumentos.
			var valArgumentos = valEmptyString(document.getElementById('txtArgumentos'), document.getElementById('spValArgumentos'), "El campo \"Argumentos\" no puede estar vacío.");
			return valArgumentos;
		}

		function setButtomsVisibility()
		{
			//var btnNuevo = document.getElementById('lnkNuevo');
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			switch(strMode)
			{
				case 'Nuevo':
				{
					//btnNuevo.style.display='none';
					btnActualizar.style.display='inline';
					btnCancelar.style.display='none';
					break;
				}

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
			Para saber cual es el Id del tema que se está editando y si se cambia, entonces 
			no será válida la revisión en caso que se halla hacho, lo mismo con los argumentos.
		*/
		var IdTemaEditado; 
		var ArgumentoEditado;
		/*
			Lo anterior sólo es válido si el estado es diferente de "Pendiente". Por eso que también 
			guardaremos el estado del registro que se edita.
		*/
		var EstadoActual;

		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		getMiTemaProyecto();
		setButtomsVisibility();

		//-->
		</script>

	</body>
</html>
