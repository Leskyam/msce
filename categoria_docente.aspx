<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Page language="c#" Codebehind="categoria_docente.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfCategoria_docente" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Categoría docente</title>
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
		<form id="frm_Mencion" method="post" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">CATEGORÍAS DOCENTES</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Edit" width="80%" align="center" border="0" style="DISPLAY: none">
																<!-- Nombre -->
																<tr valign="bottom">
																	<td align="left" colspan="1" rowspan="1">Nombre: </td>
																	<td align="right"><span id="spLeftCharsNombre" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2"><input class="frmTextInput" id="txtNombre" onkeydown="JavaScript:document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 150);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombre'), 'El campo \'Nombre\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 150);" style="WIDTH: 100%" type="text"><span class="spErrorNotification" id="spValNombre"></span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td></tr></table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="80%" align="center" border="0">
																<tr valign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left">
																		</span></td>
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
																		<div id="dvListaCategoriasDocentes">
																		</div></td></tr></table></td></tr></table></td></tr></table>
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
			var validNombre = valEmptyString(document.getElementById('txtNombre'), document.getElementById('spValNombre'), "El campo \"Nombre\" no puede estar vacío.");
			return validNombre;
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
				default:
				{
					btnNuevo.style.display='inline';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
				}
			}
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
			document.getElementById('trCategoriaDocente'+Id).style.display='none';
			IdEditado = Id;
			document.body.scrollTop = 0;
			document.getElementById('txtNombre').value = document.getElementById('Nombre'+Id).innerHTML;
			document.getElementById('txtNombre').focus();
		}
		
		// LLENA LOS DATOS QUE CORRESPONDEN A LA PÁGINA.
		function getAllCategoriasDocentes()
		{
			// Obtener los datos de los módulos.
			var dvCategoriasDocentes = ISPCFG.Msce.clswfCategoria_docente.getAllCategoriasDocentes().value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaCategoriasDocentes = document.getElementById('dvListaCategoriasDocentes')
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvCategoriasDocentes.Rows.length==0)
			{
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaCategoriasDocentes.innerHTML = "<b>NO EXISTEN CATEGORÍAS DOCENTES REGISTRADAS.</b>";
				Nuevo();
				dvCategoriasDocentes = null;
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
					strHTML_Header += "\t\t<td align=\"left\" width=\"80%\"><b>Nombre</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvCategoriasDocentes.Rows.length-1); ++i)
			{
				var Id = dvCategoriasDocentes.Rows[i].Id;
				var Nombre = dvCategoriasDocentes.Rows[i].Nombre;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"trCategoriaDocente" + Id + "\" valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td width=\"20%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td width=\"80%\" id=\"Nombre" + Id + "\">" + Nombre + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			strHTML_Foot = "</table>\n";
			divListaCategoriasDocentes.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			setButtomsVisibility();
			dvCategoriasDocentes=null; 
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
			document.getElementById('txtNombre').value='';
			document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtNombre'), 150);
			document.getElementById('txtNombre').focus();
		}
		
		function resetAllValMessages()
		{	
			document.getElementById('spValNombre').innerHTML = '';
			document.getElementById('spValNombre').style.display = 'none';
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
				if(document.getElementById('trCategoriaDocente'+IdEditado)!=null)
				{
					document.getElementById('trCategoriaDocente'+IdEditado).style.display='';
				}
			}
			// Hacer invisible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';
		}
				
		function Cancelar()
		{
			stopEditing();
			strMode = 'default';
			setButtomsVisibility();
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
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
			var CategoriaDocente = ISPCFG.Msce.clswfCategoria_docente.getCategoriaDocenteClass().value;
			if(CategoriaDocente==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos de la categoría docente. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				return;
			}
			// Obtener los valores de los campos.
			CategoriaDocente.Nombre = document.getElementById('txtNombre').value;
			
			if(strMode=='Nuevo')
			{
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando categoría docente...';
				ISPCFG.Msce.clswfCategoria_docente.Agregar(CategoriaDocente, Actualizar_CallBack);
				CategoriaDocente = null;
				return;
			}
			if(strMode=='Editar')
			{
				CategoriaDocente.Id = IdEditado;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando categoría docente...';
				ISPCFG.Msce.clswfCategoria_docente.Actualizar(CategoriaDocente, Actualizar_CallBack);
				CategoriaDocente = null;
			}
		}

		function Actualizar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strMode=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar la categoría docente. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos de la categoría docente. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
				}
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos de la categoría docente, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
				}
				else
				{
					stopEditing();
					getAllCategoriasDocentes();
					strMode = 'default';
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

			var res = ISPCFG.Msce.clswfCategoria_docente.canBeDeleted(Id);
			if(res.value==null)
			{
				var strErrorMessage = "No se pudo comprobar si esta categoría docente puede ser eliminada.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = ISPCFG.Msce.clswfCategoria_docente.WhyCanNotBeDeleted(Id).value;
				if(strWarning!=null)
				{
					// Ciclo para mostrar los errores.
					for(x=0; x<=(strWarning.length-1); x++)
					{
						boOmitirCloseButton = (x==(strWarning.length-2));
						ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Esta categoría docente no puede ser eliminada por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
					}
					res = null;
					strWarning = null;
					return;
				}
				else
				{
					var strErrorMessage = "No se han podido obtener las causas que impiden eliminar esta categoría docente.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				}				
			}
			else
			{
				if(!window.confirm("Se eliminarán los datos de la categoría docente seleccionada.")){return;}
				ISPCFG.Msce.clswfCategoria_docente.Eliminar(Id, Eliminar_CallBack);
				res = null;
			}
		}
		
		function Eliminar_CallBack(res)
		{
			if(res.error!=null)
			{
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar la categoría docente. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = "Estimado usuario, no se ha podido eliminar la categoría docente, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				getAllCategoriasDocentes();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Categoría docente eliminada.';
			}
		}
		
		
		/*
			VARIABLES LOCALES DE ESTA PÁGINA		
		*/	
		var strMode = 'Lista'; // Los valores pueden ser: 'Lista', 'Editar' y 'Nuevo'.
		var IdEditado; // Para saber cual es el Id del módulo que se está editando.

		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		getAllCategoriasDocentes();
		
		//-->
		</script>



	</body>
</html>
