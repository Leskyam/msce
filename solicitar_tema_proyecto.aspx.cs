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
	/// Descripción breve de solicitar_tema_proyecto.
	/// </summary>
	public partial class clswfSolicitarTemaProyecto : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfSolicitarTemaProyecto));
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
		public clsMaestrante.struMiTemaProyecto getTemaProyectoStruct()
		{
            clsMaestrante.struMiTemaProyecto TemaProyecto = new ISPCFG.Msce.clsMaestrante.struMiTemaProyecto();
            return TemaProyecto;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getMiTemaProyecto()
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante(HttpContext.Current.User.Identity.Name);
				System.Data.DataTable dt = new DataTable();
				dt.Columns.Add("IdTema");
				dt.Columns.Add("Tema");
				dt.Columns.Add("Argumentos");
				dt.Columns.Add("datSolicitud");
				dt.Columns.Add("Estado");
				dt.Columns.Add("AcademicoRevisa");
				if(Maestrante.IdTemaProyecto==0){return dt.DefaultView;}

				object[] MiTemaProyecto = new object[6];
				MiTemaProyecto[0] = Maestrante.IdTemaProyecto;
				clsTemaProyecto TemaProyecto = new clsTemaProyecto(Maestrante.IdTemaProyecto);
				MiTemaProyecto[1] = TemaProyecto.Nombre;
				TemaProyecto = null;
				MiTemaProyecto[2] = Maestrante.Argumentos;
				MiTemaProyecto[3] = clsUtiles.getPresentationDateTimeLong(Maestrante.datSolicitud);
				switch(Maestrante.Estado)
				{
					case clsMaestrante.enuEstadoTemaProyecto.NoRevisado:
					{
						MiTemaProyecto[4] = "Pendiente";
						break;
					}
					case clsMaestrante.enuEstadoTemaProyecto.Rechazado:
					{
						MiTemaProyecto[4] = "Rechazado";
						break;
					}
					default:
					{
						MiTemaProyecto[4] = "Aprobado";
						break;
					}
				}
				clsAcademico Academico = new clsAcademico(Maestrante.IdAcademicoRevisa);
				MiTemaProyecto[5] = Academico.Nombre + " " + Academico.Apellidos;
				Academico = null;
				dt.Rows.Add(MiTemaProyecto);
				DataView dv = dt.DefaultView;
				dt = null;
				return dv;
			}
			catch(System.Exception ex)
			{
				System.Diagnostics.Debug.WriteLine(ex.ToString());
				throw new System.Exception(ex.ToString());
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public DataView getOthersRequestingSameTema()
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante(HttpContext.Current.User.Identity.Name);
				clsMaestranteTemaProyecto MaestranteTemaProyecto = new clsMaestranteTemaProyecto(Maestrante.Id);
				DataTable dt = MaestranteTemaProyecto.getOthersRequestingSameTema();
				Maestrante = null;
				MaestranteTemaProyecto = null;
				DataView dv = dt.DefaultView;

				System.Diagnostics.Debug.WriteLine(System.Convert.ToString(clsMaestranteTemaProyecto.enuEstado.Rechazado));
                
				//dv.RowFilter="Estado<>'" + System.Convert.ToString(clsMaestranteTemaProyecto.enuEstado.Rechazado) + "'";
                dv.Sort = "Estado";
				return dv;
			}
			catch(System.Exception ex)
			{
				System.Diagnostics.Debug.WriteLine(ex.ToString());
				throw new System.Exception(ex.ToString());
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaTemas()
		{
			try
			{
				clsTemaProyecto TemaProyecto = new clsTemaProyecto();
				DataView dv = TemaProyecto.getLista().DefaultView;
				TemaProyecto = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				throw new System.Exception("Error al recuperar la lista de los temas para proyecto de investigación.");
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsMaestrante.struMiTemaProyecto TemaProyecto)
		{
			clsMaestrante Maestrante = new clsMaestrante(HttpContext.Current.User.Identity.Name);
			Maestrante.Argumentos = TemaProyecto.Argumentos;
			Maestrante.IdTemaProyecto = TemaProyecto.IdTemaProyecto;
			Maestrante.IdAcademicoRevisa = 0;
			Maestrante.datSolicitud = System.DateTime.Now;
            Maestrante.Estado = clsMaestrante.enuEstadoTemaProyecto.NoRevisado;
			bool boResult = Maestrante.AgregarTemaProyecto();
			Maestrante = null;
			return boResult;
        }

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsMaestrante.struMiTemaProyecto TemaProyecto)
		{
			clsMaestrante Maestrante = new clsMaestrante(HttpContext.Current.User.Identity.Name);
			Maestrante.Argumentos = TemaProyecto.Argumentos;
			Maestrante.IdTemaProyecto = TemaProyecto.IdTemaProyecto;
			Maestrante.IdAcademicoRevisa = 0;
			Maestrante.datSolicitud = System.DateTime.Now;
			Maestrante.Estado = clsMaestrante.enuEstadoTemaProyecto.NoRevisado;
			bool boResult = Maestrante.ActualizarTemaProyecto();
			Maestrante = null;
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar()
		{
			clsMaestrante Maestrante = new clsMaestrante(HttpContext.Current.User.Identity.Name);
			bool boResult = Maestrante.EliminarTemaProyecto();
			Maestrante = null;
			return boResult;
		}


		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"

	}	// Fin de la clase.

}	// Fin del namespace.
