using System;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsSettings.
	/// </summary>
	public class clsSettings
	{
		public clsSettings()
		{
			//
			// TODO: agregar aquí la lógica del constructor
			//
		}

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		/// <summary>
		/// Devuelve del web.config el valor de la llave (key) que se pase como parámetro.
		/// </summary>
		/// <param name="strKey">Nombre de la llave de la cual se debe recuperar el valor</param>
		/// <returns></returns>
		private static string getWebConfigSimpleValue(string strKeyName)
		{
			if(System.Configuration.ConfigurationSettings.AppSettings[strKeyName] != null)
			{
				return System.Configuration.ConfigurationSettings.AppSettings[strKeyName];
			}
			else
			{
				throw new System.Exception("La llave '" + strKeyName + "' no existe en la sección 'appSettings' del fichero de configuración 'web.config'");
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"
		
		#region "*** PROCEDIMIENTOS PÚBLICOS ESTÁTICOS ***"
		
		/// <summary>
		/// Devuelve el nombre del servidor de bases de datos que aparece configurado 
		/// para los datos de la aplicación en el fichero de configuración 'web.config'.
		/// </summary>
		public static string DBServer
		{
			get
			{
				return getWebConfigSimpleValue("DBServer");
			}
		}

		/// <summary>
		/// Devuelve el nombre de la base de datos que aparece configurado para los datos 
		/// de la aplicación en el fichero de configuración 'web.config'.
		/// </summary>
		public static string DBName
		{
			get
			{
				return getWebConfigSimpleValue("DBName");
			}
		}
		
		/// <summary>
		/// Devuelve el nombre de usuario con acceso a la base de datos que aparece configurado 
		/// en el fichero de configuración 'web.config'.
		/// </summary>
		public static string DBUserName
		{
			get
			{
				return getWebConfigSimpleValue("DBUserName");
			}
		}

		/// <summary>
		/// Devuelve la contraseña que le corresponde al nombre de usuario que aparece configurado 
		/// en el fichero de configuración 'web.config'.
		/// </summary>
		public static string DBUserPassword
		{
			get
			{
				return getWebConfigSimpleValue("DBUserPassword");
			}
		}

		/// <summary>
		/// Servidor SMTP para el envío de correo electrónico.
		/// </summary>
		public static string SMTPServer
		{
			get
			{
				string strSMTPServer = getWebConfigSimpleValue("SMTPServer");
				return strSMTPServer.Substring(0,strSMTPServer.IndexOf(":"));
			}
		}

		/// <summary>
		/// Puerto SMTP utilizado para el envío de correo electrónico.
		/// </summary>
		public static int SMTPServerPort
		{
			get
			{
				string strSMTPServer = getWebConfigSimpleValue("SMTPServer");
				return System.Convert.ToInt32(strSMTPServer.Substring(strSMTPServer.IndexOf(":")));
			}
		}

		/// <summary>
		/// Flag para saber si se utiliza la authentication SMTP.
		/// </summary>
		public static bool SMTPAuth
		{
			get
			{
				return System.Convert.ToBoolean(getWebConfigSimpleValue("SMTPAuth"));
			}
		}

		/// <summary>
		/// Cuenta SMTP del usuario utilizado para el envío de correo.
		/// </summary>
		public static string SMTPUser
		{
			get
			{
				return getWebConfigSimpleValue("SMTPUser");
			}
		}

		/// <summary>
		/// Contraseña de la cuenta SMTP, para el envío de correo.
		/// </summary>
		public static string SMTPPassword
		{
			get
			{
				return getWebConfigSimpleValue("SMTPPassword");
			}
		}

		/// <summary>
		/// Tamaño máximo, en KB, que puede alcanzar el maletín de un maestrante.
		/// </summary>
		public static System.UInt32 getWebConfigBriefcaseMaxSize
		{
			get 
			{
				try
				{
					return System.Convert.ToUInt32(getWebConfigSimpleValue("BriefcaseMaxSize"));
				}
				catch(System.Exception)
				{
					// Si hay error, retornar el valor predeterminado, 10 MB.
					return 10240;
				}
			}
		}

		/// <summary>
		/// Tamaño máximo, en KB, que puede alcanzar la bibliografía complementaria 
		/// almacenada por un docente.
		/// </summary>
		public static System.UInt32 getWebConfigBibliographyMaxSize
		{
			get 
			{
				try
				{
					return System.Convert.ToUInt32(getWebConfigSimpleValue("BibliographyMaxSize"));
				}
				catch(System.Exception)
				{
					// Si hay error, retornar el valor predeterminado, 20 MB.
					return 20480;
				}
			}
		}

		public static System.String getWebConfigMaxRequestLength
		{
			get
			{
				object objHttpRuntimeConfig = System.Configuration.ConfigurationSettings.GetConfig("system.web/httpRuntime");
                return objHttpRuntimeConfig.ToString();
			}
		}

		
		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ESTÁTICOS ***"

	} // Fin de la clase

}	// Fin del namespace
