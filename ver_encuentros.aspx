<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Page language="c#" Codebehind="ver_encuentros.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfVerEncuentros" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Ver encuentros</title>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">
													VER ENCUENTROS PLANIFICADOS
												</span>
											</td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
																		<div id="dvLista"></div>
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
			// Obtener los datos de los módulos.
			var dvEncuentros = ISPCFG.Msce.clswfVerEncuentros.getEncuentros().value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divLista = document.getElementById('dvLista')
			
			// Encuentros Pendientes
			var htmlPendientes = "<table border=\"0\" width=\"100%\">\n";
				htmlPendientes += "\t<tr valign=\"middle\">\n";
				htmlPendientes += "\t\t<td align=\"left\" nowrap><b>Mis encuentros pendientes (" + dvEncuentros[0].Rows.length + ")</b></td>\n";
				htmlPendientes += "\t</tr>\n";

			if(dvEncuentros[0].Rows.length==0)
			{
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				htmlPendientes += "<table border=\"0\" width=\"100%\">\n";
				htmlPendientes += "\t<tr valign=\"middle\">\n";
				htmlPendientes += "\t\t<td align=\"left\" nowrap><b>NO EXISTEN ENCUENTROS PENDIENTES PARA SU GRUPO</b></td>\n";
				htmlPendientes += "\t</tr>\n";
			}
			else
			{
				htmlPendientes +=	"<table border=\"0\" width=\"100%\">\n";
				htmlPendientes += "\t<tr valign=\"middle\">\n";
				htmlPendientes += "\t\t<td align=\"left\" nowrap><b>Planificado por:</b></td>\n";
				htmlPendientes += "\t\t<td align=\"left\"><b>Fecha</b></td>\n";
				htmlPendientes += "\t</tr>\n";
				// Header separator
				htmlPendientes += "\t\t<tr valign=\"top\">\n";
				htmlPendientes += "\t\t<td colspan=\"2\" height=\"5\">\n";
				htmlPendientes += "\t\t</td>\n";
				htmlPendientes += "\t\t</tr>\n";

				
				for(var i=0; i<=(dvEncuentros[0].Rows.length-1); ++i)
				{
					var Id = dvEncuentros[0].Rows[i].Id;
					var Docente = dvEncuentros[0].Rows[i].Docente;
					var Fecha = dvEncuentros[0].Rows[i].datFecha;
					var Orientaciones = dvEncuentros[0].Rows[i].Orientaciones
					// Formar el cuerpo del registro actual.
					htmlPendientes += "\t\t<tr valign=\"top\">\n";
					htmlPendientes += "\t\t\t<td nowrap>" + Docente + "</td>\n";
					htmlPendientes += "\t\t\t<td>" + getStringFromDate(Fecha) + "</td>\n";
					htmlPendientes += "\t\t</tr>\n";
					// TR para las Orientaciones
					htmlPendientes += "\t\t<tr valign=\"top\">\n";
					htmlPendientes += "\t\t<td colspan=\"2\">\n";
					htmlPendientes += "\t\t\t<div id=\"dvOrientacionesAbr" + Id + "\" style=\"cursor: pointer;\" onclick=\"JavaScript:if(document.getElementById('Orientaciones" + Id + "').style.display=='none'){document.getElementById('imgAbrOrientaciones" + Id + "').src='imagenes/minus.gif';document.getElementById('Orientaciones" + Id + "').style.display='block';} else {document.getElementById('imgAbrOrientaciones" + Id + "').src='imagenes/plus.gif';document.getElementById('Orientaciones" + Id + "').style.display='none';}\">";
					htmlPendientes += "<img id=\"imgAbrOrientaciones" + Id + "\" src=\"imagenes/plus.gif\" border=\"0\">&nbsp;<b>Orientaciones:</b>&nbsp;" + getAbr(Orientaciones,50) + "</div>\n";
					htmlPendientes += "<div id=\"Orientaciones" + Id + "\" style=\"display: none; padding-left: 14px;\">" + Orientaciones + "</div>\n";
					htmlPendientes += "\t\t</td>\n";
					htmlPendientes += "\t\t</tr>\n";
					// Record separator azul claro (escribirlo sólo si no es el último registro).
					if(i<(dvEncuentros[0].Rows.length-1))
					{
						htmlPendientes += "\t\t<tr valign=\"top\">\n";
						htmlPendientes += "\t\t<td bgcolor=\"#6699cc\" colspan=\"2\" height=\"1\">\n";
						htmlPendientes += "\t\t</td>\n";
						htmlPendientes += "\t\t</tr>\n";
					}
				}
				
				htmlPendientes += "</table>\n";
			
			}
			
			// Encuentros obsoletos
			var htmlAnteriores = "<table border=\"0\" width=\"100%\">\n";
				htmlAnteriores += "\t<tr valign=\"middle\">\n";
				htmlAnteriores += "\t\t<td align=\"left\" nowrap><b>Mis encuentros anteriores (" + dvEncuentros[1].Rows.length + ")</b></td>\n";
				htmlAnteriores += "\t</tr>\n";

			if(dvEncuentros[1].Rows.length==0)
			{
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				htmlAnteriores += "<table border=\"0\" width=\"100%\">\n";
				htmlAnteriores += "\t<tr valign=\"middle\">\n";
				htmlAnteriores += "\t\t<td align=\"left\" nowrap><b>NO EXISTEN ENCUENTROS ANTERIORES PARA SU GRUPO</b></td>\n";
				htmlAnteriores += "\t</tr>\n";
			}
			else
			{
				htmlAnteriores +=	"<table border=\"0\" width=\"100%\">\n";
				htmlAnteriores += "\t<tr valign=\"middle\">\n";
				htmlAnteriores += "\t\t<td align=\"left\" nowrap><b>Planificado por:</b></td>\n";
				htmlAnteriores += "\t\t<td align=\"left\"><b>Fecha</b></td>\n";
				htmlAnteriores += "\t</tr>\n";
				// Header separator
				htmlAnteriores += "\t\t<tr valign=\"top\">\n";
				htmlAnteriores += "\t\t<td colspan=\"2\" height=\"5\">\n";
				htmlAnteriores += "\t\t</td>\n";
				htmlAnteriores += "\t\t</tr>\n";

				
				for(var i=0; i<=(dvEncuentros[1].Rows.length-1); ++i)
				{
					var Id = dvEncuentros[1].Rows[i].Id;
					var Docente = dvEncuentros[1].Rows[i].Docente;
					var Fecha = dvEncuentros[1].Rows[i].datFecha;
					var Orientaciones = dvEncuentros[1].Rows[i].Orientaciones
					// Formar el cuerpo del registro actual.
					htmlAnteriores += "\t\t<tr valign=\"top\">\n";
					htmlAnteriores += "\t\t\t<td nowrap>" + Docente + "</td>\n";
					htmlAnteriores += "\t\t\t<td>" + getStringFromDate(Fecha) + "</td>\n";
					htmlAnteriores += "\t\t</tr>\n";
					// TR para las Orientaciones
					htmlAnteriores += "\t\t<tr valign=\"top\">\n";
					htmlAnteriores += "\t\t<td colspan=\"2\">\n";
					htmlAnteriores += "\t\t\t<div id=\"dvOrientacionesAbr" + Id + "\" style=\"cursor: pointer;\" onclick=\"JavaScript:if(document.getElementById('Orientaciones" + Id + "').style.display=='none'){document.getElementById('imgAbrOrientaciones" + Id + "').src='imagenes/minus.gif';document.getElementById('Orientaciones" + Id + "').style.display='block';} else {document.getElementById('imgAbrOrientaciones" + Id + "').src='imagenes/plus.gif';document.getElementById('Orientaciones" + Id + "').style.display='none';}\">";
					htmlAnteriores += "<img id=\"imgAbrOrientaciones" + Id + "\" src=\"imagenes/plus.gif\" border=\"0\">&nbsp;<b>Orientaciones:</b>&nbsp;" + getAbr(Orientaciones,50) + "</div>\n";
					htmlAnteriores += "<div id=\"Orientaciones" + Id + "\" style=\"display: none; padding-left: 15px;\">" + Orientaciones + "</div>\n";
					htmlAnteriores += "\t\t</td>\n";
					htmlAnteriores += "\t\t</tr>\n";
					// Record separator azul claro (escribirlo sólo si no es el último registro).
					if(i<(dvEncuentros[0].Rows.length-1))
					{
						htmlAnteriores += "\t\t<tr valign=\"top\">\n";
						htmlAnteriores += "\t\t<td bgcolor=\"#6699cc\" colspan=\"2\" height=\"1\">\n";
						htmlAnteriores += "\t\t</td>\n";
						htmlAnteriores += "\t\t</tr>\n";
					}
				}
				
				htmlAnteriores += "</table>\n";
			
			}
		
			var tablesSeparator = "<table border=\"0\" width=\"100%\">\n";
				 tablesSeparator += "\t<tr valign=\"top\">\n";
				 tablesSeparator += "\t\t<td colspan=\"2\" height=\"1\">";
				 tablesSeparator += "\t\t<hr width=\"100%\" color=\"#47639a\" size=\"1\"></hr></td></tr>\n";
				 tablesSeparator += "</table>\n";
			
			divLista.innerHTML = htmlPendientes + tablesSeparator + htmlAnteriores;
			dvEncuentros=null; 
			
		}

		getEncuentros();
		
		//-->
		</script>

	</body>
</html>
