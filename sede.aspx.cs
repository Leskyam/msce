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
	/// Descripción breve de sede.
	/// </summary>
	public partial class clswfSede : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfSede));
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
		public clsSede getSedeClass()
		{
			try
			{
				clsSede Sede = new clsSede();
				return Sede;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos de la sede.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		/// <summary>
		/// Este procedimiento recupera y devuelve los siguientes campos: 
		/// Id, Id_Municipio, Municipio y Nombre.
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public DataView getAllSedes()
		{
			try
			{
				clsSede Sede = new clsSede();
				DataView dvSedes = Sede.getAllRecordsForEdit().DefaultView;
				Sede = null;
				return dvSedes;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las sedes.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsSede Sede)
		{
			try
			{
				return System.Convert.ToBoolean(Sede.Agregar());
			}
			catch(System.Exception)
			{
				return false;
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsSede Sede)
		{
			try
			{
				return Sede.Actualizar();
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
				clsSede Sede = new clsSede();
				bool boResult = Sede.Eliminar(Id);
				Sede = null;
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
				clsSede Sede = new clsSede();
				bool boResult = Sede.canBeDeleted(Id);
				Sede = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminada la sede.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.Byte Id)
		{
			try
			{
				clsSede Sede = new clsSede();
				string[] aryResult = Sede.WhyCanNotBeDeleted(Id);
				Sede = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar la Sede.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaMunicipios()
		{
			try
			{
				clsMunicipio Municipio = new clsMunicipio();
				DataView dvMunicipios = Municipio.getLista().DefaultView;
				Municipio = null;
				return dvMunicipios;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las sedes.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
