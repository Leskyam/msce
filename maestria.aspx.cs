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
	/// Descripción breve de maestria.
	/// </summary>
	public partial class clswfMaestria : System.Web.UI.Page
	{
		//protected System.Web.UI.HtmlControls.HtmlSelect cboProvincias;
	
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfMaestria));
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

		/// <summary>
		/// Devuelve una instancia de la clase clsMaestria con todos los datos actuales.
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public clsMaestria getMaestriaClass()
		{
			try
			{
				clsMaestria Maestria = new clsMaestria();
				return Maestria;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al recuperar los datos de la Maestría actual.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView FillcboProvincia()
		{
			try
			{
				// Recordar aquí que hay que chequear si existen cedes, si es así, sólo se mostrará 
				// la provincia actual, porque antes de cambiar de provincia hay que eliminar las 
				// cedes, ya que estas dependen de la provincia.
				clsProvincia Provincia = new clsProvincia();
				DataView ProvinciasView = Provincia.getLista().DefaultView;
				Provincia = null;
				clsSede Sede = new clsSede();
				if(Sede.getCantidad()>0)
				{
					clsMaestria Maestria = new clsMaestria();
					ProvinciasView.RowFilter = "Id=" + System.Convert.ToString(Maestria.IdProvincia);
					Maestria = null;
				}
				Sede = null;
				return ProvinciasView;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar los datos para la lista de las provincias.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public DataView FillcboDirector()
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				DataView AcademicosView = Academico.getLista().DefaultView;
				Academico = null;
				return AcademicosView;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar los datos del director de la Maestría.", Ex);
			}

		}

		[AjaxPro.AjaxMethod()]
		public DataView FillcboModulo()
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				DataView ModulosView = Modulo.getLista().DefaultView;
				Modulo = null;
				return ModulosView;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar los datos para la lista de los Módulos.", Ex);
			}

		}

		[AjaxPro.AjaxMethod()]
		public bool ActualizaDatosGen(clsMaestria MaestriaActualizada)
		{
			try
			{
				//          clsMaestria Maestria = new clsMaestria();
				//			Maestria.IdProvincia = MaestriaActualizada.IdProvincia;
				//			Maestria.IdUsuarioDirector = MaestriaActualizada.IdUsuarioDirector;
				//			Maestria.Nombre = MaestriaActualizada.Nombre;
				//			Maestria.Hospedero = MaestriaActualizada.Hospedero;
				//			Maestria.Fundamentos = MaestriaActualizada.Fundamentos;
				//			Maestria.RequisitosIngreso = MaestriaActualizada.RequisitosIngreso;
				//			Maestria.datFechaInicio = MaestriaActualizada.datFechaInicio;
				//			Maestria.datFechaFin = MaestriaActualizada.datFechaFin;
				//			Maestria.MatriculaAbierta = MaestriaActualizada.MatriculaAbierta;
				//			Maestria.IdModuloActual = MaestriaActualizada.IdModuloActual;
				//          Maestria.Actualizar();
				MaestriaActualizada.Actualizar();
				return true;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				return false;
			}
		}
		
			
			#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"

	} // Fin de la clase.

}	// Fin del naespace.
