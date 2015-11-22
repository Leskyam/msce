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
	/// Descripción breve de mencion.
	/// </summary>
	public partial class clswfCategoria_docente : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfCategoria_docente));
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
		public clsCategoriaDocente getCategoriaDocenteClass()
		{
			try
			{
				clsCategoriaDocente CategoriaDocente = new clsCategoriaDocente();
				return CategoriaDocente;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos de la categoría docente.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllCategoriasDocentes()
		{
			try
			{
				clsCategoriaDocente CategoriaDocente = new clsCategoriaDocente();
				DataView dvCategoriasDocentes = CategoriaDocente.getAllRecords().DefaultView;
				CategoriaDocente = null;
				return dvCategoriasDocentes;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las categorías docentes.", Ex);
			}

		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsCategoriaDocente CategoriaDocente)
		{
			try
			{
				return System.Convert.ToBoolean(CategoriaDocente.Agregar());
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible agregar la categoría docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsCategoriaDocente CategoriaDocente)
		{
			try
			{
				return CategoriaDocente.Actualizar();
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible actualizar la categoría docente.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.Byte Id)
		{
			try
			{
				clsCategoriaDocente CategoriaDocente = new clsCategoriaDocente();
				bool boResult = CategoriaDocente.Eliminar(Id);
				CategoriaDocente = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible eliminar la categoría docente.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.Byte Id)
		{
			try
			{
				clsCategoriaDocente CategoriaDocente = new clsCategoriaDocente();
				bool boResult = CategoriaDocente.canBeDeleted(Id);
				CategoriaDocente = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminada la categoría docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.Byte Id)
		{
			try
			{
				clsCategoriaDocente CategoriaDocente = new clsCategoriaDocente();
				string[] aryResult = CategoriaDocente.WhyCanNotBeDeleted(Id);
				CategoriaDocente = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar la categoría docente.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"
	
	} // Fin de la clase.

} // Fin del namespace.
