using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using System.Security.Principal;

namespace ISPCFG.Msce 
{
	/// <summary>
	/// Descripción breve de Global.
	/// </summary>
	public class Global : System.Web.HttpApplication
	{
		/// <summary>
		/// Variable del diseñador requerida.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		public Global()
		{
			InitializeComponent();
		}	
		
		#region Código generado por el Diseñador de Web Forms
		/// <summary>
		/// Método necesario para admitir el Diseñador. No se puede modificar
		/// el contenido del método con el editor de código.
		/// </summary>
		private void InitializeComponent()
		{    
			this.components = new System.ComponentModel.Container();
		}
		#endregion

		protected void Application_Start(Object sender, EventArgs e)
		{

		}
 
		protected void Session_Start(Object sender, EventArgs e)
		{

		}

		protected void Application_BeginRequest(Object sender, EventArgs e)
		{

		}

		protected void Application_EndRequest(Object sender, EventArgs e)
		{
			try
			{
				if(HttpContext.Current.User!=null & HttpContext.Current.User.Identity.IsAuthenticated)
				{
					clsUsuario Usuario = new clsUsuario();
					Usuario.UpdateLastRequest(HttpContext.Current.User.Identity.Name);
					Usuario = null;
				}
			}
			catch(System.Exception)
			{
				;
			}
		}

		protected void Application_AuthenticateRequest(Object sender, EventArgs e)
		{
			try
			{
				HttpApplication app = (HttpApplication) sender;

				if(app.Request.IsAuthenticated && app.User.Identity is System.Web.Security.FormsIdentity) 
				{
					// Array para almacenar temporalmente los Roles del usuario.
					string[] aryRoles;
					clsUsuario Usuario = new clsUsuario(app.User.Identity.Name);
					aryRoles = Usuario.Roles.Roles;
					Usuario = null;
					HttpContext.Current.User = new GenericPrincipal((FormsIdentity) app.User.Identity, aryRoles);
				} 
			}
			catch(System.Exception)
			{
				;
			}
		}

		protected void Application_Error(Object sender, EventArgs e)
		{

		}

		protected void Session_End(Object sender, EventArgs e)
		{

		}

		protected void Application_End(Object sender, EventArgs e)
		{

		}

		// Eventos que no aparecen en el global.asax predeterminado.
		protected void Application_OnAcquireRequestState(Object sender, EventArgs e)
		{
			try
			{
				// Sólo ejecutar cuando el objeto Session "exista".
				if(HttpContext.Current.Session != null)
				{
					if(HttpContext.Current.Session["Usuario.Roles.Roles"]==null)
					{
						if(HttpContext.Current.User.Identity.IsAuthenticated)
						{
							// Array para almacenar temporalmente los Roles del usuario.
							clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
							HttpContext.Current.Session["Usuario.Roles.Roles"] = Usuario.Roles.Roles;
							Usuario = null;
						}
					}
				}
			}
			catch(System.Exception)
			{
				;
			}
		}
	
	
	} // Fin de la clase

} // Fin del namespace

