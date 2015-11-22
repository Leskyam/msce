using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
//using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Net;
using System.Net.Sockets;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Comentar la funcionalidad de esta clase.
	/// </summary>
	public class clsUtiles //: System.Web.UI.Page
	{
		// Contructor de esta clase.
		public clsUtiles()
		{
		}

		#region "*** VARIABLES PUBLICAS ***"
		
		/// <summary>
		/// Mensaje temporal para informar de algún proceso que se está realizando.
		/// </summary>
		public static string MSG_PROCESSING_BEGTAG = "<font style='padding-top: 1px; padding-bottom: 1px; padding-right: 2px; padding-left: 2px; font-weight: normal; font-size: 7pt; color: #dc143c; font-family: Verdana'>"; // Azul.
		/// <summary>
		/// Mensaje para informar de algún error sucedido. Texto en color del texto rojo oscuro y del fondo color mierda bien clarita.
		/// </summary>
		public static string MSG_ERROR_BEGTAG = "<font color=#dc143c style='padding-top: 1px; padding-bottom: 1px; padding-right: 2px; padding-left: 2px;	font-weight: normal; font-size: 7pt; color: #dc143c; font-family: Verdana; background-color: #ffefd5;'>"; 
		/// <summary>
		/// Etiquetas de cierre para final de los mensajes HTML.
		/// </summary>
		public static string MSG_ENDTAG = "</font>";
		public static string ERROR_MSG_COMPONENTS_IN_MAINTENNANCE = "Ha sucedido un error inesperado, es posible que algunos de los componentes de la aplicación se encuentre en mantenimiento, rogamos disculpe las molestias que esto pueda ocasionar.";
        /// <summary>
        /// Puerto TCP oficial para conexión con el servidor MySQL.
        /// </summary>
		public static System.Int32 DB_SERVER_PORT = 3306;



		#endregion "*** FIN DE VARIABLES PUBLICAS ***"

		#region "*** ESTRUCTURAS ***"
		
		/// <summary>
		/// Estructura para darle formato a los datos básicos del usuario, 
		/// que se deben guardar en una variable session.
		/// </summary>
		public struct struBasicUserData
		{
			/// <summary>
			/// Id del usuario en la base de datos
			/// </summary>
			public int intId;
			/// <summary>
			/// UserId del usuario con el que se identifica, normalmente el nombre del Mailbox.
			/// </summary>
			public string strUserId;
			/// <summary>
			/// Servidor POP3 que se utilizó para identificar al usuario.
			/// </summary>
			public string strPOP3ServerUsed;
			/// <summary>
			/// Indicador para saber si el usuario ha leído los términos de uso del servicio.
			/// </summary>
			public bool boReadTermsOfUse;
		}

		/// <summary>
		/// Estructura para almacenar los nombre de las variables 
		/// de session que se necesiten en toda la aplicación.
		/// </summary>
		public struct struSessionVarNames
		{
			/// <summary>
			/// Nombre de la variable session que almacena los datos básicos del usuario (Id, UserId, POP3ServerUsed)
			/// </summary>
			public string BasicUserData;
		}
		
		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"
	
		#region "*** PROCESAMIENTO DE FECHAS ***" 

		/// <summary>
		/// Formatea el valor del objeto DateTime pasado como argumento a la cadena
		/// yyyy-MM-dd HH:mm:ss, el cual es compatible con el formato de las fechas
		/// en MySql.
		/// </summary>
		/// <param name="oDate">Objeto DateTime a ser convertido</param>
		/// <returns></returns>
		public static string getStringMySqlFormatedDate(System.DateTime oDate)
		{
			string strFormat = "yyyy-MM-dd HH:mm:ss";
			return oDate.ToString(strFormat, System.Globalization.DateTimeFormatInfo.InvariantInfo);
		}

		/// <summary>
		/// Formatea el valor del objeto DateTime pasado como argumento a la cadena
		/// dd-MMM-yyyy h:mm:ss tt, el cual es compatible con el formato corto de 
		/// la aplicación.
		/// </summary>
		/// <param name="oDate">Objeto DateTime a ser convertido</param>
		/// <returns></returns>
		public static string getPresentationDateTime(System.DateTime oDate)
		{
			string strFormat = "dd-MMM-yyyy h:mm:ss tt";
			return oDate.ToString(strFormat, System.Globalization.DateTimeFormatInfo.InvariantInfo);
		}

		/// <summary>
		/// Formatea el valor del objeto DateTime pasado como argumento a la cadena
		/// dd-MMM-yyyy h:mm:ss tt, el cual es compatible con el formato corto de 
		/// la aplicación.
		/// </summary>
		/// <param name="oDate">Objeto DateTime a ser convertido</param>
		/// <returns></returns>
		public static string getPresentationDateTimeLong(System.DateTime oDate)
		{
			System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("es-MX");
			return oDate.ToString(culture.DateTimeFormat.LongDatePattern) + " a las " + oDate.ToString(culture.DateTimeFormat.LongTimePattern);
		}

		/// <summary>
		/// Formatea el valor del objeto DateTime pasado como argumento a la cadena
		/// dd-MMM-yyyy, el cual es compatible con el formato corto de de fechas 
		/// de la aplicación.
		/// </summary>
		/// <param name="oDate">Objeto DateTime a ser convertido</param>
		/// <returns></returns>
		public static string getPresentationDate(System.DateTime oDate)
		{
			string strFormat = "dd-MMM-yyyy";
			return oDate.ToString(strFormat, System.Globalization.DateTimeFormatInfo.InvariantInfo);
		}

		/// <summary>
		/// Formatea el valor del objeto DateTime pasado como argumento a la cadena
		/// "Miércoles, Julio 19, 2006" el cual es compatible con el formato largo 
		/// de de fechas de la aplicación.
		/// </summary>
		/// <param name="oDate">Objeto DateTime a ser convertido</param>
		/// <returns></returns>
		public static string getPresentationDateLong(System.DateTime oDate)
		{
			System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("es-MX");
			return oDate.ToString(culture.DateTimeFormat.LongDatePattern);
		}
		
		#endregion "*** FIN DE PROCESAMIENTO DE FECHAS ***" 

		#region "*** TRATAMIENTO DE CADENAS ***"
		
		public static string getUserNameFromIdentity(string strIdentityName)
		{
			return strIdentityName.Substring(0, strIdentityName.IndexOf("@"));
		}

		public static string getPOP3ServerFromIdentity(string strIdentityName)
		{
			return strIdentityName.Substring((strIdentityName.IndexOf("@")+1));
		}
		
		/// <summary>
		/// Cifra el contenido de los campos BLOB con 'UTF7Encoding' y devuelve el contenido
		/// en un System.Text.StringBuilder
		/// </summary>
		/// <param name="oBlobField">Un campo BLOB de un objeto DataTable.</param>
		/// <returns></returns>
		public static System.Text.StringBuilder getFromBLOB(object oBlobField)
		{
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
			System.Text.UTF7Encoding utf7 = new System.Text.UTF7Encoding();
			sbResult.Append(utf7.GetString((System.Byte[])(oBlobField)));
			return sbResult;
		}

		public static System.Text.StringBuilder getIntoBLOB(string strValue)
		{
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
			System.Text.UTF7Encoding utf7 = new System.Text.UTF7Encoding();
			sbResult.Append(utf7.GetBytes(strValue));
			return sbResult;
		}

		private static string getHTML_FootCopyright()
		{
			int intYearInitial = 2006;
			int intYearActual = System.DateTime.Now.Year;
			string strYears = (intYearInitial<intYearActual)?(intYearInitial.ToString() + "-" + intYearActual.ToString()):intYearInitial.ToString();

			string strCopyrightFoot = "<table cellspacing='0' cellpadding='0' width='750' align='center' border='0'>" + 
				"<tr>" + 
				"<td align='center' style='padding-right: 1px;padding-left: 1px;font-weight: bold;font-size: 7pt;padding-bottom: 1px;vertical-align: baseline;color: dimgray;padding-top: 1px;font-family: Verdana;'>" + 
				"Copyright &#169 " + strYears + " Universidad Pedagógica de Cienfuegos." + 
				"</td>" +
				"</tr>" + 
				"</table>";
			return strCopyrightFoot;
		}

		/// <summary>
		/// Devuelve un array string que contiene las palabras que se consideraron válidas según la configuración
		/// en la llave 'CharsToBypassInSearch' del web.config.
		/// </summary>
		/// <param name="strSentence">Cadena donde se buscarán las palabras para devolver el array.</param>
		/// <returns></returns>
//		public static string[] getSplittedSentence(string strSentence)
//		{
//			//Eliminar los espacios de la izquierda y derecha en caso que los halla.
//			strSentence = strSentence.Trim();
//			// Eliminar los caracteres de tipo numérico de la cadena.
//			for(int x=0; x<=9; x++)
//			{
//				strSentence = strSentence.Replace(x.ToString(),"");
//			}
//
//			//			System.Diagnostics.Debug.WriteLine(@"// DefaultTabString: " + System.Web.UI.HtmlTextWriter.DefaultTabString);
//			//			System.Diagnostics.Debug.WriteLine(@"// DoubleQuoteChar: " + System.Web.UI.HtmlTextWriter.DoubleQuoteChar);
//			//			System.Diagnostics.Debug.WriteLine(@"// EndTagLeftChars: " + System.Web.UI.HtmlTextWriter.EndTagLeftChars);
//			//			System.Diagnostics.Debug.WriteLine(@"// EqualsChar: " + System.Web.UI.HtmlTextWriter.EqualsChar);
//			//			System.Diagnostics.Debug.WriteLine(@"// EqualsDoubleQuoteString: " + System.Web.UI.HtmlTextWriter.EqualsDoubleQuoteString);
//			//			System.Diagnostics.Debug.WriteLine(@"// SelfClosingChars: " + System.Web.UI.HtmlTextWriter.SelfClosingChars);
//			//			System.Diagnostics.Debug.WriteLine(@"// SelfClosingTagEnd: " + System.Web.UI.HtmlTextWriter.SelfClosingTagEnd);
//			//			System.Diagnostics.Debug.WriteLine(@"// SemicolonChar: " + System.Web.UI.HtmlTextWriter.SemicolonChar);
//			//			System.Diagnostics.Debug.WriteLine(@"// SingleQuoteChar: " + System.Web.UI.HtmlTextWriter.SingleQuoteChar);
//			//			System.Diagnostics.Debug.WriteLine(@"// SlashChar: " + System.Web.UI.HtmlTextWriter.SlashChar);
//			//			System.Diagnostics.Debug.WriteLine(@"// StyleEqualsChar: " + System.Web.UI.HtmlTextWriter.StyleEqualsChar);
//			//			System.Diagnostics.Debug.WriteLine(@"// TagLeftChar: " + System.Web.UI.HtmlTextWriter.TagLeftChar);
//			//			System.Diagnostics.Debug.WriteLine(@"// TagRightChar: " + System.Web.UI.HtmlTextWriter.TagRightChar);
//
//			System.Text.StringBuilder sbSentence = new System.Text.StringBuilder();
//			sbSentence.Append(strSentence);
//
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.DefaultTabString,""); // DefaultTabString: 	
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.DoubleQuoteChar.ToString(),""); // DoubleQuoteChar: "
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.EndTagLeftChars,""); // EndTagLeftChars: </
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.EqualsChar.ToString(),""); // EqualsChar: =
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.EqualsDoubleQuoteString,""); // EqualsDoubleQuoteString: ="
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.SelfClosingChars,""); // SelfClosingChars:  /
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.SelfClosingTagEnd,""); // SelfClosingTagEnd:  />
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.SemicolonChar.ToString(),""); // SemicolonChar: ;
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.SingleQuoteChar.ToString(),""); // SingleQuoteChar: '
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.SlashChar.ToString(),""); // SlashChar: /
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.StyleEqualsChar.ToString(),""); // StyleEqualsChar: :
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.TagLeftChar.ToString(),""); // TagLeftChar: <
//			sbSentence = sbSentence.Replace(System.Web.UI.HtmlTextWriter.TagRightChar.ToString(),""); // TagRightChar: >
//
//			// Obtener el array de la sentencia separando palabras por espacios.
//			string[] strArySentence = sbSentence.ToString().Split(' ');
//			// Obtener la lista de palabras a omitir en las búsquedas y ponerlas en un array.
//			string[] strAryStringsToIgnoreInSearch = clsAppSettings.getCharsToBypassInSearch().Split('|');
//			// Cadena donde se almacenarán las palablas separadas por '|' para convertirlas en un array y devolverlas.
//			string strNewSentence = string.Empty;
//
//			// Iterar por el array que contiene la sentencia separada por espacios.
//			for(int x=0; (x<=(strArySentence.Length -1)); x++)
//			{
//				bool boInclude = true; // Para saber si debo incluir la palabra en la búsqueda.
//				// Iterar por las palabras quese omiten.
//				foreach(string sValue in strAryStringsToIgnoreInSearch)
//				{
//					if((strArySentence[x].ToUpper() == sValue.ToUpper()))
//					{
//						boInclude = false;
//						break;
//					}
//				}
//                
//				if(boInclude) 
//				{
//					if(strNewSentence != string.Empty)
//					{
//						strNewSentence += "|" + strArySentence[x];
//					}
//					else	// La primera vez que se le asigna un valor a la cadena que luego se convierte en array para ser devuelta.
//					{
//						strNewSentence = strArySentence[x];
//					}
//				}
//
//			}
//			
//			return strNewSentence.Split('|');
//
//		} // Fin de getSplittedSentence()


		#endregion "*** FIN DE TRATAMIENTO DE CADENAS ***"
		
		#region "*** DIAGNÓSTICO DE RED Y SERVICIOS ***"

		public static bool IsBServerAlive(string strServer) 
		{
			return true;
		}

		public static bool IsBServiceAlive(string strServer, System.Int32 intPort) 
		{
			// Create a TcpClient.
			// Note, for this client to work you need to have a TcpServer 
			// connected to the same address as specified by the server, port
			// combination.
			
			System.Diagnostics.Debug.WriteLine("IsBServiceAlive. Inicio: " + System.DateTime.Now);
			
			System.Net.Sockets.TcpClient client = new TcpClient();
			try
			{
				client.NoDelay = true;
				client.Connect(strServer, intPort);
				client.Close();
				return true;
			}
			catch(System.Net.Sockets.SocketException ExSocket) 
			{
				System.Diagnostics.Debug.WriteLine(ExSocket.ToString());
				return false;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				return false;
			}
			finally
			{
				System.Diagnostics.Debug.WriteLine("IsBServiceAlive. Fin: " + System.DateTime.Now);
				// Close everything.
				client.Close();
			}
		}

		#endregion "*** FIN DE DIAGNÓSTICO DE RED ***"

		public static void Page_RegisterCopyright(object sender, System.EventArgs e)
		{
			try
			{
				HttpContext.Current.Response.Write(clsUtiles.getHTML_FootCopyright());
			}
			catch(System.Exception)
			{
				return;
			}
		}

		/// <summary>
		/// Devuelve un Array de DataView de largo = 2, en el primer DataView aparecerá un sólo registro 
		/// con un campo llamado "cantPages" y en el segundo los registros que coincidan con el DataTable
		/// que se pasa como parámetro y que estén dentro de la página según los valores de los demás parámetros.
		/// </summary>
		/// <param name="dt">DataTable de los datos a paginar.</param>
		/// <param name="intPage">Página de la que se devolverán los datos</param>
		/// <param name="intRecordsByPage">Cantidad de registros por página para dividir los datos.</param>
		/// <returns></returns>
		public DataView[] getPagina(System.Data.DataTable dt, int intPage, int intRecordsByPage)
		{
			int intCantPaginas = 0;
			int intCantRecordsLastPage = 0;
			int intFrom = 0;
			int intTo = 0;
			
			if(dt.Rows.Count>0)
			{
				intCantPaginas = dt.Rows.Count/intRecordsByPage;
				intCantRecordsLastPage = dt.Rows.Count%intRecordsByPage;
				if(intCantRecordsLastPage>0){++intCantPaginas;}
				if(intPage>intCantPaginas){intPage=intCantPaginas;}
				intFrom = (intPage*intRecordsByPage)-intRecordsByPage;
				intTo = ((intPage==intCantPaginas) & (intCantRecordsLastPage>0))?(dt.Rows.Count-1):(intPage*intRecordsByPage)-1;
			}

			DataView[] dv = new DataView[2];
			DataTable dt1 = new DataTable();
			DataColumn colItem1 = new DataColumn("cantPages",Type.GetType("System.UInt16"));
			dt1.Columns.Add(colItem1);
			DataColumn colItem2 = new DataColumn("cantTotalRecords",Type.GetType("System.UInt16"));
			dt1.Columns.Add(colItem2);
			DataRow NewRow;
			NewRow = dt1.NewRow();
			if(dt.Rows.Count>0)
			{
				NewRow["cantPages"] = intCantPaginas;
				NewRow["cantTotalRecords"] = dt.Rows.Count;
				dt1.Rows.Add(NewRow);
			}
			for(int x=0; x<=(dt1.Columns.Count-1); x++)
			{
				System.Diagnostics.Debug.WriteLine(dt1.Columns[x].ColumnName);
			}
			dv[0] = dt1.DefaultView;
			dt1=null;

			DataTable dtNew = dt.Clone();
			for(int x=intFrom; x<=intTo; x++)
			{
				// Poner tope para cuando sea el caso de la última página y la cantidad de registro se menor que "intTo".
				if(x>=dt.Rows.Count){break;}
				dtNew.Rows.Add(dt.Rows[x].ItemArray);                    						
			}

			dv[1]= dtNew.DefaultView;

			System.Diagnostics.Debug.WriteLine("dv[0].Rows.Count: " + dv[0].Count);
			System.Diagnostics.Debug.WriteLine("dv[1].Rows.Count: " + dv[1].Count);

			return dv;

		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase clsUtiles()

} // Fin del namespace.
