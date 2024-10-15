package org.example;

import java.sql.*;

public class query {

    public static void main(String[] args) throws SQLException {
        try {
            String url = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=root";
            Connection conn = DriverManager.getConnection(url);
            CallableStatement ejecucion = conn.prepareCall("call taller1.transferir_dinero(?,?,?)");
            ResultSet resultado = ejecucion.executeQuery();
            while(resultado.next()){
                System.out.println(resultado.getString("v_cuenta"));
                System.out.println(resultado.getString("v_saldo"));
            }
            resultado.close();
            conn.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
