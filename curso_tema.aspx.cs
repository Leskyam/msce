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
	/// Descripción breve de curso_tema.
	/// </summary>
	public partial class clswfCurso_tema : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfCurso_tema));
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

		#region "*** ESTRUCTURAS ***"

		public struct struMencion
		{
			public System.Byte Id;
			public System.String Nombre;
			public System.Boolean Selected;
		}
		
		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		#region "*** PARA EL TAB CURSOS ***"

		[AjaxPro.AjaxMethod()]
		public clsCurso getCursoClass(System.Byte cantMenciones)
		{
			try
			{
				clsCurso Curso = new clsCurso();
				clsCurso.struMencion[] Menciones = new clsCurso.struMencion[cantMenciones];
				Curso.Menciones = Menciones;
				return Curso;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos del curso.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaModulos()
		{
			try
			{
				clsModulo Modulo = new clsModulo();
				DataView vwModulo = Modulo.getExtendedLista(true).DefaultView;
				Modulo = null;
				return vwModulo;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los módulos registrados.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllCursos(System.Byte IdModulo)
		{
			try
			{
				clsCurso Curso = new clsCurso();
				DataTable dtCursos = new DataTable();
				dtCursos = Curso.getAllRecords(IdModulo);
				for(int i=0; i<=(dtCursos.Rows.Count-1); i++)
				{
					dtCursos.Rows[i]["ObjetivoGeneral"] = clsUtiles.getFromBLOB(dtCursos.Rows[i]["ObjetivoGeneral"]).ToString();
				}
				DataView dvCursos = dtCursos.DefaultView;
				dtCursos = null;
				Curso = null;
				return dvCursos;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de cursos que le pertenecen al módulo seleccionado.", Ex);
			}

		}

		[AjaxPro.AjaxMethod()]
		public bool AgregarCurso(clsCurso Curso)
		{
			try
			{
				return System.Convert.ToBoolean(Curso.Agregar());
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al agregar curso.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool ActualizarCurso(clsCurso Curso)
		{
			try
			{
				return Curso.Actualizar();
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar datos del curso.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool EliminarCurso(System.Byte Id)
		{
			try
			{
				clsCurso Curso = new clsCurso();
				bool boResult = Curso.Eliminar(Id);
				Curso = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al eliminar curso.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool CanDeleteCurso(System.Byte Id)
		{
			try
			{
				clsCurso Curso = new clsCurso();
				bool boResult = Curso.canBeDeleted(Id);
				Curso = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminado el curso.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotDeleteCurso(System.Byte Id)
		{
			try
			{
				clsCurso Curso = new clsCurso();
				string[] aryResult = Curso.WhyCanNotBeDeleted(Id);
				Curso = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el curso.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public System.String getSctringMenciones(System.Byte Id)
		{
			clsCurso Curso = new clsCurso();
			clsCurso.struMencion[] Menciones = Curso.getMenciones(Id);
			Curso = null;
			string strMenciones = string.Empty;
			for(int x=0; x<=(Menciones.Length-1); x++)
			{
				if(strMenciones!=string.Empty){strMenciones+=x<(Menciones.Length-1)?", ": " y ";}
				strMenciones += Menciones[x].Nombre;
			}
			return strMenciones;
		}

		[AjaxPro.AjaxMethod()]
		public struMencion[] getMencionesForEdit(System.Byte Id)
		{
			clsMencion Mencion = new clsMencion();
			DataTable dtMenciones = Mencion.getLista();
			Mencion = null;
			clsCurso Curso = new clsCurso();
			clsCurso.struMencion[] MisMenciones = Curso.getMenciones(Id);
			Curso = null;
			struMencion[] result = new struMencion[dtMenciones.Rows.Count];
			for(int x=0; x<=(dtMenciones.Rows.Count-1); x++)
			{
				result[x].Id = System.Convert.ToByte(dtMenciones.Rows[x]["Id"]);
				result[x].Nombre = System.Convert.ToString(dtMenciones.Rows[x]["Nombre"]);
				for(int y=0; y<=(MisMenciones.Length-1); y++)
				{
					System.Diagnostics.Debug.WriteLine("Id: " + result[x].Id + ", " + result[x].Nombre + ": " + System.Convert.ToByte(dtMenciones.Rows[x]["Id"]) + " = " + MisMenciones[y].Id);
					if(System.Convert.ToByte(dtMenciones.Rows[x]["Id"])==MisMenciones[y].Id)
					{
                        result[x].Selected = true;
						break;
					}
				}
			}
			return result;
		}

		[AjaxPro.AjaxMethod()]
		public struMencion[] getMencionesForNuevo()
		{
			clsMencion Mencion = new clsMencion();
			DataTable dtMenciones = Mencion.getLista();
			Mencion = null;
			struMencion[] result = new struMencion[dtMenciones.Rows.Count];
			for(int x=0; x<=(dtMenciones.Rows.Count-1); x++)
			{
				result[x].Id = System.Convert.ToByte(dtMenciones.Rows[x]["Id"]);
				result[x].Nombre = System.Convert.ToString(dtMenciones.Rows[x]["Nombre"]);
				result[x].Selected = true;
			}
			return result;
		}
		
		#endregion "*** FIN DE PROCEDIMIENTOS PARA EL TAB CURSOS ***"

		#region "*** PARA EL TAB TEMAS ***"

		[AjaxPro.AjaxMethod()]
		public clsTema getTemaClass()
		{
			try
			{
				clsTema Tema = new clsTema();
				return Tema;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos del tema.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaCursos()
		{
			try
			{
				clsCurso Curso = new clsCurso();
				DataView vwCurso = Curso.getExtendedLista().DefaultView;
				Curso = null;
				return vwCurso;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los cursos registrados.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllTemas(System.Byte IdCurso)
		{
			try
			{
				clsTema Tema = new clsTema();
				DataTable dtTemas = new DataTable();
				dtTemas = Tema.getAllRecords(IdCurso);
				for(int i=0; i<=(dtTemas.Rows.Count-1); i++)
				{
					dtTemas.Rows[i]["ActividadesAprendizaje"] = clsUtiles.getFromBLOB(dtTemas.Rows[i]["ActividadesAprendizaje"]).ToString();
					dtTemas.Rows[i]["ActividadesAutoevaluacion"] = clsUtiles.getFromBLOB(dtTemas.Rows[i]["ActividadesAutoevaluacion"]).ToString();
				}
				DataView dvTemas = dtTemas.DefaultView;
				dtTemas = null;
				Tema = null;
				return dvTemas;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de temas que le pertenecen al curso seleccionado.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool AgregarTema(clsTema Tema)
		{
			try
			{
				return System.Convert.ToBoolean(Tema.Agregar());
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al agregar tema.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool ActualizarTema(clsTema Tema)
		{
			try
			{
				return Tema.Actualizar();
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar los datos del tema.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool EliminarTema(System.Byte Id)
		{
			try
			{
				clsTema Tema = new clsTema();
				bool boResult = Tema.Eliminar(Id);
				Tema = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al eliminar tema.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool CanDeleteTema(System.Byte Id)
		{
			try
			{
				clsTema Tema = new clsTema();
				bool boResult = Tema.canBeDeleted(Id);
				Tema = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminado el tema.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotDeleteTema(System.Byte Id)
		{
			try
			{
				clsTema Tema = new clsTema();
				string[] aryResult = Tema.WhyCanNotBeDeleted(Id);
				Tema = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el tema.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PARA EL TAB TEMAS ***"

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
