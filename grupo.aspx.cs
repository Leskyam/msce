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
	/// Descripción breve de grupo.
	/// </summary>
	public partial class clswfGrupo : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfGrupo));
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
		public clsGrupo getGrupoClass()
		{
			try
			{
				clsGrupo Grupo = new clsGrupo();
				return Grupo;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos del grupo.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		/// <summary>
		/// Este procedimiento recupera y devuelve los siguientes campos: 
		/// Id, Id_Municipio, Municipio y Nombre.
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public DataView getAllGrupos()
		{
			try
			{
				clsGrupo Grupo = new clsGrupo();
				DataView dvGrupo = Grupo.getAllRecordsForReport().DefaultView;
				Grupo = null;
				return dvGrupo;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los grupos.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsGrupo Grupo)
		{
			try
			{
				return System.Convert.ToBoolean(Grupo.Agregar());
			}
			catch(System.Exception)
			{
				return false;
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsGrupo Grupo)
		{
			try
			{
				return Grupo.Actualizar();
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
				clsGrupo Grupo = new clsGrupo();
				bool boResult = Grupo.Eliminar(Id);
				Grupo = null;
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
				clsGrupo Grupo = new clsGrupo();
				bool boResult = Grupo.canBeDeleted(Id);
				Grupo = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminado el grupo.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.Byte Id)
		{
			try
			{
				clsGrupo Grupo = new clsGrupo();
				string[] aryResult = Grupo.WhyCanNotBeDeleted(Id);
				Grupo = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el grupo.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaSedes()
		{
			try
			{
				clsSede Sede = new clsSede();
				DataView dvSedes = Sede.getLista().DefaultView;
				Sede = null;
				return dvSedes;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las sedes.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaMenciones()
		{
			try
			{
				clsMencion Mencion = new clsMencion();
				DataView dvMenciones = Mencion.getLista().DefaultView;
				Mencion = null;
				return dvMenciones;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las menciones.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
