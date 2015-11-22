<%@ Page language="c#" Codebehind="tema_proyecto.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfTema_proyecto" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Temas para proyecto de investigación</title>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">TEMAS
													PARA PROYECTO DE INVESTIGACIÓN</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS TEMAS DE PROYECTO -->
															<table id="tbl_Edit" width="80%" align="center" border="0" style="DISPLAY: none">
																<!-- Nombre -->
																<tr valign="bottom">
																	<td align="left" width="15%">Nombre: </td>
																	<td align="right">
																		<span id="spLeftCharsNombre" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span>
																	</td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<textarea class="frmTextInput" id="txtAreaNombre" rows="3" onkeydown="JavaScript:document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombre'), 'El campo \'Nombre\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" style="WIDTH: 100%"></textarea>
																		<span class="spErrorNotification" id="spValNombre"></span>
																	</td>
																</tr>
																<!-- cboEstado -->
																<tr valign="middle">
																	<td align="left" width="15%">Estado: </td>
																	<td align="left">
																		<select class="frmTextInput" id="cboEstado"></select>
																	</td>
																</tr>
																<!-- COMIENZO DE LOS CHECKBOXES DE LAS MENCIONES. -->
																<tr valign="top">
																	<td colspan="2">
																		<span id="spSelectAll">Menciones:&nbsp;&nbsp;<a href="JavaScript:revertSelectionCHKMenciones();">Invertir 
																				selección</a></span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" align="center">
																		<span id="spMenciones" style="WIDTH: 350px; TEXT-ALIGN: center"></span>
																		<span class="spErrorNotification" id="spValCHKMenciones" style="WIDTH: 100%; TEXT-ALIGN: left"></span>
																	</td>
																</tr>

																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1"></hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS TEMAS DE PROYECTO -->
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
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS TEMAS DE PROYECTO -->
																		<div id="dvListaTemas"></div></td></tr></table></td></tr></table></td></tr></table>
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
		function getAllTemasProyecto()
		{
			// Obtener los datos de los temas de proyecto.
			var res = ISPCFG.Msce.clswfTema_proyecto.getAllTemasProyecto();
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar los temas de proyecto registrados.");
				res=null;
				return;
			}

			var dvTemas = res.value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaTemas = document.getElementById('dvListaTemas')
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvTemas.Rows.length==0)
			{
				dvTemas = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaTemas.innerHTML = "<b>NO EXISTEN TEMAS DE PROYECTO REGISTRADOS.</b>";
				// Poner el webForm para ingresar Nuevo registro.
				Nuevo();
				return;
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
			}
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"20%\"><b>Acciones</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"10%\"><b>Estado</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"70%\"><b>Nombre</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvTemas.Rows.length-1); ++i)
			{
				var Id = dvTemas.Rows[i].Id;
				var Nombre = dvTemas.Rows[i].Nombre;
				var Estado = dvTemas.Rows[i].Habilitado;
				
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"trTema" + Id + "\" valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td width=\"20%\" rowspan=\"2\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td width=\"10%\" id=\"Estado" + Id + "\">" + ((Estado==true)?'Habilitado':'Deshabilitado') + "</td>\n";
				strHTML_Body += "\t\t\t<td width=\"70%\" id=\"Nombre" + Id + "\">" + Nombre + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";

				strHTML_Body += "\t\t<tr id=\"trTemaMenciones" + Id + "\" valign=\"top\">\n";
				strHTML_Body += "\t\t<td colspan=\"2\">\n";
				strHTML_Body += "<b>Menciones:</b> " + ISPCFG.Msce.clswfTema_proyecto.getSctringMenciones(Id).value + ".";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t</tr>\n";

			}
			strHTML_Foot = "</table>\n";
			divListaTemas.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			dvTemas=null; 
		}

		function Nuevo()
		{
			strMode = 'Nuevo';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Hacer visible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='';
			document.body.scrollTop = 0;
			// Limpiar los valores de los demás controles.
			document.getElementById('txtAreaNombre').value='';
			// Llenar el cboEstados con la lista seleccionada en "Habilitado".
			fillCboEstado(1);
			document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaNombre'), 250);
			document.getElementById('txtAreaNombre').focus();
			// Formar y llenar los checkboxes para las menciones.
			document.getElementById('spMenciones').innerHTML = getHTMLMenciones(0);
			// Limpiar los mensajes de validación de los controles.
			resetAllValMessages();
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
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder el tr que ocntiene los datos que se van a editar.
			document.getElementById('trTema'+Id).style.display='none';
			document.getElementById('trTemaMenciones'+Id).style.display='none';
			IdEditado = Id;
			document.body.scrollTop = 0;
			// Llenar el cboEstados, donde también se maneja la posición del valor seleccionado de esta lista.
			fillCboEstado(document.getElementById('Estado'+Id).innerHTML=='Habilitado'?1:0);
			document.getElementById('txtAreaNombre').value = document.getElementById('Nombre'+Id).innerHTML;
			document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaNombre'), 250);
			document.getElementById('spMenciones').innerHTML = getHTMLMenciones(Id);
			document.getElementById('txtAreaNombre').focus();
		}
		
		// Llenar el cbo para el estado del tema de proyecto (Habilitado = 1 ó Deshabilitado = 0).
		function fillCboEstado(intValorActivo)
		{
			if(intValorActivo==null){intValorActivo=0;}
			SelectEstado = document.getElementById('cboEstado');
			SelectEstado.options.length = 0; //reset the control dropdown  
			SelectEstado.options[SelectEstado.options.length] = new Option("Habilitado", 1);
			SelectEstado.options[SelectEstado.options.length] = new Option("Deshabilitado", 0);
			SelectEstado.selectedIndex = (intValorActivo==1)?0:1;
		}

		function Actualizar()
		{
 			// Si no son válidos los datos, entonces retornar.
			if(!valDocument()){return;}
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Obtener la clase clsTemaProyecto.
			var res = ISPCFG.Msce.clswfTema_proyecto.getTemaProyectoClass(getCantMencionesWithValue());
			if(res.value==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del tema de proyecto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			
			TemaProyecto = res.value;
			// Obtener los valores de los campos.
			TemaProyecto.Nombre = document.getElementById('txtAreaNombre').value;
			TemaProyecto.Habilitado = document.getElementById('cboEstado').value==1?true:false;
			TemaProyecto.Menciones = processMencionesWithValue(TemaProyecto.Menciones);

			if(strMode=='Nuevo')
			{
				//Modulo.Id = null; Esto no es necesario, la clase clsModulo lo hace sola.
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando tema de proyecto...';
				ISPCFG.Msce.clswfTema_proyecto.Agregar(TemaProyecto, Actualizar_CallBack);
				TemaProyecto = null;
				return;
			}
			if(strMode=='Editar')
			{
				TemaProyecto.Id = IdEditado;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando tema de proyecto...';
				ISPCFG.Msce.clswfTema_proyecto.Actualizar(TemaProyecto, Actualizar_CallBack);
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
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar el tema de proyecto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del tema de proyecto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
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
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos del tema de proyecto, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
				}
				else
				{
					stopEditing();
					getAllTemasProyecto();
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

			var res = ISPCFG.Msce.clswfTema_proyecto.canBeDeleted(Id);
			if(res.value==null)
			{
				var strErrorMessage = "No se pudo comprobar si este tema de proyecto puede ser eliminado.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = ISPCFG.Msce.clswfTema_proyecto.WhyCanNotBeDeleted(Id).value;
				if(strWarning!=null)
				{
					// Ciclo para mostrar los errores.
					for(x=0; x<=(strWarning.length-1); x++)
					{
						boOmitirCloseButton = (x==(strWarning.length-2));
						ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Este tema de proyecto no puede ser eliminado por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
					}
					res = null;
					strWarning = null;
					return;
				}
				else
				{
					var strErrorMessage = "No se han podido obtener las causas que impiden eliminar este tema de proyecto.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				}				
			}
			else
			{
				if(!window.confirm("Se eliminarán los datos del tema de proyecto seleccionado.")){return;}
				ISPCFG.Msce.clswfTema_proyecto.Eliminar(Id, Eliminar_CallBack);
				res = null;
			}
		}
		
		function Eliminar_CallBack(res)
		{
			if(res.error!=null)
			{
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar el tema de proyecto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = "Estimado usuario, no se ha podido eliminar el tema de proyecto, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				getAllTemasProyecto();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Tema de proyecto eliminado.';
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
			document.getElementById('spValNombre').innerHTML = '';
			document.getElementById('spValNombre').style.display = 'none';
			document.getElementById('spValCHKMenciones').innerHTML = '';
			document.getElementById('spValCHKMenciones').style.display = 'none';
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
				if(document.getElementById('trTema'+IdEditado)!=null)
				{
					document.getElementById('trTema'+IdEditado).style.display='';
					document.getElementById('trTemaMenciones'+IdEditado).style.display='';
				}
			}
			// Hacer invisible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';
		}
		
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)
		
		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			// Validar txtAreaNombre.
			var val1 = valEmptyString(document.getElementById('txtAreaNombre'), document.getElementById('spValNombre'), "El campo \"Nombre\" no puede estar vacío.");
			var val2 = valCHKMenciones();
			return (val1==true)&(val2==true);
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
		
		function disableForm()
		{
			stopEditing();
			strMode = 'Disabled';
			setButtomsVisibility();
			var strMessage	= MSG_PROCESSING_BEGTAG;
					strMessage += "<b>PARA QUE ESTE FORMULARIO SEA COMPLETAMENTE FUNCIONAL ES ";
					strMessage += "NECESARIO QUE ESTEN REGISTRADAS DE ANTEMANO LAS <a href=\"mencion.aspx\">\"Menciones\"</a> ";
					strMessage += "QUE CORRESPONDAN.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('dvListaTemas').innerHTML = strMessage;
		}

		// Validando la cantidad de Menciones seleccionadas para el curso.
		function valCHKMenciones()
		{
			var y = 0;
			var frm = document.forms[0];
			for (i=0; i<=(frm.length-1); i++) 
			{
				if (frm.elements[i].id.indexOf('chkMencion_') != -1) 
				{
					if(frm.elements[i].checked)
					{
						document.getElementById('spValCHKMenciones').innerHTML = '';
						document.getElementById('spValCHKMenciones').style.display = 'none';
						return true;
					}
				}
			}
			// Si llegamos aquí es porque no se ha seleccionado ninguna mención, 
			// advertimos del error al usuario.
			var strErrorMessage = "Los temas de proyecto deben estar destinados al menos a una mención, por tanto, selecciónela(s) debidamente.";
			document.getElementById('spValCHKMenciones').innerHTML = strErrorMessage;
			document.getElementById('spValCHKMenciones').style.display = 'block';
			return false;
		}
		
		function markCHKMencion(chkObject)
		{
			if(chkObject.checked)
			{
				chkObject.checked=false;
			}
			else
			{
				chkObject.checked=true;
			}
			//valCHKMenciones();
		}

		function getHTMLMenciones(Id)
		{			
			if(Id==null || Id==0)
			{
				var res = ISPCFG.Msce.clswfTema_proyecto.getMencionesForNuevo();
			}
			else
			{
				var res = ISPCFG.Msce.clswfTema_proyecto.getMencionesForEdit(Id);
			}
			var strHTML = '';
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			if(res.value==null)
			{
				boError = true;
			}
			if(boError)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Ha ocurrido un error mientras se intentaba obtener la lista de las menciones.");
				res=null;
				return;
			}
			if(res.value.length==0)
			{
				disableForm();
				res=null;
				return;
			}
			var intWidth = 0;
			var Menciones = res.value;
			for(x=0; x<=(Menciones.length-1); x++)
			{
				var checked = Menciones[x].Selected==true?'checked':'';
				strHTML += "<span class=\"tinytext_N\" style=\"cursor: pointer;\" onclick=\"JavaScript:valCHKMenciones();\"><input id=\"chkMencion_" + x + "\" type=\"checkbox\" tabindex=\"-1\" class=\"frmCheckInput\" value=\"" + Menciones[x].Id + "\" " + checked + ">&nbsp;<label for=\"chkMencion_" + x + "\">" + Menciones[x].Nombre + "</label></span>&nbsp;&nbsp;";
				intWidth += Menciones[x].Nombre.length + 6;
				if(intWidth>=60)
				{
					strHTML += "<br>";
					intWidth=0;
				}
			}
			return strHTML;
		}
		
		function revertSelectionCHKMenciones()
		{
			var y = 0;
			var frm = document.forms[0];
			for (i=0; i<=(frm.length-1); i++) 
			{
				if(frm.elements[i].id.indexOf('chkMencion_') != -1) 
				{
					frm.elements[i].checked=!frm.elements[i].checked;
				}
			}
			document.getElementById('spValCHKMenciones').innerHTML = '';
			document.getElementById('spValCHKMenciones').style.display = 'none';
			valCHKMenciones();
		}
		
		function getCantMencionesWithValue()
		{
			var y = 0;
			var frm = document.forms[0];
			for (i=0; i<=(frm.length-1); i++) 
			{
				if (frm.elements[i].id.indexOf('chkMencion_') != -1) 
				{
					if(frm.elements[i].checked){y++};
				}
			}
			return y;
		}
		
		function processMencionesWithValue(Menciones)
		{
			var y=0;
			var frm = document.forms[0];
			for (i=0; i<=(frm.length-1); i++) 
			{
				if (frm.elements[i].id.indexOf('chkMencion_') != -1) 
				{
					if(frm.elements[i].checked)
					{
						Menciones[y].Id = frm.elements[i].value;
						y++;
					}
				}
			}
			return Menciones;
		}

		/*
			VARIABLES LOCALES DE ESTA PÁGINA		
		*/	
		var strMode = 'Lista'; // Los valores pueden ser: 'Lista', 'Editar', 'Nuevo' y 'Disabled'.
		var IdEditado; // Para saber cual es el Id del módulo que se está editando.

		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		getAllTemasProyecto();
		setButtomsVisibility();

		
		//-->
		</script>

	</body>
</html>
