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
	/// Descripción breve de consultar.
	/// </summary>
	public partial class clswfResponderConsultas : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfResponderConsultas));
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
		public clsConsultaRespuesta getRespuestaClass()
		{
			clsConsultaRespuesta Respuesta = new clsConsultaRespuesta();
			return Respuesta;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getConsultas()
		{
			clsConsulta Consulta = new clsConsulta();
			DataView dv = Consulta.getListSinRespuesta().DefaultView;
			clsDocente Docente = new clsDocente(HttpContext.Current.User.Identity.Name);
			dv.RowFilter = "IdDocente=" + Docente.Id;
			Docente = null;
			Consulta = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getConsulta(System.UInt32 Id)
		{
			clsConsulta Consulta = new clsConsulta();
			DataTable dt = Consulta.getSinRespuesta(Id);
			dt.Rows[0]["Consulta"] = System.Convert.ToString(dt.Rows[0]["Consulta"]);
			DataView dv = dt.DefaultView;
			Consulta = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsConsultaRespuesta Respuesta)
		{
			Respuesta.datFechaHora = System.DateTime.Now;
			bool boResult = System.Convert.ToBoolean(Respuesta.Agregar());
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsConsulta Consulta)
		{
			clsMaestrante Maestrante = new clsMaestrante(HttpContext.Current.User.Identity.Name);
			Consulta.IdUsuarioMaestrante = Maestrante.Id;
			Maestrante = null;
			Consulta.datFechaHora = System.DateTime.Now;
			System.Diagnostics.Debug.WriteLine(Consulta.IdUsuarioMaestrante);
			bool boResult = System.Convert.ToBoolean(Consulta.Actualizar());
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.UInt32 Id)
		{
			clsConsulta Consulta = new clsConsulta(Id);
			bool boResult = Consulta.Eliminar();
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.UInt32 Id)
		{
			clsConsulta Consulta = new clsConsulta();
			bool boResult = Consulta.canBeDeleted(Id);
			Consulta = null;
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.UInt32 Id)
		{
			clsConsulta Consulta = new clsConsulta();
			string[] aryResult = Consulta.WhyCanNotBeDeleted(Id);
			Consulta = null;
			return aryResult;
		}
		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"

	}	// Fin de la clase.

}	// Fin del namespace.
