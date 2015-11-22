using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsBibliografiaCD.
	/// </summary>
	public class clsBibliografiaCD : clsBibliografia
	{
		#region "*** CONSTRUCTORES ***"

		public clsBibliografiaCD()
		{
		}
		
		public clsBibliografiaCD(System.UInt32 Id):base(Id)
		{
			setFieldsValue();
		}

		#endregion "*** FIN DE CONSTRUCTORES ***"

		#region "*** VARIABLES PRIVADAS ***"

		private System.UInt64 m_FileSize=0;
		private System.String m_FullURL;
		private System.String m_URLUserName;
		private System.String m_URLUserPass;

		/// <summary>
		/// Tabla: tbl_bibliografia_file
		/// </summary>
		private System.String m_TableFiles = "tbl_bibliografia_file";
		/// <summary>
		/// Tabla: tbl_bibliografia_credenciales
		/// </summary>
		private System.String m_TableCredenciales = "tbl_bibliografia_credenciales";
		
		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.UInt64 FileSize
		{
			get{return this.m_FileSize;}
		}

		public System.String FullURL
		{
			get{return this.m_FullURL;}
			set{this.m_FullURL = value;}
		}

		public System.String URLUserName
		{
			get{return this.m_URLUserName;}
			set{this.m_URLUserName = value;}
		}

		public System.String URLUserPass
		{
			get{return this.m_URLUserPass;}
			set{this.m_URLUserPass = value;}
		}
		
		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** ESTRUCTURAS ***"

		/// <summary>
		/// Esta estructura contiene todos los campos de datos de una entidad "Bibliografia en CD"
		/// se emplea para recopilar los datos del cliente para actualizaciones porque
		/// el AjaxPro con el que se trabaja no acepta "subir" esta clase compleja desde
		/// el cliente.
		/// </summary>
		public struct struBibliografiaCD
		{
			// Específicas de la clase de donde hereda (clsBibliografia).
			public System.UInt32 Id;
			/// <summary>
			/// Id del usuario lo registra.
			/// </summary>
			public System.UInt32 IdUsuario;
			public System.String Titulo;
			public System.String Autores;
			/// <summary>
			/// 1 para tipo Básica y 2 para la Complementaria.
			/// </summary>
			public clsBibliografia.enuTipo Tipo;
			public System.DateTime datFechaRegistro;
			// Temas a los que pertenece.
			public clsBibliografia.struTemas[] Temas;
			// Específicas de esta clase.
			/// <summary>
			/// FileSize para los CDs siempre será cero;
			/// </summary>
			public System.UInt64 FileSize;
			/*
			{
				get{return 0;}
				set{FileSize=0;}
			}
			*/
			/// <summary>
			/// Dirección URL completa de donde se encuentran los recursos que pertenecen al CD.
			/// </summary>
			public System.String FullURL;
			/// <summary>
			/// Id de usuario si es que se requieren credenciales de acceso al recurso.
			/// </summary>
			public System.String URLUserName;
			/// <summary>
			/// Contraseña si es que se requieren credenciales de acceso al recurso.
			/// </summary>
			public System.String URLUserPass;

		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		private void setFieldsValue()
		{
			string strSQL = "SELECT " + this.m_TableFiles + ".FileSize, " + this.m_TableFiles + ".FullURL, " + 
        this.m_TableCredenciales + ".URLUserName, " + this.m_TableCredenciales + ".URLUserPass " + 
				"FROM " + this.m_TableFiles + " " +
				"LEFT JOIN " + this.m_TableCredenciales + " ON " + 
				this.m_TableFiles + ".Id_Bibliografia=" + this.m_TableCredenciales + ".Id_Bibliografia;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dt.Rows.Count==1)
			{
				this.m_FileSize = System.Convert.ToUInt64(dt.Rows[0]["FileSize"]);
				this.m_FullURL = System.Convert.ToString(dt.Rows[0]["FullURL"]);
				this.m_URLUserName = dt.Rows[0]["URLUserName"] is System.DBNull?string.Empty:System.Convert.ToString(dt.Rows[0]["URLUserName"]); 
				this.m_URLUserPass = dt.Rows[0]["URLUserPass"] is System.DBNull?string.Empty:System.Convert.ToString(dt.Rows[0]["URLUserPass"]); 
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve los campos Id, Titulo, 
		/// Registrante (nombre + apellidos del usuario que registró esta bibliografía), Tipo y Soporte.
		/// </summary>
		/// <returns></returns>
		public new System.Data.DataTable getLista()
		{
			return base.getLista(clsBibliografia.enuSoporte.CD);
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
		
		*/

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT " + base.m_TableName + ".*, " + this.m_TableFiles + ".FileSize, " + this.m_TableFiles + ".FullURL, " +
				this.m_TableCredenciales + ".URLUserName, " + this.m_TableCredenciales + ".URLUserPass FROM " + base.m_TableName + " " +
        "INNER JOIN " + this.m_TableFiles + " ON " + base.m_TableName + ".Id=" + this.m_TableFiles + ".Id_Bibliografia " + 
        "LEFT JOIN " + this.m_TableFiles + " ON " + this.m_TableFiles + ".Id_Bibliografia=" + this.m_TableCredenciales + ".Id_Bibliografia;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/*

		public new DataTable getById(System.UInt32 Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Usuario=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}
		
		/// <summary>
		/// Devuelve la cantidad de registros de esta entidad que estén en la base de datos.
		/// </summary>
		/// <returns></returns>
		public new System.UInt32 getCantidad()
		{
			clsDAL oDAL = new clsDAL();
			System.UInt32 bytCant = System.Convert.ToUInt32(oDAL.getEscalarValue("SELECT COUNT(Id_Usuario) FROM " + this.m_TableName + ";"));
			oDAL = null;
			return bytCant;
		}
		
		*/

		public new bool Agregar()
		{
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				if(base.existURL(this.m_FullURL)){return false;} // Comprobar si ya existe la URL.
				if(!base.Agregar()){return false;} // Comprobar que se agregan correctamente los datos generales del usuario.
				string strSQL = string.Empty; // Consulta para actualizar tbl_usuario.
				strSQL = "INSERT INTO " + this.m_TableFiles + " VALUES(null, " + this.m_Id + ", " + this.m_FileSize + ", '" + this.m_FullURL + "');";
				oDAL.ExecCommand(strSQL);
				if(this.m_URLUserName!=string.Empty & this.m_URLUserPass!=string.Empty)
				{
					strSQL = "INSERT INTO " + this.m_TableCredenciales + " VALUES(" + this.m_Id + ", '" + this.m_URLUserName + "', '" + this.m_URLUserPass + "');";
					oDAL.ExecCommand(strSQL);
				}
				oDAL.CommitTrans();
				oDAL = null;
				return true;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al agregar nueva bibliografía en disco compacto.", Ex);
			}
		}

		public new bool Actualizar()
		{
			if(this.m_Id==0){return false;}
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				if(!base.Actualizar()){return false;}
				if(base.existURL(base.Id, this.m_FullURL)){return false;} // Comprobar que el UserId no exista.
				// Actualizar la table de los ficheros.
				string strSQL = "UPDATE " + this.m_TableFiles + " SET FileSize=" + this.m_FileSize + ", FullURL='" + this.m_FullURL + "' " +
					"WHERE Id_Bibliografia=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// Actualizar la table de las credenciales para acceder al recurso.
				if(this.m_URLUserName!=string.Empty & this.m_URLUserPass!=string.Empty)
				{
					strSQL = "UPDATE " + this.m_TableCredenciales + " SET URLUserName=" + this.m_URLUserName + ", m_URLUserPass='" + this.m_URLUserPass + "' " +
						"WHERE Id_Bibliografia=" + this.m_Id + ";";
					oDAL.ExecCommand(strSQL);
				}
				oDAL.CommitTrans();
				oDAL = null;
				return true;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al actualizar datos del académico.", Ex);
			}
		}

		public bool Eliminar(System.UInt32 Id)
		{
			if(Id==0){return false;}
			base.m_Id = Id;
			try
			{
				return base.Eliminar();
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al eliminar el registro del disco compacto.", Ex);
			}
		}

		public bool getDataFromStruct(clsBibliografiaCD.struBibliografiaCD CompactDisc)
		{
			this.m_Id = CompactDisc.Id;
			this.m_IdUsuario = CompactDisc.IdUsuario;
			this.m_Titulo = CompactDisc.Titulo;	// Titulo.
			this.m_Autores = CompactDisc.Autores;	// Autores.
			this.m_Tipo = CompactDisc.Tipo;
			this.m_Soporte = clsBibliografia.enuSoporte.CD;
			this.m_datFechaRegistro = CompactDisc.datFechaRegistro;	// Fecha de registro.
			this.Temas = CompactDisc.Temas;
			this.m_FullURL = CompactDisc.FullURL;	// Dirección URL.
			this.m_URLUserName = CompactDisc.URLUserName;	// Id de usuario con acceso a la URL.
			this.m_URLUserPass = CompactDisc.URLUserPass;	// Contraseña de usuario con acceso a la URL.
			return true;
		}

		/*
		public new System.Data.DataTable buscarByTexto(string strNombre, string strApellidos, string strCentroTrabajo, string strFuncion)
		{
			string strSQL = "SELECT tbl_usuario.Id, tbl_usuario.Nombre, tbl_usuario.Apellidos, " +
				"tbl_usuario.CentroTrabajo, tbl_usuario.Funcion, tbl_maestria.Id_UsuarioDirector AS roleDirector, " +
				"tbl_usuario_academico.Id_Usuario AS roleAcademico, tbl_usuario_docente.Id_Usuario AS roleDocente, " +
				"tbl_usuario_maestrante.Id_Usuario AS roleMaestrante, tbl_usuario.PerfilPublico " +
				"FROM tbl_usuario " + 
				"LEFT JOIN tbl_maestria ON tbl_usuario.Id = tbl_maestria.Id_UsuarioDirector " +
				"LEFT JOIN tbl_usuario_academico ON tbl_usuario.Id = tbl_usuario_academico.Id_Usuario " + 
				"LEFT JOIN tbl_usuario_docente ON tbl_usuario.Id = tbl_usuario_docente.Id_Usuario " +
				"LEFT JOIN tbl_usuario_maestrante ON tbl_usuario.Id = tbl_usuario_maestrante.Id_Usuario " +
				"WHERE (tbl_usuario.Nombre LIKE '" +  strNombre + "' OR tbl_usuario.Apellidos LIKE '" +  strApellidos + "' " + 
				"OR tbl_usuario.CentroTrabajo LIKE '" +  strCentroTrabajo + "' OR tbl_usuario.Funcion LIKE '" +  strFuncion + "') " + 
				"AND (tbl_usuario_academico.Id_Usuario<>'') ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos;";

			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		*/

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	} // Fin de la clase.
} // Fin del namespace.
