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
	/// Descripción breve de usuario.
	/// </summary>
	public partial class clswfDocente : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfDocente));
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
		public clsDocente getDocenteClass()
		{
			try
			{
				clsDocente Docente = new clsDocente();
				return Docente;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos de docentes.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllDocentes()
		{
			try
			{
				clsDocente Docente = new clsDocente();
				DataView dvDocentes = Docente.getExtendedLista().DefaultView;
				dvDocentes.RowFilter="UserId<>'" + HttpContext.Current.User.Identity.Name + "'";
				Docente = null;
				return dvDocentes;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los docentes.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public clsDocente getDocente(System.UInt32 Id)
		{
			clsDocente Docente = new clsDocente(Id);
			Docente.UserPass = string.Empty; // Limpiar la contraseña antes de entregar al cliente.
			return Docente;
		}

		[AjaxPro.AjaxMethod()]
		public clsDocente.struDocente getStructDocente()
		{
			clsDocente.struDocente Docente = new clsDocente.struDocente();
			return Docente;
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaCategoriasDocentes()
		{
			try
			{
				clsCategoriaDocente Categoria = new clsCategoriaDocente();
				DataView dvCategorias = Categoria.getLista().DefaultView;
				Categoria = null;
				return dvCategorias;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las categorías docentes.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaTitulosAcademicos()
		{
			try
			{
				clsTituloAcademico Titulo = new clsTituloAcademico();
				DataView dvTitulos = Titulo.getLista().DefaultView;
				Titulo = null;
				return dvTitulos;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los títulos académcios.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool[] Agregar(clsDocente.struDocente DocenteData)
		{
			try
			{
				bool[] boResult = new bool[2];
				clsDocente Docente = new clsDocente();
				// Procesar el password si viene vacío.
				DocenteData.UserPass=DocenteData.UserPass==string.Empty?Docente.generatePassword(DocenteData.Nombre):DocenteData.UserPass;
				// Poner el Id del académico que lo registra.
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				DocenteData.IdAcademicoRegistra = Usuario.Id;
				Docente.getDataFromStruct(DocenteData);
				boResult[0] = Docente.Agregar();
				if(boResult[0]){boResult[1] = Docente.sendWelcomeMail();}
				Docente = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se insertaron los datos del nuevo docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsDocente.struDocente DocenteData)
		{
			try
			{
				clsDocente Docente = new clsDocente();
				// Poner el Id del académico que lo registra.
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				DocenteData.IdAcademicoRegistra = Usuario.Id;
				Docente.getDataFromStruct(DocenteData);
				bool boResult = Docente.Actualizar();
				Docente = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se actualizaron los datos del docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.UInt32 Id)
		{
			try
			{
				clsDocente Docente = new clsDocente();
				bool boResult = Docente.Eliminar(Id);
				Docente = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se actualizaron los datos del docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.UInt32 Id)
		{
			try
			{
				clsDocente Docente = new clsDocente();
				bool boResult = Docente.canBeDeleted(Id);
				Docente = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible comprobar si se admite eliminar el registro del docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.UInt32 Id)
		{
			try
			{
				clsDocente Docente = new clsDocente();
				string[] aryResult = Docente.WhyCanNotBeDeleted(Id);
				Docente = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el regsitro de este docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string getNewUserId(string Nombre, string Apellidos)
		{
			try
			{
				clsDocente Docente = new clsDocente();
				string UserId = Docente.generateUserId(Nombre, Apellidos);
				Docente = null;
				return UserId;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible obtener el nuevo 'UserId'.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool existUserId(System.UInt32 Id, string UserId)
		{
			try
			{
				clsDocente Docente = new clsDocente();
				bool boResult = false;
				if(Id==0)
				{
					boResult = Docente.existUserId(UserId);
				}
				else
				{
					boResult = Docente.existUserId(Id, UserId);
				}
				Docente = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible comprobar si existe el 'UserId'.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
