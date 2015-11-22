using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsAcademico.
	/// </summary>
	public class clsAcademico : clsUsuario
	{
		#region "*** CONSTRUCTORES ***"

		public clsAcademico()
		{
		}
		
		public clsAcademico(System.UInt32 Id):base(Id)
		{
			setFieldsValue();
		}

		public clsAcademico(System.String UserId):base(UserId)
		{
			setFieldsValue();
		}

		#endregion "*** FIN DE CONSTRUCTORES ***"

		#region "*** VARIABLES PRIVADAS ***"

		private System.String m_FuncionAcademico;
		private new System.String m_TableName = "tbl_usuario_academico";
		//private System.String m_BaseTableName = "tbl_usuario";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.String FuncionAcademico
		{
			get{return m_FuncionAcademico;}
			set{m_FuncionAcademico = value;}
		}

		
		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** ESTRUCTURAS ***"

		/// <summary>
		/// Esta estructura contiene todos los campos de datos de una entidad "Academico"
		/// se emplea para recopilar los datos del cliente para actualizaciones porque
		/// el AjaxPro con el que se trabaja no acepta "subir" esta clase compleja desde
		/// el cliente.
		/// </summary>
		public struct struAcademico
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
			public System.Byte CuentaBloqueada;		// Se declara Byte porque AjaxPro no entiende Boolean.
			public System.Byte PerfilPublico;		// Se declara Byte porque AjaxPro no entiende Boolean.
			public string FuncionAcademico;
		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		private void setFieldsValue()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Usuario=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtAcademico = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtAcademico.Rows.Count==1)
			{
				this.m_FuncionAcademico = System.Convert.ToString(dtAcademico.Rows[0]["FuncionAcademico"]);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve los campos Id y Nombre (nombre + apellidos) de todos los 
		/// usuarios con role de Académico.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista()
		{
			string strSQL = "SELECT tbl_usuario_academico.Id_Usuario AS Id, CONCAT(tbl_usuario.Nombre, ' ', " + 
				"tbl_usuario.Apellidos) AS Nombre FROM tbl_usuario INNER JOIN tbl_usuario_academico ON " + 
				"tbl_usuario.Id = tbl_usuario_academico.Id_Usuario ORDER BY tbl_usuario.Nombre;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dtAcademicos = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtAcademicos;
		}

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
			string strSQL = "SELECT " + base.m_TableName + ".*, " + this.m_TableName + ".FuncionAcademico " + 
				"FROM " + base.m_TableName + " " + 
                "INNER JOIN " + this.m_TableName + " ON " + base.m_TableName + ".Id=" + this.m_TableName + ".Id_Usuario;";
			clsDAL oDAL = new clsDAL();
			DataTable dtAcademicos = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtAcademicos;
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

		public new bool Agregar()
		{
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				if(base.existUserId(base.UserId)){return false;} // Comprobar que el UserId no exista.
				if(!base.Agregar()){return false;} // Comprobar que se agregan correctamente los datos generales del usuario.
				string strSQL = string.Empty; // Consulta para actualizar tbl_usuario.
				strSQL = "INSERT INTO " + this.m_TableName + " VALUES(" + this.m_Id + ", '" + this.m_FuncionAcademico + "');";
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL.CommitTrans();
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
                oDAL.RollBackTrans();
				throw new System.Exception("Error al agregar nuevo académico.", Ex);
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
				string strSQL = "UPDATE " + this.m_TableName + " SET FuncionAcademico='" + this.m_FuncionAcademico + "' " +
					"WHERE Id_Usuario=" + this.m_Id + ";";
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL.CommitTrans();
				oDAL = null;
				return boResult;
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
				throw new System.Exception("Error al eliminar el registro del académcio.", Ex);
			}
		}

		public bool getDataFromStruct(clsAcademico.struAcademico AcademicoData)
		{
			this.m_Id = AcademicoData.Id;
			this.m_Nombre = AcademicoData.Nombre;
			this.m_Apellidos = AcademicoData.Apellidos;
			this.m_Sexo = AcademicoData.Sexo;
			this.m_UserId = AcademicoData.UserId;
			this.m_UserPass = AcademicoData.UserPass;
			this.m_CentroTrabajo = AcademicoData.CentroTrabajo;
			this.m_Funcion = AcademicoData.Funcion;
			this.m_email = AcademicoData.email;
			this.m_datUltimoAcceso = AcademicoData.datUltimoAcceso;	
			this.m_CuentaBloqueada = System.Convert.ToBoolean(AcademicoData.CuentaBloqueada);
			this.m_PerfilPublico = System.Convert.ToBoolean(AcademicoData.PerfilPublico);
   			this.m_FuncionAcademico = AcademicoData.FuncionAcademico;
			return true;
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
				"AND (tbl_usuario_academico.Id_Usuario<>'') ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos;";

			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public bool registrarComoDocente(System.Byte IdCategoriaDocente, System.Byte IdTituloAcademico, string strFacultadDepartamento)
		{
			string strSQL = "INSERT INTO tbl_usuario_docente VALUES(" + this.m_Id + ", " + IdCategoriaDocente + ", " + IdTituloAcademico + ", " + strFacultadDepartamento + ", " + this.m_Id + ");";
      clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	} // Fin de la clase.
} // Fin del namespace.
