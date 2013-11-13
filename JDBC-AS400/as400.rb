require 'java'
require 'lib/jt400.jar'

begin
  java_import 'com.ibm.as400.access.AS400JDBCDriver'
  user = "someuser"
  pass = "somepass"
  conn = java.sql.DriverManager.getConnection("jdbc:as400://as400;naming=sql;errors=full", user, pass)
  stmt = conn.createStatement
  rs = stmt.executeQuery("select name from table")
  while (rs.next) do
    puts rs.getString("name")
  end
  rs.close
  stmt.close
  conn.close()
end