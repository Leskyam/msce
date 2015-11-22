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
	/// Descripci�n breve de mencion.
	/// </summary>
	public partial class clswfMencion : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfMencion));
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
		public clsMencion getMencionClass()
		{
			try
			{
				clsMencion Mencion = new clsMencion();
				return Mencion;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos de la menci�n.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllMenciones()
		{
			try
			{
				clsMencion Mencion = new clsMencion();
				DataView dvMenciones = Mencion.getAllRecords().DefaultView;
				Mencion = null;
				return dvMenciones;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las menciones.", Ex);
			}

		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsMencion Mencion)
		{
			try
			{
				return System.Convert.ToBoolean(Mencion.Agregar());
			}
			catch(System.Exception)
			{
				return false;
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsMencion Mencion)
		{
			try
			{
				return Mencion.Actualizar();
			}
			catch(System.Exception)
			{
				return false;
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.Byte Id)
		{
			try
			{
				clsMencion Mencion = new clsMencion();
				bool boResult = Mencion.Eliminar(Id);
				Mencion = null;
				return boResult;
			}
			catch(System.Exception)
			{
				return false;
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.Byte Id)
		{
			try
			{
				clsMencion Mencion = new clsMencion();
				bool boResult = Mencion.canBeDeleted(Id);
				Mencion = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminada la menci�n.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.Byte Id)
		{
			try
			{
				clsMencion Mencion = new clsMencion();
				string[] aryResult = Mencion.WhyCanNotBeDeleted(Id);
				Mencion = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar la menci�n.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"
	
	} // Fin de la clase.

} // Fin del namespace.
