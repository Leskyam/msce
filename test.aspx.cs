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
	/// Descripción breve de test.
	/// </summary>
	public partial class test : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			clsMiMaletin Maletin = new clsMiMaletin(HttpContext.Current.User.Identity.Name);
			Response.Write("<b>Propietario: " + Maletin.Ownner.Nombre + " " + Maletin.Ownner.Apellidos + "</b><br>");
			Response.Write("CantTotalFiles: " + Maletin.CantTotalFiles + "<br>");
			Response.Write("TotalSize: " + Maletin.EspacioOcupado + "bytes <br>");
			Response.Write("Porciento ocupado: " + Maletin.PorcientoOcupado.ToString() + "<br>");

			Response.Write("<table><tr><td>Id</td><td>Nombre</td><td>Tamaño</td><td>Fecha última modificación</td></tr>");

			for(int i=0; i<=(Maletin.Contenido.Length-1); i++)
			{
				Response.Write("<tr><td>" + Maletin.Contenido[i].Id + "</td><td>" + Maletin.Contenido[i].Nombre + "</td><td>" + Maletin.Contenido[i].Size + "bytes </td><td>" + clsUtiles.getPresentationDateTimeLong(Maletin.Contenido[i].FechaUltimaModificacion) + "</td></tr>");
				//Response.Write("Fichero: " + Maletin.Contenido[i].Id + " Nombre<br>");
			}
			Response.Write("</table>");


			// Introducir aquí el código de usuario para inicializar la página
//			if(Page.Request.QueryString["Id"]!=null)
//			{
				if(Page.Request.QueryString["type"]!=null)
				{
					string strTitle, strDescription;
					int intWidth, intHeight;
					switch(Page.Request.QueryString["type"].ToString())
					{
						case "view":
						{
							intWidth = 512;
							intHeight = 384;
							strTitle = "Nombre del video";
							strDescription = string.Empty;
							break;
						}
						default:
						{
							intWidth = 320;
							intHeight = 250;
							strTitle = "Nombre del video";
							strDescription = "Nombre: Nombre del video&nbsp;&nbsp;Tamaño: 1,43 MB<br>Autor: Autor del viedo&nbsp;&nbsp;<a href=\"bibliografia\\audiovisuales\\2373.swf\">Descargar</a><br><br>";
							break;
						}
					}
//			}
				if(!Page.IsStartupScriptRegistered("media"))
				{
					string strFileName = "media.avi";
					System.IO.FileInfo oFile = new System.IO.FileInfo(Request.ApplicationPath + System.IO.Path.DirectorySeparatorChar + strFileName);
					string strScript = string.Empty;
					if(oFile.Extension=="swf")
					{
						// Específico para películas flash
						strScript = "<script language='javascript'><!--" + System.Environment.NewLine;
						strScript += "var objMedia = '<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\"" + intWidth + "\" height=\"" + intHeight + "\" viewastext>';" + System.Environment.NewLine;
						strScript += " objMedia += '<param name=\"movie\" value=\"bibliografia/basica/audiovisual/" +  strFileName + "\">';" + System.Environment.NewLine;
						strScript += " objMedia += '<param name=\"quality\" value=\"high\">';" + System.Environment.NewLine;
						strScript += " objMedia += '<embed src=\"bibliografia/basica/audiovisual/" +  strFileName + "\" quality=\"high\" width=\"" + intWidth + "\" height=\"" + intHeight + "\"></embed>';" + System.Environment.NewLine;
						strScript += " objMedia += '</object>';" + System.Environment.NewLine;
						strScript += " document.getElementById('spHeaderContent').innerHTML = '" + strTitle + "';" + System.Environment.NewLine;
						strScript += " document.getElementById('dvmedia').innerHTML = '" + strDescription + "' + objMedia;" + System.Environment.NewLine;
						strScript += "//--></script>" + System.Environment.NewLine;
						Page.RegisterStartupScript("media", strScript);
					}
					else
					{
						strScript = "<script language='javascript'><!--" + System.Environment.NewLine;
            strScript += "var WMP7;";
            strScript += "if ( navigator.appName != \"Netscape\" ){   ";
            strScript += "WMP7 = new ActiveXObject('WMPlayer.OCX');";
						strScript += "}";
						strScript += "// Windows Media Player 7 Code";
						strScript += "if ( WMP7 )";
						strScript += "{";
						strScript += "var objMedia =\"<object id=\"MediaPlayer\" classid=\"clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6\" standby=\"Loading Microsoft Windows Media Player components...\" type=\"application/x-oleobject\" width=\"" + intWidth + "\" height=\"" + intHeight + "\">; ";
            strScript += "objMedia += '<param name=\"url\" value=\"http://ncnetshow/station1.asx\">';";
						strScript += "objMedia += '<param name=\"AutoStart\" value=\"true\">';";
						strScript += "objMedia += '<param name=\"ShowControls\" value=\"1\">';";
						strScript += "objMedia += '<param name=\"uiMode\" value=\"mini\">';";
						strScript += "objMedia += '</object>';";
						strScript += "objMedia += '}';";
            strScript += "objMedia += '// Windows Media Player 6.4 Code'";
						strScript += "else";
						strScript += "{";
						strScript += "//IE Code";
						strScript += "var objMedia =\"<object id=\"MediaPlayer\" classid=\"clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95\" codebase=\"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715\" standby=\"Loading Microsoft Windows Media Player components...\" type=\"application/x-oleobject\" width=\"" + intWidth + "\" height=\"" + intHeight + "\">;";
            strScript += "";
     /*
  	document.write ('<PARAM NAME="FileName" VALUE="http://ncnetshow/station1.asx">');
     document.write ('<PARAM NAME="AutoStart" VALUE="true">');
     document.write ('<PARAM NAME="ShowControls" VALUE="1">');

     //Netscape code
     document.write ('    <Embed type="application/x-mplayer2"');
     document.write ('        pluginspage="http://www.microsoft.com/windows/windowsmedia/"');
     document.write ('        filename="http://ncnetshow/station1.asx"');
     document.write ('        src="http://ncnetshow/station1.asx"');
     document.write ('        Name=MediaPlayer');
     document.write ('        ShowControls=1');
     document.write ('        ShowDisplay=1');
     document.write ('        ShowStatusBar=1');
     document.write ('        width=290');
     document.write ('        height=320>');
     document.write ('    </embed>');

     document.write ('</OBJECT>');
}

</SCRIPT>
		 */


					}
						/*
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="800" height="600" viewastext>
							<param name="movie" value="bibliografia/audiovisuales/2373.swf">
							<param name="quality" value="high">
							<embed src="bibliografia/audiovisuales/2373.swf" quality="high" width="800" height="600">
							</embed>
						</object>
						*/
					/*for(int i=0; i<=(Page.Request.Headers.Count-1); i++)
					{
						System.Diagnostics.Debug.WriteLine(Page.Request.Headers[i].ToString());
					}
					*/

				}
			}
		}

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
	}
}
