using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsAcademico.
	/// </summary>
	public class clsBibliografia
	{
		#region "*** CONSTRUCTORES ***"

		public clsBibliografia()
		{
		}
		
		public clsBibliografia(System.UInt32 Id)
		{
			setFieldsValue(Id);
		}

		#endregion "*** FIN DE CONSTRUCTORES ***"

		#region "*** VARIABLES PRIVADAS ***"

		protected System.UInt32 m_Id;
		protected System.UInt32 m_IdUsuario;
		protected string m_Titulo;
		protected string m_Autores;
		protected enuTipo m_Tipo;
		protected enuSoporte m_Soporte;
		protected System.DateTime m_datFechaRegistro;
		protected struTemas[] m_Temas;
		protected struFicheros[] m_Ficheros;
		protected string m_TableName = "tbl_bibliografia";
		protected string m_TableTemas = "tbl_bibliografia_tema";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.UInt32 Id
		{
			get{return this.m_Id;}
		}
		public System.UInt32 IdUsuario
		{
			get{return this.m_IdUsuario;}
			set{this.m_IdUsuario = value;}
		}
		public string Titulo
		{
			get{return this.m_Titulo;}
			set{this.m_Titulo = value;}
		}
		public string Autores
		{
			get{return this.m_Autores;}
			set{this.m_Autores = value;}
		}
		public clsBibliografia.enuTipo Tipo
		{
			get{return this.m_Tipo;}
			set{this.m_Tipo = value;}
		}
		public clsBibliografia.enuSoporte Soporte
		{
			get{return this.m_Soporte;}
			set{this.m_Soporte = value;}
		}
		public System.DateTime datFechaRegistro
		{
			get{return this.m_datFechaRegistro;}
			set{this.m_datFechaRegistro = value;}
		}
		public clsBibliografia.struTemas[] Temas
		{
			get{return this.m_Temas;}
			set{this.m_Temas = value;}
		}
		
		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** ENUMERACINES ***"

		/// <summary>
		/// Puede ser Básica (1) ó Complementaria (2)
		/// </summary>
		public enum enuTipo: byte
		{
			Basica = 1,
			Complementaria = 2
		};

		/// <summary>
		/// Puede ser Audiovisual (1), CD (2) ó Documento (3)
		/// </summary>
		public enum enuSoporte: byte
		{
			Audiovisual = 1,
			CD = 2,
			Documento = 3
		};
		
		#endregion "*** FIN DE ENUMERACINES ***"

		#region "*** ESTRUCTURAS ***"

		/// <summary>
		/// Esta estructura contiene todos los campos de datos de una entidad "Academico"
		/// se emplea para recopilar los datos del cliente para actualizaciones porque
		/// el AjaxPro con el que se trabaja no acepta "subir" esta clase compleja desde
		/// el cliente.
		/// </summary>
		public struct struBibliografia
		{
			public System.UInt32 Id;
			public System.UInt32 IdUsuario;
			public string Titulo;
			public string Autores;
			public clsBibliografia.enuTipo Tipo;
			public clsBibliografia.enuSoporte Soporte;
		}
		/// <summary>
		/// Estructura para los campos de la tabla "tbl_bibliografia_tema"
		/// </summary>
		public struct struTemas
		{
			public System.Byte IdTema;
		}
		/// <summary>
		/// Estructura para los campos de la tabla "tbl_bibliografia_file"
		/// </summary>
		public struct struFicheros
		{
			public System.UInt64 fileSize;
			public string fileURL;
		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		private void setFieldsValue(System.UInt32 Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			if(dt.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToUInt32(dt.Rows[0]["Id"]);
				this.m_IdUsuario = System.Convert.ToUInt32(dt.Rows[0]["Id_Usuario"]);
				this.m_Titulo = System.Convert.ToString(dt.Rows[0]["Titulo"]);
				this.m_Autores = System.Convert.ToString(dt.Rows[0]["Autores"]);
				this.m_Tipo = (clsBibliografia.enuTipo)(dt.Rows[0]["Tipo"]);
				this.m_Soporte = (clsBibliografia.enuSoporte)(dt.Rows[0]["Soporte"]);
				this.m_datFechaRegistro = System.Convert.ToDateTime(dt.Rows[0]["datFechaRegistro"]);
				// Temas a los que pertenece la bibliografía
				strSQL = "SELECT * FROM " + this.m_TableTemas + " WHERE Id_Bibliografia=" + this.m_Id + ";";
				dt = oDAL.getDataTable(strSQL);
				if(dt.Rows.Count>0)
				{
					clsBibliografia.struTemas[] Temas = new struTemas[dt.Rows.Count];
					for(int i=0; i<=(dt.Rows.Count-1); i++)
					{
						Temas[i].IdTema = System.Convert.ToByte(dt.Rows[i]["Id_Tema"]);
					}
					this.m_Temas = Temas;
				}
			}

			oDAL = null;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve los campos Id, Titulo, 
		/// Registrante (nombre + apellidos del usuario que registró esta bibliografía), Tipo y Soporte.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista()
		{
			string strSQL = "SELECT tbl_bibliografia.Id, tbl_bibliografia.Titulo, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Registrante, " +
				"CASE tbl_bibliografia.Tipo WHEN " + System.Convert.ToByte(enuTipo.Basica) + " THEN 'Básica' ELSE 'Complementaria' END AS Tipo, " + 
				"CASE tbl_bibliografia.Soporte WHEN " + System.Convert.ToByte(enuSoporte.Audiovisual) + " THEN 'Audio-visual' " +
				"WHEN " + System.Convert.ToByte(enuSoporte.CD) + " THEN 'Disco compacto' ELSE 'Documento' END AS Soporte FROM tbl_bibliografia " +
				"INNER JOIN tbl_usuario ON tbl_bibliografia.Id_Usuario = tbl_usuario.Id;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve los campos Id, Titulo, 
		/// Registrante (nombre + apellidos del usuario que registró esta bibliografía), Tipo y Soporte. 
		/// Filtrado por Tipo (Básica o Complementaria).
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista(clsBibliografia.enuTipo Tipo)
		{
			string strSQL = "SELECT tbl_bibliografia.Id, tbl_bibliografia.Titulo, " + 
        "CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Registrante, " +
        "CASE tbl_bibliografia.Tipo WHEN " + System.Convert.ToByte(enuTipo.Basica) + " THEN 'Básica' ELSE 'Complementaria' END AS Tipo, " + 
				"CASE tbl_bibliografia.Soporte WHEN " + System.Convert.ToByte(enuSoporte.Audiovisual) + " THEN 'Audio-visual' " +
				"WHEN " + System.Convert.ToByte(enuSoporte.CD) + " THEN 'Disco compacto' ELSE 'Documento' END AS Soporte FROM tbl_bibliografia " +
				"INNER JOIN tbl_usuario ON tbl_bibliografia.Id_Usuario = tbl_usuario.Id " + 
				"WHERE tbl_bibliografia.Tipo=" + System.Convert.ToByte(Tipo) + ";";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve los campos Id, Titulo, 
		/// Registrante (nombre + apellidos del usuario que registró esta bibliografía), Tipo y Soporte. 
		/// Filtrado por Soporte (Audiovisual, CD ó Documento).
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista(clsBibliografia.enuSoporte Soporte)
		{
			string strSQL = "SELECT tbl_bibliografia.Id, tbl_bibliografia.Titulo, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Registrante, " +
				"CASE tbl_bibliografia.Tipo WHEN " + System.Convert.ToByte(enuTipo.Basica) + " THEN 'Básica' ELSE 'Complementaria' END AS Tipo, " + 
				"CASE tbl_bibliografia.Soporte WHEN " + System.Convert.ToByte(enuSoporte.Audiovisual) + " THEN 'Audio-visual' " +
				"WHEN " + System.Convert.ToByte(enuSoporte.CD) + " THEN 'Disco compacto' ELSE 'Documento' END AS Soporte FROM tbl_bibliografia " +
				"INNER JOIN tbl_usuario ON tbl_bibliografia.Id_Usuario = tbl_usuario.Id " + 
				"WHERE tbl_bibliografia.Soporte=" + System.Convert.ToByte(Soporte) + ";";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/*

		/// <summary>
		/// Devuelve los campos "Id", "UserId", "Nombre" (nombre + apellidos) y "CuentaBloqueada" de todos los 
		/// usuarios con role de Académico, ordenados por: Nombre, Apellidos, Sexo
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getExtendedLista()
		{
			string strSQL = "SELECT tbl_usuario_academico.Id_Usuario AS Id, tbl_usuario.UserId, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', " + "tbl_usuario.Apellidos) AS Nombre, " +
				"tbl_usuario.CuentaBloqueada " + 
				"FROM tbl_usuario " + 
				"INNER JOIN tbl_usuario_academico ON tbl_usuario.Id = tbl_usuario_academico.Id_Usuario " +
				"ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos, tbl_usuario.Sexo;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dtAcademicos = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtAcademicos;
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT " + this.m_TableName + ".*, " + this.m_TableName + ".FuncionAcademico " + 
				"FROM " + base.m_TableName + " " + 
				"INNER JOIN " + this.m_TableName + " ON " + base.m_TableName + ".Id=" + this.m_TableName + ".Id_Usuario;";
			clsDAL oDAL = new clsDAL();
			DataTable dtAcademicos = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtAcademicos;
		}

		*/

		public DataTable getById(System.UInt32 Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve la cantidad de registros de esta entidad que estén en la base de datos.
		/// </summary>
		/// <returns></returns>
		public System.UInt32 getCantidad()
		{
			clsDAL oDAL = new clsDAL();
			System.UInt32 intCant = System.Convert.ToUInt32(oDAL.getEscalarValue("SELECT COUNT(Id) FROM " + this.m_TableName + ";"));
			oDAL = null;
			return intCant;
		}

		public bool Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " VALUES(null, " + this.m_IdUsuario + ", " +
				"'" + this.m_Titulo + "', '" + this.m_Autores + "', " + System.Convert.ToByte(this.m_Tipo) + ", " +
				System.Convert.ToByte(this.m_Soporte) + ", '" + clsUtiles.getStringMySqlFormatedDate(System.DateTime.Now) + "');";
			clsDAL oDAL = new clsDAL();
			oDAL.BeginTrans();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			this.m_Id = System.Convert.ToUInt32(oDAL.getLastIDENTITY(this.m_TableName));
			// Para agregar los temas a los que pertenece la bibliografía.
			clsTema Tema = new clsTema();
			System.Byte bytCantTemas = Tema.getCantidad();
			Tema = null;
			if((this.m_Temas.Length>0) & (this.m_Temas.Length<bytCantTemas)) // Cuando se declaran explícitamente los temas ó cuando se han seleccionado todos.
			{
				for(int i=0; i<=(this.m_Temas.Length-1); i++)
				{
					strSQL = "INSERT INTO " + this.m_TableTemas + " VALUES(null, " + this.m_Id + ", " + System.Convert.ToByte(this.m_Temas[i].IdTema) + ");";
					oDAL.ExecCommand(strSQL);
				}
			}
			else // Para cuando no se declaran explícitamente los temas y se desea que pertenezca a todos, se inserta un cero (0).
			{
				strSQL = "INSERT INTO " + this.m_TableTemas + " VALUES(null, " + this.m_Id + ", 0);";
			}

			oDAL.CommitTrans();
			oDAL = null;
			return boResult;
		}

		public bool Actualizar()
		{
			if(this.m_Id==0){return false;}
			string strSQL = "UPDATE " + this.m_TableName + " SET Titulo='" + this.m_Titulo + "', " +
				"Autores='" + this.m_Autores + "', Tipo=" + System.Convert.ToByte(this.m_Tipo) + " WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			oDAL.BeginTrans();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			// PARA AGREGAR LOS TEMAS A LOS QUE PERTENECE LA BIBLIOGRAFÍA.
			// 1. Eliminar todos los temas a los que pertenece la bibliografía.
			strSQL = "DELETE FROM " + this.m_TableTemas + " WHERE Id_Bibliografia=" + this.m_Id + ";";
			oDAL.ExecCommand(strSQL);
			// 2. Proceso para insertar nuevamente, pero sólo los valores que se proporcionan.
			clsTema Tema = new clsTema();
			System.Byte bytCantTemas = Tema.getCantidad();
			Tema = null;
			if((this.m_Temas.Length>0) & (this.m_Temas.Length<bytCantTemas)) // Cuando se declaran explícitamente los temas ó cuando se han seleccionado todos.
			{
				for(int i=0; i<=(this.m_Temas.Length-1); i++)
				{
					strSQL = "INSERT INTO " + this.m_TableTemas + " VALUES(null, " + this.m_Id + ", " + System.Convert.ToByte(this.m_Temas[i].IdTema) + ");";
					oDAL.ExecCommand(strSQL);
				}
			}
			else // Para cuando no se declaran explícitamente los temas y se desea que pertenezca a todos, se inserta un cero (0).
			{
				strSQL = "INSERT INTO " + this.m_TableTemas + " VALUES(null, " + this.m_Id + ", 0);";
			}

			oDAL.CommitTrans();
			oDAL = null;
			return boResult;
		}
		
		public bool Eliminar()
		{
			if(this.m_Id==0){return false;}
			clsDAL oDAL = new clsDAL();
			try
			{
				string strSQL = string.Empty;
				oDAL.BeginTrans();
				// 1. Eliminar él o los temas a los que corresponde.
				strSQL = "DELETE FROM tbl_bibliografia_tema WHERE Id_Bibliografia=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// 2. Eliminar él o los ficheros y sus respectivas URLs.
				strSQL = "DELETE FROM tbl_bibliografia_file WHERE Id_Bibliografia=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// 3. Eliminar las credenciales (para aquella bibliografía que se permite especificar tales parámetros).
				strSQL = "DELETE FROM tbl_bibliografia_credenciales WHERE Id_Bibliografia=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// 4. Finalmente eliminar de la tabla de tbl_bibliografia.
				strSQL = "DELETE FROM tbl_bibliografia WHERE Id=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				oDAL.CommitTrans();
				oDAL = null;
				return true;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al eliminar la bibliografía.", Ex); 
			}
		}

		/// <summary>
		/// Comprueba si existe la URL pasado como parámetro
		/// </summary>
		/// <param name="FullURL"></param>
		/// <returns></returns>
		public bool existURL(string FullURL)
		{
			string strSQL = "SELECT COUNT(Id_Bibliografia) FROM tbl_bibliografia_file WHERE FullURL='" + FullURL + "';";
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boResult;
		}

		/// <summary>
		/// Comprueba si existe la URL pasado como parámetro, pero teniendo en cuenta
		/// que no debe revisar en la fila del propio Id_Bibliografia pasado como parámetro.
		/// </summary>
		/// <param name="Id">Id de bibliografía en la tabla "tbl_bibliografia_file"</param>
		/// <param name="FullURL">Dirección URL completa del registro que se pretende actualizar.</param>
		/// <returns></returns>
		public bool existURL(System.UInt32 Id, string FullURL)
		{
			string strSQL = "SELECT COUNT(Id_Bibliografia) FROM tbl_bibliografia_file WHERE FullURL='" + FullURL + "' AND Id_Bibliografia!=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boResult;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	} // Fin de la clase.
} // Fin del namespace.
