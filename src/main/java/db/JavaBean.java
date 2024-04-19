package db;
import java.sql.*;
/**
 *
 * @author vali
 */
public class JavaBean {
	String error;
	Connection con;
	public JavaBean() {
	}
	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/streaming?useSSL=false", "root", "Septembrie10");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
					throw new Exception(error);
		}
	} // connect()
	public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", 
					"Septembrie10");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
					throw new Exception(error);
		}
	} // connect(String bd)
	public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, 
	Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", 
					"Septembrie10");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
					throw new Exception(error);
		}
	} // connect(String bd, String ip)
	public void disconnect() throws SQLException {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()
	public void adaugaAbonat(String Nume, String Prenume, int Varsta, String Data_nasterii, String Tara, String Adresa_mail)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into abonati(nume, prenume, varsta, data_nasterii, tara, adresa_mail) values('" + Nume
						+ "' , '" + Prenume + "', '" + Varsta + "', '" + Data_nasterii +"', '" + Tara + "', '" + Adresa_mail + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaPacient()
	public void adaugaStreamingService(String nume_serv, float taxa_serv)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into services(nume_serv, taxa_serv) values('" + nume_serv + 
						"' , '" + taxa_serv + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaMedic()
	public void adaugaAbonament(long idabonati, long idservices, String tip_abonament, String data_inceput, String data_expirare, float taxa)
					throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("insert into abonament(idabonati, idservices, tip_abonament, data_inceput, data_expirare, taxa) values('" + idabonati + "' , '" + idservices + "', '" + tip_abonament + "', '" + data_inceput + "', '" + data_expirare + "', '" + taxa + "');");
				// se poate modifica valoarea datei astfel incat sa se ia data curenta a sistemului:
				// stmt.executeUpdate("insert into consultatie(idpacient, idmedic, DataConsultatie, Diagnostic, Medicament) values('" + idpacient + "' , '" + idmedic + "', CURDATE(), '" + Diagnostic + "', '" + Medicament + "');");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of adaugaConsultatie()
	public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("select * from `streaming`.`" + tabel + "`;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, 
ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()
	public ResultSet vedeAbonament() throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("select a.nume , a.prenume , a.varsta, a.data_nasterii, a.tara, a.adresa_mail, b.nume_serv , b.taxa_serv , c.idabonament, c.idabonati, c.idservices , c.tip_abonament, c.data_inceput, c.data_expirare, c.taxa from abonati a, services b, abonament c where a.idabonati = c.idabonati and b.idservices = c.idservices;");
					Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, 
ResultSet.CONCUR_READ_ONLY*/);
					rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeConsultatie()
	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws
	SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
				for (int i = 0; i < primaryKeys.length; i++) {
					aux = java.lang.Long.parseLong(primaryKeys[i]);
					delete.setLong(1, aux);
					delete.execute();
				}
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			} catch (Exception e) {
				error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
				throw new Exception(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeDateTabela()
	public void stergeTabela(String tabela) throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("delete from " + tabela + ";");
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of stergeTabela()
	public void modificaTabela(String tabela, String IDTabela, long ID, String[] campuri, String[] valori) throws SQLException, Exception {
		String update = "update " + tabela + " set ";
		String temp = "";
		if (con != null) {
			try {
				for (int i = 0; i < campuri.length; i++) {
					if (i != (campuri.length - 1)) {
						temp = temp + campuri[i] + "='" + valori[i] + "', ";
					} else {
						temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
					}
				}
				update = update + temp;
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate(update);
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	} // end of modificaTabela()
	public ResultSet intoarceLinie(String tabela, long ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Executa interogarea
			String queryString = ("SELECT * FROM " + tabela + " where idabonati=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinie()
	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, long ID) throws
	SQLException, Exception {
		ResultSet rs = null;
		try {
			// Executa interogarea
			String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID
					+ ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()
	public ResultSet intoarceAbonamentId(long ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			// Executa interogarea
			String queryString = ("select a.nume, a.prenume , a.varsta, a.data_nasterii, a.tara, a.adresa_mail, b.nume_serv, b.taxa_serv , c.idabonament, c.idabonati, c.idservices , c.tip_abonament, c.data_inceput, c.data_expirare, c.taxa from abonati a, services b, abonament c where a.idabonati = c.idabonati and b.idservices = c.idservices and idabonament = '" + ID + "';");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()
}