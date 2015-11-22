using System;
using System.Data; // Para los DataTable, DataSet, DataReader.
using MySql.Data.MySqlClient; // Para objetos espec�ficos del proveedor administrado de MySql.

namespace ISPCFG.Msce
{
	/// <summary>
	/// Esta clase encapsula el acceso a datos, su nombre viene de "Data Access Layer".
	/// </summary>
	// Ejemplo de cadena de conexi�n utilizando ByteFX.Data.dll
	// m_oConn.ConnectionString = "server=DBServer;username=YourUserName;password=YourPassword;Database=DBName"

	public class clsDAL
	{
		#region "*** CONSTRUCTORES DE LA CLASE ***"
		
		// *******************************************************
		// *******************************************************
		/// <summary>
		/// CONSTRUCTOR DE LA CLASE QUE FUERZA A QUIEN LA INSTANCIE
		/// A PROPORCIONAR LOS VALORES PARA LA CADENA DE CONEXI�N.
		/// </summary>
		/// <param name="strServerName">Nombre del servidor de bases de datos que se utilizar�.</param>
		/// <param name="strDataBaseName">Nombre de la base de datos que almacena los datos de la aplicaci�n.</param>
		/// <param name="strUserName">Nombre del usuario con acceso a los datos.</param>
		/// <param name="strPassword">Contrase�a seg�n como corresponda para el usuario.</param>
		public clsDAL(string strServerName, string strDataBaseName, string strUserName, string strPassword)
		{
			m_oConn = new MySql.Data.MySqlClient.MySqlConnection("Server=" + strServerName + ";Database=" + strDataBaseName + ";Username=" + strUserName + ";Password=" + strPassword + ";Connection timeout=10");
		}

		/// <summary>
		/// CONSTRUCTOR DE LA CLASE QUE PERMITE QUE SEA INSTANCIADA 
		/// SIN PROPORCIONAR LOS VALORES PARA LA CADENA DE CONEXI�N
		/// TOMANDO LOS VALORES PREESTABLECIDOS.
		/// </summary>
		public clsDAL()
		{
			m_oConn = new MySql.Data.MySqlClient.MySqlConnection(
                "Server=" + clsSettings.DBServer + 
                ";Database=" + clsSettings.DBName + 
                ";Username=" + clsSettings.DBUserName + 
                ";Password=" + clsSettings.DBUserPassword + 
                ";Connection timeout=10");
		}

		#endregion "*** FIN DE CONSTRUCTORES DE LA CLASE ***"
		
		#region "*** VARIABLES PRIVADAS ***"

		/// <summary>
		/// Objeto MySqlConnection privado, utilizado para las conexiones a la base de datos.
		/// </summary>
		private MySql.Data.MySqlClient.MySqlConnection m_oConn;	// Objeto MySqlConnection
		/// <summary>
		/// Indicador para saber si se est� en una transacci�n.
		/// </summary>
		private bool m_IN_TRANSACTION = false;
		/// <summary>
		/// Objeto MySqlTransaction utilizado para las transacciones.
		/// </summary>
		private MySql.Data.MySqlClient.MySqlTransaction m_oTRANSACTION;
		
		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES P�BLICAS ***"

		#endregion "*** FIN DE PROPIEDADES P�BLICAS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		// **************************************************
		// DEVUELVE UN OBJETO MySqlConnection
		// **************************************************
		private MySql.Data.MySqlClient.MySqlConnection getConnection()
		{
			if(m_oConn.State == System.Data.ConnectionState.Open)
			{
				return m_oConn;
			}
			else
			{
//				try
//				{
					m_oConn.Open();
					return m_oConn;
//				}
//				catch(System.Exception Ex)
//				{
//          System.Diagnostics.Debug.WriteLine(Ex.ToString());
//					throw new System.Exception("Error al abrir la conexi�n con la base de datos.");
//				}
			}

		} // Fin de getConnection()

		// **************************************************
		// CIERRA LA CONEXI�N DEL OBJETO oConn EN CASO QUE SE
		// ENCUENTRE ABIERTA.
		// **************************************************
		private void CloseConnection()
		{
			if(m_oConn.State == System.Data.ConnectionState.Open)
			{
				m_oConn.Close();
			}
			
			return;

		} // Fin de CloseConnection()

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS P�BLICOS ***"

