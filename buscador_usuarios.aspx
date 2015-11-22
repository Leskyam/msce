<%@ Page language="c#" Codebehind="buscador_usuarios.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfBuscadorUsuarios" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Buscador de usuarios</title>
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
		<form id="frm_Usuario" method="post" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="tit_Maestria_A" id="spHeaderTituloLista">BUSCADOR
													DE USUARIOS</span></td></tr>
										<tr valign="top">
											<td>
												<table id="tbl_content" style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px" cellspacing="0" cellpadding="0" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA DE LOS CRITERIOS SIMPLES -->
															<table id="tbl_SimpleSearch" width="90%" align="center" border="0">
																<!-- Opciones para el criterio txtSearch -->
																<!-- txtSearch -->
																<tr>
																	<td align="center">
																		<div id="dvAyudita" class="tinytext_N">Introduzca cualquier parte del nombre ó 
																			los
																			apellidos ó el centro de trabajo ó la función que desempeña en el mismo (para
																			ampliar las búsquedas teclee una cadena de pocos caracteres).</div>
																	</td>
																</tr>
																<tr valign="middle">
																	<td align="center">
																		<input class="frmTextInput" autocomplete="on" id="txtSearch" type="text" maxlength="50" size="50">&nbsp;
																		<a id="lnkBuscar" title="Buscar usuarios." href="JavaScript:Buscar();">Buscar</a>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LA INFORMACIÓN GENERAL DE LOS RESULTADOS DE LA BÚSQUEDA -->
															<table id="tbl_ResultsInfo" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2">
																		<div id="dvResultsInfo"></div>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS RESULTADOS DE LA BÚSQUEDA -->
															<table id="tbl_Results" width="100%" align="center" border="0">
																<tr>
																	<td colspan="2" align="center">
																		<!-- ELEMENTOS PARA EL PAGINADO -->
																		<span id="spPaginatorBar" style="DISPLAY: none; FONT-WEIGHT: bold; WIDTH: 100%; BACKGROUND-COLOR: whitesmoke; TEXT-ALIGN: center">
																			<a id="lnkPrimera" href="JavaScript:Primera();" title="Ir a: primera página" style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">
																				&lt;&lt;</a>&nbsp;<a id="lnkAnterior" href="JavaScript:Anterior();" title="Ir a: página anterior" style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">&lt;</a>&nbsp;<label for="txtCurrentPage">Página</label>&nbsp;<input type="text" maxlength="3" id="txtCurrentPage" class="frmTextInput" size="3" onchange="JavaScript:pageChange(this.value);">&nbsp;de&nbsp;<span id="spCantPaginas">10</span>&nbsp;<a id="lnkSiguiente" href="JavaScript:Siguiente();" title="Ir a: página siguiente" style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">&gt;</a>&nbsp;<a id="lnkUltima" href="JavaScript:Ultima();" title="Ir a: última página" style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid">&gt;&gt;</a>
																		</span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<div id="dvResults"></div>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<!-- MAIN WINDOW; END --></td></tr></table>
						<!-- BODY TABLE; END --></td></tr></table></form>
		<script language="javascript">
		<!--

		/* 
			PARA LA DECLARACIÓN DE LAS IMÁGENES DE FONDO DE LAS CELDAS, LO HACEMOS POR SCRIPT
			PORQUE FireFox NO INTREPRETA BIEN LO QUE NECESITAMOS SI UTILIZAMOS ESTILOS.
		*/
		document.getElementById('tbl_content').style.backgroundImage = "url(imagenes/body_bg.gif)";
		document.getElementById('tbl_content').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_navBarLeft').style.backgroundImage = "url(imagenes/side_nav_bg.gif)";
		document.getElementById('td_navBarLeft').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_bodyHeader').style.backgroundImage = "url(imagenes/body_header.gif)";
		document.getElementById('td_bodyHeader').style.backgroundRepeat = "no-repeat";
		
		/*
			COMIENZO DE LOS PROCEDIMIENTOS PARA LA FUNCIONALIDAD ESPECÍFA DE ESTA PÁGINA
		*/
		
		function Buscar()
		{
			settings.currentPage = 1;
			settings.cadena = document.getElementById('txtSearch').value;
			getResults();
		}

		function getResults()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Ocualtar el texto ayudita luego de enviar la solicitud de búsqueda.
			document.getElementById('dvAyudita').style.display='none';
			date = new Date();
			settings.begTime = date.getTime();
			var res = ISPCFG.Msce.clswfBuscadorUsuarios.Buscar(settings.cadena, settings.currentPage, settings.recordsByPage, getResults_CallBack);
		}
		// Retorno de buscarUsuarios(role)
		function getResults_CallBack(res)
		{
			date = new Date();
			settings.endTime = date.getTime();
			// Obtener la referencia al elemento DIV que contendrá los datos resultantes de la búsqueda.
			var divResults = document.getElementById('dvResults')
			// Obtener la referencia al elemento DIV que contendrá los datos generales resultantes de la búsqueda.
			var divResultsInfo = document.getElementById('dvResultsInfo')

			// Verificar que no exista error.
			var boError = false;
			if(res==null)
			{
				boError = true;
			} 
			if(!boError)
			{
				if(res.error!=null)
				{
					boError = true;
				}
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
				if(typeof(res.value)!='object')
				{
					boError = true;
				}
			}
			if(boError)
			{
				divResults.innerHTML = '';
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos de la búsqueda solicitada. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res=null;
				return;
			}
			
			if(res.value[0].Rows.length>0)
			{
				settings.cantPages = res.value[0].Rows[0].cantPages;
				settings.currentPage = settings.currentPage<=settings.cantPages?settings.currentPage:settings.cantPages;
				settings.cantTotalRecords = res.value[0].Rows[0].cantTotalRecords;
			}
			else
			{
				settings.cantPages = 0;
				settings.cantTotalRecords = 0;
			}			
			var dvUsuarios = res.value[1];
			res=null;
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvUsuarios.Rows.length==0)
			{
				document.getElementById('tbl_Results').style.display = 'none';
				document.getElementById('tbl_ResultsInfo').style.display = '';
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divResults.innerHTML = "";
				divResultsInfo.innerHTML = "<b>Usuarios encontrados (0).</b><br>";
				divResultsInfo.innerHTML += "No se encontró ningún usuario cuyo nombre, apellidos, ";
				divResultsInfo.innerHTML += "centro de trabajo ó función contenga la cadena de "; 
				divResultsInfo.innerHTML += "caracteres <b>\"" + settings.cadena +"\"</b>. ";
				divResultsInfo.innerHTML += "Observe la sugerencia que aparece en la parte superior del vínculo \"Buscar\".";
				document.getElementById('spPaginatorBar').style.display = 'none';
				document.getElementById('dvAyudita').style.display = 'block';
				dvUsuarios = null;
				return;
			}
			if(settings.cantPages>1){document.getElementById('spPaginatorBar').style.display = 'block';}
			document.getElementById('tbl_Results').style.display = '';
			document.getElementById('tbl_ResultsInfo').style.display = '';
			
			var strTBLInfo = "<table border=\"0\" width=\"100%\">\n";
				 strTBLInfo += "\t<tr valign=\"top\">\n";
				 strTBLInfo += "\t\t<td align=\"left\" class=\"tinytext_A\">Usuarios encontrados: <b>" + settings.cantTotalRecords + "</b></td>\n";
				 strTBLInfo += "\t\t<td align=\"right\" class=\"tinytext_A\">tiempo invertido: <b>" + (settings.endTime - settings.begTime)/1000 + " Seg.</b></td>\n";
				 strTBLInfo += "\t</tr>\n";
				 strTBLInfo += "</table>\n";
				 
			dvResultsInfo.innerHTML = strTBLInfo;
			
			// Formar el encabezado de la tabla de la lista de los usuarios.
			var strTBL_Result =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strTBL_Result += "<table border=\"0\" width=\"100%\">\n";
			// Formar el cuerpo de la tabla de la lista de los usuarios.
			for(var i=0; i<=(dvUsuarios.Rows.length-1); ++i)
			{
				var Id = dvUsuarios.Rows[i].Id;
				var NombreCompleto = dvUsuarios.Rows[i].Nombre + " " + dvUsuarios.Rows[i].Apellidos;
				var CentroTrabajo = dvUsuarios.Rows[i].CentroTrabajo;
				var Funcion = dvUsuarios.Rows[i].Funcion;
				var Roles = dvUsuarios.Rows[i].roleDirector==Id?"Director, ":'';
				Roles += dvUsuarios.Rows[i].roleAcademico==Id?"Académico, ":'';
				Roles += dvUsuarios.Rows[i].roleDocente==Id?"Docente, ":'';
				Roles += dvUsuarios.Rows[i].roleMaestrante==Id?"Maestrante.":'';
				if(Roles.lastIndexOf(",")==(Roles.length-2)){Roles=Roles.substring(0,Roles.length-2) + ".";}
				var PerfilPublico = dvUsuarios.Rows[i].PerfilPublico;
				var datUltimoAcceso = getStringFromDate(dvUsuarios.Rows[i].datUltimoAcceso);
				
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				// Nombre completo y Sexo.
				strTBL_Result += "\t\t<tr valign=\"top\">\n";
				strTBL_Result += "\t\t\t<td><b>Nombre:</b> ";
				if(PerfilPublico)
				{
					strTBL_Result += "<a href=\"perfil.aspx?Id=" + Id + "\">" + NombreCompleto + "</a>";
				}
				else
				{
					strTBL_Result += NombreCompleto;
				}

				strTBL_Result += " <b>Roles:</b> " + Roles + "</td>\n";
				strTBL_Result += "\t\t</tr>\n";
				strTBL_Result += "\t\t<tr valign=\"top\">\n";
				strTBL_Result += "\t\t\t<td><b>Centro de trabajo:</b> " + CentroTrabajo + " <b>Función:</b> " + Funcion + " <b>Último acceso:</b> " + datUltimoAcceso + "</td>\n";
				strTBL_Result += "\t\t</tr>\n";
				
				if(i!=dvUsuarios.Rows.length-1)
				{
				strTBL_Result += "\t\t<tr valign=\"top\">\n";
				strTBL_Result += "\t\t\t<td width=\"100%\" height=\"15\">&nbsp;</td>\n";
				strTBL_Result += "\t\t</tr>\n";
				}
			}
			strTBL_Result += "</table>\n";
			divResults.innerHTML = strTBL_Result;
			
			document.getElementById('txtCurrentPage').value = settings.currentPage;
			document.getElementById('spCantPaginas').innerHTML = settings.cantPages;
			dvUsuarios=null;
			if(settings.currentPage==1)
			{
				document.getElementById('lnkPrimera').disabled = true;
				document.getElementById('lnkPrimera').href = 'JavaScript:doNothing();'
				document.getElementById('lnkPrimera').style.cursor = 'default';
				document.getElementById('lnkAnterior').disabled = true;
				document.getElementById('lnkAnterior').href = 'JavaScript:doNothing();';
				document.getElementById('lnkAnterior').style.cursor = 'default';
			}
			else
			{
				document.getElementById('lnkPrimera').disabled = false;
				document.getElementById('lnkPrimera').href = 'JavaScript:Primera();';
				document.getElementById('lnkPrimera').style.cursor = 'pointer';
				document.getElementById('lnkAnterior').disabled = false;
				document.getElementById('lnkAnterior').href = 'JavaScript:Anterior();';
				document.getElementById('lnkAnterior').style.cursor = 'pointer';
			}
			if(settings.currentPage==settings.cantPages)
			{
				document.getElementById('lnkSiguiente').disabled = true;
				document.getElementById('lnkSiguiente').href = 'JavaScript:doNothing();';
				document.getElementById('lnkSiguiente').style.cursor = 'dafault';
				document.getElementById('lnkUltima').disabled = true;
				document.getElementById('lnkUltima').href = 'JavaScript:doNothing();';
				document.getElementById('lnkUltima').style.cursor = 'dafault';
			}
			else
			{
				document.getElementById('lnkSiguiente').disabled = false;
				document.getElementById('lnkSiguiente').href = 'JavaScript:Siguiente();';
				document.getElementById('lnkSiguiente').style.cursor = 'pointer';
				document.getElementById('lnkUltima').disabled = false;
				document.getElementById('lnkUltima').href = 'JavaScript:Ultima();';
				document.getElementById('lnkUltima').style.cursor = 'pointer';
			}
			
			document.getElementById('txtSearch').focus();
			
		}
		
		function doNothing()
		{
			;
		}
		
		function Primera()
		{
			settings.currentPage = 1;
			getResults();
		}
		function Anterior()
		{
			--settings.currentPage; // = settings.currentPage-1;
			getResults();
		}
		function Siguiente()
		{
			++settings.currentPage; // = settings.currentPage+1;
			getResults();
		}
		function Ultima()
		{
			settings.currentPage = settings.cantPages;
			getResults();
		}
		function pageChange(page)
		{
			settings.currentPage = page!=0?Math.abs(page):1;
			getResults();
			document.getElementById('txtCurrentPage').value = settings.currentPage;
		}
		/*
			INICIALIZAR VALORES PREDETERMINADOS
		*/
		//settings.recordsByPage = 2; // Cantidad de registros que se mostrarán en cada página.
		//settings.currentPage = 1; // Página donde comienza la lista, la primera vez que se ejecuta o se se refresca la página.

		function switchAdvancedOptions()
		{
			link = document.getElementById('lnkAdvancedOptions');
			table = document.getElementById('tbl_AdvancedSearch');
	    if(table.style.display=='none')
	    {
				link.innerHTML = 'Opciones simples';
				table.style.display='block';
				fillListaRoles();
	    }
	    else
	    {
				link.innerHTML = 'Opciones avanzadas';
				table.style.display='none';				
	    }
		
		}
		
		function fillListaRoles()
		{
			var refCbo = document.getElementById('cboRoles');
			if(refCbo.options.length==0)
			{
				refCbo.options[refCbo.options.length] = new Option("Académico", "Académico");
				refCbo.options[refCbo.options.length] = new Option("Docente", "Docente");
				refCbo.options[refCbo.options.length] = new Option("Maestrante", "Maestrante");
			}
		}
		
		function chkChange()
		{
			document.getElementById('cboRoles').disabled = document.getElementById('chkTodosRoles').checked;
		}
		
		/*
			INICIALIZAR VALORES PREDETERMINADOS
		*/
		var settings = {"cadena": '', 
										"currentPage": '1', 
										"recordsByPage": '10', 
										"cantTotalRecords": 0,
										"begTime": 0,
										"endTime": 0};
		//settings.cadena = cadena de caracteres a buscar.
		//settings.currentPage = el valor de la página actual si es necesario el paginado.
		//settings.recordsByPage = la cantidad de registros que se mostrarán por página.
		//settings.cantTotalRecords = la cantidad total de registros que son devueltos por la búsqueda.
		//settings.begTime = la hora en que se comienza a hacer lá búsqueda.
		//settings.endTime = la hora en que se finaliza de hacer la búsqueda.
		

		//-->
		</script>


	</body>
</html>
