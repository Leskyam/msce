<%@ Page language="c#" Codebehind="editar_bibliografia.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfEditarBibliografia" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Editar bibliografía</title>
		<meta content="False" name="vs_showGrid">
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
		<form id="frm_EditarBibliografia" method="post" enctype="multipart/form-data" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">EDITAR
													BIBLIOGRAFÍA</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="center" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LA BIBLIOGRAFÍA -->
															<table id="tbl_Edit" style="DISPLAY: block" width="100%" align="center" border="0">
																<!-- txtTitulo -->
																<tr valign="middle">
																	<td align="left" width="70"><label for="txtTitulo">Título:</label> </td>
																	<td align="left" width="475"><input class="frmTextInput" id="txtTitulo" style="WIDTH: 100%" type="text"></td></tr>
																<!-- chkMiAutoria -->
																<tr valign="bottom">
																	<td align="left" colspan="2"><input class="frmCheckInput" id="chkMiAutoria" onclick="JavaScript:if(this.checked==true){txtAutores.className='frmTextInput_disabled';txtAutores.readOnly=txtAutores.disabled=true;}else{txtAutores.className='frmTextInput';txtAutores.readOnly=txtAutores.disabled=false;}" type="checkbox"><label for="chkMiAutoria" style="cursor: pointer;">Esta
																			bibliografía es de mi autoría</label> </td></tr>
																<!-- txtAutores -->
																<tr valign="top">
																	<td align="left"><label for="txtAutores">Autor(es):
																		</label></td>
																	<td align="right"><span id="spLeftCharsAutores" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2"><textarea class="frmTextInput" id="txtAutores" onkeydown="JavaScript:document.getElementById('spLeftCharsAutores').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" onkeyup="JavaScript:document.getElementById('spLeftCharsAutores').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" style="WIDTH: 100%" onchange="JavaScript:valEmptyString(this, document.getElementById('spValAutores'), 'El campo \'Autor(es)\' no puede estar vacío.');"></textarea><span class="spErrorNotification" id="spValAutores"></span> </td></tr>
																<tr>
																	<td colspan="2">
																		<!-- TABLA PARA LAS OPCIONES DE TIPO -->
																		<table width="100%" border="0">
																			<!-- optTipo -->
																			<tr valign="top">
																				<td align="left" width="50%"><label><b>Tipo de
																							bibliografía:</b>&nbsp;</label><br><input id="optTipoBasica" type="radio" checked value="1" name="optTipo"><label for="optTipoBasica" style="cursor: pointer;">Básica</label><br><input id="optTipoComplementaria" type="radio" value="2" name="optTipo"><label for="optTipoComplementaria" style="cursor: pointer;">Complementaria</label>
																				</td>
																				<!-- optTipoContenido -->
																				<td align="left" width="50%"><label><b>Tipo de
																							contenido:</b>&nbsp;</label><br><input id="optTipoAudiovisual" type="radio" value="1" name="optTipoContenido"><label for="optTipoAudiovisual" style="cursor: pointer;">Audiovisual</label><br><input id="optTipoCD" type="radio" value="2" name="optTipoContenido"><label for="optTipoCD" style="cursor: pointer;">CDs</label><br><input id="optTipoDocumento" type="radio" checked value="3" name="optTipoContenido"><label for="optTipoDocumento" style="cursor: pointer;">Documento</label>
																				</td></tr></table>
																		<!-- FIN DE LA TABLA PARA LAS OPCIONES DE TIPO --></td></tr>
																<!-- TR para la selección de o los temas a los que pertenece la bibliografía. -->
																<tr valign="middle">
																	<td align="left" colspan="2">
																		<label><b>Selección de temas</b></label>&nbsp;&nbsp;
																		<input class="frmCheckInput" id="chkTodosTemas" type="checkbox" name="chkTodosTemas" onclick="JavaScript:this.checked==true?document.getElementById('dvWrapperTemaSelector').style.display='none':document.getElementById('dvWrapperTemaSelector').style.display='block';"><label for="chkTodosTemas" style="cursor: pointer;">Aplicable
																			para todos los temas</label>
																		<div id="dvWrapperTemaSelector" style="border-right: lightgrey 1px solid; padding-right: 2px; border-top: lightgrey 1px solid; padding-left: 2px; padding-bottom: 2px; border-left: lightgrey 1px solid; padding-top: 2px; border-bottom: lightgrey 1px solid">
																			<table width="90%" border="0">
																				<tr>
																					<td nowrap colspan="3"><label for="cboCurso">Curso</label>&nbsp;<select class="frmTextInput" id="cboCurso" onchange="JavaScript:fillListaTemas(this.value, 0);"></select></td>
																				</tr>
																				<tr>
																					<td valign="top"><label for="listTemas">Temas del curso</label><br><select class="frmTextInput" id="listTemas" multiple style="width: 150" ondblclick="JavaScript:addToTemaSelection();"></select></td>
																					<td valign="middle" align="center" nowrap>&nbsp;<-->&nbsp;</td>
																					<td valign="top"><label for="listTemasSeleccionados">Temas seleccionados</label><br><select class="frmTextInput" id="listTemasSeleccionados" multiple style="width: 300" ondblclick="JavaScript:deleteFromTemaSelection();"></select></td></tr>
																				<tr>
																					<td><a title="Agregar los temas seleccionados a la lista." href="JavaScript:addToTemaSelection();">Agregar
																							a la lista</a></td>
																					<td valign="middle" align="center"></td>
																					<td><a title="Eliminar todos los temas seleccionados de la lista." href="JavaScript:clearTemaSelection();">Cancelar
																							selección</a></td></tr></table></div></td></tr>
																<!-- TR para incrustar los elementos para la selección de ficheros para hacer uploads -->
																<tr valign="bottom">
																	<td align="left" colspan="2"><input class="frmCheckInput" id="chkEnableFileUpload" onclick="JavaScript:this.checked==true?document.getElementById('dvWrapperFileBrowser').style.display='block':document.getElementById('dvWrapperFileBrowser').style.display='none';" type="checkbox"><label for="chkEnableFileUpload" style="cursor: pointer;">
																			Habilitar envío de fichero(s)</label></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<div id="dvWrapperFileBrowser" style="PADDING-RIGHT: 5px; DISPLAY: none; PADDING-LEFT: 5px; BACKGROUND: #eee; PADDING-BOTTOM: 5px; MARGIN: 0px; PADDING-TOP: 5px"><input class="frmTextInput" id="element_input" size="50" type="file" name="file_1" runat="server"><br>
																			<div id="files_list" style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: black 1px solid; PADDING-LEFT: 5px; FONT-SIZE: 7pt; BACKGROUND: #fff; PADDING-BOTTOM: 5px; BORDER-LEFT: black 1px solid; PADDING-TOP: 5px; BORDER-BOTTOM: black 1px solid">
																				<div id="files_list_header">Files (maximum
																					3):</div></div></div>
																		<script src="includes/multifile.js"></script>
																	</td></tr>
																<!-- Separador -->
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
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
																		<div id="dvListaSedes"></div></td></tr></table></td></tr></table></td></tr></table>
									<!-- MAIN WINDOW; END --></td></tr></table>
						<!-- BODY TABLE; END --></td></tr></table></form><!-- PAGE TABLE; END -->
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

		function Nuevo()
		{
			alert("Esta funcionalidad no está implementada aún...");
			return;
		}

		function Cancelar()
		{
			alert("Esta funcionalidad no está implementada aún...");
			return;
		}

		function Actualizar()
		{
			alert("Esta funcionalidad no está implementada aún...");
			return;
			if(document.getElementById('chkEnableFileUpload').checked==true)
			{
				document.forms["frm_EditarBibliografia"].submit();
			}
		}
				
		// Llenar el cbo de los módulos-cursos
		function fillCboCurso()
		{
			var res = ISPCFG.Msce.clswfEditarBibliografia.getListaCursos()
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los cursos registrados.");
				res=null
				return;
			}
			
			var refCboCurso = document.getElementById('cboCurso');
			refCboCurso.options.length = 0; // reiniciar la lista de opciones.
			dataView = res.value;  
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				refCboCurso.options[refCboCurso.options.length] = new Option(dataView.Rows[i].Modulo + ": " + getAbr(dataView.Rows[i].Nombre,60), dataView.Rows[i].Id);
			}
			res=null;			
		}

		// Llenar la lista de Temas de donde seleccionar.
		function fillListaTemas(IdCurso, IdTema)
		{
			var res = ISPCFG.Msce.clswfEditarBibliografia.getListaTemas(IdCurso);
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
			var list = document.getElementById('listTemas');
			// Limpiar la lista anterior.
			list.options.length = 0;
			// Si no existen registros mandar a desabilitar el formulario.
			if(dataView.Rows.length==0)
			{
				list.options[list.options.length] = new Option("Este curso no tiene temas", 0);
				list.disabled = true;
				return;
			}
			list.disabled = false;
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				list.options[list.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
			}
			return true;
			res=null;			

			// Establecer el valor de selectedIndex del cboMencion para que 
			// se corresponda con el grupo que se esté editando.
			//if(strMode=='Editar'||strMode=='Nuevo'){setIndexInCboTema(IdTema);}
		}
		
		function clearTemaSelection()
		{
			document.getElementById('listTemasSeleccionados').options.length = 0;
		}
		
		function addToTemaSelection()
		{
			var listSource = document.getElementById('listTemas');
			var listTarget = document.getElementById('listTemasSeleccionados');
			var cboCursoTexto = document.getElementById('cboCurso').options[document.getElementById('cboCurso').selectedIndex].text;
			var Modulo = cboCursoTexto.substring(0,cboCursoTexto.indexOf(":",0)+1);
			var IdCurso = document.getElementById('cboCurso').value;
			for(i=0; i<=(listSource.options.length-1); i++)
			{
				if(listSource.options[i].selected==true)
				{
					//alert("VALOR: " + listSource.options[i].value + " TEXTO: " + listSource.options[i].text);
					var valor = listSource.options[i].value;
					var texto = listSource.options[i].text;
					if(!existSelectedTema(valor))
					{
						listTarget.options[listTarget.options.length] = new Option(Modulo + " Curso: " + IdCurso + " " + texto, valor);
					}
				}
			}
			listSource.selectedIndex = -1;
		}
		
		function deleteFromTemaSelection()
		{
			var list = document.getElementById('listTemasSeleccionados');
			for(i=0; i<=(list.options.length-1); i++)
			{
				if(list.options[i].selected==true)
				{
					//var valor = listSource.options[i].value;
					//var texto = listSource.options[i].text;
					if(msie==true)
					{
						list.options.remove(i);
					}
					else
					{
						list.options.item(i).remove;
					}
				}
			}
		}
		
		/*
			Comprueba si ya está seleccionado el tema cuyo 
			Id se pasa como valor del parámetro "IdTema".
		*/
		function existSelectedTema(IdTema)
		{
			var list = document.getElementById('listTemasSeleccionados');
			for(i=0; i<=(list.options.length-1); i++)
			{
				if(list.options[i].value==IdTema){return true;}
			}
			return false;
		}
		
		function disableForm()
		{
			alert("Deshabilitar webForm");
		}


		/*
			INICIALIZAR ESTE WEBFORM.
		*/
		//-->
		
		fillCboCurso();
		fillListaTemas(document.getElementById('cboCurso').value,0);
		</script>
		</TR></TBODY></TABLE>

	</body>
</html>
