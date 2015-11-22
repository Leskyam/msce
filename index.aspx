<%@ Page language="c#" Codebehind="index.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfIndex" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
  <head>
		<title>Maestría: Inicio</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="estilos/main.css" type="text/css" rel="stylesheet">
		<link rel="shortcut icon" href="imagenes/favicon.ico" />
		<!-- Cargar el fichero principal de scripts del lado del cliente -->
		<script type="text/javascript" src="includes/main.js"></script>
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<!-- PAGE TABLE; BEGIN -->
		<form id="frm_Index" method="post" runat="server">
			<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr>
					<td><!-- CONTROL PARA EL ENCABEZADO, QUE INCLUYE LOS CONTROLES PARA IDENTIFICACIÓN DE USUARIO --><uc1:wucheader id="ctlHeader" runat="server"></uc1:wucheader></td></tr>
				<tr>
					<td><!-- CONTROL PARA LA BARRA DE OPCIONES DEL ENCABEZADO --><uc1:wucheadernavbar id="ctlHeaderNavBar" runat="server"></uc1:wucheadernavbar></td></tr></table>
			<table id="Table2" cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr id="tr_Notify" style="DISPLAY: none" height="0" runat="server">
					<td width="750"><span id="sp_Notify" runat="server"></span></td></tr>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent" style="TEXT-TRANSFORM: uppercase">NOMBRE
													DE LA MAESTRÍA</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="20" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320"><!-- background="imagenes/body_bg.gif" -->
															<div id="dvDatosMaestria" style="POSITION: relative; TEXT-ALIGN: center">Datos de
																la Maestría</div>
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

		/*
			OBTENER LOS DATOS DE LA MAESTRÍA QUE SE DEBEN MOSTRAR 
		*/
		var NombreMaestria = null;
		var DatosMaestria1 = null;
		var DatosMaestria2 = null;
		var Mode = 1;

		function getDatosMaestria(bytMode)
		{
			Mode = bytMode;
			document.getElementById('dvDatosMaestria').innerHTML = "<table style='position: relative;' cellpadding='5' align='center' border='0'><tr><td><font color='#47639a'>Cargando datos. Por favor, espere...</font></td></tr></table>";
			switch(Mode)
			{
				case 2:
				{
					if(DatosMaestria2!=null & NombreMaestria!=null)
					{
						document.getElementById('spHeaderContent').innerHTML = NombreMaestria;
						document.getElementById('dvDatosMaestria').innerHTML = DatosMaestria2;
						return;
					}
					break;
				}
				default:
				{
					if(DatosMaestria1!=null & NombreMaestria!=null)
					{
						document.getElementById('spHeaderContent').innerHTML = NombreMaestria;
						document.getElementById('dvDatosMaestria').innerHTML = DatosMaestria1;
						return;
					}
				}
			}
			var res = ISPCFG.Msce.clswfIndex.getDatosMaestria(Mode).value;
			getDatosMaestria_CallBlack(res);
		}

		function getDatosMaestria_CallBlack(res)
		{
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
					document.getElementById('spHeaderContent').innerHTML = "<table style='position: relative;' cellpadding='5' align='center' border='0'><tr><td>" + MSG_ERROR_BEGTAG + "Error al recuperar el nombre de la Maestría." + MSG_ENDTAG + "</td></tr></table>";
					document.getElementById('dvDatosMaestria').innerHTML = "<table style='position: relative;' cellpadding='5' align='center' border='0'><tr><td>" + MSG_ERROR_BEGTAG + "Error al recuperar otros datos de la Maestría." + MSG_ENDTAG + "</td></tr></table>";
					return;
			}
			
			NombreMaestria = res[0];
			DatosMaestria = res[1];
			switch(Mode)
			{
				case 2:
				{
					DatosMaestria2 = DatosMaestria;
					break;
				}
				default:
				{
					DatosMaestria1 = DatosMaestria;
				}
				
			}
			
			document.getElementById('spHeaderContent').innerHTML = NombreMaestria;
			document.getElementById('dvDatosMaestria').innerHTML = DatosMaestria;
			res = null;
		}
		
	getDatosMaestria(1);		

//-->
		</script>


	</body>
</html>
