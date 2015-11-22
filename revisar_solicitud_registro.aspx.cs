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
	/// Descripción breve de revisar_solicitud_registro.
	/// </summary>
	public partial class clswfRevisarSolicitudRegistro : System.Web.UI.Page
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
		/// Método necesario para admitir el Diseñador. No se puede modificar
		/// el contenido del método con el editor de código.
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfRevisarSolicitudRegistro));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}

		}

		#endregion "*** FIN DE EVENTOS ***"
	
		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public DataView getList()
		{
			clsMaestrante Maestrante = new clsMaestrante();
			DataView dv = Maestrante.getListaSolicitandoRegistro().DefaultView;
			Maestrante = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getSolicitud(System.UInt32 IdUsuario)
		{
			clsMaestrante Maestrante = new clsMaestrante();
			DataView dv = Maestrante.getListaSolicitandoRegistro().DefaultView;
			dv.RowFilter = "Id=" + IdUsuario;
			Maestrante = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public bool AprobarSolicitud(System.UInt32 IdUsuario)
		{
			clsMaestrante Maestrante = new clsMaestrante(IdUsuario);
			clsAcademico Academico = new clsAcademico(HttpContext.Current.User.Identity.Name);
			Maestrante.IdAcademicoAutoriza = Academico.Id;
			bool boResult = Maestrante.Actualizar();
			if(boResult){Maestrante.sendWelcomeMail();}
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public bool EliminarSolicitud(System.UInt32 IdUsuario)
		{
			clsMaestrante Maestrante = new clsMaestrante();
			bool boResult = Maestrante.Eliminar(IdUsuario);
			return boResult;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"
	
	}	// Fin de la clase.

}	// Fin del namespace.
