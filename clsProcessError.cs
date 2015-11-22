using System;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsProcessError.
	/// </summary>
	public class clsProcessError
	{
		public clsProcessError()
		{
			//
			// TODO: agregar aquí la lógica del constructor
			//
		}

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Procesar errores que se mostrarán en la parte superior a lo largo de toda la página,
		/// inmediatamente después del encabezado de la página, en los elementos <TR> y <SPAN>
		/// </summary>
		/// <param name="tr_Notify">Objeto <tr> del lado del servidor.</param>
		/// <param name="sp_Notify">Objeto <span> del lado del servidor.</param>
		/// <param name="strErrorMessage">Mensaje de error.</param>
		public void ShowPageErrorNotification(System.Web.UI.HtmlControls.HtmlTableRow tr_Notify, 
			System.Web.UI.HtmlControls.HtmlGenericControl sp_Notify, string strErrorMessage)
		{
			//class="spErrorNotification" 
			tr_Notify.Style["display"] = "block";
			if(sp_Notify.InnerHtml==string.Empty)
			{
				sp_Notify.InnerHtml += "<ul style='padding-left: 1px; padding-bottom: 1px; margin-left: 1px; margin-top: 1px'>Ha ocurrido un error: "; 
			}
			sp_Notify.InnerHtml += "<li style='margin-left: 20px;'>" + strErrorMessage + "</li>";
			sp_Notify.Attributes["class"]="spErrorNotification";
			sp_Notify.Style["display"] = "block";
		}
		
		/// <summary>
		/// Procesar errores que se mostrarán en la parte superior a lo largo de toda la página,
		/// inmediatamente después del encabezado de la página, en los elementos <TR> y <SPAN>
		/// </summary>
		/// <param name="tr_Notify">Objeto <tr> del lado del servidor.</param>
		/// <param name="sp_Notify">Objeto <span> del lado del servidor.</param>
		/// <param name="strWariningHeader">Encabezado para el mensaje de advertencia.</param>
		/// <param name="strWariningMessage">Contenido del mensaje de advertencia.</param>
		public void ShowPageWarningNotification(System.Web.UI.HtmlControls.HtmlTableRow tr_Notify, 
			System.Web.UI.HtmlControls.HtmlGenericControl sp_Notify, 
			string strWarningHeader, string strWarningMessage)
		{
			tr_Notify.Style["display"] = "block";
			if(sp_Notify.InnerHtml==string.Empty)
			{
				sp_Notify.InnerHtml += "<ul style='padding-left: 1px; padding-bottom: 1px; margin-bottom: 0px; margin-left: 1px; margin-top: 1px'>ADVERTENCIA(S): " + strWarningHeader; 
			}
			sp_Notify.InnerHtml += "<li style='list-style-position: outside; margin-left: 20px;'>" + strWarningMessage + "</li>";
			sp_Notify.Style["display"] = "block";
			sp_Notify.Attributes["class"]="spWarningNotification";
		}

		public void ClearPageErrorNotification(System.Web.UI.HtmlControls.HtmlTableRow tr_Notify, 
			System.Web.UI.HtmlControls.HtmlGenericControl sp_Notify)
		{
			tr_Notify.Style["display"] = "none";
			sp_Notify.InnerHtml = string.Empty;
			sp_Notify.Style["display"] = "none";
		}
		
		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase.

} // Fin del namespace.
