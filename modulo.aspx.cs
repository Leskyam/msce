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
	/// Descripción breve de modulo.
	/// </summary>
	public partial class clswfModulo : System.Web.UI.Page
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
                AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfModulo));

				//clsModulo Modulo = new clsModulo();
				//Modulo.WhyCanNotBeDeleted(10);
				//Modulo = null;

			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
                ProcessError.ShowPageErrorNotification(this.tr_Notify, this.sp_Notify, strErrorMessage);
                ProcessError = null;
			}
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		/// <summary>
		/// Devuelve una instancia de la clase clsModulo con todos los datos actuales.
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public clsModulo getModuloClass()
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				return Modulo;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos del módulo.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}


		/// <summary>
		/// Devuelve un DataView con los datos de todos los módulos registrados,
		/// los campos devueltos son: Id, NoOrden, NombreCorto, NombreCompleto.
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public DataView FillPageData()
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				DataTable dtModulos = new DataTable();
                dtModulos = Modulo.getAllRecords();
				for(int i=0; i<=(dtModulos.Rows.Count-1); i++)
				{
                    dtModulos.Rows[i]["Objetivos"] = clsUtiles.getFromBLOB(dtModulos.Rows[i]["Objetivos"]).ToString();
				}
				DataView dvModulos = dtModulos.DefaultView;
				dtModulos = null;
				Modulo = null;
                return dvModulos;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al recuperar los datos de los Módulos actualmente registrados.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string getStringFromBlob(object objBlobData)
		{
            return clsUtiles.getFromBLOB(objBlobData).ToString();
		}

		[AjaxPro.AjaxMethod()]
		public System.Byte getNextNoOrden()
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				System.Byte bytNextNoOrden = Modulo.getNextNoOrden();
				Modulo = null;
				return bytNextNoOrden;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al conseguir el próximo Número de orden correspondiente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool isValidForNewNoOrden(System.Byte NoOrden)
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				bool isValid = !Modulo.ExistNoOrden(NoOrden);
				Modulo = null;
				return isValid;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al validar el Número de orden.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool isValidForChangeNoOrden(System.Byte Id, System.Byte NoOrden)
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				bool boIsValid = !Modulo.ExistNoOrden(Id, NoOrden);
				Modulo = null;
				return boIsValid;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al validar el Número de orden.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool isValidForNewNombreCorto(System.String NombreCorto)
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				bool isValid = !Modulo.ExistNombreCorto(NombreCorto.Trim());
				Modulo = null;
				return isValid;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al validar si existe el Nombre corto.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool isValidForChangeNombreCorto(System.Byte Id, System.String NombreCorto)
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				bool boIsValid = !Modulo.ExistNombreCorto(Id, NombreCorto.Trim());
				Modulo = null;
				return boIsValid;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al validar si existe el Nombre corto.", Ex);
			}
		}
		
		/// <summary>
		/// Comprueba si puede ser eliminado un módulo.
		/// </summary>
		/// <param name="Id"></param>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.Byte Id)
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				bool boResult = false;
				boResult = Modulo.canBeDeleted(Id);
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminado el módulo.", Ex);
			}
		}

		/// <summary>
		/// Devuelve un array de tipo string con la o las razones por 
		/// las que un módulo no puede ser eliminado.
		/// </summary>
		/// <param name="Id"></param>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.Byte Id)
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				string[] boResult;
				boResult = Modulo.WhyCanNotBeDeleted(Id);
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el módulo.", Ex);
			}
		}

		#region "*** PROCEDIMIENTOS AJAX PARA ACTUALIZACIONES ***"
		
		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsModulo Modulo)
		{
			try
			{
				System.Diagnostics.Debug.WriteLine(Modulo.Objetivos);
				return System.Convert.ToBoolean(Modulo.Agregar());
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				return false;
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsModulo Modulo)
		{
			try
			{
				return Modulo.Actualizar();
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
				bool boResult;
				clsModulo Modulo = new clsModulo();
				boResult = Modulo.Eliminar(Id);
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al eliminar el módulo.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX PARA ACTUALIZACIONES ***"

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"
	
	}	// Fin de la clase.

}	// Fin del namespace.
