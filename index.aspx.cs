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
	/// Descripción breve de index.
	/// </summary>
	public partial class clswfIndex : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(ISPCFG.Msce.clswfIndex));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
        ProcessError = null;
			}

			if(Page.Request.QueryString["ReturnUrl"]!=null)
			{
				//System.Web.Security.FormsAuthentication.SignOut();
				string strWarningMessage = "Usted ha sido redireccionado a esta página porque no tiene acceso a: <b>" + Page.Request.QueryString["ReturnUrl"] + "</b>. " + 
					"Probablemente usted introdujo directamente la dirección URL en la barra de direcciones de su navegador. Si es así, por favor, utilice las " + 
					"opciones que le proporciona la aplicación y si usted está recibiendo este mensaje y utilizó una opción disponible a través de la aplicación, " + 
					"por favor, contacte con los administradores del sistema porque es probable que halla algún problema en la configuración de seguridad de la aplicación.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageWarningNotification(this.tr_Notify,this.sp_Notify, "ACCESO DENEGADO.", strWarningMessage);
                ProcessError = null;
			}

		}	// Fin de Page_Load()

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public string[] getDatosMaestria(System.Byte bytMode)
		{
			try
			{
				clsMaestria Maestria = new clsMaestria();
				string[] strResult = new string[2];
				strResult[0] = Maestria.Nombre;

				// Cadena que representa el TAB.
				string strTab = System.Web.UI.HtmlTextWriter.DefaultTabString;
				// Las comillas dobles.
				char strQuote = System.Web.UI.HtmlTextWriter.DoubleQuoteChar;
				// Nueva línea
				string strNewLine = System.Environment.NewLine;
				// Cadena HTML a escribir como la propiedad innerHTML de la tabla "tbl_DatosMaestria"
				string strHTML = string.Empty;

				switch(bytMode)
				{
					case 2:
					{
						System.Text.StringBuilder sbMode2 = new System.Text.StringBuilder();
						sbMode2.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + strTab + "<td><b>Fundamentos</b></td>" + strNewLine);
						sbMode2.Append(strTab + "</tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + strTab + "<td>" + Maestria.Fundamentos + "</td>" + strNewLine);
						sbMode2.Append(strTab + "</tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + strTab + "<td><hr color='#47639a' size='1'></hr>" + strNewLine);
						sbMode2.Append(strTab + "</tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + strTab + "<td><b>Requisitos de ingreso</b></td>" + strNewLine);
						sbMode2.Append(strTab + "</tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + strTab + "<td>" + Maestria.RequisitosIngreso + "</td>" + strNewLine);
						sbMode2.Append(strTab + "</tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode2.Append(strTab + strTab + "<td style='PADDING-TOP: 10px'><a id='lnkDatosMaestria' title='Ver Provincia, Director, etc.' href=" + strQuote + "JavaScript:getDatosMaestria(1);" + strQuote + " target='_self' name='lnkDatosMaestria'>Regresar...</a></td>" + strNewLine);
						sbMode2.Append(strTab + "</tr>" + System.Environment.NewLine);
                        
						strHTML = sbMode2.ToString();
						break;
					}
					default:
					{
						clsProvincia Provincia = new clsProvincia();
						string strProvincia = Provincia.Nombre;
						Provincia = null;
						clsUsuario Usuario = new clsUsuario(Maestria.IdUsuarioDirector);
						string strDirector = Usuario.Nombre + " " + Usuario.Apellidos;
						Usuario = null;
						clsModulo Modulo = new clsModulo(Maestria.IdModuloActual);
						string strModuloActual = Modulo.NombreCorto!=Modulo.NombreCompleto?Modulo.NombreCorto + ". " + Modulo.NombreCompleto:Modulo.NombreCorto;
						clsSede Sede = new clsSede();
						System.Byte bytCantSedes = Sede.getCantidad();
						Sede = null;
                        System.UInt32[] aryCantUsuarios = new System.UInt32[3];
						clsAcademico Academico = new clsAcademico();
						aryCantUsuarios[0] = Academico.getCantidad();
						Academico = null;
						clsDocente Docente = new clsDocente();
						aryCantUsuarios[1] = Docente.getCantidad();
                        Docente = null;
						clsMaestrante Maestrante = new clsMaestrante();
						aryCantUsuarios[2] = Maestrante.getCantidad();
						Maestrante = null;
				
						System.Text.StringBuilder sbMode1 = new System.Text.StringBuilder();
						string strFormatTDBeg = "<td style='PADDING-BOTTOM: 10px' valign='top'>";
						string strFormatTDEnd = "&nbsp;</td>";
						// Provincia.
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Provincia:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + strProvincia + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						// Director.
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Director:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<a href=\"perfil.aspx?Id=" + Maestria.IdUsuarioDirector + "\">" + strDirector + "</a>" + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						// Fecha de inicio.
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Fecha de inicio:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + clsUtiles.getPresentationDateLong(Maestria.datFechaInicio) + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						// Fecha de fin.
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Fecha de finalización:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + clsUtiles.getPresentationDateLong(Maestria.datFechaFin) + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						// Estado de la matrícula.
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Estado de la matrícula:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + (Maestria.MatriculaAbierta?"Abierta":"Cerrada") + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						// Módulo actual.
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Módulo actual:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<a href=\"lista_modulos.aspx\">" + strModuloActual + "</a>" + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						// Sedes universitarias.
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Sedes universitarias:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<a href=\"lista_sedes.aspx\">" + bytCantSedes + "</a>" + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						// Usuarios registrados
						/*
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + "<td style='PADDING-BOTTOM: 10px' valign='top' rowspan='3'>" + "<b>Usuarios registrados:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + "<td valign='top'><a href='lista_usuarios.aspx?role=academico'>Académicos:</a> " + aryCantUsuarios[0] + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + "<td valign='top'><a href='lista_usuarios.aspx?role=docente'>Docentes:</a> " + aryCantUsuarios[1] + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + "<td valign='top'><a href='lista_usuarios.aspx?role=maestrante'>Maestrantes: </a>" + aryCantUsuarios[2] + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						*/
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + "<b>Usuarios registrados:</b>" + strFormatTDEnd + strNewLine);
						sbMode1.Append(strTab + strTab + "<td valign='top'>" + strNewLine);
						sbMode1.Append(strTab + strTab + strTab + "<a href='lista_usuarios.aspx?role=academico'>académicos: " + aryCantUsuarios[0] + "</a>" + ",&nbsp;" + strNewLine); 
						sbMode1.Append(strTab + strTab + strTab + "<a href='lista_usuarios.aspx?role=docente'>docentes: " + aryCantUsuarios[1] + "</a>" + ",&nbsp;" + strNewLine);
						sbMode1.Append(strTab + strTab + strTab + "<a href='lista_usuarios.aspx?role=maestrante'>maestrantes: " + aryCantUsuarios[2] + "</a>" + strNewLine);
						sbMode1.Append(strTab + strTab + strFormatTDBeg + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						
						// Link a "Más detalles...".
						sbMode1.Append(strTab + "<tr>" + System.Environment.NewLine);
						sbMode1.Append(strTab + strTab + "<td colspan='2'><a id='lnkDatosMaestria' title='Ver Fundamentos, Requisitos para la matrícula, etc.' href=" + strQuote + "JavaScript:getDatosMaestria(2);" + strQuote + " target='_self' name='lnkDatosMaestria'>Más detalles...</a></td>" + strNewLine);
						sbMode1.Append(strTab + "</tr>" + System.Environment.NewLine);
						
						strHTML = sbMode1.ToString();
						break;
					}
				}

				Maestria = null;
				strResult[1] = "<table style='POSITION: relative' cellpadding='5' align='center' border='0'>" + strHTML + "</table>";
				return strResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar datos de la maestría.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"

	}	// Fin de la clase.

}	// Fin del namespace.
