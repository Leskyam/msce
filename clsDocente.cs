using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsAcademico.
	/// </summary>
	public class clsDocente : clsUsuario
	{
		#region "*** CONSTRUCTORES ***"

		public clsDocente()
		{
		}
		public clsDocente(System.UInt32 Id):base(Id)
		{
			setFieldsValue();
		}
		public clsDocente(System.String UserId):base(UserId)
		{
			setFieldsValue();
		}

		#endregion "*** FIN DE CONSTRUCTORES ***"

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_IdCategoriaDocente;
		private System.Byte m_IdTituloAcademico;
		private System.String m_FacultadDepartamento;
		private System.UInt32 m_IdAcademicoRegistra;
		private new System.String m_TableName = "tbl_usuario_docente";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte IdCategoriaDocente
		{
			get{return this.m_IdCategoriaDocente;}
			set{this.m_IdCategoriaDocente = value;}
		}

		public System.Byte IdTituloAcademico
		{
			get{return this.m_IdTituloAcademico;}
			set{this.m_IdTituloAcademico = value;}
		}

		public System.String FacultadDepartamento
		{
			get{return this.m_FacultadDepartamento;}
			set{this.m_FacultadDepartamento = value;}
		}

		public System.UInt32 IdAcademicoRegistra
		{
			get{return this.m_IdAcademicoRegistra;}
			set{this.m_IdAcademicoRegistra = value;}
		}
		
		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** ESTRUCTURAS ***"

		/// <summary>
		/// Esta estructura contiene todos los campos de datos de una entidad "Docente"
		/// se emplea para recopilar los datos del cliente para actualizaciones porque
		/// el AjaxPro con el que se trabaja no acepta "subir" esta clase compleja desde
		/// el cliente.
		/// </summary>
		public struct struDocente
		{
			public System.UInt32 Id;				
			public string Nombre;					
			public string Apellidos;				
			public char Sexo;						
			public string UserId;					
			public string UserPass;					
			public string CentroTrabajo;			
			public string Funcion;					
			public string email;					
			public System.DateTime datUltimoAcceso;	
			public System.Byte CuentaBloqueada;		// Se declara Byte porque AjaxPro no entiende Boolean para las estructuras.
			public System.Byte PerfilPublico;		// Se declara Byte porque AjaxPro no entiende Boolean para las estructuras.
			public System.Byte IdCategoriaDocente;
			public System.Byte IdTituloAcademico;
			public string FacultadDepartamento;
			public System.UInt32 IdAcademicoRegistra;
		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		private void setFieldsValue()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Usuario=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtDocente = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtDocente.Rows.Count==1)
			{
				this.m_IdCategoriaDocente = System.Convert.ToByte(dtDocente.Rows[0]["Id_CategoriaDocente"]);
				this.m_IdTituloAcademico = System.Convert.ToByte(dtDocente.Rows[0]["Id_TituloAcademico"]);
				this.m_FacultadDepartamento = System.Convert.ToString(dtDocente.Rows[0]["FacultadDepartamento"]);
				this.m_IdAcademicoRegistra = System.Convert.ToUInt32(dtDocente.Rows[0]["Id_AcademicoRegistra"]);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve los campos Id y Nombre (nombre + apellidos) de todos los 
		/// usuarios con role de Docente.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista()
		{
			string strSQL = "SELECT tbl_usuario_docente.Id_Usuario AS Id, " +
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Nombre " +
				"FROM tbl_usuario " +
				"INNER JOIN tbl_usuario_docente ON tbl_usuario.Id = tbl_usuario_docente.Id_Usuario " +
				"ORDER BY tbl_usuario.Nombre;";
			clsDAL oDAL = new clsDAL();
			System.Diagnostics.Debug.WriteLine(strSQL);
			System.Data.DataTable dtDocentes = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtDocentes;
		}

		/// <summary>
		/// Devuelve los campos "Id", "UserId", "Nombre" (nombre + apellidos) y "CuentaBloqueada" de todos los 
		/// usuarios con role de Docente, ordenados por: Nombre, Apellidos, Sexo
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getExtendedLista()
		{
			string strSQL = "SELECT tbl_usuario_docente.Id_Usuario AS Id, tbl_usuario.UserId, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', " + "tbl_usuario.Apellidos) AS Nombre, " +
				"tbl_usuario.CuentaBloqueada " + 
				"FROM tbl_usuario " + 
				"INNER JOIN tbl_usuario_docente ON tbl_usuario.Id = tbl_usuario_docente.Id_Usuario " +
				"WHERE tbl_usuario.Id NOT IN(SELECT Id_Usuario FROM tbl_usuario_academico) " + 
				"ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos, tbl_usuario.Sexo;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dtDocentes = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtDocentes;
		}
		
		/// <summary>
		/// Devuelve todos los campos de la tabla "tbl_usuario" más los campos: 
		/// Id_CategoriaDocente, Id_TituloAcademico, FacultadDepartamento, 
		/// Id_AcademicoRegistra de la tabla "tbl_usuario_docente".
		/// </summary>
		/// <returns></returns>
		public DataTable getAllRecords()
		{
			string strSQL = "SELECT " + base.m_TableName + ".*, " + this.m_TableName + ".Id_CategoriaDocente, " + 
				this.m_TableName + ".Id_TituloAcademico, " + this.m_TableName + ".FacultadDepartamento, " + 
				this.m_TableName + ".Id_AcademicoRegistra " + 
				"FROM " + base.m_TableName + " " + 
				"INNER JOIN " + this.m_TableName + " ON " + base.m_TableName + ".Id=" + this.m_TableName + ".Id_Usuario " + 
				"WHERE " + base.m_TableName + ".Id NOT IN(SELECT Id_Usuario FROM tbl_usuario_academico);";
			clsDAL oDAL = new clsDAL();
			DataTable dtDocentes = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtDocentes;
		}
		
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


		/// <summary>
		/// Transfiere los valores en los campos de la estructura struDocente 
		/// a los miembros que corresponden de esta clase.
		/// </summary>
		/// <param name="DocenteData"></param>
		/// <returns></returns>
		public bool getDataFromStruct(clsDocente.struDocente DocenteData)
		{
			this.m_Id = DocenteData.Id;
			this.m_Nombre = DocenteData.Nombre;
			this.m_Apellidos = DocenteData.Apellidos;
			this.m_Sexo = DocenteData.Sexo;
			this.m_UserId = DocenteData.UserId;
			this.m_UserPass = DocenteData.UserPass;
			this.m_CentroTrabajo = DocenteData.CentroTrabajo;
			this.m_Funcion = DocenteData.Funcion;
			this.m_email = DocenteData.email;
			this.m_datUltimoAcceso = DocenteData.datUltimoAcceso;	
			this.m_CuentaBloqueada = System.Convert.ToBoolean(DocenteData.CuentaBloqueada);
			this.m_PerfilPublico = System.Convert.ToBoolean(DocenteData.PerfilPublico);
			this.m_IdCategoriaDocente = DocenteData.IdCategoriaDocente;
			this.m_IdTituloAcademico = DocenteData.IdTituloAcademico;
			this.m_FacultadDepartamento = DocenteData.FacultadDepartamento;
			this.m_IdAcademicoRegistra = DocenteData.IdAcademicoRegistra;
			return true;
		}

		public DataTable getListaConConsultasRespondidas()
		{
			string strSQL = "SELECT DISTINCT tbl_consulta.Id_UsuarioDocente AS Id, " +
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Nombre, " +
                "COUNT(tbl_consulta_respuesta.Id_Consulta) AS Ocurrencias " +
                "FROM tbl_consulta " +
				"INNER JOIN tbl_usuario ON tbl_consulta.Id_UsuarioDocente=tbl_usuario.Id " +
				"INNER JOIN tbl_consulta_respuesta ON tbl_consulta.Id=tbl_consulta_respuesta.Id_Consulta " +
				"WHERE tbl_consulta.Id IN (SELECT Id_Consulta FROM tbl_consulta_respuesta) " +
                "GROUP BY tbl_consulta.Id_UsuarioDocente, Nombre " +
				"ORDER BY Ocurrencias DESC;";
			clsDAL oDAL = new clsDAL();
			DataTable dtDocentes = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtDocentes;
		}
		
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
				"AND (tbl_usuario_docente.Id_Usuario<>'') ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos;";

			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;

		}

		#region "*** PROCEDIMIENTOS PARA ACTUALIZACIONES ***" 
		
		public new bool Agregar()
		{
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				if(base.existUserId(base.UserId)){return false;} // Comprobar que el UserId no exista.
				if(!base.Agregar()){return false;} // Comprobar que se agregan correctamente los datos generales del usuario.
				string strSQL = string.Empty; // Consulta para actualizar tbl_usuario.
				strSQL = "INSERT INTO " + this.m_TableName + " VALUES(" + this.m_Id + ", " + this.m_IdCategoriaDocente + ", " + 
					this.m_IdTituloAcademico + ", '" + this.m_FacultadDepartamento + "', " + this.m_IdAcademicoRegistra + ");";
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL.CommitTrans();
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al agregar nuevo docente.", Ex);
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
				if(base.existUserId(base.Id, base.UserId)){return false;} // Comprobar que el UserId no exista.
				string strSQL = "UPDATE " + this.m_TableName + " SET Id_CategoriaDocente=" + this.m_IdCategoriaDocente + ", " + 
					"Id_TituloAcademico=" + this.m_IdTituloAcademico + ", FacultadDepartamento='" + this.m_FacultadDepartamento + "', " + 
					"Id_AcademicoRegistra=" + this.m_IdAcademicoRegistra + " " +
					"WHERE Id_Usuario=" + this.m_Id + ";";
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL.CommitTrans();
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al actualizar datos del docente.", Ex);
			}
		}

		public bool Eliminar(System.UInt32 Id)
		{
			if(Id==0){return false;}
			base.m_Id = Id;
			clsDAL oDAL = new clsDAL();
			try
			{
				return base.Eliminar();
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al eliminar el registro del académcio.", Ex);
			}
		}

		#endregion "*** FIN DE LOS PROCEDIMIENTOS PARA ACTUALIZACIONES ***" 

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	} // Fin de la clase.
} // Fin del namespace.
