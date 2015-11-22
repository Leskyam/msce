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
	/// Descripción breve de planificar_encuentros.
	/// </summary>
	public partial class clswfPlanificarEncuentros : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfPlanificarEncuentros));
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

		#region "*** PROCEDIMIENTOS AJAX***"
    
		[AjaxPro.AjaxMethod()]
		public clsEncuentro getEncuentroClass()
		{
			clsEncuentro Encuentro = new clsEncuentro();
			return Encuentro;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getEncuentros()
		{
			clsEncuentro Encuentro = new clsEncuentro();
			DataView dv = Encuentro.getLista().DefaultView;
			clsDocente Docente = new clsDocente(HttpContext.Current.User.Identity.Name);
			dv.RowFilter = "Id_UsuarioDocente=" + Docente.Id;
			Docente = null;
			Encuentro = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getEncuentro(System.UInt32 Id)
		{
			clsEncuentro Encuentro = new clsEncuentro();
			DataTable dt = Encuentro.getRecord(Id);
			Encuentro = null;
			dt.Rows[0]["Orientaciones"] = System.Convert.ToString(clsUtiles.getFromBLOB(dt.Rows[0]["Orientaciones"]));
			DataView dv = dt.DefaultView;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaGrupos()
		{
			clsGrupo Grupo = new clsGrupo();
			DataView dv = Grupo.getExtendedLista().DefaultView;
			Grupo = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public System.DateTime getLimitDate()
		{
			return System.DateTime.Now.AddDays(3);
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsEncuentro Encuentro)
		{
			try
			{
				clsDocente Docente = new clsDocente(HttpContext.Current.User.Identity.Name);
				Encuentro.IdUsuarioDocente = Docente.Id;
				Docente = null;
				return System.Convert.ToBoolean(Encuentro.Agregar());
			}
			catch(System.Exception)
			{
				throw new System.Exception("Error al registrar encuentro.");
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsEncuentro Encuentro)
		{
			try
			{
				clsDocente Docente = new clsDocente(HttpContext.Current.User.Identity.Name);
				Encuentro.IdUsuarioDocente = Docente.Id;
				Docente = null;
				return Encuentro.Actualizar();
			}
			catch(System.Exception)
			{
				throw new System.Exception("Error al actualizar encuentro.");
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.UInt32 Id)
		{
			try
			{
				clsEncuentro Encuentro = new clsEncuentro();
				bool boResult = Encuentro.Eliminar(Id);
				Encuentro  = null;
				return boResult;
			}
			catch(System.Exception)
			{
				throw new System.Exception("Error al eliminar encuentro.");
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool areValidKeyValuesForNew(clsEncuentro Encuentro)
		{
			clsDocente Docente = new clsDocente(HttpContext.Current.User.Identity.Name);
			Encuentro.IdUsuarioDocente = Docente.Id;
			Docente = null;
			return Encuentro.areValidKeyValuesForNew();
		}

		[AjaxPro.AjaxMethod()]
		public bool areValidKeyValuesForUpdate(clsEncuentro Encuentro)
		{
			clsDocente Docente = new clsDocente(HttpContext.Current.User.Identity.Name);
			Encuentro.IdUsuarioDocente = Docente.Id;
			Docente = null;
			return Encuentro.areValidKeyValuesForUpdate();
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"

	}	// Fin de la clase.

}	// Fin del namespace
