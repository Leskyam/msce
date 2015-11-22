using System;
using System.IO;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsMiMaletin.
	/// </summary>
	public class clsMiMaletin
	{
		public clsMiMaletin(System.String UserId)
		{
			if(!existMaletin(UserId))
			{
				crearMaletin(UserId);
			}
			this.m_MaletinName = UserId;
			setFieldsValue(this.m_MaletinName);
		}

		#region "*** VARIABLES PRIVADAS ***"

		/// <summary>
		/// Camino base, sin tener en cuenta el nombre del maletín. Ej.: D:\inetpub\wwwroot\msce\briefcases
		/// </summary>
		private static string m_BasePath = string.Empty;
		/// <summary>
		/// Corresponde con el nombre de usuario del maestrante al que pertenece el maletín en cuestión.
		/// </summary>
		private string m_MaletinName;
		/// <summary>
		/// Cantidad total de ficheros que se encuentran en el maletín del maestrante.
		/// </summary>
		private int m_CantTotalFiles = 0;
		/// <summary>
		/// Cantidad total de espacio, en Bytes, que ocupan todos los ficheros en el maletín del maestrante.
		/// </summary>
		private long m_EspacioOcupado = 0;
        /// <summary>
        /// Objeto Maestrante, que es el maestrante al que pertenece el maletín.
        /// </summary>
		private clsMaestrante m_Ownner;
		/// <summary>
		/// Estructura con los campos Id, Nombre, Size y Fecha de cada uno de los ficheros que se encuentran en el maletín.
		/// </summary>
		private struContenido[] m_Contenido;

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** ESTRUCTURAS ***"

		public struct struContenido
		{
			/// <summary>
			/// Id controlado por programa.
			/// </summary>
			public int Id;
			/// <summary>
			/// Nombre completo del fichero.
			/// </summary>
			public System.String Nombre;
			/// <summary>
			/// Tamaño en Bytes del fichero.
			/// </summary>
			public long Size;
			/// <summary>
			/// Fecha de creación del fichero.
			/// </summary>
			public System.DateTime FechaUltimaModificacion;
		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROPIEDADES ***"

		public static System.String BasePath
		{
			get
			{
				if(m_BasePath==string.Empty)
				{
					/*
					  "Request.MapPath" de mono devuelve el camino con un caracter del tipo "DirectorySeparatorChar" 
					  al final de la cadena, pero el .Net Framework de MS no, así que los perseamos para que funcione 
					  para los dos Frameworks quitando dicho caracter si está presente al final de la cadena.
					*/
					string strAppPath = System.Web.HttpContext.Current.Request.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath);
					if(strAppPath.LastIndexOf(System.IO.Path.DirectorySeparatorChar)==(strAppPath.Length-1)){strAppPath=strAppPath.Substring(0,strAppPath.Length-1);}
					m_BasePath = strAppPath + System.IO.Path.DirectorySeparatorChar + "briefcases";
					if(!System.IO.Directory.Exists(m_BasePath))
					{
						m_BasePath = string.Empty;
						throw new System.Exception("No existe el directorio \"briefcases\" en la ruta de la aplicación.");
					}
				}

				return m_BasePath;
			}
		}
		/// <summary>
		/// Cantidad total de ficheros guardados en la carpeta del maletín.
		/// </summary>
		public int CantTotalFiles
		{
			get{return this.m_CantTotalFiles;}
			//set{this.m_CantTotalFiles = value;}
		}
		/// <summary>
		/// Cantidad total de espacio, en Bytes, que ocupan los ficheros que se encuentran en el maletín.
		/// </summary>
		public long EspacioOcupado
		{
			get{return this.m_EspacioOcupado;} // Devolver en Bytes.
			//set{this.m_EspacioOcupado = value;}
		}
		/// <summary>
		/// Objeto Maestrante que pertenece al maestrante propietario del maletín en cuestión.
		/// </summary>
		public clsMaestrante Ownner
		{
			get{return this.m_Ownner;}
			//set{this.m_Ownner = value;}
		}
		/// <summary>
		/// Estructura que almacenará los datos Id, Nombre, Size y Fecha de cada uno de los ficheros del maletín.
		/// </summary>
		public struContenido[] Contenido
		{
			get{return this.m_Contenido;}
			//set{this.m_Contenido = value;}
		}
		/// <summary>
		/// Valor configurado en el web.config que indica qué cantidad, en Bytes, de espacio puede ocupar un maletin.
		/// </summary>
		public long BriefcaseMaxSizeAllowed
		{
			get{return clsSettings.getWebConfigBriefcaseMaxSize*1024;}
		}
		/// <summary>
		/// Porciento ocupado según la cantidad de bytes existentes y la permitida.
		/// </summary>
		public double PorcientoOcupado
		{
			get
			{
				if(this.m_CantTotalFiles==0){return 0.00;}
				double dblResult = System.Convert.ToDouble(((System.Convert.ToDouble(this.m_EspacioOcupado)*100)/System.Convert.ToDouble(BriefcaseMaxSizeAllowed)).ToString("#0.00"));
				return dblResult;
			}
		}


		#endregion "*** FIN DE PROPIEDADES ***"
		
		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		private void setFieldsValue(System.String NombreMaletin)
		{
			if(System.IO.Directory.Exists(BasePath + System.IO.Path.DirectorySeparatorChar + NombreMaletin))
			{
				this.m_MaletinName = NombreMaletin;
				this.m_CantTotalFiles = 0;
				this.m_EspacioOcupado = 0;
				this.m_Ownner = new clsMaestrante(this.m_MaletinName);

				// Create a reference to the current directory.
				DirectoryInfo di = new DirectoryInfo(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName);
				// Create an array representing the files in the current directory.
				FileInfo[] fi = di.GetFiles();
				// Cantidad total de ficheros.
				this.m_CantTotalFiles = fi.Length;
				struContenido[] files = new struContenido[this.m_CantTotalFiles];
				int x = 0;
				foreach(FileInfo fiTemp in fi)
				{
					files[x].Id = x+1;
					files[x].Nombre = parseExtForView(fiTemp); // fiTemp.Name + " Sin .aspx: " + supressASPXExtension(fiTemp);
					files[x].Size = fiTemp.Length;
					files[x].FechaUltimaModificacion = fiTemp.LastWriteTime;
					++x;
					// Cantidad total de espacio ocupado por los ficheros en el maletín.
					this.m_EspacioOcupado += fiTemp.Length;
				}
                this.m_Contenido = files;
			}
			else
			{
				throw new System.Exception("El maletín para \"" + this.m_MaletinName + "\" no existe.");
			}
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="fInfo"></param>
		/// <returns></returns>
		private string parseExtForView(System.IO.FileInfo fInfo)
		{
			string srtReturn = fInfo.Name;
			if(fInfo.Extension==".aspx")
			{
				srtReturn = fInfo.Name.Substring(0,(fInfo.Name.Length-fInfo.Extension.Length));
			}
			else
			{
				fInfo.MoveTo(fInfo.FullName + ".aspx");
				parseExtForView(fInfo);
			}
			return srtReturn;
		}
		
		/// <summary>
        /// Crear la carpeta donde se almacenará el maletín del usuario maestrante, 
        /// y que llevará el nombre de usuario del mismo.
        /// </summary>
        /// <param name="NombreMaletin"></param>
        /// <returns></returns>
		private bool crearMaletin(string NombreMaletin)
		{
			try
			{
				System.IO.Directory.CreateDirectory(BasePath + System.IO.Path.DirectorySeparatorChar + NombreMaletin);
                
				return true;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				throw new System.Exception("No se puede crear el directorio para el maletín de su perfil", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Cambiar el nombre del maletín, o sea, cambiar el nombre 
		/// de la carpeta que contiene el maletín del usuario.
		/// </summary>
		/// <param name="newName"></param>
		/// <returns></returns>
		public bool Renombrar(string newName)
		{
			System.IO.DirectoryInfo dirInfo = new DirectoryInfo(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName);
			dirInfo.MoveTo(BasePath + System.IO.Path.DirectorySeparatorChar + newName);
			dirInfo = null;
			this.m_MaletinName = newName;
			setFieldsValue(newName);
			return true;
		}

		/// <summary>
		/// Eliminar de manera permanente el ficheros, cuyo nombre se pasa 
		/// como valor del parámetro.
		/// </summary>
		/// <param name="FileName"></param>
		/// <returns></returns>
		public bool EliminarFichero(System.String FileName)
		{
			FileInfo fi = new FileInfo(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + FileName + ".aspx");
			//fi = addASPXExtension(fi);
			if(System.IO.File.Exists(fi.FullName))
			{
				fi.Delete();
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool RenombrarFichero(System.String actualFileName, System.String newFileName)
		{
			// Comprobar si ya existe el fichero con el nombre que se intenta utilizar.
			if(System.IO.File.Exists(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + newFileName + ".aspx")){return false;}
			FileInfo fi = new FileInfo(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + actualFileName + ".aspx");
			FileInfo newfi = new FileInfo(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + newFileName + ".aspx");
			if(System.IO.File.Exists(fi.FullName) & !System.IO.File.Exists(newfi.FullName))
			{
				fi.MoveTo(newfi.FullName);
				return true;
			}
			else
			{
				return false;
			}
		}

		public bool existFile(System.String FileName)
		{
      if(!System.IO.File.Exists(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + FileName + ".aspx")){return false;}
			return true;
		}

		public bool existMaletin(System.String NombreMaletin)
		{
			if(System.IO.Directory.Exists(BasePath + System.IO.Path.DirectorySeparatorChar + NombreMaletin))
				return true;
			else
				return false;
		}

		public System.IO.FileInfo secureDownload(System.String FileName)
		{
			System.IO.FileInfo fInfo = new System.IO.FileInfo(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + FileName + ".aspx");
			return fInfo;


			/*
			FileInfo fi = new FileInfo(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + FileName + ".aspx");
			System.Web.HttpContext.Current.Response.Clear();
			System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + fi.Name.Replace(".aspx", ""));
			System.Web.HttpContext.Current.Response.AddHeader("Content-Length", fi.Length.ToString());
			System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
			System.Web.HttpContext.Current.Response.Charset = "iso-8859-1";
			System.Web.HttpContext.Current.Response.WriteFile(fi.FullName);
			System.Web.HttpContext.Current.Response.End();
			return true;
			*/
    }

		public bool agregarFicheros(System.Web.HttpFileCollection files)
		{
				for(int i=0; i<=(files.Count-1); i++)
				{
					//long intPropuesto = System.Convert.ToInt64(files[i].ContentLength)+this.m_EspacioOcupado;
					//long QuotaMas5Porciento = this.BriefcaseMaxSizeAllowed+(this.BriefcaseMaxSizeAllowed/20);
					//System.Diagnostics.Debug.WriteLine("Largo + EspacioOcupado: " + intPropuesto + " BriefcaseMaxSizeAllowed + 5 %: " + QuotaMas5Porciento);
					//System.Diagnostics.Debug.WriteLine(this.PorcientoOcupado + " y " + (intPropuesto<=QuotaMas5Porciento).ToString());
					if((this.PorcientoOcupado<100.00) & (System.Convert.ToInt64(files[i].ContentLength)+this.m_EspacioOcupado) <= this.BriefcaseMaxSizeAllowed+(this.BriefcaseMaxSizeAllowed/20)) // más, menos el 5 %
					{
						if(files[i].ContentLength==0){continue;}
						files[i].SaveAs(BasePath + System.IO.Path.DirectorySeparatorChar + this.m_MaletinName + System.IO.Path.DirectorySeparatorChar + System.IO.Path.GetFileName(files[i].FileName) + ".aspx");
            setFieldsValue(this.m_MaletinName);
						continue;
					}
					else
					{
						string filesNoSaved = string.Empty;
						for(int y=i; y<=(files.Count-1); y++)
						{
							if(files[y].ContentLength==0){continue;}
							filesNoSaved += filesNoSaved!=string.Empty?", " + System.IO.Path.GetFileName(files[y].FileName): System.IO.Path.GetFileName(files[y].FileName);
						}
							throw new System.Exception("No todos los ficheros fueron guardados, no hay suficiente espacio. Los nombres de los ficheros que no fueron guardados son: " + filesNoSaved);
					}
				}

			return true;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	}
}
