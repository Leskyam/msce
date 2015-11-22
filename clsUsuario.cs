using System;
using System.Web;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsUsuario.
	/// </summary>
	public class clsUsuario
	{
		public clsUsuario()
		{
			//
			// TODO: agregar aquí la lógica del constructor
			//
		}

		/// <summary>
		/// Inicializa la clase recuperando los datos del usuario cuyo Id se pasa 
		/// como valor del parámetro "Id".
		/// </summary>
		/// <param name="Id">Id del usuario.</param>
		public clsUsuario(System.UInt32 Id)
		{
			// Establecer los valores de los campos de esta clase.
			setFieldsValue(Id);
		}
		
		/// <summary>
		/// Inicializa la clase recuperando los datos del usuario cuyo UserId 
		/// (Nombre de usuario para el login) se pasa como valor del parámetro "UserId".
		/// </summary>
		/// <param name="Id">UserId (Nombre de usuario para el login) del usuario.</param>
		public clsUsuario(System.String UserId)
		{
			// Establecer los valores de los campos de esta clase.
			setFieldsValue(UserId);
			AsignarRoles(this.m_Id);
			ObtenerRolePrincipal();
		}

		#region "*** VARIABLES PROTEGIDAS ***"

		// Declarada protected para que sea accedida por las clases que hereden de esta.
		protected System.UInt32 m_Id;				//MySQL int(4) unsigned
		protected string m_Nombre;					//MySQL varchar(50)
		protected string m_Apellidos;					//MySQL varchar(75)
		protected char m_Sexo;						//MySQL char(1);
		protected string m_UserId;					//MySQL varchar(25)
		protected string m_UserPass;					//MySQL varchar(16)
		protected string m_CentroTrabajo;				//MySQL varchar(150)
		protected string m_Funcion;					//MySQL varchar(150)
		protected string m_email;						//MySQL varchar(150)
		protected System.DateTime m_datUltimoAcceso;	//MySQL datetime
		protected bool m_CuentaBloqueada;				//MySQL tinyint(1)
		protected bool m_PerfilPublico;				//MySQL tinyint(1)
		protected string m_RolePrincipal;		
		protected strucRoles m_Roles;
		protected string m_TableName = "tbl_usuario";

		#endregion "*** FIN DE VARIABLES PROTEGIDAS ***"

		#region "*** VARIABLES PÚBLICAS ***"

		#endregion "*** FIN DE VARIABLES PÚBLICAS ***"

		#region "*** PROPIEDADES ***"

		public System.UInt32 Id	//MySQL int(4) unsigned
		{
			get
			{
				return m_Id;	
			}
		}				
		
		public string Nombre	//MySQL varchar(50)
		{
			get
			{
				return m_Nombre;	
			}
			set
			{
					m_Nombre = value.Length<=50?value:value.Substring(0,50);
			}
		}				
		
		public string Apellidos	//MySQL varchar(75)
		{
			get
			{
				return m_Apellidos;	
			}
			set
			{
				m_Apellidos = value.Length<=75?value:value.Substring(0,75);
			}
		}				

		public char Sexo	//MySQL char(1);
		{
			get
			{
				return m_Sexo;	
			}
			set
			{
				switch(value)
				{
					case 'F':
					case 'f':
					{
						this.m_Sexo = 'F';
						break;
					}
					case 'M':
					case 'm':
					{
						this.m_Sexo = 'M';
						break;
					}
					default:
					{
						this.m_Sexo = 'F';
						break;
					}
				}
			}
		}				
		
		public string UserId	//MySQL varchar(25)
		{
			get
			{
				return this.m_UserId;	
			}
			set
			{
				this.m_UserId = (value.Length>25)?value.Substring(0,25):value;
			}
		}				
		
		public string UserPass	//MySQL varchar(16)
		{
			get
			{
				return this.m_UserPass;	
			}
			set
			{
				this.m_UserPass = (value.Length>16)?value.Substring(0,16):value;
			}
		}				
		
		public string CentroTrabajo	//MySQL varchar(150)
		{
			get
			{
				return m_CentroTrabajo;	
			}
			set
			{
				m_CentroTrabajo = (value.Length>150)?value.Substring(0,150):value;;
			}
		}				
		
		public string Funcion	//MySQL varchar(150)
		{
			get
			{
				return m_Funcion;	
			}
			set
			{
				m_Funcion = (value.Length>150)?value.Substring(0,150):value;;
			}
		}				
		
		public string email	//MySQL varchar(150)
		{
			get
			{
				return m_email;	
			}
			set
			{
				m_email = value;
			}
		}				

		public System.DateTime datUltimoAcceso	//MySQL datetime
		{
			get
			{
				return m_datUltimoAcceso;	
			}
		}				
		
		public bool CuentaBloqueada	//MySQL tinyint(1)
		{
			get
			{
				return this.m_CuentaBloqueada;	
			}
			set
			{
				this.m_CuentaBloqueada = value;
			}
		}				

		public bool PerfilPublico	//MySQL tinyint(1)
		{
			get
			{
				return this.m_PerfilPublico;	
			}
			set
			{
				this.m_PerfilPublico = value;
			}
		}				

		public string RolePrincipal
		{
			get
			{
				if(this.m_RolePrincipal==null & this.m_Id>0)
				{
					this.AsignarRoles(this.m_Id);
					this.ObtenerRolePrincipal();
				}
				return m_RolePrincipal;	
			}
		}	
		
		public strucRoles Roles
		{
			get
			{
				return m_Roles;
			}

		}

		#region "*** EXPLICACIONES DE LOS CAMPOS ***"

		public static System.String explain_Nombre
		{
			get
			{
				return "Nombre del usuario, puede ser un nombre sencillo, compuesto por una sola palabra o compuesto, cuando está formado por varias.";
			}
		}
		public static System.String explain_Apellidos
		{
			get
			{
				return "Apellidos del usuario, normalmente los apellidos del usuario, aunque se acepta que en caso de no tener uno ó ninguno de los dos se utilice 'SOA'";
			}
		}
		public static System.String explain_Sexo
		{
			get
			{
				return "Sexo del usuario por naturaleza, puede ser 'Femenino' ó 'Masculino'";
			}
		}
		public static System.String explain_UserId
		{
			get
			{
				return "Id de usuario, nombre de usuario, usuario, login, son los nombres que comúnmente se utilizan para llamar al 'Id de usuario', es el nombre que, conbinado con la 'Contraseña', el usuario utilizará para hacer uso pleno de la aplicación, según su 'Role' y que es por tanto, así como la 'Contraseña', DE CARÁCTER INTRANSFERIBLE.";
			}
		}
		public static System.String explain_UserPass
		{
			get 
			{
				return "Contraseña, es la palabra clave que, conbinada con el 'Id de usuario', el usuario utilizará para hacer uso pleno de la aplicación, según su 'Role' y que es por tanto, así como el 'Id de usuario', DE CARÁCTER INTRANSFERIBLE.";
			}
		}
		public static System.String explain_CentroTrabajo
		{
			get
			{
				return "Centro de trabajo del usuario, es donde el usuario normalmente desarrolla la mayor parte de su trabajo profesional.";
			}
		}
		public static System.String explain_Funcion
		{
			get
			{
				return "Función en el centro de trabajo del usuario, es la responsabilidad o función de la que se ocupa el usuario en su 'Centro de trabajo'.";
			}
		}
		public static System.String explain_email
		{
			get
			{
				return "Dirección de correo electrónico del usuario, es la dirección de correo electrónico que pertenece al usuario o aquella de la cual puede hacer uso.";
			}
		}
		public static System.String explain_CuentaBloqueada
		{
			get
			{
				return "Cuenta bloqueada, es el indicador que se utiliza para habilitar/deshabilitar el acceso del usuario a la aplicación.";
			}
		}
		public static System.String explain_PerfilPublico
		{
			get 
			{
				return "Perfil público, es el indicador determina si el perfil del usuario puede ser visto por usuarios que no sean el propietario del mismo.";
			}
		}
		public static System.String explain_Role(string RoleName)
		{
			switch(RoleName)
			{
				case "Director":
				{
					return "El role de 'Director' le pertenece a un solo usuario, normalmente es el director del comité " + 
						"de académicos de la provincia, donde se desarrolla la maestría. Este usuario es el único que " + 
						"puede modificar los datos generales de la maestría, como son: el nombre de la provincia donde se " + 
						"desarrolla, el nombre de la maestría, el nombre de la entidad que hospeda esta aplicación, las " +
						"fechas de inicio y de finalización, el estado de la matrícula, el módulo que se encuentra activo " + 
						"actualmente, los requisitos para ingresar, los fundamentos de la maestría y hasta puede delegar su " +
						"función en otro usuario que tenga el role de 'Académico'. También es el único que puede modificar " +
						"los módulos, los cursos y los temas de la maestría y tiene la responsabilidad de registrar aquellos " + 
						"usuarios con role de 'Académico'. Este usuario tiene también el role de 'Académico' ya que es un " + 
						"miembro más de dicho comité, lo que le permite entonces tener acceso a todas las funcionalidades " +
						"que tiene un 'Académico' común.";
				}
				case "Académico":
				{
					return "El role de 'Académico' le pertenece a un grupo selecto de usuarios, son los que participan en " +
						"el comité de académicos de la provincia. Como 'Académicos' tiene los siguientes derechos: pueden " +
						"modificar las menciones, las sedes universitarias, los grupos de maestrantes, los temas para " + 
						"proyectos de investigación y tienen la responsabilidad de proporcionar la bibliografía básica " + 
						"y de registrar a los usuarios con role de 'Docente', además pueden, si lo entienen necesario, " + 
						"agragar también aquellos que son 'Maestrante'. Este tipo de usuario puede tener también el role " + 
						"de 'Docente', lo que le permite entonces tener acceso a todas las funcionalidades que tiene un " +
						"'Docente' común.";
				}
				case "Docente":
				{
					return "El role de 'Docente' le pertenece a aquellos usuarios que normalmente imparten los encuentro " + 
						"presenciales de la maestría. Como 'Docentes' tiene los siguientes derechos: buscar y descargar " + 
						"bibliografía, y tienen la responsabilidad de agregar la bibliografía complementaria perteneciente " + 
						"a cada 'Tema', responder las consultas que les son dirigidas por los 'Maestrantes' y programar los " + 
						"encuentros presenciales por grupo, registrando para cada encuentro las orientaciones pertienentes al mismo.";
				}
				case "Maestrante":
				{
					return "El role de 'Maestrante' le pertenece a aquellos usuarios que están estudiando para obtener " + 
						"el título de 'Master' en la materia que se imparte, estos usuarios tienen los siguientes derechos: " + 
						"pueden buscar y descargar bibliografía, tanto básica como complementaria, plantear consultas " + 
						"a los 'Docentes' y leer las respuestas de los mismos, ver las planificaciones existentes para " + 
						"los encuentros presenciales y solicitar un tema para proyecto de investigación que será aprobado " + 
						"o rechazado por alguno de los 'Académcios'";
				}
				default:
				{
					return "El nombre del 'Role' que se proporcionó como parámetro no se puede identificar.";
				}
			}
		}

		#endregion "*** FIN DE LAS EXPLICACIONES PARA LOS CAMPOS ***"

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** ESTRUCTURAS ***"
		
		public struct struLoggedUsers
		{
			public System.UInt32 Id;
			public System.String Nombre;
			public System.String Apellidos;
			public System.String UserId;
			public System.String RolePrincipal;
			public System.String email;
			public System.DateTime datUltimoAcceso;
			public System.DateTime datLastRequest;
		}
				
		public struct strucRoles
		{
			public string[] Roles;
			/// <summary>
			/// Mi implementación de ToString(), devuelve los roles a los que pertenece el usuario separados por ", " coma y un espacio.
			/// </summary>
			/// <returns></returns>
			public override string ToString()
			{
				string strRoles = string.Empty;
				for(int i=0; i<=(Roles.Length-1); i++)
				{
					strRoles += strRoles==string.Empty?Roles[i]:", "+Roles[i];
				}
				return strRoles!=string.Empty?strRoles:"Invitado";
			}
		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** ENUMERACIONES ***"

		public enum enuRolesName
		{
			Director = 1,
			Academico = 2,
			Docente = 3,
			Maestrante = 4
		};


		#endregion "*** FIN DE ENUMERACIONES ***"

		#region "*** VARIABLES ESTÁTICAS ***"

		public static struLoggedUsers[] LoggedUsers = new struLoggedUsers[0];

		#endregion "*** FIN DE VARIABLES ESTÁTICAS ***"
		
		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.UInt32 Id)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtUsuario = oDAL.getDataTable("SELECT * FROM " + this.m_TableName + " WHERE " + this.m_TableName + ".Id=" + Id + ";");
			oDAL = null;
			if(dtUsuario.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToUInt32(dtUsuario.Rows[0]["Id"]);
				this.m_Nombre = System.Convert.ToString(dtUsuario.Rows[0]["Nombre"]);
				this.m_Apellidos = System.Convert.ToString(dtUsuario.Rows[0]["Apellidos"]);
				this.m_Sexo = System.Convert.ToChar(dtUsuario.Rows[0]["Sexo"]);
				this.m_UserId = System.Convert.ToString(dtUsuario.Rows[0]["UserId"]);
				this.m_UserPass = System.Convert.ToString(dtUsuario.Rows[0]["UserPass"]);
				this.m_CentroTrabajo = System.Convert.ToString(dtUsuario.Rows[0]["CentroTrabajo"]);
				this.m_Funcion = System.Convert.ToString(dtUsuario.Rows[0]["Funcion"]);
				this.m_email = System.Convert.ToString(dtUsuario.Rows[0]["email"]);
				this.m_datUltimoAcceso = System.DateTime.Now;
				this.m_CuentaBloqueada = System.Convert.ToBoolean(dtUsuario.Rows[0]["CuentaBloqueada"]);
				this.m_PerfilPublico = System.Convert.ToBoolean(dtUsuario.Rows[0]["PerfilPublico"]);
				AsignarRoles(this.m_Id);
				ObtenerRolePrincipal();
			}
		}

		private void setFieldsValue(System.String UserId)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtUsuario = oDAL.getDataTable("SELECT * FROM " + this.m_TableName + " WHERE " + this.m_TableName + ".UserId='" + UserId + "';");
			oDAL = null;
			if(dtUsuario.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToUInt32(dtUsuario.Rows[0]["Id"]);
				this.m_Nombre = System.Convert.ToString(dtUsuario.Rows[0]["Nombre"]);
				this.m_Apellidos = System.Convert.ToString(dtUsuario.Rows[0]["Apellidos"]);
				this.m_Sexo = System.Convert.ToChar(dtUsuario.Rows[0]["Sexo"]);
				this.m_UserId = System.Convert.ToString(dtUsuario.Rows[0]["UserId"]);
				this.m_UserPass = System.Convert.ToString(dtUsuario.Rows[0]["UserPass"]);
				this.m_CentroTrabajo = System.Convert.ToString(dtUsuario.Rows[0]["CentroTrabajo"]);
				this.m_Funcion = System.Convert.ToString(dtUsuario.Rows[0]["Funcion"]);
				this.m_email = System.Convert.ToString(dtUsuario.Rows[0]["email"]);
				this.m_datUltimoAcceso = System.DateTime.Now;
				this.m_CuentaBloqueada = System.Convert.ToBoolean(dtUsuario.Rows[0]["CuentaBloqueada"]);
				this.m_PerfilPublico = System.Convert.ToBoolean(dtUsuario.Rows[0]["PerfilPublico"]);
				AsignarRoles(this.m_Id);
				ObtenerRolePrincipal();
			}
		}

		private string ParseUserId(string strUserId)
		{
			if(strUserId.IndexOf(" ")>-1)
			{
				strUserId = strUserId.Replace(" ","_");
			}

			return strUserId;
		}
		
		private void ActualizarUltimoAcceso(System.UInt32 Id)
		{
			clsDAL oDAL = new clsDAL();
			System.DateTime oDate = System.DateTime.Now;
			oDAL.ExecCommand("UPDATE " + this.m_TableName + " SET datUltimoAcceso='" + 
				clsUtiles.getStringMySqlFormatedDate(oDate) + 
				"' WHERE Id=" + Id + ";");
			oDAL = null;
			this.m_datUltimoAcceso = oDate;
		}

		/// <summary>
		/// Adicionar los datos del usuario que correspondan a la variable 
		/// estática de esta clase que almacena los mismos.
		/// </summary>
		private void AddUserToConnectedList()
		{
			if(!IsUserInConnectedList())
			{
				clsUsuario.struLoggedUsers[] tmpContectedUsers = new struLoggedUsers[clsUsuario.LoggedUsers.Length+1];
				clsUsuario.LoggedUsers.CopyTo(tmpContectedUsers,0);
				tmpContectedUsers[tmpContectedUsers.Length-1].Id = this.m_Id;
				tmpContectedUsers[tmpContectedUsers.Length-1].UserId = this.m_UserId;
				tmpContectedUsers[tmpContectedUsers.Length-1].Nombre = this.m_Nombre;
				tmpContectedUsers[tmpContectedUsers.Length-1].Apellidos = this.m_Apellidos;
				tmpContectedUsers[tmpContectedUsers.Length-1].RolePrincipal = this.m_RolePrincipal;
				tmpContectedUsers[tmpContectedUsers.Length-1].email = this.m_email;
				tmpContectedUsers[tmpContectedUsers.Length-1].datUltimoAcceso = this.m_datUltimoAcceso;
				tmpContectedUsers[tmpContectedUsers.Length-1].datLastRequest = System.DateTime.Now;
				clsUsuario.LoggedUsers = tmpContectedUsers;
				tmpContectedUsers = null;
			}
			return;
		}

		private bool IsUserInConnectedList()
		{
			for(int x=0; x<=(clsUsuario.LoggedUsers.Length-1); x++)
			{
				if(clsUsuario.LoggedUsers[x].Id == this.m_Id)
				{
					return true;
				}
			}
			return false;

		}

		private bool IsUserInConnectedList(string strUserId)
		{
			for(int x=0; x<=(clsUsuario.LoggedUsers.Length-1); x++)
			{
				if(clsUsuario.LoggedUsers[x].UserId.ToLower() == strUserId.ToLower())
				{
					return true;
				}
			}
			return false;

		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		public bool Validar(string strUserId, string strUserPass)
		{
			clsDAL oDAL = new clsDAL();
			object intId = oDAL.getEscalarValue("SELECT Id FROM " + this.m_TableName + " WHERE UserId='" + ParseUserId(strUserId) + "' " + 
				"AND UserPass=PASSWORD('" + strUserPass + "') AND CuentaBloqueada=0; ");
			oDAL = null;
			if(intId is System.UInt32)
			{
				setFieldsValue(System.Convert.ToUInt32(intId));
				// Chequear si es un maestrante, si ha sido ya autorizado.
				if(this.IsInRole(clsUsuario.enuRolesName.Maestrante))
				{
					clsMaestrante Maestrante = new clsMaestrante(this.Id);
					if(!Maestrante.IsAuthorized())
						return false;
				}
				ActualizarUltimoAcceso(System.Convert.ToUInt32(intId));
				AddUserToConnectedList();
				return true;
			}

			return false;
		}

		public void AsignarRoles(System.UInt32 Id)
		{
			string strSQL = "SELECT " + this.m_TableName + ".Id, tbl_maestria.Id_UsuarioDirector AS Director, " + 
				"tbl_usuario_academico.Id_Usuario AS Academico, tbl_usuario_docente.Id_Usuario AS Docente, " + 
				"tbl_usuario_maestrante.Id_Usuario AS Maestrante FROM " + this.m_TableName + " LEFT JOIN tbl_maestria ON " + 
				"" + this.m_TableName + ".Id = tbl_maestria.Id_UsuarioDirector LEFT JOIN tbl_usuario_academico ON " +
				"" + this.m_TableName + ".Id = tbl_usuario_academico.Id_Usuario LEFT JOIN tbl_usuario_docente ON " + 
				"" + this.m_TableName + ".Id = tbl_usuario_docente.Id_Usuario LEFT JOIN tbl_usuario_maestrante ON " +
				"" + this.m_TableName + ".Id = tbl_usuario_maestrante.Id_Usuario WHERE " + this.m_TableName + ".Id = " + Id + ";";

			clsDAL oDAL = new clsDAL();
			System.Data.DataTable tblUserRoles;
			tblUserRoles = oDAL.getDataTable(strSQL);
			oDAL = null;
			string strUserRoles = String.Empty;
			if(tblUserRoles.Rows.Count==1)
			{
				for(int x=1; x<=(tblUserRoles.Rows[0].ItemArray.Length-1); x++)
				{
					if(!(tblUserRoles.Rows[0][x] is System.DBNull))
					{
						if(System.Convert.ToUInt32(tblUserRoles.Rows[0][x])==Id)
						{
							strUserRoles += tblUserRoles.Columns[x].ColumnName!="Academico"?tblUserRoles.Columns[x].ColumnName + "|":"Académico" + "|";
						}
					}
				}
			}
			// Finalmente agregar el role "Invitado" a todos los usuarios identificados también.
			strUserRoles = strUserRoles==string.Empty?"Invitado":strUserRoles;
			// Eliminar el último caracter "|".
			if(strUserRoles.LastIndexOf("|")==strUserRoles.Length-1)
			{
				strUserRoles = strUserRoles.Remove(strUserRoles.LastIndexOf("|"),1);
			}
			// Asignar los roles que se hallan determinado según el usuario.
			//			System.Web.Security.FormsIdentity UserIdentity = (System.Web.Security.FormsIdentity)System.Web.HttpContext.Current.User.Identity;
			//			System.Web.HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(UserIdentity, strUserRoles.Split('|'));
			this.m_Roles.Roles = strUserRoles.Split('|');
            
		}

		public string ObtenerRolePrincipal()
		{
			if(this.IsInRole(clsUsuario.enuRolesName.Director))
			{
				this.m_RolePrincipal = enuRoleToString(clsUsuario.enuRolesName.Director);
				return this.m_RolePrincipal;
			}
			if(this.IsInRole(clsUsuario.enuRolesName.Academico))
			{
				this.m_RolePrincipal = enuRoleToString(clsUsuario.enuRolesName.Academico);
				return this.m_RolePrincipal;
			}
			if(this.IsInRole(clsUsuario.enuRolesName.Docente))
			{
				this.m_RolePrincipal = enuRoleToString(clsUsuario.enuRolesName.Docente);
				return this.m_RolePrincipal;
			}
			if(this.IsInRole(clsUsuario.enuRolesName.Maestrante))
			{
				this.m_RolePrincipal = enuRoleToString(clsUsuario.enuRolesName.Maestrante);
				return this.m_RolePrincipal;
			}

			this.m_RolePrincipal = "Invitado";
			return "Invitado";

		}

		public bool IsInRole(clsUsuario.enuRolesName RoleName)
		{
			bool boResult = false;
			if(this.m_Id>0 & this.m_Roles.Roles!=null)
			{
				for(int x=0; x<=(this.m_Roles.Roles.Length-1); x++)
				{
					//System.Diagnostics.Debug.WriteLine(this.m_Roles.Roles[x]);
					if(this.m_Roles.Roles[x]==enuRoleToString(RoleName))
					{
						boResult = true;
						break;
					}
				}
			}

			return boResult;

		}

		/// <summary>
		/// Actualiza la fecha/hora del último request que hizo el usuario, así
		/// sabremos cual de ellos debe eliminarse por vencimiento de tiempo de 
		/// sesión para que no se muestre más en las listas de usuarios Identificados.
		/// </summary>
		/// <param name="UserId">El nombre de usuario.</param>
		public void UpdateLastRequest(string UserId)
		{
			if((clsUsuario.LoggedUsers.Length>0) & (UserId!=string.Empty))
			{
				for(int x=0; x<=(clsUsuario.LoggedUsers.Length-1); x++)
				{
					if(clsUsuario.LoggedUsers[x].UserId.ToLower() == UserId.ToLower())
					{
						clsUsuario.LoggedUsers[x].datLastRequest = System.DateTime.Now;
						break;
					}
				}
			}
		}

		public void DeleteFronConnectedList(string UserId)
		{
			if(clsUsuario.LoggedUsers.Length>0)
			{
				if(IsUserInConnectedList(UserId))
				{
					if(clsUsuario.LoggedUsers.Length==1)
					{
						clsUsuario.LoggedUsers = new clsUsuario.struLoggedUsers[0];
						return;
					}
					clsUsuario.struLoggedUsers[] tmpConnectedUser = new struLoggedUsers[clsUsuario.LoggedUsers.Length-1];
					int y = 0;
					for(int x=0; x<=(clsUsuario.LoggedUsers.Length-1); x++)
					{
						if(clsUsuario.LoggedUsers[x].UserId.ToLower() != UserId.ToLower())
						{
							tmpConnectedUser[y].Id = clsUsuario.LoggedUsers[x].Id;
							tmpConnectedUser[y].UserId = clsUsuario.LoggedUsers[x].UserId;
							tmpConnectedUser[y].Nombre = clsUsuario.LoggedUsers[x].Nombre;
							tmpConnectedUser[y].Apellidos = clsUsuario.LoggedUsers[x].Apellidos;
							tmpConnectedUser[y].RolePrincipal = clsUsuario.LoggedUsers[x].RolePrincipal;
							tmpConnectedUser[y].email = clsUsuario.LoggedUsers[x].email;
							tmpConnectedUser[y].datUltimoAcceso = clsUsuario.LoggedUsers[x].datUltimoAcceso;
							tmpConnectedUser[y].datLastRequest = clsUsuario.LoggedUsers[x].datLastRequest;
							y++;
						}
					}

					clsUsuario.LoggedUsers = tmpConnectedUser;
				}
			}
		}

		public string generatePassword(string Nombre)
		{
			string strSalt = System.DateTime.Now.Ticks.ToString();
			// Para almacenar los valores de las cadenas originales del Password y el Salt.
			byte[] bytValue;
			// Para almacenar el valor resultante del Hash.
			byte[] bytHash;
			// Convertir la cadena original y el SaltKey a un array de tipo Bytes.
			bytValue = System.Text.Encoding.UTF8.GetBytes(strSalt + Nombre);
			// Efectual cálculo del Hash para el algoritmo SHA1.
			System.Security.Cryptography.SHA1CryptoServiceProvider HashProvider = new System.Security.Cryptography.SHA1CryptoServiceProvider();
			// Calcular el Hash, devuelve un array de Bytes.
			bytHash = HashProvider.ComputeHash(bytValue);
			HashProvider.Clear();
			string strPassword = Convert.ToBase64String(bytHash);
			strPassword =	strPassword.Length>8?strPassword.Substring(0,8):strPassword;
			return strPassword;
		}

		public bool sendWelcomeMail()
		{
			try
			{
				clsMaestria Maestria = new clsMaestria();
				string strNombreMaestria = Maestria.Nombre;
				Maestria = null;
				clsProvincia Provincia = new clsProvincia();
				string strProvinciaActual = Provincia.Nombre; 
				Provincia = null;

				// Cadena que representa el TAB.
				string strTab = System.Web.UI.HtmlTextWriter.DefaultTabString;
				// Las comillas dobles.
				//char strQuote = System.Web.UI.HtmlTextWriter.DoubleQuoteChar;
				// Nueva línea
				string strNewLine = System.Environment.NewLine;
				System.Text.StringBuilder sbHTML = new System.Text.StringBuilder();

				// La base de los links que contiene el correo.
				string strContentBase = HttpContext.Current.Request.Url.ToString().Substring(0, HttpContext.Current.Request.Url.ToString().IndexOf(HttpContext.Current.Request.ApplicationPath)+HttpContext.Current.Request.ApplicationPath.Length+1);

				// Estilos para poner en los elementos style porque algunos clientes web de mensajería no entienden de estilos empotrados, tiene que ser en-línea.
				string style_body = "font-size: 8pt; color: #000000; font-family: Verdana; text-decoration: none";
				string style_td_title = "font-size: 10pt; color: #47639a; font-weight: bold; font-family: Verdana; background-color: #f0f8ff; border-right: #47639a 1px solid; border-top: #47639a 1px solid; border-left: #47639a 1px solid; border-bottom: #47639a 1px solid";
				string style_td = "font-size: 8pt; color: #000000; font-family: Verdana; text-decoration: none; padding-right: 2px; padding-left: 2px; padding-bottom: 2px; margin: 2px; padding-top: 2px";
				string style_td_content = "font-size: 8pt; color: #000000; font-family: Verdana; text-decoration: none; padding-right: 2px; padding-left: 2px; padding-bottom: 2px; margin: 2px; padding-top: 2px; background-color: #ffffff; border-right: #47639a 1px solid; border-left: #47639a 1px solid; border-bottom: #47639a 1px solid";

				sbHTML.Append("<html>" + strNewLine);
				sbHTML.Append(strTab + "<head>" + strNewLine);
				sbHTML.Append(strTab + strTab + "<title>Bienvenido a: " + strNombreMaestria + "</title>" + strNewLine);
				sbHTML.Append(strTab + strTab + "<meta http-equiv=\"Content-Language\" content=\"es\">" + strNewLine);
				sbHTML.Append(strTab + strTab + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">" + strNewLine);
				sbHTML.Append(strTab + "</head>" + strNewLine);
				sbHTML.Append(strTab + "<body style=\"" + style_body + "\" topmargin=\"0\" leftmargin=\"0\" bottommargin=\"0\" rightmargin=\"0\"> " + strNewLine);
				sbHTML.Append(strTab + strTab + "<table border=\"0\" width=\"100%\">" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td_title + "\" valign=\"middle\" colspan=\"3\"><b>Bienvenido a: " + strNombreMaestria + "</b></td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td_content + "\" colspan=\"3\">" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + strTab + this.m_Sexo.ToString()=="F"?"Estimada":"Estimado " + this.m_Nombre + " " + this.m_Apellidos + ":<br>Usted ha sido registrado para hacer uso de la " + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + strTab + "aplicación que presenta, en su versión digital, la maestría a distancia <b>\"" + strNombreMaestria + "\"</b>, y que se desarrolla en " + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + strTab + strProvinciaActual + ". A continuación le notificamos algunos datos de su interés." + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"20%\" valign=\"top\"><b>Definición</b></td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"30%\" valign=\"top\"><b>Valor</b></td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"50%\" valign=\"top\"><b>Explicación</b></td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"20%\" valign=\"top\">Id de usuario:</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"30%\" valign=\"top\">" + this.m_UserId + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"50%\" valign=\"top\">" + clsUsuario.explain_UserId + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"20%\" valign=\"top\">Contraseña:</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"30%\" valign=\"top\">" + this.m_UserPass + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"50%\" valign=\"top\">" + clsUsuario.explain_UserPass + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"20%\" valign=\"top\">Role principal:</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"30%\" valign=\"top\">" + this.RolePrincipal + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" width=\"50%\" valign=\"top\">" + clsUsuario.explain_Role(this.RolePrincipal) + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td valign=\"middle\" colspan=\"3\"><hr size=\"1\" color=\"#47639a\" width=\"100%\"></td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" valign=\"middle\" colspan=\"3\">" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + strTab + "Le sugerimos que revise los datos de su <a href=\"" + strContentBase + "perfil.aspx?Id=" + this.Id + "\" target=\"_blank\">perfil</a> " + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + strTab + "y modifique los que estime conveniente si es necesario." + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "<tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "<td style=\"" + style_td + "\" valign=\"middle\" colspan=\"3\">" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + strTab + "<br>Atentamente,<br><br>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + strTab + "<a href=\"" + strContentBase + "lista_usuarios.aspx?role=academico\" target=\"_blank\">Miembros del comité de académicos de la provincia</a>." + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + strTab + "</td>" + strNewLine);
				sbHTML.Append(strTab + strTab + strTab + "</tr>" + strNewLine);
				sbHTML.Append(strTab + strTab + "</table>" + strNewLine);
				sbHTML.Append(strTab + "</body>" + strNewLine);
				sbHTML.Append("</html>");

				System.Web.Mail.MailMessage mailMsg = new System.Web.Mail.MailMessage();
				mailMsg.From = clsSettings.SMTPUser; //strNombreMaestria;
				mailMsg.To = this.m_email;
				mailMsg.Subject = "Notificación de registro: " + strNombreMaestria;
				mailMsg.BodyEncoding = System.Text.Encoding.GetEncoding("iso-8859-1");
				mailMsg.BodyFormat = System.Web.Mail.MailFormat.Html;
				mailMsg.UrlContentBase = strContentBase;
				mailMsg.Body = sbHTML.ToString();
				mailMsg.Priority = System.Web.Mail.MailPriority.Normal;
				mailMsg.Headers["Reply-To"] = "no-replay";
				System.Web.Mail.SmtpMail.SmtpServer = clsSettings.SMTPServer;
				try
				{
					if(clsSettings.SMTPAuth)
					{
						mailMsg.Fields.Add("http://www.msce.cu/smtpauthenticate", "1");
						mailMsg.Fields.Add("http://www.msce.cu/sendusername", clsSettings.SMTPUser);
						mailMsg.Fields.Add("http://www.msce.cu/smtppassword", clsSettings.SMTPPassword);
					}
				}
				catch(System.Exception)
				{
					; // No hacer nada.
				}
				System.Web.Mail.SmtpMail.Send(mailMsg);
				mailMsg = null;
				return true;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				return false;
			}
		}

		public string generateUserId(string Nombre, string Apellidos)
		{
			try
			{
				string strUserId = Nombre + " " + Apellidos;
				char[,] chrAccents = {{'á','é','í','ó','ú','ñ'}, {'a','e','i','o','u','n'}};
				string[] strInvalidWords = {"y", "de","del",".","la","las","lo","los"};
				// Manejarlo todo en minúscula.
				strUserId = strUserId.ToLower();
				// Eliminar los puntos (.)
				strUserId = strUserId.Replace(".","");
				// Eliminar las palabras que no se toman en cuenta.
				for(int x=0; x<=(strInvalidWords.Length-1); x++)
				{
					if(strUserId.IndexOf(" " + strInvalidWords[x] + " ")>-1)
						strUserId = strUserId.Replace(" " + strInvalidWords[x] + " "," ");
				}
				// Eliminar los espacios del comienzo y del final, si existen.
				strUserId = strUserId.Trim();
				// Reemplazar los espacios por el caracter '|'
				strUserId = strUserId.Replace(' ','|');
				// Buscar y reemplazar las ocurencias de "||" por "|"
				while(strUserId.IndexOf("||")>-1)
				{
					strUserId = strUserId.Replace("||","|");
				}
				// Crear el array con los valores hallados.
				string[] aryUserId = strUserId.Split('|');
				// Tomar el primer valor del array, que debe será el primer nombre.
				strUserId = aryUserId[0];
				// Almacenar el primer nombre, porque si el UserId ya está registrado, tomaremos
				// este y le adicionaremos 2000++ hasta que se convierta en único.
				string strPrimerNombre = strUserId.Substring(0,1).ToUpper() + strUserId.Substring(1);
				for(int x=1; x<=(aryUserId.Length-1); x++)
				{
					if(aryUserId[x].Length==0){continue;}
					strUserId += aryUserId[x].Substring(0,1).ToUpper();
				}
				// Reemplazar los caracteres acentuados y las ñ
				for(int x=0; x<=((chrAccents.Length/2)-1); x++)
				{
					strUserId = strUserId.Replace(chrAccents[0,x], chrAccents[1,x]);
				}
				// Hacer el primer caracter siempre mayúscula.
				if(strUserId.Length>0){strUserId = strUserId.Substring(0,1).ToUpper() + strUserId.Substring(1);}
				// Comprobar que no exista el usuario y generar un nuevo UserId si es así.
				if(existUserId(strUserId))
				{
					int intExtension = 2000;
					// Dejar el UserId logrado hasta el momento, porque tendremos que agregarles
					// ++2000 y si mantenemos las iniciales de los apellidos, se puede hacer muy 
					// tedioso el UserId para el usuario, así que será sólo Nombre2XXX, donde X
					// se incrementará hasta hallar un valor único.
					strUserId = strPrimerNombre;
					while(existUserId(strUserId + intExtension.ToString()))
					{
						++intExtension;
					}
					strUserId += intExtension.ToString();
				}
				return strUserId;
			}
			catch(System.Exception)
			{
				return "";
			}
		}

		/// <summary>
		/// Comprueba si existe el UserId pasado como parámetro.
		/// </summary>
		/// <param name="UserId"></param>
		/// <returns></returns>
		public bool existUserId(string UserId)
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "SELECT COUNT(Id) FROM " + this.m_TableName + " WHERE UserId='" + UserId + "';";
			bool boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boResult;
		}

		/// <summary>
		/// Comprueba si existe el UserId pasado como parámetro, pero teniendo en cuenta
		/// que no debe revisar en la fila del propio UserId pasado como parámetro.
		/// </summary>
		/// <param name="Id"></param>
		/// <param name="UserId"></param>
		/// <returns></returns>
		public bool existUserId(System.UInt32 Id, string UserId)
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "SELECT COUNT(Id) FROM " + this.m_TableName + " WHERE UserId='" + UserId + "' " + 
				"AND Id!=" + Id + ";";
			bool boResult = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boResult;
		}

		public bool canBeDeleted(System.UInt32 Id)
		{
			bool boResult = true;
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_bibliografia.Id_Usuario=tbl_usuario.Id THEN true ELSE false END AS Bibliogracia, " +
				"CASE WHEN tbl_PlanteaConsulta.Id_UsuarioMaestrante=tbl_usuario.Id THEN true ELSE false END AS PlanteaConsulta, " +
				"CASE WHEN tbl_RespondeConsulta.Id_UsuarioDocente=tbl_usuario.Id THEN true ELSE false END AS RespondeConsulta, " +
				"CASE WHEN tbl_RevisaTemaProyecto.Id_AcademicoRevisa=tbl_usuario.Id THEN true ELSE false END AS RevisaTemaProyecto, " +
				"CASE WHEN tbl_maestria.Id_UsuarioDirector=tbl_usuario.Id THEN true ELSE false END AS Director, " +
				"CASE WHEN tbl_encuentro_orientaciones.Id_UsuarioDocente=tbl_usuario.Id THEN true ELSE false END AS OrientacionesEncuentro " +
				"FROM tbl_usuario " + 
				"LEFT JOIN tbl_bibliografia ON tbl_usuario.Id = tbl_bibliografia.Id_Usuario " +
				"LEFT JOIN tbl_consulta AS tbl_PlanteaConsulta ON tbl_usuario.Id = tbl_PlanteaConsulta.Id_UsuarioMaestrante " +
				"LEFT JOIN tbl_consulta AS tbl_RespondeConsulta ON tbl_usuario.Id = tbl_RespondeConsulta.Id_UsuarioMaestrante " +
				"LEFT JOIN tbl_maestrante_tema_proyecto AS tbl_RevisaTemaProyecto ON tbl_usuario.Id = tbl_RevisaTemaProyecto.Id_AcademicoRevisa " +
				"LEFT JOIN tbl_maestria ON tbl_usuario.Id = tbl_maestria.Id_UsuarioDirector " +
				"LEFT JOIN tbl_encuentro_orientaciones ON tbl_usuario.Id = tbl_encuentro_orientaciones.Id_UsuarioDocente " +
				"WHERE tbl_usuario.Id=" + Id + ";";

			clsDAL oDAL = new clsDAL();
			DataTable dtUsuario = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtUsuario.Rows.Count==0){return false;}

			for(int x=0; x<=(dtUsuario.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtUsuario.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.UInt32 Id)
		{
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_bibliografia.Id_Usuario=tbl_usuario.Id THEN true ELSE false END AS Bibliogracia, " +
				"CASE WHEN tbl_PlanteaConsulta.Id_UsuarioMaestrante=tbl_usuario.Id THEN true ELSE false END AS PlanteaConsulta, " +
				"CASE WHEN tbl_RespondeConsulta.Id_UsuarioDocente=tbl_usuario.Id THEN true ELSE false END AS RespondeConsulta, " +
				"CASE WHEN tbl_RevisaTemaProyecto.Id_AcademicoRevisa=tbl_usuario.Id THEN true ELSE false END AS RevisaTemaProyecto, " +
				"CASE WHEN tbl_maestria.Id_UsuarioDirector=tbl_usuario.Id THEN true ELSE false END AS Director, " +
				"CASE WHEN tbl_encuentro_orientaciones.Id_UsuarioDocente=tbl_usuario.Id THEN true ELSE false END AS OrientacionesEncuentro " +
				"FROM tbl_usuario " + 
				"LEFT JOIN tbl_bibliografia ON tbl_usuario.Id = tbl_bibliografia.Id_Usuario " +
				"LEFT JOIN tbl_consulta AS tbl_PlanteaConsulta ON tbl_usuario.Id = tbl_PlanteaConsulta.Id_UsuarioMaestrante " +
				"LEFT JOIN tbl_consulta AS tbl_RespondeConsulta ON tbl_usuario.Id = tbl_RespondeConsulta.Id_UsuarioMaestrante " +
				"LEFT JOIN tbl_maestrante_tema_proyecto AS tbl_RevisaTemaProyecto ON tbl_usuario.Id = tbl_RevisaTemaProyecto.Id_AcademicoRevisa " +
				"LEFT JOIN tbl_maestria ON tbl_usuario.Id = tbl_maestria.Id_UsuarioDirector " +
				"LEFT JOIN tbl_encuentro_orientaciones ON tbl_usuario.Id = tbl_encuentro_orientaciones.Id_UsuarioDocente " +
				"WHERE tbl_usuario.Id=" + Id + ";";
				
			clsDAL oDAL = new clsDAL();
			DataTable dtUsuario = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtUsuario.Rows.Count==0){return ("El usuario ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtUsuario.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtUsuario.Rows[0][x]))
				{
					switch(dtUsuario.Columns[x].ColumnName)
					{
						case "Bibliografia":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe 'bibliografía' registrada por este usuario."); 
							break;
						}
						case "PlanteaConsulta":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrada, al menos, una 'Consulta' por este usuario."); 
							break;
						}
						case "RespondeConsulta":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrada, al menos, una respuesta a 'Consulta' que fue hecha por este usuario."); 
							break;
						}
						case "RevisaTemaProyecto":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe, al menos, un 'Tema de proyecto' que está autorizado o revizado por este usuario."); 
							break;
						}
						case "Director":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Este usuario aparece registrado como el Director de la maestría."); 
							break;
						}
						case "OrientacionesEncuentro":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrada, al menos, una 'Orientacion para encuentro presencial' a nombre de este usuario."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		#region "*** MIEMBROS PÚBLICOS ESTÁTICOS ***"

		public static string enuRoleToString(clsUsuario.enuRolesName enuRole)
		{
			
			switch(enuRole)
			{
				case clsUsuario.enuRolesName.Director:
				{
					return "Director";
				}
				case clsUsuario.enuRolesName.Academico:
				{
					return "Académico";
				}
				case clsUsuario.enuRolesName.Docente:
				{
					return "Docente";
				}
				case clsUsuario.enuRolesName.Maestrante:
				{
					return "Maestrante";
				}
				default:
				{
					return "Invitado";
				}
			}

		}

		#endregion "*** FIN DE MIEMBROS PÚBLICOS ESTÁTICOS ***"

		public bool Agregar()
		{
			// Rectificar para no insertar el valor '' en el campo email.
			this.email = this.email==string.Empty?null:this.email;

			string strSQL = "INSERT INTO " + this.m_TableName + " VALUES(null, '" + this.m_Nombre + "', " +
				"'" + this.m_Apellidos + "', '" + this.m_Sexo + "', '" + this.m_UserId + "', " +
				"PASSWORD('" + this.m_UserPass + "'), '" + this.m_CentroTrabajo + "', " + 
				"'" + this.m_Funcion + "', '" + this.m_email + "', " + 
				"'" + clsUtiles.getStringMySqlFormatedDate(System.DateTime.Now) + "', " +
				"" + this.m_CuentaBloqueada + ", " + this.m_PerfilPublico + ");";
			clsDAL oDAL = new clsDAL();
			oDAL.BeginTrans();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			this.m_Id = System.Convert.ToUInt32(oDAL.getLastIDENTITY(this.m_TableName));
			oDAL.CommitTrans();
			oDAL = null;
			return boResult;
		}

		public bool Actualizar()
		{
			if(this.m_Id==0){return false;}
			string strSQL = string.Empty; // Consulta para actualizar tbl_usuario.

			// Rectificar para no insertar el valor '' en el campo email.
			this.email = this.email==string.Empty?null:this.email;
			
			if(this.m_UserPass==string.Empty)
			{
				strSQL = "UPDATE " + this.m_TableName + " SET Nombre='" + this.m_Nombre + "', " +
					"Apellidos='" + this.m_Apellidos + "', Sexo='" + this.m_Sexo + "', UserId='" + this.m_UserId + "', " +
					"CentroTrabajo='" + this.m_CentroTrabajo + "', Funcion='" + this.m_Funcion + "', " +
					"email='" + this.m_email + "', CuentaBloqueada=" + this.m_CuentaBloqueada + ", PerfilPublico=" + this.m_PerfilPublico + " " + 
					"WHERE Id=" + this.m_Id + ";";
			}
			else
			{
				strSQL = "UPDATE " + this.m_TableName + " SET Nombre='" + this.m_Nombre + "', " +
					"Apellidos='" + this.m_Apellidos + "', Sexo='" + this.m_Sexo + "', UserId='" + this.m_UserId + "', " +
					"UserPass=PASSWORD('" + this.m_UserPass + "'), CentroTrabajo='" + this.m_CentroTrabajo + "', " + 
					"Funcion='" + this.m_Funcion + "', email='" + this.m_email + "', " + 
					"CuentaBloqueada=" + this.m_CuentaBloqueada + ", PerfilPublico=" + this.m_PerfilPublico + " " + 
					"WHERE Id=" + this.m_Id + ";";
			}
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;

		}

		public bool Eliminar()
		{
			if(this.m_Id==0){return false;}
			// Comprobar siempre si se puede eliminar antes de hacerlo, a pesar de que este método
			// es público, ya que al escribir el código se nos puede olvidar comprobar esto y MySQL
			// no admite chequeos de integridad, al menos en la 4.1.7.
			if(!this.canBeDeleted(this.m_Id)){return false;}
			clsDAL oDAL = new clsDAL();
			try
			{
				string strSQL = string.Empty;
				oDAL.BeginTrans();
				// Eliminar el tema de proyecto si existe solicitado.
				strSQL = "DELETE FROM tbl_maestrante_tema_proyecto WHERE Id_Usuario=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// Eliminar de la tabla de mensajes tanto si el mensaje es "From" como si es "To".
				strSQL = "DELETE FROM tbl_usuario_mensaje WHERE Id_Usuario_From=" + this.m_Id + " OR Id_Usuario_To=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// Eliminar de la tabla de séntecis curriculares.
				strSQL = "DELETE FROM tbl_usuario_sintesis_curricular WHERE Id_Usuario=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// Eliminar de la tabla de maestrantes.
				strSQL = "DELETE FROM tbl_usuario_maestrante WHERE Id_Usuario=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// Eliminar de la tabla de docentes.
				strSQL = "DELETE FROM tbl_usuario_docente WHERE Id_Usuario=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// Eliminar de la tabla de académcios.
				strSQL = "DELETE FROM tbl_usuario_academico WHERE Id_Usuario=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				// Eliminar de la tabla de usuarios.
				strSQL = "DELETE FROM tbl_usuario WHERE Id=" + this.m_Id + ";";
				oDAL.ExecCommand(strSQL);
				oDAL.CommitTrans();
				oDAL = null;
				return true;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al eliminar registro de usuario.", Ex); 
			}
		}

		public DataTable getById(System.UInt32 Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getAllRecords(clsUsuario.enuRolesName role)
		{
			string strEntityTableName = "tbl_usuario_academico";
			switch(role)
			{
				case clsUsuario.enuRolesName.Docente:
				{
					strEntityTableName = "tbl_usuario_docente";
					break;
				}
				case clsUsuario.enuRolesName.Maestrante:
				{
					strEntityTableName = "tbl_usuario_maestrante";
					break;
				}
			}
			string strSQL = "SELECT " + this.m_TableName + ".* " + 
				"FROM " + this.m_TableName + " " + 
				"INNER JOIN " + strEntityTableName + " ON " + this.m_TableName + ".Id=" + strEntityTableName + ".Id_Usuario " + 
				"ORDER BY Nombre, Apellidos, Sexo;";
			clsDAL oDAL = new clsDAL();
			DataTable dtUsuarios = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtUsuarios;
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

		public System.Data.DataTable buscarByTexto(string strNombre, string strApellidos, string strCentroTrabajo, string strFuncion)
		{
			string strSQL = "SELECT tbl_usuario.Id, tbl_usuario.Nombre, tbl_usuario.Apellidos, " +
				"tbl_usuario.CentroTrabajo, tbl_usuario.Funcion, tbl_maestria.Id_UsuarioDirector AS roleDirector, " +
				"tbl_usuario_academico.Id_Usuario AS roleAcademico, tbl_usuario_docente.Id_Usuario AS roleDocente, " +
				"tbl_usuario_maestrante.Id_Usuario AS roleMaestrante, tbl_usuario.PerfilPublico, tbl_usuario.datUltimoAcceso " +
				"FROM tbl_usuario " + 
				"LEFT JOIN tbl_maestria ON tbl_usuario.Id = tbl_maestria.Id_UsuarioDirector " +
				"LEFT JOIN tbl_usuario_academico ON tbl_usuario.Id = tbl_usuario_academico.Id_Usuario " + 
				"LEFT JOIN tbl_usuario_docente ON tbl_usuario.Id = tbl_usuario_docente.Id_Usuario " +
				"LEFT JOIN tbl_usuario_maestrante ON tbl_usuario.Id = tbl_usuario_maestrante.Id_Usuario " +
				"WHERE tbl_usuario.Nombre LIKE '" +  strNombre + "' OR tbl_usuario.Apellidos LIKE '" +  strApellidos + "' " + 
				"OR tbl_usuario.CentroTrabajo LIKE '" +  strCentroTrabajo + "' OR tbl_usuario.Funcion LIKE '" +  strFuncion + "' " + 
				"ORDER BY tbl_usuario.Nombre, tbl_usuario.Apellidos;";

			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;

		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	}	// Fin de la clase

}	// Fin del namespace
