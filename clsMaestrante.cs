using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsMaestrante.
	/// </summary>
	public class clsMaestrante: clsUsuario
	{
		#region "*** CONSTRUCTORES ***"

		public clsMaestrante():base()
		{
		}
		public clsMaestrante(System.UInt32 Id):base(Id)
		{
            setFieldsValue();
		}
		public clsMaestrante(System.String UserId):base(UserId)
		{
			setFieldsValue();
		}

		#endregion "*** FIN DE CONSTRUCTORES ***"

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_IdGrupo; // Grupo al que pertenece.
		private System.String m_NoCI; // Número de carnet de identidad.
		private System.UInt32 m_IdAcademicoAutoriza; // Académico que autoriza el registro.
		// Para los temas de proyecto.
		private System.Boolean m_TieneTemaProyecto = false;
		private System.Byte m_IdTemaProyecto;
		private System.String m_Argumentos;
		private System.DateTime m_datSolicitud;
		private clsMaestrante.enuEstadoTemaProyecto m_EstadoTemaProyecto;
		private System.UInt32 m_IdAcademicoRevisa;
        private new System.String m_TableName = "tbl_usuario_maestrante";
        
		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** ENUMERACIONES ***"

		//	Flag que indica si le ha sido aprobado el proyecto solicitado. 
		// Ej.: 0 (No revisado), 1 (Aprobado), 2 (Rechazado). 
		public enum enuEstadoTemaProyecto: byte
		{
			/// <summary>
			/// Valor cero (0)
			/// </summary>
			NoRevisado = 0,
			/// <summary>
			/// Valor uno (1)
			/// </summary>
			Aprobado = 1,
			/// <summary>
			/// Valor dos (2)
			/// </summary>
			Rechazado = 2
		};

		#endregion "*** FIN DE ENUMERACIONES ***"

		#region "*** ESTRUCTURAS ***"

		/// <summary>
		/// Esta estructura contiene todos los campos de datos de una entidad "Docente"
		/// se emplea para recopilar los datos del cliente para actualizaciones porque
		/// el AjaxPro con el que se trabaja no acepta "subir" esta clase compleja desde
		/// el cliente.
		/// </summary>
		public struct struMaestrante
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
			public string NoCI;
			public System.Byte IdGrupo;
			public System.UInt32 IdAcademicoAutoriza;
		}

		/// <summary>
		/// Esta estructura contiene todos los campos de datos de una entidad "Docente"
		/// se emplea para recopilar los datos del cliente para actualizaciones porque
		/// el AjaxPro con el que se trabaja no acepta "subir" esta clase compleja desde
		/// el cliente.
		/// </summary>
		public struct struMiTemaProyecto
		{
			public System.Byte IdTemaProyecto;		// Se declara Byte porque AjaxPro no entiende Boolean para las estructuras.
			public string Argumentos;
			public System.DateTime datSolicitud;	
			public clsMaestrante.enuEstadoTemaProyecto Estado;		// Se declara Byte porque AjaxPro no entiende Boolean para las estructuras.
			public System.UInt32 IdAcademicoRevisa;
		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte IdGrupo
		{
			get{return this.m_IdGrupo;}
			set{this.m_IdGrupo = value;}
		}

		public System.String NoCI
		{
			get{return this.m_NoCI;}
			set{this.m_NoCI = value;}
		}
		/// <summary>
		/// Identificador del usuario "Académico" que aprueba la solicitud de registro de este maestrante.
		/// </summary>
		public System.UInt32 IdAcademicoAutoriza
		{
			get{return this.m_IdAcademicoAutoriza;}
			set{this.m_IdAcademicoAutoriza = value;}
		}

		// Para los temas de proyecto.
		public System.Boolean TieneTemaProyecto
		{
			get
			{
				clsDAL oDAL = new clsDAL();
				string strSQL = "SELECT COUNT(Id_Usuario) FROM tbl_maestrante_tema_proyecto WHERE Id_Usuario=" + this.m_Id + ";";
				this.m_TieneTemaProyecto = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
				return this.m_TieneTemaProyecto;
			}
		}
		public System.Byte IdTemaProyecto
		{
			get{return this.m_IdTemaProyecto;}
			set{this.m_IdTemaProyecto = value;}
		}
		public System.String Argumentos
		{
			get{return this.m_Argumentos;}
			set{this.m_Argumentos = value;}
		}
		public System.DateTime datSolicitud
		{
			get{return this.m_datSolicitud;}
			set{this.m_datSolicitud = value;}
		}
		public clsMaestrante.enuEstadoTemaProyecto Estado
		{
			get{return this.m_EstadoTemaProyecto;}
			set{this.m_EstadoTemaProyecto = value;}
		}
		/// <summary>
		/// Identificador del usuario "Académico" que revisa la solicitud de tema para proyecto de invest.
		/// </summary>
		public System.UInt32 IdAcademicoRevisa
		{
			get{return this.m_IdAcademicoRevisa;}
			set{this.m_IdAcademicoRevisa = value;}
		}
        
		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
        
		private void setFieldsValue()
		{
			string strSQL = "SELECT * FROM tbl_usuario_maestrante WHERE Id_Usuario=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
            DataTable dtMaestrante = oDAL.getDataTable(strSQL);
			if(dtMaestrante.Rows.Count==1)
			{
				this.m_IdGrupo = System.Convert.ToByte(dtMaestrante.Rows[0]["Id_Grupo"]);
				this.m_NoCI = System.Convert.ToString(dtMaestrante.Rows[0]["NoCI"]);
				this.m_IdAcademicoAutoriza = System.Convert.ToUInt32(dtMaestrante.Rows[0]["Id_AcademicoAutoriza"]);
				// Manejar los datos de los campos que pertecen al tema de proyecto del maestrante.
				strSQL = "SELECT * FROM tbl_maestrante_tema_proyecto WHERE Id_Usuario=" + this.m_Id + ";";
				DataTable dtTemaProyecto = oDAL.getDataTable(strSQL);
				this.m_TieneTemaProyecto = false;
				if(dtTemaProyecto.Rows.Count==1)
				{
					this.m_IdTemaProyecto = System.Convert.ToByte(dtTemaProyecto.Rows[0]["Id_TemaProyecto"]);
					this.m_Argumentos = System.Convert.ToString(dtTemaProyecto.Rows[0]["Argumentos"]);
					this.m_datSolicitud = System.Convert.ToDateTime(dtTemaProyecto.Rows[0]["datSolicitud"]);
					this.m_EstadoTemaProyecto = (clsMaestrante.enuEstadoTemaProyecto)(dtTemaProyecto.Rows[0]["Estado"]);
					this.m_IdAcademicoRevisa = System.Convert.ToUInt32(dtTemaProyecto.Rows[0]["Id_AcademicoRevisa"]);
					this.m_TieneTemaProyecto = true;
				}
			}
			oDAL = null;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***" 

		public bool IsAuthorized()
		{
            clsDAL oDAL = new clsDAL();
			string strSQL = "SELECT Id_Usuario FROM tbl_usuario_maestrante WHERE Id_Usuario=" + this.m_Id + " " +
                "AND Id_AcademicoAutoriza IN(SELECT Id_Usuario FROM tbl_usuario_academico);";
			System.Boolean boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boResult;
		}
		
		public bool IsAuthorized(System.UInt32 Id)
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "SELECT Id_Usuario FROM tbl_usuario_maestrante WHERE Id_Usuario=" + Id + " " +
				"AND Id_AcademicoAutoriza IN(SELECT Id_Usuario FROM tbl_usuario_academico);";
			System.Boolean boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boResult;
		}

		/// <summary>
		/// Devuelve los campos "Id" y "Nombre" (nombre + apellidos) de todos los 
		/// usuarios con role de Académico, ordenados por: Nombre, Apellidos, Sexo
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista()
		{
			string strSQL = "SELECT " + this.m_TableName + ".Id_Usuario AS Id, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', " + "tbl_usuario.Apellidos) AS Nombre " +
				"FROM tbl_usuario " + 
				"INNER JOIN " + this.m_TableName + " ON tbl_usuario.Id = " + this.m_TableName + ".Id_Usuario " +
				"ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos, tbl_usuario.Sexo;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dtMaestrantes = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtMaestrantes;
		}

		/// <summary>
		/// Devuelve los campos "Id", "UserId", "Nombre" (nombre + apellidos) y "CuentaBloqueada" de todos los 
		/// usuarios con role de Académico, ordenados por: Nombre, Apellidos, Sexo
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getExtendedLista()
		{
			string strSQL = "SELECT " + this.m_TableName + ".Id_Usuario AS Id, tbl_usuario.UserId, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', " + "tbl_usuario.Apellidos) AS Nombre, " +
				"tbl_usuario.CuentaBloqueada, " + this.m_TableName + ".Id_AcademicoAutoriza " + 
				"FROM tbl_usuario " + 
				"INNER JOIN " + this.m_TableName + " ON tbl_usuario.Id = " + this.m_TableName + ".Id_Usuario " +
				"ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos, tbl_usuario.Sexo;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dtMaestrantes = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtMaestrantes;
		}

		/// <summary>
		/// Devuelve los campos "Id" y "Nombre" (nombre + apellidos) de todos los 
		/// usuarios con role de Académico, ordenados por: Nombre, Apellidos, Sexo
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getListaSolicitandoRegistro()
		{
			string strSQL = "SELECT tbl_usuario_maestrante.Id_Usuario AS Id, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Maestrante, " + 
				"tbl_usuario_maestrante.NoCI, tbl_usuario.Sexo, tbl_usuario.CentroTrabajo, " +
				"tbl_usuario.Funcion, tbl_sede.Nombre AS Sede, tbl_grupo.Nombre AS Grupo " +
				"FROM tbl_usuario " +
				"INNER JOIN tbl_usuario_maestrante ON tbl_usuario.Id = tbl_usuario_maestrante.Id_Usuario " +
				"INNER JOIN tbl_grupo ON tbl_usuario_maestrante.Id_Grupo = tbl_grupo.Id " +
				"INNER JOIN tbl_sede ON tbl_grupo.Id_Sede = tbl_sede.Id " +
				"WHERE tbl_usuario_maestrante.Id_AcademicoAutoriza=0 " +
				"ORDER BY tbl_sede.Nombre, tbl_grupo.Nombre, Maestrante, tbl_usuario.Sexo;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dtMaestrantes = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtMaestrantes;
		}

		/// <summary>
		/// Devuelve todos los campos de la tabla "tbl_usuario" más los campos: Id_Grupo, NoCI y
		/// Id_AcademicoAutoriza de la tabla "tbl_usuario_maestrante", más los campos: Id_TemaProyecto,
		/// Argumentos, datSolicitud, Estado, Id_AcademicoRevisa de la tabla "tbl_maestrante_tema_proyecto".
		/// </summary>
		/// <returns></returns>
		public DataTable getAllRecords()
		{
			string strSQL = "SELECT tbl_usuario.*, " + 
				"tbl_usuario_maestrante.Id_Grupo, tbl_usuario_maestrante.NoCI, " +
				"tbl_usuario_maestrante.Id_AcademicoAutoriza, tbl_maestrante_tema_proyecto.Id_TemaProyecto, " +
				"tbl_maestrante_tema_proyecto.Argumentos, tbl_maestrante_tema_proyecto.datSolicitud, " +
				"tbl_maestrante_tema_proyecto.Estado, tbl_maestrante_tema_proyecto.Id_AcademicoRevisa " +
                "FROM tbl_usuario " + 
				"INNER JOIN tbl_usuario_maestrante ON tbl_usuario.Id=tbl_usuario_maestrante.Id_Usuario " +
                "LEFT JOIN tbl_maestrante_tema_proyecto ON tbl_usuario.Id=tbl_maestrante_tema_proyecto.Id_Usuario;";
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
		/// Devuelve la cantidad de usuarios, supuestamente maestrantes, 
		/// haciendo solicitud de autorización de registro.
		/// </summary>
		/// <returns></returns>
		public System.UInt16 getCantSolicitandoRegistro()
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "SELECT COUNT(Id_Usuario) FROM tbl_usuario_maestrante " + 
                "WHERE Id_AcademicoAutoriza NOT IN (SELECT Id_Usuario FROM tbl_usuario_academico);";
			System.UInt16 intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}

		/// <summary>
		/// Transfiere los valores en los campos de la estructura struMaestrante 
		/// a los miembros que corresponden de esta clase.
		/// </summary>
		/// <param name="DocenteData"></param>
		/// <returns></returns>
		public bool getDataFromStruct(clsMaestrante.struMaestrante MaestranteData)
		{
			this.m_Id = MaestranteData.Id;
			this.m_Nombre = MaestranteData.Nombre;
			this.m_Apellidos = MaestranteData.Apellidos;
			this.m_Sexo = MaestranteData.Sexo;
			this.m_UserId = MaestranteData.UserId;
			this.m_UserPass = MaestranteData.UserPass;
			this.m_CentroTrabajo = MaestranteData.CentroTrabajo;
			this.m_Funcion = MaestranteData.Funcion;
			this.m_email = MaestranteData.email;
			this.m_datUltimoAcceso = MaestranteData.datUltimoAcceso;	
			this.m_CuentaBloqueada = System.Convert.ToBoolean(MaestranteData.CuentaBloqueada);
			this.m_PerfilPublico = System.Convert.ToBoolean(MaestranteData.PerfilPublico);
			this.m_NoCI = MaestranteData.NoCI;
			this.m_IdGrupo = MaestranteData.IdGrupo;
			this.m_IdAcademicoAutoriza = MaestranteData.IdAcademicoAutoriza;
			
			return true;
		}

		/// <summary>
		/// Comprueba si existe el NoCI pasado como parámetro.
		/// </summary>
		/// <param name="NoCI"></param>
		/// <returns></returns>
		public bool existNoCI(string NoCI)
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "SELECT COUNT(Id_Usuario) FROM " + this.m_TableName + " WHERE NoCI='" + NoCI + "';";
			bool boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			return boResult;
		}

		/// <summary>
		/// Comprueba si existe el NoCI pasado como parámetro, pero teniendo en cuenta
		/// que no debe revisar en la fila del propio NoCI pasado como parámetro.
		/// </summary>
		/// <param name="Id"></param>
		/// <param name="NoCI"></param>
		/// <returns></returns>
		public bool existNoCI(System.UInt32 Id, string NoCI)
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "SELECT COUNT(Id_Usuario) FROM " + this.m_TableName + " WHERE NoCI='" + NoCI + "' " + 
				"AND Id_Usuario!=" + Id + ";";
			bool boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			return boResult;
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
				"AND (tbl_usuario_maestrante.Id_Usuario<>'') ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos;";

			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;

		}

		#region "*** PROCEDIMIENTOS PARA ACTUALIZACIONES ***" 
		
		/// <summary>
		/// Agrega un nuevo maestrante, no agrega los datos a la tabla "tbl_maestrante_tema_proyecto" 
		/// porque se entiende que si es nuevo, no es necesario esto, sin embargo, hay que implementar
		/// en el mátodo que actualiza los datos que se agrege el tema de proyecto para cuando el propio
		/// maestrante lo solicita a través de la página perfil.aspx.
		/// </summary>
		/// <returns></returns>
		public new bool Agregar()
		{
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				if(base.existUserId(base.UserId)){return false;} // Comprobar que el UserId no exista.
				if(!base.Agregar()){return false;} // Comprobar que se agregan correctamente los datos generales del usuario.
				string strSQL = string.Empty; // Consulta para actualizar tbl_usuario.
				strSQL = "INSERT INTO " + this.m_TableName + " VALUES(" + this.m_Id + ", " + this.m_IdGrupo + ", " + 
					"'" + this.m_NoCI + "', " + this.m_IdAcademicoAutoriza + ");";
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL.CommitTrans();
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al agregar nuevo maestrante.", Ex);
			}
		}

		/// <summary>
		/// Actualiza los datos del maestrante en las tablas: 
		/// "tbl_usuario", "tbl_usuario_maestrante" y agrega
		/// o actualiza según como corresponda los datos del
		/// tema de proyecto que solicita el maestrante. 
		/// </summary>
		/// <returns></returns>
		public new bool Actualizar()
		{
			if(this.m_Id==0){return false;}
			clsDAL oDAL = new clsDAL();
			try
			{				
				oDAL.BeginTrans();
				if(!base.Actualizar()){return false;}
				if(base.existUserId(base.Id, base.UserId)){return false;} // Comprobar que el UserId no exista.
				string strSQL = "UPDATE " + this.m_TableName + " SET Id_Grupo=" + this.m_IdGrupo + ", " + 
					"NoCI='" + this.m_NoCI + "', Id_AcademicoAutoriza=" + this.m_IdAcademicoAutoriza + " " +
					"WHERE Id_Usuario=" + this.m_Id + ";";
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				if(!boResult){return false;}
				if(this.m_IdTemaProyecto!=0)
				{
					// Poner el Id de académico que revisa en cero (ninguno), si el estado es "NoRevisado"
					if(this.m_EstadoTemaProyecto.ToString("d") == clsMaestrante.enuEstadoTemaProyecto.NoRevisado.ToString("d")){this.m_IdAcademicoRevisa=0;}
					if(this.TieneTemaProyecto) // Actualizar el tema de proyecto.
					{
						strSQL = "UPDATE tbl_maestrante_tema_proyecto SET Id_TemaProyecto=" + this.m_IdTemaProyecto + ", " +
							"Argumentos='" + this.m_Argumentos +  "', datSolicitud='" + clsUtiles.getStringMySqlFormatedDate(this.m_datSolicitud) + "', " +
                            "Estado=" + this.Estado.ToString("d") + ", Id_AcademicoRevisa=" + this.m_IdAcademicoRevisa + " " +
							"WHERE Id_Usuario=" + this.m_Id + ";";
					}
					else // Agregar el tema de proyecto.
					{
						strSQL = "INSERT INTO tbl_maestrante_tema_proyecto VALUES(" + this.m_Id + ", " + this.m_IdTemaProyecto + ", '" +
							this.m_Argumentos +  "', '" + clsUtiles.getStringMySqlFormatedDate(this.m_datSolicitud) + "', " +
							this.Estado.ToString("d") + ", " + this.m_IdAcademicoRevisa + ");";
					}
					boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				}
				oDAL.CommitTrans();
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al actualizar datos del maestrante.", Ex);
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
				throw new System.Exception("Error al eliminar el registro del maestrante.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PARA ACTUALIZACIONES ***" 

		#region "*** PROCEDIMIENTOS PARA LA ENTIDAD "tbl_maestrante_tema_proyecto" ***"

		public bool getDataFromStruct(clsMaestrante.struMiTemaProyecto MiTemaProyecto)
		{
			this.m_IdTemaProyecto = MiTemaProyecto.IdTemaProyecto;	
			this.m_Argumentos = MiTemaProyecto.Argumentos;
			this.m_datSolicitud = MiTemaProyecto.datSolicitud;
			this.m_EstadoTemaProyecto = MiTemaProyecto.Estado;
			this.m_IdAcademicoRevisa = MiTemaProyecto.IdAcademicoRevisa;
			return true;
		}

		/// <summary>
		/// Devuelve la cantidad de Temas de proyecto que se encuentran en el estado que se
		/// pase como valor en el parámetro Estado, de tipo clsMaestrante.enuEstadoTemaProyecto
		/// </summary>
		/// <param name="Estado">valor de tipo clsMaestrante.enuEstadoTemaProyecto (byte)</param>
		/// <returns></returns>
		public System.UInt16 getCantTemasProyecto(clsMaestrante.enuEstadoTemaProyecto Estado)
		{
			string strSQL = "SELECT COUNT(tbl_maestrante_tema_proyecto.Id_Usuario) " + 
				"FROM tbl_maestrante_tema_proyecto WHERE Estado=" + Estado.ToString("d") + ";";
			clsDAL oDAL = new clsDAL();
			System.UInt16 intResult;
			intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}

		public bool AgregarTemaProyecto()
		{
			clsDAL oDAL = new clsDAL();
			if(this.TieneTemaProyecto){return false;} // Comprobar que el Maestrante no tenga ya Tema de proyecto.
			string strSQL = string.Empty; // Consulta para agregar tbl_maestrante_tema_proyecto.
			strSQL = "INSERT INTO tbl_maestrante_tema_proyecto VALUES(" + this.m_Id + ", " + this.m_IdTemaProyecto + ", " + 
				"'" + this.m_Argumentos + "', '" + clsUtiles.getStringMySqlFormatedDate(System.DateTime.Now) + "', " + this.m_EstadoTemaProyecto.ToString("d") + ", " + 
				this.m_IdAcademicoRevisa + ");";
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}
		
		public bool ActualizarTemaProyecto()
		{
			if(!this.TieneTemaProyecto){return false;} 
			// Actualizar el tema de proyecto.
			string strSQL = "UPDATE tbl_maestrante_tema_proyecto SET Id_TemaProyecto=" + this.m_IdTemaProyecto + ", " +
				"Argumentos='" + this.m_Argumentos +  "', datSolicitud='" + clsUtiles.getStringMySqlFormatedDate(this.m_datSolicitud) + "', " +
				"Estado=" + this.m_EstadoTemaProyecto.ToString("d") + ", Id_AcademicoRevisa=" + this.m_IdAcademicoRevisa + " " +
				"WHERE Id_Usuario=" + this.m_Id + ";";
            clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		public bool EliminarTemaProyecto()
		{
			if(!this.TieneTemaProyecto){return false;} 
			// Actualizar el tema de proyecto.
			string strSQL = "DELETE FROM tbl_maestrante_tema_proyecto WHERE Id_Usuario=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PARA LA ENTIDAD "tbl_maestrante_tema_proyecto" ***"

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***" 


	} // Fin de la clase "clsMaestrante".

	/// <summary>
	/// Descripción de la clase clsMaestranteTemaProyecto.
	/// </summary>
	public class clsMaestranteTemaProyecto
	{
		public clsMaestranteTemaProyecto()
		{
		}

		public clsMaestranteTemaProyecto(System.UInt32 IdUsuario)
		{
			setFieldsValue(IdUsuario);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.UInt32 m_IdUsuario;
		private System.Byte m_IdTemaProyecto;
		private System.String m_Fundamentos;
		private System.DateTime m_datSolicitud;
		private clsMaestranteTemaProyecto.enuEstado m_Estado;
		private System.UInt32 m_IdUsuarioAutoriza;

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"
		
		public System.UInt32 IdUsuario
		{
			get{return this.m_IdUsuario;}
			set
			{
				setFieldsValue(value);
				this.m_IdUsuario = value;
			}
		}

		public System.Byte IdTemaProyecto
		{
			get{return this.m_IdTemaProyecto;}
			set{this.m_IdTemaProyecto = value;}
		}

		public System.String Fundamentos
		{
			get{return this.m_Fundamentos;}
			set{this.m_Fundamentos = value;}
		}

		public System.DateTime datSolicitud
		{
			get{return this.m_datSolicitud;}
			set{this.m_datSolicitud = value;}
		}

		public clsMaestranteTemaProyecto.enuEstado Estado
		{
			get{return this.m_Estado;}
			set{this.m_Estado = value;}
		}

		public System.UInt32 IdUsuarioAutoriza
		{
			get{return this.m_IdUsuarioAutoriza;}
			set{this.m_IdUsuarioAutoriza = value;}
		}

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** ENUMERACIONES ***"

		//	Flag que indica si le ha sido aprobado el proyecto solicitado. 
		// Ej.: 0 (No revisado), 1 (Aprobado), 2 (Rechazado). 
		public enum enuEstado: byte
		{
			/// <summary>
			/// Valor cero (0)
			/// </summary>
			Pendiente = 0,
			/// <summary>
			/// Valor uno (1)
			/// </summary>
			Aprobado = 1,
			/// <summary>
			/// Valor dos (2)
			/// </summary>
			Rechazado = 2
		};

		#endregion "*** FIN DE ENUMERACIONES ***"
		
		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.UInt32 IdUsuario)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable("SELECT * FROM tbl_maestrante_tema_proyecto WHERE Id_Usuario=" + IdUsuario + ";");
			oDAL = null;
			if(dt.Rows.Count==1)
			{
				this.m_IdUsuario = System.Convert.ToUInt32(dt.Rows[0]["Id_Usuario"]);
				this.m_IdTemaProyecto = System.Convert.ToByte(dt.Rows[0]["Id_TemaProyecto"]);
				this.m_Fundamentos = System.Convert.ToString(dt.Rows[0]["Argumentos"]);
				this.m_datSolicitud = System.Convert.ToDateTime(dt.Rows[0]["datSolicitud"]);
				this.m_Estado = (clsMaestranteTemaProyecto.enuEstado)(dt.Rows[0]["Estado"]);
				this.m_IdUsuarioAutoriza = System.Convert.ToUInt32(dt.Rows[0]["Id_AcademicoRevisa"]);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"
		
		public System.UInt16 getCantTemasProyecto()
		{
			string strSQL = "SELECT COUNT(tbl_maestrante_tema_proyecto.Id_Usuario) " + 
				"FROM tbl_maestrante_tema_proyecto WHERE Estado=0;";
			clsDAL oDAL = new clsDAL();
			System.UInt16 intResult;
			intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}

		public DataTable getList()
		{
			string strSQL = "SELECT tbl_usuario.Id, CONCAT(tbl_usuario.Nombre, ' ',tbl_usuario.Apellidos) AS Maestrante, " + 
				"tbl_usuario.CentroTrabajo, tbl_usuario.Funcion, tbl_sede.Nombre AS Sede, tbl_grupo.Nombre AS Grupo, " +
				"tbl_tema_proyecto.Nombre AS TemaProyecto, tbl_maestrante_tema_proyecto.Argumentos, tbl_maestrante_tema_proyecto.Estado " + 
				"FROM tbl_usuario " +
				"INNER JOIN tbl_maestrante_tema_proyecto ON tbl_usuario.Id=tbl_maestrante_tema_proyecto.Id_Usuario " + 
				"INNER JOIN tbl_usuario_maestrante ON tbl_usuario.Id=tbl_usuario_maestrante.Id_Usuario " +
				"INNER JOIN tbl_grupo ON tbl_usuario_maestrante.Id_Grupo=tbl_grupo.Id " + 
				"INNER JOIN tbl_tema_proyecto ON tbl_maestrante_tema_proyecto.Id_TemaProyecto=tbl_tema_proyecto.Id " +
				"INNER JOIN tbl_sede ON tbl_grupo.Id_Sede=tbl_sede.Id " +
				"ORDER BY Sede, Grupo, Maestrante";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getListByEstado(enuEstado Estado)
		{
			string strSQL = "SELECT tbl_usuario.Id, CONCAT(tbl_usuario.Nombre, ' ',tbl_usuario.Apellidos) AS Maestrante, " + 
				"tbl_usuario.CentroTrabajo, tbl_usuario.Funcion, tbl_sede.Nombre AS Sede, tbl_grupo.Nombre AS Grupo, " +
				"tbl_mencion.Nombre AS Mencion, " +
				"tbl_tema_proyecto.Nombre AS TemaProyecto, tbl_maestrante_tema_proyecto.Argumentos, tbl_maestrante_tema_proyecto.Estado " + 
				"FROM tbl_usuario " +
				"INNER JOIN tbl_maestrante_tema_proyecto ON tbl_usuario.Id=tbl_maestrante_tema_proyecto.Id_Usuario " + 
				"INNER JOIN tbl_usuario_maestrante ON tbl_usuario.Id=tbl_usuario_maestrante.Id_Usuario " +
				"INNER JOIN tbl_grupo ON tbl_usuario_maestrante.Id_Grupo=tbl_grupo.Id " + 
				"INNER JOIN tbl_mencion ON tbl_grupo.Id_Mencion=tbl_mencion.Id " +
				"INNER JOIN tbl_tema_proyecto ON tbl_maestrante_tema_proyecto.Id_TemaProyecto=tbl_tema_proyecto.Id " +
				"INNER JOIN tbl_sede ON tbl_grupo.Id_Sede=tbl_sede.Id " +
				"WHERE tbl_maestrante_tema_proyecto.Estado=" + System.Convert.ToByte(Estado) + " " +
				"ORDER BY Sede, Grupo, Maestrante;";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getOthersRequestingSameTema()
		{
			string strSQL = "SELECT tbl_usuario_maestrante.Id_Usuario AS Id, " +
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Nombre, " +
				"tbl_mencion.Nombre AS Mencion, tbl_maestrante_tema_proyecto.datSolicitud AS FechaSolicitud, " + 
				"CASE tbl_maestrante_tema_proyecto.Estado " +
				"WHEN " + System.Convert.ToByte(enuEstado.Pendiente) + " THEN '" + System.Convert.ToString(enuEstado.Pendiente) + "' " + 
				"WHEN " + System.Convert.ToByte(enuEstado.Aprobado) + " THEN '" + System.Convert.ToString(enuEstado.Aprobado) + "' " + 
				"WHEN " + System.Convert.ToByte(enuEstado.Rechazado) + " THEN '" + System.Convert.ToString(enuEstado.Rechazado) + "' " + 
				"END AS Estado, tbl_usuario.PerfilPublico " + 
				"FROM tbl_usuario " +
				"INNER JOIN tbl_usuario_maestrante ON tbl_usuario.Id=tbl_usuario_maestrante.Id_Usuario " + 
				"INNER JOIN tbl_maestrante_tema_proyecto ON tbl_usuario.Id=tbl_maestrante_tema_proyecto.Id_Usuario " +
				"INNER JOIN tbl_grupo, tbl_mencion ON tbl_usuario_maestrante.Id_Grupo=tbl_grupo.Id AND tbl_grupo.Id_Mencion=tbl_mencion.Id " +
				"WHERE ((tbl_maestrante_tema_proyecto.Id_TemaProyecto=" + this.m_IdTemaProyecto + ") AND " +
				"(tbl_usuario_maestrante.Id_Usuario!=" + this.m_IdUsuario + "));";
			clsDAL oDAL = new clsDAL();
            DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getSolicitud(System.UInt32 IdUsuario)
		{
			string strSQL = "SELECT tbl_usuario.Id, CONCAT(tbl_usuario.Nombre, ' ',tbl_usuario.Apellidos) AS Maestrante, " + 
				"tbl_usuario.CentroTrabajo, tbl_usuario.Funcion, tbl_sede.Nombre AS Sede, tbl_grupo.Nombre AS Grupo, " +
				"tbl_mencion.Nombre AS Mencion, " +
				"tbl_tema_proyecto.Nombre AS TemaProyecto, tbl_maestrante_tema_proyecto.Argumentos, tbl_maestrante_tema_proyecto.Estado " + 
				"FROM tbl_usuario " +
				"INNER JOIN tbl_maestrante_tema_proyecto ON tbl_usuario.Id=tbl_maestrante_tema_proyecto.Id_Usuario " + 
				"INNER JOIN tbl_usuario_maestrante ON tbl_usuario.Id=tbl_usuario_maestrante.Id_Usuario " +
				"INNER JOIN tbl_grupo ON tbl_usuario_maestrante.Id_Grupo=tbl_grupo.Id " + 
				"INNER JOIN tbl_mencion ON tbl_grupo.Id_Mencion=tbl_mencion.Id " +
				"INNER JOIN tbl_tema_proyecto ON tbl_maestrante_tema_proyecto.Id_TemaProyecto=tbl_tema_proyecto.Id " +
				"INNER JOIN tbl_sede ON tbl_grupo.Id_Sede=tbl_sede.Id " +
				"WHERE tbl_maestrante_tema_proyecto.Id_Usuario=" + IdUsuario + ";";
			clsDAL oDAL = new clsDAL();
			System.Data.DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public bool ActualizarEstadoSolicitud(System.UInt32 IdUsuario, clsMaestranteTemaProyecto.enuEstado Estado, System.UInt32 IdAcademicoRevisa)
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "UPDATE tbl_maestrante_tema_proyecto SET Estado=" + System.Convert.ToByte(Estado) + 
				", Id_AcademicoRevisa=" + IdAcademicoRevisa + " WHERE Id_Usuario=" + IdUsuario + ";";
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}
		
		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	} // Fin de la clase "clsMaestranteTemaProyecto".

} // Fin del namespace.
