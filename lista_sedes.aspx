<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Page language="c#" Codebehind="lista_sedes.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfListaSedes" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestr�a: Lista de sedes universitarias</title>
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
					<td><!-- CONTROL PARA EL ENCABEZADO, QUE INCLUYE LOS CONTROLES PARA IDENTIFICACI�N DE USUARIO --><uc1:wucheader id="ctlHeader" runat="server"></uc1:wucheader></td></tr>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">LISTA 
													DE SEDES UNIVERSITARIAS</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICI�N DE LOS M�DULOS -->
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS M�DULOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS M�DULOS -->
																		<div id="dvListaSedes"></div></td></tr></table></td></tr></table></td></tr></table>
									<!-- MAIN WINDOW; END --></td></tr></table>
						<!-- BODY TABLE; END --></td></tr></table></form>
		<!-- PAGE TABLE; END -->
		<script language="javascript">
		<!--

		/* 
			PARA LA DECLARACI�N DE LAS IM�GENES DE FONDO DE LAS CELDAS, LO HACEMOS POR SCRIPT
			PORQUE FireFox NO INTREPRETA BIEN LO QUE NECESITAMOS SI UTILIZAMOS ESTILOS.
		*/
		document.getElementById('td_body_bg').style.backgroundImage = "url(imagenes/body_bg.gif)";
		document.getElementById('td_body_bg').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_navBarLeft').style.backgroundImage = "url(imagenes/side_nav_bg.gif)";
		document.getElementById('td_navBarLeft').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_bodyHeader').style.backgroundImage = "url(imagenes/body_header.gif)";
		document.getElementById('td_bodyHeader').style.backgroundRepeat = "no-repeat";

		// LLENA LOS DATOS QUE CORRESPONDEN A LA P�GINA.
		function getAllSedes()
		{
			// Obtener la referencia al elemento DIV que contendr� los datos de los m�dulos.
			var divListaSedes = document.getElementById('dvListaSedes');
			divListaSedes.innerHTML = "Recuperando lista de las sedes. Por favor, espere...";
			// Obtener los datos de los m�dulos.
			var res = ISPCFG.Msce.clswfListaSedes.getAllRecords().value;
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
			if(boError)
			{
				divListaSedes.innerHTML = "";
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos para la lista de las sedes. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				dvSedes = null;
				return;
			}
			
			var dvSedes = res;
			// Comprobar que no sea cero (0) la cantidad de registros (m�dulos).
			if(dvSedes.Rows.length==0)
			{
				dvSedes = null;
				// Mostrar mensaje al usuario indicando que no existen m�dulos registrados.
				divListaSedes.innerHTML = "<b>NO EXISTEN SEDES REGISTRADAS.</b>";
				return;
			}
			var strHTML =	"<table border=\"0\" align=\"center\">\n";
					strHTML += "\t<tr valign=\"middle\">\n";
					strHTML += "\t\t<td align=\"left\"><b>Municipio</b></td>\n";
					strHTML += "\t\t<td align=\"left\"><b>Nombre</b></td>\n";
					strHTML += "\t</tr>\n";
	
			for(var i=0; i<=(dvSedes.Rows.length-1); ++i)
			{
				var Municipio = dvSedes.Rows[i].Municipio;
				var Nombre = dvSedes.Rows[i].Nombre;
				// Formar el cuerpo del registro actual.
				strHTML += "\t\t<tr valign=\"top\">\n";
				strHTML += "\t\t\t<td>" + Municipio + "</td>\n";
				strHTML += "\t\t\t<td>" + Nombre + "</td>\n";
				strHTML += "\t\t</tr>\n";
				if(i<dvSedes.Rows.length-1)
				{
					strHTML += "\t\t<tr valign=\"top\">\n";
					strHTML += "\t\t\t<td colspan=\"3\"><hr width=\"100%\" class=\"hr_SeparatorRecord\" size=\"1\"></hr></td>\n";
					strHTML += "\t\t</tr>\n";
				}
			}
			strHTML += "</table>";
			divListaSedes.innerHTML = strHTML;
			dvSedes=null; 
		}
		
		getAllSedes();
		
		//-->
		</script>


	</body>
</html>
