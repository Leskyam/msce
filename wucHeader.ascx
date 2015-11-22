<%@ Control Language="c#" AutoEventWireup="True" Codebehind="wucHeader.ascx.cs" Inherits="ISPCFG.Msce.wucHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<!-- HEADER TABLE; BEGIN -->
<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
	<tr valign="top">
		<td>
			<table cellspacing="0" cellpadding="0" width="750" border="0">
				<tr valign="top">
					<td>
						<table cellspacing="0" cellpadding="0" width="750" border="0">
							<tr>
								<td><!-- Imagen para el logo de la maestría --><img alt="" src="imagenes/header_logo1.gif"></td>
								<td valign="middle" align="center" width="545" background="imagenes/header_image_1.gif" colspan="2" height="104">
									<!-- Parte superior del globo terráqueo que se encuentra a la derecha -->
									<table border="0" width="545">
										<tr height="84">
											<td valign="middle" align="center" width="545"><span class="tit_Aplicacion_B">MAESTRÍA <font color="#47639a">
														A DISTANCIA</font></span><br><span class="subtit_A" id="spProvinciaNombre" runat="server">
													Cienfuegos
												</span>
											</td></tr>
										<tr valign="bottom"><td align="right" style="PADDING-RIGHT: 2px; PADDING-BOTTOM: 1px"><b><span id="spHospedero" class="tinytext_A" runat="server">Hospedero:</span></b></td></tr>
									</table>

								</td>
							</tr>
							<tr>
								<td valign="top"><!-- imagen en la parte inferior al logo --><img height="38" alt="" src="imagenes/header_logo2.gif" width="205"></td>
								<td valign="top"><img height="38" alt="" src="imagenes/header_members.gif"></td>
								<td valign="top" background="imagenes/header_members_bg.gif"><img height="1" alt="" src="imagenes/spacer.gif" width="397"><br>
									<!-- PARTE QUE LE CORRESPONDE A LOS CONTROLES PARA AUTENTICACIÓN -->
									<!-- DIV PARA CUANDO EL USUARIO NO ESTÁ IDENTIFICADO -->
									<div id="dvLogin" runat="server">
										<table id="tbl_login" cellspacing="0" cellpadding="0" width="397" border="0">
											<tr>
												<td rowspan="2" valign="middle"><img height="37" alt="" src="imagenes/spacer.gif" width="5"></td>
												<td class="frmLabel" valign="bottom" width="118">Id de usuario:</td>
												<td align="left" width="10" rowspan="2" valign="middle"><asp:requiredfieldvalidator id="regValUserId" runat="server" errormessage="*" controltovalidate="txtUserId" tooltip="Se requiere su nombre de usuario." backcolor="White">*</asp:requiredfieldvalidator></td>
												<td class="frmLabel" valign="bottom" width="118">Contraseña:</td>
												<td align="left" width="15" rowspan="2" valign="middle"><asp:requiredfieldvalidator id="reqValUserPass" runat="server" errormessage="*" controltovalidate="txtUserPass" tooltip="Se requiere la contraseña." backcolor="White">*</asp:requiredfieldvalidator></td>
												<td valign="bottom" align="center" width="121" colspan="3"><span class="spErrorNotification" id="spLoginNotification" runat="server">Acceso
														denegado</span></td>
												<td rowspan="2" valign="middle"><img height="37" alt="" src="imagenes/spacer.gif" width="10"></td></tr>
											<tr valign="middle">
												<td class="frmLabel" valign="middle" width="118"><input class="frmTextInput" id="txtUserId" type="text" maxlength="25" size="15" name="txtUserId" runat="server" style="WIDTH: 118px"></td>
												<td class="frmLabel" valign="middle" width="118"><input class="frmTextInput" id="txtUserPass" type="password" maxlength="16" size="15" name="txtUserPass" runat="server" style="WIDTH: 118px"></td>
												<td valign="middle" align="center" width="46"><asp:imagebutton id="imgLogin" runat="server" imageurl="imagenes/btn_login.gif" alternatetext="Entrar" onclick="imgLogin_Click"></asp:imagebutton></td>
												<td valign="middle"><img height="20" alt="" src="imagenes/spacer.gif" width="10"></td>
												<td valign="middle" align="center" width="65"><a href="register.aspx"><img id="imgRegister" title="Solicitar registro." height="18" src="imagenes/btn_register.gif" border="0" name="imgRegister"></a></td></tr></table></div>
									<!-- DIV PARA CUANDO EL USUARIO ESTÁ IDENTIFICADO -->
									<div id="dvWelcome" runat="server">
										<table id="tbl_Welcome" cellspacing="0" cellpadding="0" width="397" border="0">
											<tr valign="middle" height="17">
												<td width="5" rowspan="2"><img alt="" src="imagenes/spacer.gif" width="5" height="30"> </td>
												<td valign="bottom" align="left" width="246"><span class="textRoleName_B" id="spUserRoles" style="WIDTH: 100%" runat="server"></span></td>
												<td align="right" colspan="4"><span class="tinytext" id="spSessionTimeout" title="Tiempo para que finalice la sesión automáticamente.">Tiempo:</span> </td>
												<td rowspan="2"><img alt="" src="imagenes/spacer.gif" width="10" height="30"> </td></tr>
											<tr valign="middle" height="20">
												<td valign="middle" align="left" width="246"><span class="textUserFullName_B" id="spUserFullName" style="WIDTH: 100%" runat="server"></span></td>
												<td width="16" rowspan="1" style="WIDTH: 16px"><img alt="" src="imagenes/spacer.gif" width="15" height="18"> </td>
												<td align="right" width="65"><a href="perfil.aspx"><img id="imgViewProfile" title="Ver/modificar datos de mi perfil." height="18" alt="Mi perfil" src="imagenes/btn_my_profile.gif" border="0" name="imgViewProfile"></a> </td>
												<td width="10"><img alt="" src="imagenes/spacer.gif" width="10" height="18"> </td>
												<td align="left" width="46"><asp:imagebutton id="imgLogout" runat="server" imageurl="imagenes/btn_logout.gif" alternatetext="Salir" enableviewstate="False" causesvalidation="False" onclick="imgLogout_Click"></asp:imagebutton></td></tr></table></div></td></tr></table></td></tr></table></td></tr></table>
<!-- HEADER TABLE; END -->

<!-- -->
<script language="JavaScript">
<!-- Evitar que sea leído por navegadores que no soporten JavaScript.

function ForceToCloseSession()
{
	ISPCFG.Msce.wucHeader.ForceToCloseSession(ForceToCloseSession_CallBlack);
}

function ForceToCloseSession_CallBlack(res)
{
	if(res.value!='' & res.error==null){window.open(document.location.protocol + '//' + document.domain + res.value + '/index.aspx',"_self",null,false);}
	res = null;
	return;
}

//if(document.getElementById('ctlHeader_dvLogin')!=null){alert('ok');document.getElementById('ctlHeader_txtUserId').focus();}

// Terminar de ocultar el código JavaScript -->
</script>

