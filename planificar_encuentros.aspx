<%@ Page language="c#" Codebehind="planificar_encuentros.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfPlanificarEncuentros" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Planificar encuentros</title>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">PLANIFICAR
													ENCUENTROS</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Edit" width="80%" align="center" border="0" style="DISPLAY: none">
																<!-- cboGrupo -->
																<tr valign="middle">
																	<td align="left" nowrap width="30">Grupo: </td>
																	<td align="left"><select class="frmTextInput" id="cboGrupo"></select></td></tr>
																<!-- txtFecha -->
																<tr valign="top">
																	<td align="left" width="30">Fecha: </td>
																	<td align="left"><input id="txtFecha" class="frmTextInput" title="El formato esperado es: 'dd-mmm-aaaa'" type="text" maxlength="11" onchange="JavaScript:return(valFechas(this));">&nbsp;<label id="lblFormatoFecha" for="txtFecha" class="tinytext_A"></label><span id="spValFecha" class="spErrorNotification" style="WIDTH: 100%;"></span></td></tr>
																<!-- Orientaciones -->
																<tr valign="bottom">
																	<td align="left" width="30">Orientaciones: </td>
																	<td align="right"><span id="spLeftCharsOrientaciones" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2"><textarea class="frmTextInput" id="txtOrientaciones" onkeydown="JavaScript:document.getElementById('spLeftCharsOrientaciones').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValOrientaciones'), 'El campo \'Orientaciones\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsOrientaciones').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);" style="WIDTH: 100%" rows="4"></textarea><span class="spErrorNotification" id="spValOrientaciones"></span> </td></tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr></table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="80%" align="center" border="0">
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
		function getEncuentros()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Obtener los datos de los módulos.
			var dvEncuentros = ISPCFG.Msce.clswfPlanificarEncuentros.getEncuentros().value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divLista = document.getElementById('dvLista')
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvEncuentros.Rows.length==0)
			{
				dvEncuentros = null;
				// Poner el webForm para ingresar Nuevo registro.
				Nuevo();
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divLista.innerHTML = "<b>USTED NO HA PLANIFICADO ENCUENTROS.</b>";
				return;
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
			}
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table border=\"0\" width=\"80%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td colspan=\"3\"><b>Mis encuentros pendientes (" + dvEncuentros.Rows.length + ")</b></td>\n";
					strHTML_Header += "\t</tr>\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td align=\"left\" nowrap width=\"15%\"><b>Acciones</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\"><b>Sede -> Grupo</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\"><b>Fecha</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvEncuentros.Rows.length-1); ++i)
			{
				var Id = dvEncuentros.Rows[i].Id;
				var Grupo = dvEncuentros.Rows[i].Sede + ' -> ' + dvEncuentros.Rows[i].Grupo;
				var Fecha = dvEncuentros.Rows[i].datFecha;
				var Editable = dvEncuentros.Rows[i].Editable==1?true:false;
				// Formar el cuerpo del registro actual.
				strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"trEncuentro" + Id + "\" valign=\"top\">\n";
				if(Editable)
				{	
					strHTML_Body += "\t\t\t<td nowrap width=\"15%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
				}
				else
				{
					strHTML_Body += "\t\t\t<td nowrap width=\"15%\"><a title=\"Los encuentros dejan de ser editables 72 horas antes del mismo.\"style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ", false);\">Ver</a>&nbsp;</td>\n";
				}
				strHTML_Body += "\t\t\t<td id=\"Grupo" + Id + "\">" + Grupo + "</td>\n";
				strHTML_Body += "\t\t\t<td id=\"Fecha" + Id + "\">" + getStringFromDate(Fecha) + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			
			strHTML_Foot = "</table>\n";
			
			divLista.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			dvEncuentros=null; 
			
		}

		function Editar(Id, esEditable)
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
			document.getElementById('trEncuentro'+Id).style.display='none';
			var res = ISPCFG.Msce.clswfPlanificarEncuentros.getEncuentro(Id);
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los grupos registrados.");
				res=null;
				return false;
			}
				
			Encuentro = res.value;  

			IdEditado = Id;
			document.body.scrollTop = 0;
			// Llenar el cboMunicipios, donde también se maneja la posición del valor seleccionado de esta lista.
			fillListaGrupos(Encuentro.Rows[0].Id_Grupo);
			document.getElementById('txtFecha').value = getStringFromDate(Encuentro.Rows[0].datFecha);
			document.getElementById('txtOrientaciones').value = Encuentro.Rows[0].Orientaciones;
			document.getElementById('spLeftCharsOrientaciones').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtOrientaciones'), 500);

			if(esEditable==false)
			{
				document.getElementById('cboGrupo').disabled = true;
				document.getElementById('cboGrupo').className = 'frmTextInput_disabled'
				document.getElementById('txtFecha').disabled = true;
				document.getElementById('txtFecha').className = 'frmTextInput_disabled'
				document.getElementById('txtOrientaciones').disabled = true;
				document.getElementById('txtOrientaciones').className = 'frmTextInput_disabled'
				document.getElementById('lnkActualizar').style.display = 'none';
				document.getElementById('lnkCancelar').focus();
			}
			else
			{
				document.getElementById('cboGrupo').disabled = false;
				document.getElementById('cboGrupo').className = 'frmTextInput'
				document.getElementById('txtFecha').disabled = false;
				document.getElementById('txtFecha').className = 'frmTextInput'
				document.getElementById('txtOrientaciones').disabled = false;
				document.getElementById('txtOrientaciones').className = 'frmTextInput'
				document.getElementById('lnkActualizar').style.display = 'inline';
				document.getElementById('cboGrupo').focus();
			}
			
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
			document.getElementById('txtOrientaciones').value='';
			// Establecer el texto del label para indicar el formato correcto de la fecha poniendo como ejemplo el día de hoy.
			setTxtFechaHelp();
			// Llenar el cboMunicipios, donde también se maneja la posición del valor seleccionado de esta lista.
			if(!fillListaGrupos(0)){return;};
			document.getElementById('spLeftCharsOrientaciones').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtOrientaciones'), 500);
			// Habilitar los controles para la inserción de los nuevos datos.
			document.getElementById('cboGrupo').disabled = false;
			document.getElementById('cboGrupo').className = 'frmTextInput'
			document.getElementById('txtFecha').disabled = false;
			document.getElementById('txtFecha').className = 'frmTextInput'
			document.getElementById('txtOrientaciones').disabled = false;
			document.getElementById('txtOrientaciones').className = 'frmTextInput'
			document.getElementById('cboGrupo').focus();
		}

		// Llenar el cbo de los municipios.
		function fillListaGrupos(IdGrupoActivo)
		{
			var refCbo = document.getElementById('cboGrupo');
			// Si en cboMunicipios ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfPlanificarEncuentros.getListaGrupos();
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los grupos registrados.");
					res=null;
					return false;
				}
				
				dataView = res.value;  
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCbo.options[refCbo.options.length] = new Option(dataView.Rows[i].Sede + ' -> ' + dataView.Rows[i].Nombre, dataView.Rows[i].Id);
				}
				res=null;			
			}

			// Pero al final siempre que se esté editando tratamos de establecer el 
			// valor de selectedIndex para que se corresponda con la sede que se esté editando.
			if(strMode=='Editar'||strMode=='Nuevo'){setIndexInCboGrupos(IdGrupoActivo);}
			return true;
		}
		
		function setIndexInCboGrupos(IdGrupoActivo)
		{
			var refCbo = document.getElementById('cboGrupo');
			if(refCbo.options.length==0){return;}
			for(var i = 0; i<=(refCbo.options.length-1); i++)
			{
				if(refCbo.options[i].value==IdGrupoActivo){refCbo.selectedIndex=i;return;}
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
			var Encuentro = ISPCFG.Msce.clswfPlanificarEncuentros.getEncuentroClass().value;
			if(Encuentro==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del encuentro. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				return;
			}

			var boResult = false;
			
			Encuentro.IdGrupo = document.getElementById('cboGrupo').value;
			Encuentro.datFecha = getDateFromString(document.getElementById('txtFecha').value);
			Encuentro.Orientaciones = document.getElementById('txtOrientaciones').value
			
			if(strMode=='Nuevo')
			{
				var res = ISPCFG.Msce.clswfPlanificarEncuentros.areValidKeyValuesForNew(Encuentro);
				var boError = false;
				if(res.error!=null)
				{
					boError = true;
				}
				if(!boError)
				{
					if(res.value==null)
					{
						boError = true; 
					}
				}
				if(boError)
				{
					strErrorMessage = "Estimado usuario, NO SE REGISTRÓ EL ENCUENTRO, ha sucedido un error que ha impedido comprobar si puede ser registrado el mismo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					return;
				}
				if(res.value==false)
				{
					strErrorMessage = "Estimado usuario, NO SE REGISTRÓ EL ENCUENTRO, existe ya un encuentro planificado por usted para la misma fecha con este grupo.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					return;
				}
				
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando encuentro...';
				ISPCFG.Msce.clswfPlanificarEncuentros.Agregar(Encuentro, Actualizar_CallBack);
				Encuentro = null;
				return;
			}
			if(strMode=='Editar')
			{
				Encuentro.Id = IdEditado;
				var res = ISPCFG.Msce.clswfPlanificarEncuentros.areValidKeyValuesForUpdate(Encuentro);
				var boError = false;
				if(res.error!=null)
				{
					boError = true;
				}
				if(!boError)
				{
					if(res.value==null)
					{
						boError = true; 
					}
				}
				if(boError)
				{
					strErrorMessage = "Estimado usuario, NO SE REGISTRÓ EL ENCUENTRO, ha sucedido un error que ha impedido comprobar si puede ser registrado el mismo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					return;
				}
				if(res.value==false)
				{
					strErrorMessage = "Estimado usuario, NO SE ACTUALIZÓ EL ENCUENTRO, existe ya un encuentro planificado por usted para la misma fecha con este grupo.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					return;
				}

				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando encuentro...';
				ISPCFG.Msce.clswfPlanificarEncuentros.Actualizar(Encuentro, Actualizar_CallBack);
				Encuentro = null;
			}
		}

		function Actualizar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strMode=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar el encuentro. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del encuentro. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
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
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos del encuentro, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
				}
				else
				{
					stopEditing();
					getEncuentros();
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
			if(!window.confirm("Se eliminarán los datos de la sede seleccionada.")){return;}
			ISPCFG.Msce.clswfPlanificarEncuentros.Eliminar(Id, Eliminar_CallBack);
		}
		// Retorno de Eliminar(Id)
		function Eliminar_CallBack(res)
		{
			if(res.error!=null)
			{
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar el encuentro seleccionado. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = "Estimado usuario, no se ha podido eliminar el encuentro seleccionado, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				getEncuentros();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Encuentro eliminado.';
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
			document.getElementById('spValFecha').innerHTML = '';
			document.getElementById('spValFecha').style.display = 'none';
			document.getElementById('spValOrientaciones').innerHTML = '';
			document.getElementById('spValOrientaciones').style.display = 'none';
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
				if(document.getElementById('trEncuentro'+IdEditado)!=null)
				{
					document.getElementById('trEncuentro'+IdEditado).style.display='';
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
			// Validar txtNombre.
			var validOrientaciones = valEmptyString(document.getElementById('txtOrientaciones'), document.getElementById('spValOrientaciones'), "El campo \"Orientaciones\" no puede estar vacío.");
			var validFecha = valFechas(document.getElementById('txtFecha'));
			return validFecha & validOrientaciones;
		}

		/*
			VALIDAR LAS FECHAS DE INICIO Y FIN DE LA MAESTRÍA.
			Esta función valida las fechas desde el punto de vista 
			del formato, que debe ser: dd-mmm-aaaa y también advierte
			que la fecha de fin tiene que ser mayor que la de inicio.
		*/
		function valFechas(sender)
		{
			// Controles input con las supuestas fechas en string.
			var inputFecha = document.getElementById('txtFecha');
			// Elementos <span> para mensaje de validación.
			var valFecha = document.getElementById('spValFecha');
			// Fechas obtenidas según valores string de los input.
			var datFecha = new Date();
			// Variable para el resultado.
			var boResult = true;
			// La fecha de hoy según el cliente.
			var res = ISPCFG.Msce.clswfPlanificarEncuentros.getLimitDate();
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			if(!boError)
			{
				if(res.value==null)
				{
					boError = true;
				}
			}
			if(!boError)
			{
				var LimitDate = new Date(res.value);
			}
			else
			{
				var LimitDate = new Date();
			}
		
			// Ocultar los controles de validación.
			valFecha.style.display = 'none';
			
			// Validando Fecha
			try
			{
				datFecha = getDateFromString(inputFecha.value);
			}
			catch(ExFecha)
			{
				valFecha.innerHTML = ExFecha.toString();
				valFecha.style.display = 'block';
				boResult = false;
			}
			// Si no se muestran ninguno de los controles para mensajes de error.
			if(boResult==true)
			{
				// Comparar las fechas.
				if(datFecha<LimitDate)
				{
					boResult=false;
					valFecha.innerHTML = "La fecha del encuentro debe ser de, al menos, 72 horas antes del mismo.";
					valFecha.style.display='block';
				}
			}
			
			return boResult;
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
				case 'Disabled':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
					break;					
				}				
				default:
				{
					btnNuevo.style.display='inline';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
				}
			}
		}
		
		function setTxtFechaHelp()
		{
			var lbl = document.getElementById('lblFormatoFecha');
			var hoy = new Date();
			lbl.innerHTML = "Ej. hoy es: \"" + hoy.getDate() + "-" + getAbrFromMonth(hoy.getMonth()) + "-" + hoy.getFullYear() + "\"";
		}
		
		function disableForm()
		{
			stopEditing();
			strMode = 'Disabled';
			setButtomsVisibility();
			var strMessage	= MSG_PROCESSING_BEGTAG;
					strMessage += "<b>PARA QUE ESTE FORMULARIO SEA COMPLETAMENTE FUNCIONAL ES ";
					strMessage += "NECESARIO QUE ESTEN REGISTRADAS DE ANTEMANO LAS \"Sedes\" ";
					strMessage += "Y LAS \"Menciones\" QUE CORRESPONDAN.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('dvListaGrupos').innerHTML = strMessage;
		}

		/*
			VARIABLES LOCALES DE ESTA PÁGINA		
		*/	
		var strMode = 'Lista'; // Los valores pueden ser: 'Lista', 'Editar', 'Nuevo' y 'Disabled'.
		var IdEditado; // Para saber cual es el Id del módulo que se está editando.

		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		getEncuentros();
		setButtomsVisibility();
		
		
		//-->
		</script>

	</body>
</html>
