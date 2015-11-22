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
	/// Descripción breve de bibliografia_cd.
	/// </summary>
	public partial class clswfBibliografiaCD : System.Web.UI.Page
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

		}
		#endregion

		#region "*** EVENTOS ***"

		protected void Page_Load(object sender, System.EventArgs e)
		{
			AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfBibliografiaCD));
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public DataView getListaCursos()
		{
			try
			{
				clsCurso Curso = new clsCurso();
				DataView dv = Curso.getExtendedLista().DefaultView;
				Curso = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los cursos registrados.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaTemas(System.Byte IdCurso)
		{
			try
			{
				clsTema Tema = new clsTema();
				DataView dv = Tema.getLista().DefaultView;
				dv.RowFilter = "Id_Curso=" + IdCurso;
				Tema = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los temas registrados.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public clsBibliografiaCD getCompactDisc(System.UInt32 Id)
		{
			clsBibliografiaCD CompactDisc = new clsBibliografiaCD(Id);
      System.Diagnostics.Debug.WriteLine(CompactDisc.Temas[0].IdTema);
			return CompactDisc;
		}


		[AjaxPro.AjaxMethod()]
		public DataView getListaCDs()
		{
			try
			{
				clsBibliografiaCD CDs = new clsBibliografiaCD();
				DataView dv = CDs.getLista().DefaultView;
				CDs = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los discos compactos registrados.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public clsBibliografiaCD.struBibliografiaCD getStructCD()
		{
			clsBibliografiaCD.struBibliografiaCD CompactDisc = new clsBibliografiaCD.struBibliografiaCD();
			return CompactDisc;
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsBibliografiaCD.struBibliografiaCD CDData, System.Byte[] aryTemas)
		{
			try
			{
				bool boResult;
				clsBibliografiaCD CompactDisc = new clsBibliografiaCD();
				// Procesar el password si viene vacío.
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				CDData.IdUsuario = Usuario.Id;
				Usuario = null;
				CompactDisc.getDataFromStruct(CDData);
				clsBibliografiaCD.struTemas[] Temas = new clsBibliografia.struTemas[aryTemas.Length];
				for(int i=0; i<=(aryTemas.Length-1); i++)
				{
					Temas[i].IdTema = aryTemas[i];
				}
				CompactDisc.Temas = Temas;
				boResult = CompactDisc.Agregar();
				CompactDisc = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception(Ex.Message);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.UInt32 Id)
		{
			clsBibliografiaCD CompactDisc = new clsBibliografiaCD();
      bool boResult = CompactDisc.Eliminar(Id);
			CompactDisc = null;
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public bool validURLAccess(System.String sURL, System.String sUserName, System.String sUserPass)
		{
			try
			{
				string strResponse = string.Empty;
				string strMethod = "GET";
				System.Uri requestURL = new Uri(sURL);
				// Chequear si es una solicitud FTP
				System.Net.WebRequest WRequest;
				System.Net.WebResponse WResponse;

				/*
				if(sURL.Substring(0,6).ToLower()=="ftp://")
				{
					FtpRequestCreator Creator = new FtpRequestCreator();
					System.Net.WebRequest.RegisterPrefix("ftp:", Creator);
					strMethod = "dir";
				}
				*/

				WRequest = System.Net.WebRequest.Create( sURL );
				WRequest.Method = strMethod;

				if(sUserName!=string.Empty) // we will add the user and password for basic auth.
				{
					System.Net.NetworkCredential myCred = new System.Net.NetworkCredential(sUserName, sUserPass);
					System.Net.CredentialCache MyCrendentialCache = new System.Net.CredentialCache();
					MyCrendentialCache.Add(requestURL, "Basic", myCred);
					WRequest.Credentials = MyCrendentialCache;
				}
				else //Set the default Credentials. This will allow NTLM or Kerbeors authentication with out prompting the user
				{
					// the default credentials are usually the Windows credentials (user name, password, and domain) of the user running the application
					WRequest.Credentials = System.Net.CredentialCache.DefaultCredentials;
				}

				WResponse = (System.Net.WebResponse)WRequest.GetResponse();
				System.IO.StreamReader sr = new System.IO.StreamReader(WResponse.GetResponseStream(), System.Text.Encoding.GetEncoding("iso-8859-1"));
				//Convert the stream to a string
				strResponse = sr.ReadToEnd();
				System.Diagnostics.Debug.WriteLine(strResponse);
				sr.Close(); 
				return true;
			}

			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				throw new System.Exception(Ex.Message.ToString(), Ex);
			}
		}

		/*
		private System.Net.IWebRequestCreate FtpWebRequestCreator(System.Uri requestURL)
		{
      System.Net.IWebRequestCreate ftpRequest;
			return ftpRequest.Create(requestURL);
		}
		*/


		#endregion "*** FIN DE LOS PROCEDIMIENTOS AJAX ***"
	
	} // Fin de la clase.

}	// Fin del namespace
