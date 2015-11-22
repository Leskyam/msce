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
	public partial class clswfAcademico : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfAcademico));
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
		public clsAcademico getAcademicoClass()
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				return Academico;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos de académicos.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllAcademicos()
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				DataView dvAcademicos = Academico.getExtendedLista().DefaultView;
                dvAcademicos.RowFilter="UserId<>'" + HttpContext.Current.User.Identity.Name + "'";
				Academico = null;
				return dvAcademicos;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los académicos.", Ex);
			}

		}

		[AjaxPro.AjaxMethod()]
		public clsAcademico getAcademico(System.UInt32 Id)
		{
			clsAcademico Academico = new clsAcademico(Id);
			Academico.UserPass = string.Empty; // Limpiar la contraseña antes de entregar al cliente.
			return Academico;
		}

		[AjaxPro.AjaxMethod()]
		public clsAcademico.struAcademico getStructAcademico()
		{
			clsAcademico.struAcademico Academico = new clsAcademico.struAcademico();
			return Academico;
		}

		[AjaxPro.AjaxMethod()]
		public bool[] Agregar(clsAcademico.struAcademico AcademicoData)
		{
			try
			{
				bool[] boResult = new bool[2];
				clsAcademico Academico = new clsAcademico();
				// Procesar el password si viene vacío.
				AcademicoData.UserPass=AcademicoData.UserPass==string.Empty?Academico.generatePassword(AcademicoData.Nombre):AcademicoData.UserPass;
				Academico.getDataFromStruct(AcademicoData);
				boResult[0] = Academico.Agregar();
				if(boResult[0]){boResult[1] = Academico.sendWelcomeMail();}
				Academico = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se insertaron los datos del nuevo académico.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsAcademico.struAcademico AcademicoData)
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				Academico.getDataFromStruct(AcademicoData);
				bool boResult = Academico.Actualizar();
				Academico = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se actualizaron los datos del académico.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.UInt32 Id)
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				bool boResult = Academico.Eliminar(Id);
				Academico = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se actualizaron los datos del académico.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.UInt32 Id)
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				bool boResult = Academico.canBeDeleted(Id);
				Academico = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible comprobar si se admite eliminar el registro del académico.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.UInt32 Id)
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				string[] aryResult = Academico.WhyCanNotBeDeleted(Id);
				Academico = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el regsitro de este académico.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string getNewUserId(string Nombre, string Apellidos)
		{
			try
			{
			clsAcademico Academico = new clsAcademico();
			string UserId = Academico.generateUserId(Nombre, Apellidos);
			Academico = null;
			return UserId;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible autogenerar el nuevo 'Id de usuario'.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool existUserId(System.UInt32 Id, string UserId)
		{
			try
			{
				clsAcademico Academico = new clsAcademico();
				bool boResult = false;
				if(Id==0)
				{
					boResult = Academico.existUserId(UserId);
				}
				else
				{
					boResult = Academico.existUserId(Id, UserId);
				}
				Academico = null;
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
