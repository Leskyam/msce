using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripci�n breve de revisar_tema_proyecto.
	/// </summary>
	public partial class clswfRevisarTemaProyecto : System.Web.UI.Page
	{
	
		#region C�digo generado por el Dise�ador de Web Forms
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: llamada requerida por el Dise�ador de Web Forms ASP.NET.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// M�todo necesario para admitir el Dise�ador. No se puede modificar
		/// el contenido del m�todo con el editor de c�digo.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Unload += new System.EventHandler(clsUtiles.Page_RegisterCopyright);
		}
		#endregion

		#region "*** EVENTOS ***"

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfRevisarTemaProyecto));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta p�gina no estar� disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}

		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"
        
		[AjaxPro.AjaxMethod()]
		public DataView getList(clsMaestranteTemaProyecto.enuEstado Estado)
		{
			clsMaestranteTemaProyecto MaestranteTemaProyecto = new clsMaestranteTemaProyecto();

			DataView dv = MaestranteTemaProyecto.getListByEstado(Estado).DefaultView;
			MaestranteTemaProyecto = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getSolicitud(System.UInt32 IdUsuario)
		{
			clsMaestranteTemaProyecto MaestranteTemaProyecto = new clsMaestranteTemaProyecto();

			DataView dv = MaestranteTemaProyecto.getSolicitud(IdUsuario).DefaultView;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(System.UInt32 IdUsuario, clsMaestranteTemaProyecto.enuEstado Estado)
		{
			clsMaestranteTemaProyecto MaestranteTemaProyecto = new clsMaestranteTemaProyecto();
			clsAcademico Academico = new clsAcademico(HttpContext.Current.User.Identity.Name);
			bool boResult = MaestranteTemaProyecto.ActualizarEstadoSolicitud(IdUsuario, Estado, Academico.Id);
			Academico = null;
            MaestranteTemaProyecto = null;
			return boResult;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	}	// Fin de la clase.

} // Fin del namespace.