		/// <summary>
		/// Abre una conexi�n en modo de transacci�n, todos los m�todos que se ejecuten a continuaci�n
		/// y hasta que se ejecute el m�todo CommitTrans() � RollBackTrans() se har�n bajo la transacci�n iniciada por �ste.
		/// </summary>
		/// <returns></returns>
		public bool BeginTrans()
		{
			this.m_IN_TRANSACTION = true;
			this.m_oTRANSACTION = getConnection().BeginTransaction();
			return this.m_IN_TRANSACTION;
		}
		/// <summary>
		/// Hace efectivas las modificaciones hechas desde que se inici� la transacci�n utilizando el m�todo BeginTrans()
		/// </summary>
		/// <returns></returns>
		public bool CommitTrans()
		{
			if(this.m_IN_TRANSACTION)
			{
				this.m_oTRANSACTION.Commit();
			}

			this.m_IN_TRANSACTION = false;
			return true;

		}
		/// <summary>
		/// Deshace los cambios hechos en caso que se halla iniciado una transacci�n utilizando el m�todo BeginTrans().
		/// </summary>
		public void RollBackTrans()
		{
			if(this.m_IN_TRANSACTION)
			{
				this.m_oTRANSACTION.Rollback();
			}

			this.m_IN_TRANSACTION = false;
		}

		/// <summary>
		/// Devuelve un objeto DataTable a partir de los par�metros pasados.
		/// </summary>
		/// <param name="strSelectSQL">Sentencia SELECT para llenar el objeto DataTable.</param>
		/// <returns></returns>
		public System.Data.DataTable getDataTable(string strSelectSQL)
		{
			MySql.Data.MySqlClient.MySqlDataAdapter oDA = new MySql.Data.MySqlClient.MySqlDataAdapter(strSelectSQL, m_oConn);
			System.Data.DataTable oDT = new System.Data.DataTable();
			oDA.Fill(oDT);
			return oDT;
		}

		/// <summary>
		/// Devuelve la cantidad de registros afectados al ejecutar la sentencia SQL que se pasa como par�metro, 
		/// debe utilizarse una sentencia UPDATE � INSERT. 
		/// </summary>
		/// <param name="strSQL">Sentencia SQL a ejecutar.</param>
		/// <returns></returns>
		public int ExecCommand(string strSQL)
		{
			int intRecordsAffected;
			MySql.Data.MySqlClient.MySqlCommand oCommand = new MySql.Data.MySqlClient.MySqlCommand(strSQL, this.m_oConn);

			if(this.m_IN_TRANSACTION)
			{
				oCommand.Transaction = this.m_oTRANSACTION;
				intRecordsAffected = oCommand.ExecuteNonQuery();
			}
			else
			{
				this.getConnection();
				intRecordsAffected = oCommand.ExecuteNonQuery();
				this.CloseConnection();
			}

			return intRecordsAffected;

		} // Fin de ExecCommand()

		/// <summary>
		/// Obtiene el valor del ID del �ltimo registro insertado en la tabla que se pase como par�metro 'strTableName'.
		/// </summary>
		/// <param name="strTableName">Nombre de la tabla de la que se desea recuperar el �ltimo Id insertado.</param>
		/// <returns></returns>
		public object getLastIDENTITY(string strTableName)
		{
			// object oIDENTITY;
			string strSQL = "SELECT @@IDENTITY FROM " + strTableName + ";";
			return getEscalarValue(strSQL);
		}

		/// <summary>
		/// Devuelve el valor del primer campo, del primer registro seg�n la consulta que se pase como par�metro.
		/// </summary>
		/// <param name="strSQL">Sentencia SELECT para obtener el resultado.</param>
		/// <returns></returns>
		public object getEscalarValue(string strSQL)
		{
			object oResult;
			MySql.Data.MySqlClient.MySqlCommand oCommand = new MySqlCommand(strSQL, this.m_oConn);

			if(this.m_IN_TRANSACTION)
			{
				oCommand.Transaction = this.m_oTRANSACTION;
				oResult = oCommand.ExecuteScalar();
			}
			else
			{
				this.getConnection();
				oResult = oCommand.ExecuteScalar();
				this.CloseConnection();
			}

			return oResult;
		
		} // Fin de getEscalarValue()

		#endregion "*** FIN DE PROCEDIMIENTOS P�BLICOS ***"


	}
}
