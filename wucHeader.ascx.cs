namespace ISPCFG.Msce
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Web.Security;

	/// <summary>
	///		Descripción breve de wucHeader.
	/// </summary>
	public partial class wucHeader : System.Web.UI.UserControl
	{

		#region Código generado por el Diseñador de Web Forms
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: llamada requerida por el Diseñador de Web Forms ASP.NET.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		///		Método necesario para admitir el Diseñador. No se puede modificar
		///		el contenido del método con el editor de código.
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion

		#region "*** EVENTOS ***"
		
		protected void Page_Load(object sender, System.EventArgs e)
		{			
			// Poner el nombre de la provincia en la que se imparte la Maestría.
			try
			{
				// Registrar esta clase para ejecutar métodos Ajax.
				AjaxPro.Utility.RegisterTypeForAjax(typeof(wucHeader));
				clsProvincia Provincia = new clsProvincia();
				this.spProvinciaNombre.InnerText = Provincia.Nombre;
				Provincia = null;
			}
			catch(System.Exception)
			{
				this.spProvinciaNombre.InnerHtml = clsUtiles.MSG_ERROR_BEGTAG + "Error al recuperar el nombre de la provincia." + clsUtiles.MSG_ENDTAG;
			}

			// Poner el nombre de la provincia en la que se imparte la Maestría.
			try
			{
				clsMaestria Maestria = new clsMaestria();
				this.spHospedero.InnerText = "Hospedero: " + Maestria.Hospedero;
				Maestria = null;
			}
			catch(System.Exception)
			{
				this.spHospedero.InnerHtml = clsUtiles.MSG_ERROR_BEGTAG + "Error al recuperar el nombre del Hospedero." + clsUtiles.MSG_ENDTAG;
			}
		
			if(HttpContext.Current.User.Identity.IsAuthenticated)
			{
				try
				{
					clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
					string strRoles = Usuario.Roles.ToString();
					// Eliminar el role "Invitado" si está presente.
					strRoles = (strRoles.ToUpper().IndexOf(", INVITADO")>-1)?strRoles.ToUpper().Replace(", INVITADO",string.Empty):strRoles;
					// Cambiar el role "Director" si está presente y es mujer por el de "Directora".
					strRoles = (strRoles.ToUpper().IndexOf("DIRECTOR")>-1)&((Usuario.Sexo.ToString()).ToUpper()=="F")?strRoles.ToUpper().Replace("DIRECTOR","DIRECTORA"):strRoles;
					// Cambiar la última coma ", " por " y ".
					if(strRoles.LastIndexOf(",")>-1)
					{
						string strRolesLeft = strRoles.Substring(0,strRoles.LastIndexOf(",")).Trim();
						string strRolesRight = strRoles.Substring(strRoles.LastIndexOf(",")+1).Trim();
            strRoles = strRolesLeft + " y " + strRolesRight; 
					}
					this.spUserRoles.InnerHtml = strRoles; //(Usuario.RolePrincipal.ToUpper()=="DIRECTOR")&((Usuario.Sexo.ToString()).ToUpper()=="F")?"DIRECTORA":Usuario.RolePrincipal;
					this.spUserFullName.InnerHtml = Usuario.Nombre + " " + Usuario.Apellidos;
					// Si el usuario está visualizando el perfil propio (perfil.aspx).
					if(System.IO.Path.GetFileName(Request.Path).ToLower()=="perfil.aspx") 
					{
						bool esMiPerfil = false;
						if(Request.QueryString["Id"]==null)
						{
							esMiPerfil = true;
						}
						else
						{
							if(System.Convert.ToUInt32(Request.QueryString["Id"])==Usuario.Id){esMiPerfil=true;}
						}
						if(esMiPerfil)
						{
							if(!Page.IsStartupScriptRegistered("esMiPerfil"))
							{
								string strScript = "<script languaje='JavaScript'> " + System.Environment.NewLine;
								strScript += "document.getElementById('imgViewProfile').style.display='none';" + System.Environment.NewLine;
								strScript += "</script>" + System.Environment.NewLine;
								Page.RegisterStartupScript("esMiPerfil", strScript);
 							}
						}
					}

					Usuario = null;
				}
				catch(System.Exception)
				{;}

				if (!Page.IsStartupScriptRegistered("SessionTimeout"))
				{
					// Cadena que representa el TAB.
					string strTab = System.Web.UI.HtmlTextWriter.DefaultTabString;
					// Las comillas dobles.
					//char strQuote = System.Web.UI.HtmlTextWriter.DoubleQuoteChar;
					// Nueva línea
					string strNewLine = System.Environment.NewLine;

					System.Text.StringBuilder sbScript = new System.Text.StringBuilder();
					sbScript.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
					sbScript.Append(strTab + "var SessionTime = " + Session.Timeout.ToString() + ";" + strNewLine);
					sbScript.Append(strTab + "function SessionTimeout()" + strNewLine);
					sbScript.Append(strTab + "{" + strNewLine);
					sbScript.Append(strTab + strTab + "SessionTime -= 1;" + strNewLine);
					sbScript.Append(strTab + strTab + "document.getElementById('spSessionTimeout').innerHTML = 'Tiempo restante: ' + SessionTime + ' min';" + strNewLine);
					sbScript.Append(strTab + strTab + "if(SessionTime <= 0)" + strNewLine);
					sbScript.Append(strTab + strTab + "{" + strNewLine);
					sbScript.Append(strTab + strTab + strTab + "ForceToCloseSession();" + strNewLine);
					sbScript.Append(strTab + strTab + "}" + strNewLine);
					sbScript.Append(strTab + strTab + "window.setTimeout('SessionTimeout()', 60000)" + strNewLine);
					sbScript.Append(strTab + "}" + strNewLine);
					sbScript.Append(strTab + "SessionTimeout();" + strNewLine);
					sbScript.Append("//--></script>" + strNewLine);

					Page.RegisterStartupScript("SessionTimeout", sbScript.ToString());
				}
			}
			else
			{
				if (!Page.IsStartupScriptRegistered("SetFocusToTxtUserId"))
				{
					// Cadena que representa el TAB.
					string strTab = System.Web.UI.HtmlTextWriter.DefaultTabString;
					// Las comillas dobles.
					//char strQuote = System.Web.UI.HtmlTextWriter.DoubleQuoteChar;
					// Nueva línea
					string strNewLine = System.Environment.NewLine;

					System.Text.StringBuilder sbScript = new System.Text.StringBuilder();
					sbScript.Append("<script language='JavaScript'><!--" + strNewLine);
					sbScript.Append(strTab + "window.document.getElementById('" + this.txtUserId.ClientID + "').focus();" + strNewLine);
					sbScript.Append("//--></script>" + strNewLine);
					Page.RegisterStartupScript("SetFocusToTxtUserId", sbScript.ToString());
				}
			}
			// Establecer la visibilidad de los controles DIV del lado del servidor que
			// enmarcan las opciones para identificarse y para salir.
			this.dvLogin.Visible=(!HttpContext.Current.User.Identity.IsAuthenticated);
			//this.txtUserId.Visible = (!HttpContext.Current.User.Identity.IsAuthenticated); //this.dvLogin.Visible;
			this.dvWelcome.Visible=HttpContext.Current.User.Identity.IsAuthenticated;
		}

		protected void imgLogin_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			// Procedimiento para validar las credenciales presentadas por el usuario
			try
			{
				clsUsuario Usuario = new clsUsuario();
				if(Usuario.Validar(this.txtUserId.Value, this.txtUserPass.Value))
				{
					FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
						1, // Ticket version
						Usuario.UserId, // Usuario asociado con el ticket.
						DateTime.Now, // Fecha/Hora del ticket.
						DateTime.Now.AddMinutes(HttpContext.Current.Session.Timeout), // Fecha/Hora a la que expira.
						false, // "true" para una cookie persistente de usuario.
						Usuario.Nombre + " " + Usuario.Apellidos, // Servidor de POP3 que identificó al usuario.
						FormsAuthentication.FormsCookiePath); // Camino para el que es válida la cookie.
					// Cifrar la cookie para un transporte seguro.
					string encTicket = FormsAuthentication.Encrypt(ticket);
					// Crear la cookie
					// Crear la cookie
					System.Web.HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket); // ticket con el Hash aplicado.
					// Establecer el tiempo de expiración de la cookie al tiempo de expiración del ticket.
					if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
					Response.Cookies.Add(cookie);
					FormsAuthentication.SetAuthCookie(Usuario.UserId, false, FormsAuthentication.FormsCookiePath);
					// Redireccionar a la URL solicitada, o la URL donde se encontraba 
					// cuando solicitó identificación
					string returnUrl = Request.QueryString["ReturnUrl"];
					if ((returnUrl == null) || (returnUrl.ToUpper().IndexOf("DEFAULT.ASPX") > -1))
					{
						// Url de retorno a la dirección donde se encuentra el usuario actualmente.
						returnUrl = Request.Url.ToString();
					}
					// No utilizar FormsAuthentication.RedirectFromLoginPage ya que 
					// reemplazaría el ticket de authentication (la cookie) que acabamos de agregar.
					Response.Redirect(returnUrl, false);
					// Ocultar el label de Acceso denegado.
					this.spLoginNotification.Style["display"] = "none";

					//			// Role del usuario
					//			this.spUserRole.InnerHtml = "Maestrante";
					//			// Recordar recortar el nombre completa a 45 caracteres.
					//			this.spUserFullName.InnerHtml = this.txtUserId.Value; //+ " De la Paz y otro apellido.";		
				}
				else
				{
					ShowAccessDenied();
				}
			
				Usuario = null;
			}
			catch(System.Exception)
			{
                ShowAccessDenied();
			}

		}	// Fin de imgLogin_Click()

		protected void imgLogout_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			Response.Redirect(forceToSignOut(),false);
		
		}	// Fin de imgLogout_Click()

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		[AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
		public string ForceToCloseSession()
		{
			return forceToSignOut();
		}


		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
	
		private string forceToSignOut()
		{
			try
			{
				string strAppPath = string.Empty;
				FormsAuthentication.SignOut();
				if(HttpContext.Current.Session!=null)
				{
					HttpContext.Current.Session.Abandon();
					strAppPath = HttpContext.Current.Request.ApplicationPath;
				}
				clsUsuario Usuario = new clsUsuario();
				Usuario.DeleteFronConnectedList(HttpContext.Current.User.Identity.Name);
				Usuario = null;
				
				return strAppPath;

			}
			
			catch(System.Exception)
			{
				//System.Diagnostics.Debug.WriteLine(Ex.ToString());
				return string.Empty;
			}

		}
		
		/// <summary>
		/// Mostrar el elemento para declara acceso denegado.
		/// </summary>
		private void ShowAccessDenied()
		{
			this.spLoginNotification.InnerText = "Acceso denegado";
			this.spLoginNotification.Style["display"] = "block";
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

	}
}
