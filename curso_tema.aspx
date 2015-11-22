<%@ Page language="c#" Codebehind="curso_tema.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfCurso_tema" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Cursos y sus temas</title>
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
		<form id="frm_Cursos_Temas" method="post" runat="server">
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
									<!-- Control Web para las opciones de la izquierda -->
									<uc1:wucleftoptions id="ctlLeftOptions" runat="server"></uc1:wucleftoptions>
								</td>
								<td> <!-- MAIN WINDOW; BEGIN -->
									<table id="Table4" cellspacing="0" cellpadding="0" width="545" border="0">
										<tr valign="top">
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="tit_Maestria_A" id="spHeaderTabName">CURSOS</span>
											</td>
										</tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="545" border="0">
													<tr>
														<td id="td_body_bg" valign="top" height="320">
															<!-- COMIENZO DEL CUERPO PARA LAS OPCIONES DE CURSOS Y DE TEMAS -->
															<span style="MARGIN-LEFT: 5px; MARGIN-RIGHT: 5px">
																<span id="spTabCursos" onclick="JavaScript:setTab(this);">Cursos</span>
																<span id="spTabTemas" onclick="JavaScript:setTab(this);">Temas</span>
															</span>
															<!-- OPCIONES PARA EL CUERPO DEL TAB "CURSOS" -->
															<div id="spTabCursosBody" class="spTabBody">
																<!-- TABLA PARA LA SELECCIÓN DEL MÓDULO AL QUE PERTENECE EL CURSO -->
																<table border="0" width="90%" id="tbl_ListaModulos" align=center>
																	<tr valign="top">
																		<td>Módulo:&nbsp;</td>
																		<td><select id="cboModulo" class="frmTextInput" onchange="JavaScript:cboModuloChange(this);"></select>&nbsp;</td>
																		<td width="100%"><span id="spModuloName" style="COLOR: #47639a; TEXT-ALIGN: right"></span></td>
																	</tr>
																</table>
																<!-- ENVOLTURA PARA LOS CONTROLES DE EDICIÓN DEL CURSO -->
																<div id="dvWrapperEditaCurso" style="DISPLAY: none">
																	<table border="0" width="90%" align=center>
																		<tr valign="bottom">
																			<td>Nombre:</td>
																			<td align="right">
																				<span id="spLeftCharsCursosNombre" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																					restantes:</span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2">
																				<textarea id="txtAreaCursosNombre" class="frmTextInput" onkeydown="JavaScript:document.getElementById('spLeftCharsCursosNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 150);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValCursosNombre'), 'El campo \'Nombre\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsCursosNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 150);" style="WIDTH: 100%" rows="2"></textarea>
																				<span class="spErrorNotification" id="spValCursosNombre"></span>
																			</td>
																		</tr>
																		<tr valign="bottom">
																			<td>Objetivo general:</td>
																			<td align="right">
																				<span id="spLeftCharsCursosObjetivo" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																					restantes:</span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2">
																				<textarea id="txtAreaCursosObjetivo" class="frmTextInput" onkeydown="JavaScript:document.getElementById('spLeftCharsCursosObjetivo').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValCursosObjetivo'), 'El campo \'Objetivo general\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsCursosObjetivo').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" style="WIDTH: 100%" rows="4"></textarea>
																				<span class="spErrorNotification" id="spValCursosObjetivo"></span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2">
																				<span id="spSelectAll">Menciones:&nbsp;&nbsp;<a href="JavaScript:revertSelectionCHKMenciones();">Invertir selección</a></span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2" align="center">
																				<span id="spMenciones" style="WIDTH: 350px; TEXT-ALIGN: center"></span>
																				<span class="spErrorNotification" id="spValCHKMenciones" style="WIDTH: 100%; TEXT-ALIGN: left"></span>
																			</td>
																		</tr>
																	</table>
																</div>
																<!-- TABLA PARA LOS BOTONES DE ACCIONES Y PARA EL SPAN PARA INFORMAR DE LAS ACTUALIZACIONES -->
																<table border="0" width="90%" id="tbl_Botones" align=center>
																	<tr valign="top">
																		<td colspan="2" height="1">
																			<hr width="100%" color="#47639a" size="1"></hr>
																		</td>
																	</tr>
																	<tr>
																		<td><span id="spEstadoCursos"></span></td>
																		<td align="right">
																			<a id="lnkNuevoCurso" title="Agregar un nuevo curso." href="JavaScript:Nuevo();"><img id="imgNuevoCurso" title="Agregar un nuevo curso." alt="Nuevo" src="imagenes/btn_nuevo.gif" border="0"></a>
																			<a id="lnkActualizarCurso" title="Actualizar modificación." href="JavaScript:ActualizarCurso();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																			<a id="lnkCancelarCurso" title="Cancelar" href="JavaScript:Cancelar();">&nbsp;<img id="imgCancelarCurso" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																		</td>
																	</tr>
																</table>
																<!-- FIN DE LA TABLA PARA LOS BOTONES DE ACCIONES Y PARA EL SPAN PARA INFORMAR DE LAS ACTUALIZACIONES -->
																<!-- ENVOLTURA PARA LA LISTA DE LOS CURSOS -->
																<div id="dvWrapperListaCursos" style="display: none;">
																	<table border="0" width="90%" align=center>
																		<tr valign="top">
																			<td colspan="2" height="1">
																				<hr width="100%" color="#47639a" size="1"></hr>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<div id="dvListaCursos">
																				</div>
																			</td>
																		</tr>
																	</table>
																</div>
															</div>
															<!-- FIN DE LAS OPCIONES PARA EL CUERPO DEL TAB "Cursos" -->
															<!-- COMIENZO DE LAS OPCIONES PARA EL CUERPO DEL TAB "Temas"-->
															<div id="spTabTemasBody" class="spTabBody">
																<!-- TABLA PARA LA SELECCIÓN DEL CURSO AL QUE PERTENECE EL TEMA -->
																<table border="0" width="90%" align=center>
																	<tr valign="top">
																		<td width="10%">Curso:</td>
																		<td width="90%">
																			<select id="cboCurso" class="frmTextInput" onchange="JavaScript:cboCursoChange(this);"></select>
																		</td>
																	</tr>
																</table>
																<!-- ENVOLTURA PARA LOS CONTROLES DE EDICIÓN DEL TEMA -->
																<div id="dvWrapperEditaTema" style="DISPLAY: none">
																	<table border="0" width="90%" align=center>
																		<tr valign="bottom">
																			<td>Nombre:</td>
																			<td align="right">
																				<span id="spLeftCharsTemasNombre" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																					restantes:</span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2">
																				<textarea id="txtAreaTemasNombre" class="frmTextInput" onkeydown="JavaScript:document.getElementById('spLeftCharsTemasNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 150);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValTemasNombre'), 'El campo \'Nombre\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsTemasNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 150);" style="WIDTH: 100%" rows="2"></textarea>
																				<span class="spErrorNotification" id="spValTemasNombre"></span>
																			</td>
																		</tr>
																		<tr valign="bottom">
																			<td>Objetivos generales:</td>
																			<td align="right">
																				<span id="spLeftCharsTemasObjGenerales" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																					restantes:</span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2">
																				<textarea id="txtAreaTemasObjGenerales" class="frmTextInput" onkeydown="JavaScript:document.getElementById('spLeftCharsTemasObjGenerales').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValTemasObjetivo'), 'El campo \'Objetivos generales\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsTemasObjGenerales').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 250);" style="WIDTH: 100%" rows="3"></textarea>
																				<span class="spErrorNotification" id="spValTemasObjetivo"></span>
																			</td>
																		</tr>
																		<tr valign="bottom">
																			<td>Actividades de aprendizaje:</td>
																			<td align="right">
																				<span id="spLeftCharsTemasActAprendizaje" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																					restantes:</span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2">
																				<textarea id="txtAreaTemasActAprendizaje" class="frmTextInput" onkeydown="JavaScript:document.getElementById('spLeftCharsTemasActAprendizaje').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValTemasActAprendizaje'), 'El campo \'Actividades de aprendizaje\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsTemasActAprendizaje').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" style="WIDTH: 100%" rows="4"></textarea>
																				<span class="spErrorNotification" id="spValTemasActAprendizaje"></span>
																			</td>
																		</tr>
																		<tr valign="bottom">
																			<td>Actividades de autoevaluación:</td>
																			<td align="right">
																				<span id="spLeftCharsTemasActAutoevaluacion" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																					restantes:</span>
																			</td>
																		</tr>
																		<tr valign="top">
																			<td colspan="2">
																				<textarea id="txtAreaTemasActAutoevaluacion" class="frmTextInput" onkeydown="JavaScript:document.getElementById('spLeftCharsTemasActAutoevaluacion').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValTemasActAutoevaluacion'), 'El campo \'Actividades de autoevaluación\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsTemasActAutoevaluacion').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" style="WIDTH: 100%" rows="4"></textarea>
																				<span class="spErrorNotification" id="spValTemasActAutoevaluacion"></span>
																			</td>
																		</tr>
																	</table>
																</div>
																<!-- FIN DE LA ENVOLTURA PARA LOS CONTROLES DE EDICIÓN DEL TEMA -->
																<!-- TABLA PARA LOS BOTONES DE ACCIONES Y PARA EL SPAN PARA INFORMAR DE LAS ACTUALIZACIONES EN EL TAB "Temas" -->
																<table border="0" width="90%" align=center>
																	<tr valign="top">
																		<td colspan="2" height="1">
																			<hr width="100%" color="#47639a" size="1"></hr>
																		</td>
																	</tr>
																	<tr>
																		<td><span id="spEstadoTemas"></span></td>
																		<td align="right">
																			<a id="lnkNuevoTema" title="Agregar un nuevo tema." href="JavaScript:Nuevo();"><img id="imgNuevoTema" title="Agregar un nuevo tema." alt="Nuevo" src="imagenes/btn_nuevo.gif" border="0"></a>
																			<a id="lnkActualizarTema" title="Actualizar modificación." href="JavaScript:ActualizarTema();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																			<a id="lnkCancelarTema" title="Cancelar" href="JavaScript:Cancelar();">&nbsp;<img id="imgCancelarTema" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																		</td>
																	</tr>
																</table>
																<!-- FIN DE LA TABLA PARA LOS BOTONES DE ACCIONES Y PARA EL SPAN PARA INFORMAR DE LAS ACTUALIZACIONES -->
																<!-- ENVOLTURA PARA LA LISTA DE LOS TEMAS -->
																<div id="dvWrapperListaTemas">
																	<table border="0" width="90%" align=center>
																		<tr valign="top">
																			<td colspan="2" height="1">
																				<hr width="100%" color="#47639a" size="1"></hr>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<div id="dvListaTemas">
																				</div>
																			</td>
																		</tr>
																	</table>
																</div>
																<!-- FIN DE LA ENVOLTURA PARA LA LISTA DE LOS TEMAS -->
															</div>
															<!-- FIN DEL CUERPO PARA LAS OPCIONES DE CURSOS Y DE TEMAS -->
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<!-- MAIN WINDOW; END --> </td></tr></table>
						<!-- BODY TABLE; END --> </td></tr></table></form>
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
			COMIENZO DE LOS PROCEDIMIENTOS PARA EL TAB "CURSOS" 
		*/
			
		// Llenar el cbo de los módulos
		function fillCboModulo()
		{
			var refCboModulo = document.getElementById('cboModulo');
			if(refCboModulo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfCurso_tema.getListaModulos()
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los módulos registrados.");
					res=null;
					return;
				}
				
				dataView = res.value;  
				res=null;			
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCboModulo.options[refCboModulo.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
					refCboModulo.options[refCboModulo.options.length-1].title = dataView.Rows[i].NombreCompleto;
				}
			}
			if(refCboModulo.options.length>0){document.getElementById('spModuloName').innerHTML = refCboModulo.options[refCboModulo.selectedIndex].title};
			return true;
		}
		
		// Obtener los registros de los cursos que le corresponden 
		// al módulo seleccionado en el cboModulo.
		function getAllCursos()
		{
			// Si no hay módulos en la lista no se pueden recuperar los cursos.
			// Probablemente no existan módulos registrados.
			if(document.getElementById('cboModulo').options.length==0){return;}

			var res = ISPCFG.Msce.clswfCurso_tema.getAllCursos(document.getElementById('cboModulo').value);
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de cursos que le pertenecen al módulo seleccionado.");
				res=null;
				return;
			}
			
			dataView = res.value;
			if(dataView.Rows.length==0)
			{
				Nuevo();
				document.getElementById('dvListaCursos').innerHTML = "<b>NO EXISTEN CURSOS REGISTRADOS PARA EL MÓDULO SELECICONADO.</b>";
				return;
			}

			// Habilitar el TAB "TEMAS" porque existen temas registrados.
			document.getElementById('spTabTemas').style.display = 'inline';
			
			// HTML para el encabezado de la tabla de lista de los cursos del módulo seleccionado.
			var	strHTML_Header	= "<!-- ESTE ES EL ENCABEZADO -->\n";
					strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td width=\"20%\"><b>Acciones<b></td>\n";
					strHTML_Header += "\t\t<td width=\"80%\"><b>Nombre</b></td>\n";
					strHTML_Header += "\t</tr>\n";
					strHTML_Header += "\t<!-- FIN DEL ENCABEZADO -->\n";

			var strHTML_Body = "";
			
			var strHTML_Foot = "</table>\n";
			
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				//alert("ID: " + dataView.Rows[i].Id + "\nID_MODULO: " + dataView.Rows[i].Id_Modulo + "\nNOMBRE: " + dataView.Rows[i].Nombre + "\nOBJETIVO GENERAL: " + dataView.Rows[i].ObjetivoGeneral); 
				var Id = dataView.Rows[i].Id;
				var IdModulo = dataView.Rows[i].Id_Modulo;
				var Nombre = dataView.Rows[i].Nombre;
				var ObjetivoGeneral = dataView.Rows[i].ObjetivoGeneral;
				
				//strHTML_Body += "\t<!-- ESTO ENTRA DENTRO DEL CICLO QUE RECORRE LOS REGISTROS -->\n";
				strHTML_Body += "\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t<td rowspan=\"3\" width=\"20%\">\n";
				strHTML_Body += "\t\t\t<a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;\n";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t\t<td rowspan=\"1\" width=\"80%\">\n";
				strHTML_Body += "\t\t\t<span id=\"Nombre" + Id + "\">" + Nombre + "</span>\n";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t</tr>\n";
				strHTML_Body += "\t<tr>\n";
				strHTML_Body += "\t\t<td>\n";
				strHTML_Body += "\t\t\t<div id=\"dvObjetivoAbr" + Id + "\" style=\"cursor: pointer;\" onclick=\"JavaScript:if(document.getElementById('ObjetivoGeneral" + Id + "').style.display=='none'){document.getElementById('imgAbrCursoObjetivo" + Id + "').src='imagenes/minus.gif';document.getElementById('ObjetivoGeneral" + Id + "').style.display='block';} else {document.getElementById('imgAbrCursoObjetivo" + Id + "').src='imagenes/plus.gif';document.getElementById('ObjetivoGeneral" + Id + "').style.display='none';}\">";
				strHTML_Body += "<img id=\"imgAbrCursoObjetivo" + Id + "\" src=\"imagenes/plus.gif\" border=\"0\">&nbsp;" + getAbr(ObjetivoGeneral,50) + "</div>\n";
				strHTML_Body += "<div id=\"ObjetivoGeneral" + Id + "\" style=\"display: none;\">" + ObjetivoGeneral + "</div>\n";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t</tr>\n";
				strHTML_Body += "\t<tr>\n";
				strHTML_Body += "\t\t<td>\n";
				strHTML_Body += "Menciones: " + ISPCFG.Msce.clswfCurso_tema.getSctringMenciones(Id).value + ".";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t</tr>\n";
				// ESCRIBIR ESTE <tr> SÓLO SI NO ES EL ÚLTIMO REGISTRO, PARA QUE NO DESLUZCA.
				if(i<dataView.Rows.length-1)
				{
					strHTML_Body += "\t<tr>\n";
					strHTML_Body += "\t\t<td colspan=\"2\"><hr width=\"100%\" class=\"hr_SeparatorRecord\" size=\"1\"></hr></td>\n";
					strHTML_Body += "\t</tr>\n";
				}
			}
			document.getElementById('dvListaCursos').innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			res=null;
		}

		/*
			Actualiza la lista de los registros del tab "CURSOS"
			según el Módulo seleccionado en el cboModulo.
		*/
		function cboModuloChange(sender)
		{
			if(sender.options.length==0){return;}
			var spanModuloName = document.getElementById('spModuloName');
			spanModuloName.innerHTML = sender.options[sender.selectedIndex].title;
			// Establecer la notoficación de actualización en proceso.
			document.getElementById('spEstadoCursos').innerHTML = '';
			if(strActiveOperation=='Listar')
			{
				getAllCursos();
			}
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
		
		// Actualizar los datos del curso en edición.
		function ActualizarCurso()
		{
			document.getElementById('spEstadoCursos').innerHTML = '';
			// Si no son válidos los datos, entonces retornar.
			if(!valDocument()){return;}
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Establecer la notoficación de actualización en proceso.
			document.getElementById('spEstadoCursos').innerHTML = 'Actualización en proceso...';
			
			// Obtener la clase clsCurso.
			var res = ISPCFG.Msce.clswfCurso_tema.getCursoClass(getCantMencionesWithValue());
			if(res.value==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del curso. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoCursos').innerHTML = '';
				res=null;
				return;
			}
			
			Curso = res.value;
			Curso.IdModulo = document.getElementById('cboModulo').value;
			Curso.Nombre = document.getElementById('txtAreaCursosNombre').value;
			Curso.ObjetivoGeneral = document.getElementById('txtAreaCursosObjetivo').value;
			Curso.Menciones = processMencionesWithValue(Curso.Menciones);
			
			if(strActiveOperation=='Nuevo')
			{
				ISPCFG.Msce.clswfCurso_tema.AgregarCurso(Curso, ActualizarCurso_CallBack);
				Curso = null;
				return;
			}
			if(strActiveOperation=='Editar')
			{
				Curso.Id = IdEditado;
				ISPCFG.Msce.clswfCurso_tema.ActualizarCurso(Curso, ActualizarCurso_CallBack);
				Curso = null;
				return;
			}
			
		}
						
		// Actualizar los datos del curso en edición.
		function ActualizarCurso_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strActiveOperation=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar el nuevo curso. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del curso. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
				}
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, strErrorMessage);
				document.getElementById('spEstadoCursos').innerHTML = '';
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos del curso, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
					document.getElementById('spEstadoCursos').innerHTML = '';
				}
				else
				{
					if(strActiveOperation=='Nuevo')
					{
						document.getElementById('txtAreaCursosNombre').value = '';
						document.getElementById('txtAreaCursosObjetivo').value = '';
						selectAllCHKMenciones();
						// Habilitar el TAB "TEMAS" porque se ha insertado uno nuevo.
						document.getElementById('spTabTemas').style.display = 'inline';
					}
					document.getElementById('spEstadoCursos').innerHTML = 'Actualización efectuada.';
				}
			}				
			res=null;
		}
		
		/*
			FIN DE LOS PROCEDIMIENTOS EL TAB "CURSOS"
		*/


		/*
			COMIENZO DE LOS PROCEDIMIENTOS EL TAB "TEMAS"
		*/
		
		// Llenar el cbo de los módulos
		function fillCboCurso()
		{
			var res = ISPCFG.Msce.clswfCurso_tema.getListaCursos()
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
				refCboCurso.options[refCboCurso.options.length] = new Option(dataView.Rows[i].Modulo + ": " + getAbr(dataView.Rows[i].Nombre,50), dataView.Rows[i].Id);
			}
			res=null;			
		}
		
		// Obtener los registros de los temas que le corresponden 
		// al módulo seleccionado en el cboModulo.
		function getAllTemas()
		{
			if(document.getElementById('cboCurso').options.length==0)
			{
				// Avisa que no esisten cursos registrados, por tanto no se pueden agregar temas.
				setTab(document.getElementById('spTabCursos'));
				document.getElementById('spEstadoCursos').innerHTML = 'Para registrar temas debe primero registrar los cursos.';
				return;
			}
			var res = ISPCFG.Msce.clswfCurso_tema.getAllTemas(document.getElementById('cboCurso').value);
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de tamas que le pertenecen al curso seleccionado.");
				res=null
				return;
			}
			
			dataView = res.value;
			if(dataView.Rows.length==0)
			{
				Nuevo();
				document.getElementById('dvListaTemas').innerHTML = "<b>NO EXISTEN TEMAS REGISTRADOS PARA EL CURSO SELECICONADO.</b>";
				return;
			}
			
			// HTML para el encabezado de la tabla de lista de los cursos del módulo seleccionado.
			var	strHTML_Header	= "<!-- ESTE ES EL ENCABEZADO -->\n";
					strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td width=\"20%\"><b>Acciones<b></td>\n";
					strHTML_Header += "\t\t<td width=\"80%\"><b>Nombre</b></td>\n";
					strHTML_Header += "\t</tr>\n";
					strHTML_Header += "\t<!-- FIN DEL ENCABEZADO -->\n";

			var strHTML_Body = "";
			
			var strHTML_Foot = "</table>\n";
			
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				//alert("ID: " + dataView.Rows[i].Id + "\nID_MODULO: " + dataView.Rows[i].Id_Modulo + "\nNOMBRE: " + dataView.Rows[i].Nombre + "\nOBJETIVO GENERAL: " + dataView.Rows[i].ObjetivoGeneral); 
				var Id = dataView.Rows[i].Id;
				var Nombre = dataView.Rows[i].Nombre;
				var ObjetivosGenerales = dataView.Rows[i].ObjetivosGenerales;
				var ActividadesAprendizaje = dataView.Rows[i].ActividadesAprendizaje;
				var ActividadesAutoevaluacion = dataView.Rows[i].ActividadesAutoevaluacion;
				//strHTML_Body += "\t<!-- ESTO ENTRA DENTRO DEL CICLO QUE RECORRE LOS REGISTROS -->\n";
				strHTML_Body += "\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t<td rowspan=\"2\" width=\"20%\">\n";
				strHTML_Body += "\t\t\t<a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;\n";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t\t<td rowspan=\"1\" width=\"80%\">\n";
				strHTML_Body += "\t\t\t<span id=\"dvNombreTemas" + Id + "\">" + Nombre + "</span>\n";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t</tr>\n";
				strHTML_Body += "\t<tr>\n";
				strHTML_Body += "\t\t<td>\n";
				strHTML_Body += "\t\t\t<div style=\"cursor: pointer;\" onclick=\"JavaScript:if(document.getElementById('dvObjGeneralesTema" + Id + "').style.display=='none'){document.getElementById('imgAbrObjGeneralesTema" + Id + "').src='imagenes/minus.gif';document.getElementById('dvObjGeneralesTema" + Id + "').style.display='block';}else{document.getElementById('imgAbrObjGeneralesTema" + Id + "').src='imagenes/plus.gif';document.getElementById('dvObjGeneralesTema" + Id + "').style.display='none';}\"><img id=\"imgAbrObjGeneralesTema" + Id + "\" src=\"imagenes/plus.gif\" border=\"0\">&nbsp;" + getAbr(ObjetivosGenerales, 50) + "</div>\n";
				strHTML_Body += "\t\t\t<div id=\"dvObjGeneralesTema" + Id + "\"  style=\"display: none; margin-left: 12px;\">" + ObjetivosGenerales + "</div>\n";
				strHTML_Body += "\t\t\t<div style=\"cursor: pointer;\" onclick=\"JavaScript:if(document.getElementById('dvActAprendizajeTema" + Id + "').style.display=='none'){document.getElementById('imgAbrActAprendizajeTema" + Id + "').src='imagenes/minus.gif';document.getElementById('dvActAprendizajeTema" + Id + "').style.display='block';}else{document.getElementById('imgAbrActAprendizajeTema" + Id + "').src='imagenes/plus.gif';document.getElementById('dvActAprendizajeTema" + Id + "').style.display='none';}\"><img id=\"imgAbrActAprendizajeTema" + Id + "\" src=\"imagenes/plus.gif\" border=\"0\">&nbsp;" + getAbr(ActividadesAprendizaje, 50) + "</div>\n";
				strHTML_Body += "\t\t\t<div id=\"dvActAprendizajeTema" + Id + "\"  style=\"display: none; margin-left: 12px;\">" + ActividadesAprendizaje + "</div>\n";
				strHTML_Body += "\t\t\t<div style=\"cursor: pointer;\" onclick=\"JavaScript:if(document.getElementById('dvActAutoevaluacionTema" + Id + "').style.display=='none'){document.getElementById('imgAbrActAutoevaluacionTema" + Id + "').src='imagenes/minus.gif';document.getElementById('dvActAutoevaluacionTema" + Id + "').style.display='block';}else{document.getElementById('imgAbrActAutoevaluacionTema" + Id + "').src='imagenes/plus.gif';document.getElementById('dvActAutoevaluacionTema" + Id + "').style.display='none';}\"><img id=\"imgAbrActAutoevaluacionTema" + Id + "\" src=\"imagenes/plus.gif\" border=\"0\">&nbsp;" + getAbr(ActividadesAutoevaluacion, 50) + "</div>\n";
				strHTML_Body += "\t\t\t<div id=\"dvActAutoevaluacionTema" + Id + "\"  style=\"display: none; margin-left: 12px;\">" + ActividadesAutoevaluacion + "</div>\n";
				strHTML_Body += "\t\t</td>\n";
				strHTML_Body += "\t</tr>\n";
				// ESCRIBIR ESTE <tr> SÓLO SI NO ES EL ÚLTIMO REGISTRO, PARA QUE NO DESLUZCA.
				if(i<dataView.Rows.length-1)
				{
					strHTML_Body += "\t<tr>\n";
					strHTML_Body += "\t\t<td colspan=\"2\"><hr width=\"100%\" class=\"hr_SeparatorRecord\" size=\"1\"></hr></td>\n";
					strHTML_Body += "\t</tr>\n";
				}
			}
			document.getElementById('dvListaTemas').innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			res=null;
		}
		
		/*
			Actualiza la lista de los registros del tab "TEMAS"
			según el Curso seleccionado en el cboCurso.
		*/
		function cboCursoChange(sender)
		{
			// Establecer la notoficación de actualización en proceso.
			document.getElementById('spEstadoTemas').innerHTML = '';
			if(strActiveOperation=='Listar')
			{
				getAllTemas();
			}
		}
		
		// Actualizar los datos del tema en edición.
		function ActualizarTema()
		{
			document.getElementById('spEstadoTemas').innerHTML = '';
			// Si no son válidos los datos, entonces retornar.
			if(!valDocument()){return;}
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Establecer la notoficación de actualización en proceso.
			document.getElementById('spEstadoTemas').innerHTML = 'Actualización en proceso...';
			// Obtener la clase clsCurso.
			var res = ISPCFG.Msce.clswfCurso_tema.getTemaClass();
			if(res.value==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del tema. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoTemas').innerHTML = '';
				res=null;
				return;
			}
			
			Tema = res.value;
			Tema.IdCurso = document.getElementById('cboCurso').value;
			Tema.Nombre = document.getElementById('txtAreaTemasNombre').value;
			Tema.ObjetivosGenerales = document.getElementById('txtAreaTemasObjGenerales').value;
			Tema.ActividadesAprendizaje = document.getElementById('txtAreaTemasActAprendizaje').value;
			Tema.ActividadesAutoevaluacion = document.getElementById('txtAreaTemasActAutoevaluacion').value;
			
			if(strActiveOperation=='Nuevo')
			{
				ISPCFG.Msce.clswfCurso_tema.AgregarTema(Tema, ActualizarTema_CallBack);
			}
			if(strActiveOperation=='Editar')
			{
				Tema.Id = IdEditado;
				ISPCFG.Msce.clswfCurso_tema.ActualizarTema(Tema, ActualizarTema_CallBack);
			}
			Tema = null;
		}
						
		// Actualizar los datos del tema en edición.
		function ActualizarTema_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strActiveOperation=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar el nuevo tema. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del tema. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
				}
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, strErrorMessage);
				document.getElementById('spEstadoTemas').innerHTML = '';
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos del tema, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
					document.getElementById('spEstadoTemas').innerHTML = '';
				}
				else
				{
					if(strActiveOperation=='Nuevo')
					{
						document.getElementById('txtAreaTemasNombre').value = '';
						document.getElementById('txtAreaTemasObjGenerales').value = '';
						document.getElementById('txtAreaTemasActAprendizaje').value = '';
						document.getElementById('txtAreaTemasActAutoevaluacion').value = '';
					}
					document.getElementById('spEstadoTemas').innerHTML = 'Actualización efectuada.';
					getAllTemas();
				}
			}				
			res=null;
		}

		/*
			FIN DE LOS PROCEDIMIENTOS EL TAB "TEMAS"
		*/


		/*
			PROCEDIMIENTOS COMUNES (PARA AMBOS TABs "CURSOS" Y "TEMAS"
		*/

		/*
			Activar o desactivar los TABs
			Recibe como parámetro el elemento sobre el cual se hizo click,
			actualiza el valor de la variable local (strActiveTab) que indica 
			en qué TAB estamos, oculta y muestra el TAB que corresponda y 
			actualiza el "Header" de esta página, donde le dice al usuario 
			qué opción está utilizando, si CURSOS ó TEMAS.
		*/ 
		function setTab(sender)
		{
			// Evitar que se ejecuten de manera innecesaria los procedimientos para el TAB 'Temas'
			if(strActiveTab==sender.innerHTML&strActiveTab=='Temas'){return;}
			// Establecer el indicados para saber en qué TAB estamos, los posibles valores son: Cursos ó Temas.
			strActiveTab = sender.innerHTML;
			// Establecer siempre la opción predeterminada al cambiar de TAB.
			strActiveOperation = 'Listar';
			// Establecer la visibilidad de los controles de lista o de edición.
			switchEditListView();
			// Establecer la visibilidad de los botones.
			setButtomsVisibility();
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Establecer la notoficación de actualización en proceso.
			document.getElementById('spEstado'+sender.innerHTML).innerHTML = '';

			for(x=0; x<=(aryTabsIds.length-1); x++)
			{
				if(aryTabsIds[x]!=sender.id)
				{
					document.getElementById(aryTabsIds[x]).className = 'spTabButtomOn';
					document.getElementById(aryTabsIds[x]+'Body').style.display='none';
				}
				else
				{
					document.getElementById(aryTabsIds[x]).className = 'spTabButtomOff';
					document.getElementById(aryTabsIds[x]+'Body').style.display='block';
				}
				document.getElementById('spHeaderTabName').innerHTML = sender.innerHTML.toUpperCase();
			}
			if(sender.innerHTML=='Cursos')
			{
				// No es necesario actualizar el cbo de los Módulos porque al inicio se carga.
				// fillCboModulo();
				// Actualizar la lista de los registros de los 
				// cursos que le corresponden al módulo seleccionado.
				getAllCursos();
			}
			else
			{
				// Actualizar el cbo de los cursos, porque quizás se ha 
				// agregado elguno en el TAB "CURSOS".
				fillCboCurso();
				// Actualizar también la lista de los registros de los 
				// temas que le corresponden al curso seleccionado.
				getAllTemas();
			}
		}
		
		// Eliminar registro.
		function Eliminar(Id)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			
			if(strActiveTab=='Cursos')
			{
				var res = ISPCFG.Msce.clswfCurso_tema.CanDeleteCurso(Id);
				if(res.value==null)
				{
					var strErrorMessage = "No se pudo comprobar si este curso puede ser eliminado.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					res = null;
					return;
				}
				if(res.value==false)
				{
					var strWarning = ISPCFG.Msce.clswfCurso_tema.WhyCanNotDeleteCurso(Id).value;
					if(strWarning!=null)
					{
						// Ciclo para mostrar los errores.
						for(x=0; x<=(strWarning.length-1); x++)
						{
							boOmitirCloseButton = (x==(strWarning.length-2));
							ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Esta curso no puede ser eliminado por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
						}
						res = null;
						strWarning = null;
						return;
					}
					else
					{
						var strErrorMessage = "No se han podido obtener las causas que impiden eliminar este curso.";
						ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					}				
				}
				else
				{
					if(!window.confirm("Se eliminarán los datos del curso seleccionado.")){return;}
					// Informar al usuario que comienza el proceso.
					document.getElementById('spEstadoCursos').innerHTML = 'Eliminando curso...';
					ISPCFG.Msce.clswfCurso_tema.EliminarCurso(Id, Eliminar_CallBack);
					res = null;
				}
			}
			else // Sucede cuando strActiveTab = 'Temas'
			{
				var res = ISPCFG.Msce.clswfCurso_tema.CanDeleteTema(Id);
				if(res.value==null)
				{
					var strErrorMessage = "No se pudo comprobar si este tema puede ser eliminado.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					res = null;
					return;
				}
				if(res.value==false)
				{
					var strWarning = ISPCFG.Msce.clswfCurso_tema.WhyCanNotDeleteTema(Id).value;
					if(strWarning!=null)
					{
						// Ciclo para mostrar los errores.
						for(x=0; x<=(strWarning.length-1); x++)
						{
							boOmitirCloseButton = (x==(strWarning.length-2));
							ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Esta tema no puede ser eliminado por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
						}
						res = null;
						strWarning = null;
						return;
					}
					else
					{
						var strErrorMessage = "No se han podido obtener las causas que impiden eliminar este tema.";
						ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					}				
				}
				else
				{
					if(!window.confirm("Se eliminarán los datos del tema seleccionado.")){return;}
					// Informar al usuario que comienza el proceso.
					document.getElementById('spEstadoTemas').innerHTML = 'Eliminando tema...';
					ISPCFG.Msce.clswfCurso_tema.EliminarTema(Id, Eliminar_CallBack);
					res = null;
				}
			}
		}
		
		// Eliminar registro
		function Eliminar_CallBack(res)
		{
			if(strActiveTab=='Cursos')
			{
				if(res.error!=null)
				{
					// Limpiar el área que informa del proceso al usuario.
					document.getElementById('spEstadoCursos').innerHTML = '';
					var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar el curso. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					res = null;
					return;
				}
				if(res.value==false)
				{
					// Limpiar el área que informa del proceso al usuario.
					document.getElementById('spEstadoCursos').innerHTML = '';
					var strWarning = "Estimado usuario, no se ha podido eliminar el curso, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
					res = null;
					return;
				}
				else
				{
					document.body.scrollTop = 0;
					document.getElementById('spEstadoCursos').innerHTML = 'Curso eliminado.';
					getAllCursos();
					res=null;
					return;
				}
			}
			else // Sucede cuando strActiveTab = 'Temas'
			{
				if(res.error!=null)
				{
					// Limpiar el área que informa del proceso al usuario.
					document.getElementById('spEstadoTemas').innerHTML = '';
					var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar el tema. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					res = null;
					return;
				}
				if(res.value==false)
				{
					// Limpiar el área que informa del proceso al usuario.
					document.getElementById('spEstadoTemas').innerHTML = '';
					var strWarning = "Estimado usuario, no se ha podido eliminar el tema, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
					res = null;
					return;
				}
				else
				{
					document.body.scrollTop = 0;
					document.getElementById('spEstadoTemas').innerHTML = 'Tema eliminado.';
					getAllTemas();
					res=null;
					return;
				}
			}
		}
		
		// Cancelar edición.	
		function Cancelar()
		{
			strActiveOperation = 'Listar';
			switchEditListView();
			setButtomsVisibility();
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));

			if(strActiveTab=='Cursos')
			{
				// Limpiar la zona de notificación de actualización.
				document.getElementById('spEstadoCursos').innerHTML = '';
				cboModuloChange(document.getElementById('cboModulo'));
				document.getElementById('txtAreaCursosNombre').value = '';
				document.getElementById('txtAreaCursosObjetivo').value = '';
				document.getElementById('spEstadoCursos').innerHTML = '';
			}
			else // Sucede cuando strActiveTab = 'Temas'
			{
				// Limpiar la zona de notificación de actualización.
				document.getElementById('spEstadoCursos').innerHTML = '';
				//cboCursoChange(document.getElementById('cboCurso'));
				document.getElementById('txtAreaTemasNombre').value = '';
				document.getElementById('txtAreaTemasObjGenerales').value = '';
				document.getElementById('txtAreaTemasActAprendizaje').value = '';
				document.getElementById('txtAreaTemasActAutoevaluacion').value = '';
				document.getElementById('spEstadoTemas').innerHTML = '';
			}	
		}

		// Altener entre las vistas de controles para editar 
		// y los de ver la lista de los registros.
		function switchEditListView()
		{
			if(strActiveTab=='Cursos')
			{	
				wrapperEdita = document.getElementById('dvWrapperEditaCurso');
				wrapperLista = document.getElementById('dvWrapperListaCursos');
			}
			else
			{
				wrapperEdita = document.getElementById('dvWrapperEditaTema')
				wrapperLista = document.getElementById('dvWrapperListaTemas');
			}
			
			switch(strActiveOperation)
			{
				case 'Nuevo':
				case 'Editar':
				{
				wrapperLista.style.display='none';
				wrapperEdita.style.display='block';
				break;
				}
				case 'Disabled':
				{
					document.getElementById('tbl_ListaModulos').style.display = 'none';
					document.getElementById('tbl_Botones').style.display = 'none';
					document.getElementById('spTabTemas').style.display = 'none';
					//break; // El break no se pone intencionalmente, porque aprovechamos el modo Listar para mostrar el mensaje.
				}
				// El predeterminado es 'Listar'
				default:
				{
				wrapperEdita.style.display='none';
				wrapperLista.style.display='block';
				}
			}
		}

		/*
			ESTABLECE LA VISIBILIDAD DE LOS BOTONES: Nuevo, Actualizar y Cancelar.
		*/
		function setButtomsVisibility()
		{
			// Hacer las referencias a los elementos indicados
			// según el tab activo.
			if(strActiveTab=='Cursos')
			{
				var btnNuevo = document.getElementById('lnkNuevoCurso');
				var btnActualizar = document.getElementById('lnkActualizarCurso');
				var btnCancelar = document.getElementById('lnkCancelarCurso');
			}
			else
			{
				var btnNuevo = document.getElementById('lnkNuevoTema');
				var btnActualizar = document.getElementById('lnkActualizarTema');
				var btnCancelar = document.getElementById('lnkCancelarTema');
			}
			
			// Se espera que la variables: strActiveOperation tenga uno de los  
			// siguientes valores: 'Listar', 'Editar', 'Nuevo' ó 'Disabled'.
			switch(strActiveOperation)
			{
				case 'Editar':
				case 'Nuevo':
				{
					btnNuevo.style.display = 'none';
					btnActualizar.style.display = 'inline';
					btnCancelar.style.display = 'inline';
					break;					
				}
				case 'Disabled':
				{
					btnNuevo.style.display = 'none';
					btnActualizar.style.display = 'none';
					btnCancelar.style.display = 'none';
					break;					
				}
				default:
				{
					btnNuevo.style.display = 'inline';
					btnActualizar.style.display = 'none';
					btnCancelar.style.display = 'none';
				}
			}
		}
		
		// Editar un registro.
		function Editar(Id)
		{
			// Establecer el modo de este webFrom.
			strActiveOperation = 'Editar';
			// Establecer el Id del elemento en edición, sea Curso ó Tema.
			IdEditado = Id;
			// Resetear todos los elementos para mensajes de validación.
			resetAllValMessages();
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Cambiar entre la opción de editar o listar.
			switchEditListView();
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Llevar el scroll a la parte superior.
			document.body.scrollTop = 0;
			
			if(strActiveTab=='Cursos')
			{
				document.getElementById('txtAreaCursosNombre').value = document.getElementById('Nombre'+Id).innerHTML;
				document.getElementById('txtAreaCursosObjetivo').value = document.getElementById('ObjetivoGeneral'+Id).innerHTML;
				// Mostrar las cantidades de caracteres restantes.
				document.getElementById('spLeftCharsCursosNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaCursosNombre'), 150);
				document.getElementById('spLeftCharsCursosObjetivo').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaCursosObjetivo'), 1000);
				document.getElementById('spMenciones').innerHTML = getHTMLMenciones(Id);
			
				// Establecer el enfoque para edición.
				document.getElementById('txtAreaCursosNombre').focus();
				// Limpiar el área que informa del proceso al usuario.
				document.getElementById('spEstadoCursos').innerHTML = '';
			}
			else // Sucede cuando strActiveTab=='Temas'
			{
				document.getElementById('txtAreaTemasNombre').value = document.getElementById('dvNombreTemas'+Id ).innerHTML;
				document.getElementById('txtAreaTemasObjGenerales').value = document.getElementById('dvObjGeneralesTema'+Id ).innerHTML;
				document.getElementById('txtAreaTemasActAprendizaje').value = document.getElementById('dvActAprendizajeTema'+Id ).innerHTML;
				document.getElementById('txtAreaTemasActAutoevaluacion').value = document.getElementById('dvActAutoevaluacionTema'+Id ).innerHTML;
				// Mostrar las cantidades de caracteres restantes.
				document.getElementById('spLeftCharsTemasNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasNombre'), 150);
				document.getElementById('spLeftCharsTemasObjGenerales').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasObjGenerales'), 250);
				document.getElementById('spLeftCharsTemasActAprendizaje').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasActAprendizaje'), 1000);
				document.getElementById('spLeftCharsTemasActAutoevaluacion').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasActAutoevaluacion'), 1000);
				// Limpiar el área que informa del proceso al usuario.
				document.getElementById('spEstadoTemas').innerHTML = '';
				// Establecer el enfoque para edición.
				document.getElementById('txtAreaTemasNombre').focus();
			}
		}
		
		function getHTMLMenciones(Id)
		{			
			if(Id==null || Id==0)
			{
				var res = ISPCFG.Msce.clswfCurso_tema.getMencionesForNuevo();
			}
			else
			{
				var res = ISPCFG.Msce.clswfCurso_tema.getMencionesForEdit(Id);
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
				/*
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Para que este formulario sea funcional deben estar registradas las <a href=\"mencion.aspx\">menciones</a> correspondientes.");
				*/
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
				
		// Nuevo registro.
		function Nuevo()
		{
			strActiveOperation = 'Nuevo';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			switchEditListView();
			setButtomsVisibility();
			if(strActiveTab=='Cursos')
			{
				// Limpiar el área que informa del proceso al usuario.
				document.getElementById('spEstadoCursos').innerHTML = '';
				document.getElementById('txtAreaCursosNombre').value='';
				document.getElementById('spLeftCharsCursosNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaCursosNombre'), 150);
				document.getElementById('txtAreaCursosObjetivo').value='';
				document.getElementById('spLeftCharsCursosObjetivo').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaCursosObjetivo'), 1000);
				document.getElementById('txtAreaCursosNombre').focus();
				// Formar y llenar los checkboxes para las menciones.
				document.getElementById('spMenciones').innerHTML = getHTMLMenciones(0);
			}
			else
			{
				// Limpiar el área que informa del proceso al usuario.
				document.getElementById('spEstadoTemas').innerHTML = '';
				document.getElementById('txtAreaTemasNombre').value='';
				document.getElementById('spLeftCharsTemasNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasNombre'), 150);
				document.getElementById('txtAreaTemasObjGenerales').value='';
				document.getElementById('spLeftCharsTemasObjGenerales').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasObjGenerales'), 250);
				document.getElementById('txtAreaTemasActAprendizaje').value='';
				document.getElementById('spLeftCharsTemasActAprendizaje').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasActAprendizaje'), 1000);
				document.getElementById('txtAreaTemasActAutoevaluacion').value='';
				document.getElementById('spLeftCharsTemasActAutoevaluacion').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaTemasActAutoevaluacion'), 1000);
				document.getElementById('txtAreaTemasNombre').focus();
			}
		}
		
		// Ocultar todos los DIV que se utilizan para mostrar las 
		// validaciones de los controles de edición.
		function resetAllValMessages()
		{	
			if(strActiveTab=='Cursos')
			{
				document.getElementById('spValCursosNombre').innerHTML = '';
				document.getElementById('spValCursosNombre').style.display = 'none';
				document.getElementById('spValCursosObjetivo').innerHTML = '';
				document.getElementById('spValCursosObjetivo').style.display = 'none';
			}
			else
			{
				document.getElementById('spValTemasNombre').innerHTML = '';
				document.getElementById('spValTemasNombre').style.display = 'none';
				document.getElementById('spValTemasObjetivo').innerHTML = '';
				document.getElementById('spValTemasObjetivo').style.display = 'none';
				document.getElementById('spValTemasActAprendizaje').innerHTML = '';
				document.getElementById('spValTemasActAprendizaje').style.display = 'none';
			}
		}
	
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)

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

		function selectAllCHKMenciones()
		{
			var y = 0;
			var frm = document.forms[0];
			for (i=0; i<=(frm.length-1); i++) 
			{
				if(frm.elements[i].id.indexOf('chkMencion_') != -1) 
				{
					frm.elements[i].checked=true;
				}
			}
			document.getElementById('spValCHKMenciones').innerHTML = '';
			document.getElementById('spValCHKMenciones').style.display = 'none';
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
			var strErrorMessage = "Los cursos deben estar destinados al menos a una mención, por tanto, selecciónela(s) debidamente.";
			document.getElementById('spValCHKMenciones').innerHTML = strErrorMessage;
			document.getElementById('spValCHKMenciones').style.display = 'block';
			return false;
		}
		
		// Validar el documento completo, dependiendo del TAB activo.
		function valDocument()
		{
			if(strActiveTab=='Cursos')
			{
				var val1 = valEmptyString(document.getElementById('txtAreaCursosNombre'),document.getElementById('spValCursosNombre'),"El campo \"Nombre\" no puede estar vacío.");
				var val2 = valEmptyString(document.getElementById('txtAreaCursosObjetivo'),document.getElementById('spValCursosObjetivo'),"El campo \"Objetivo general\" no puede estar vacío.");
				var val3 = valCHKMenciones();
				return (val1==true)&(val2==true)&(val3==true);
			}
			else
			{
				var val1 = valEmptyString(document.getElementById('txtAreaTemasNombre'),document.getElementById('spValTemasNombre'),"El campo \"Nombre\" no puede estar vacío.");
				var val2 = valEmptyString(document.getElementById('txtAreaTemasObjGenerales'),document.getElementById('spValTemasObjetivo'),"El campo \"Objetivos generales\" no puede estar vacío.");
				var val3 = valEmptyString(document.getElementById('txtAreaTemasActAprendizaje'),document.getElementById('spValTemasActAprendizaje'),"El campo \"Actividades de aprendizaje\" no puede estar vacío.");
				var val4 = valEmptyString(document.getElementById('txtAreaTemasActAutoevaluacion'),document.getElementById('spValTemasActAutoevaluacion'),"El campo \"Actividades de autoevaluación\" no puede estar vacío.");
				return (val1==true)&(val2==true)&(val3==true)&(val4==true);
			}
		}
		
		function disableForm()
		{
			strActiveOperation = 'Disabled';
			switchEditListView();
			setButtomsVisibility();
			var strMessage	= MSG_PROCESSING_BEGTAG;
					strMessage += "<b>PARA QUE ESTE FORMULARIO SEA COMPLETAMENTE FUNCIONAL ES ";
					strMessage += "NECESARIO QUE ESTEN REGISTRADOS DE ANTEMANO LOS <a href=\"modulo.aspx\">Módulos</a> ";
					strMessage += "Y LAS <a href=\"mencion.aspx\">Menciones</a> QUE CORRESPONDAN.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('dvListaCursos').innerHTML = strMessage;
		}
		
		/*
			FIN DE LOS PROCEDIMIENTOS COMUNES PARA AMBOS TABs "CURSOS" Y "TEMAS"
		*/
		
		/*
			DECLARACIÓN E INICIALIZACIÓN DONDE CORRESPONDA DE LAS VARIABLES LOCALES.
		*/
		// Array para almacenar los IDs de los elementos <span> que forman los botones TABs.
		var aryTabsIds = new Array('spTabCursos', 'spTabTemas');
		// Indicador para saber en qué TAB estamos. Los valores posibles son: Cursos ó Temas
		var strActiveTab = 'Cursos';
		// Variable que indica qué opción se está utilizando, 
		// si 'Listar', 'Editar', 'Nuevo' ó 'Disabled' dentro del TAB que nos encontremos.
		var strActiveOperation = 'Listar';
		// Variable para conocer el Id del elemento (curso ó tema) que se está editando.
		var IdEditado = 0;

		/* 
			INICIALIZACIÓN DEL FORMULARIO CON LOS VALORES PREDETERMINADOS 
			SEGÚN LAS VARIABLES ESTABLECIDAS AL INICIO.
		*/
		
		function Inicializar()
		{
			// Ejecutar el procedimiento que muestra/esconde los tabs con 
			// la opción predeterminada (mostrar el span "Cursos").
			setTab(document.getElementById(aryTabsIds[0]));
			// Llenar el cbo de la lista de los módulos del tab Cursos
			if(!fillCboModulo()){return;}
			// Obtener todos los registros de los cursos según el módulo actual en el cbo para ellos.
			getAllCursos();
			// Establecer la visibilida de los botones.
			setButtomsVisibility()
		}
		
		Inicializar();
		
		//-->
		</script>


	</body>
</html>
