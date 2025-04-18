package ServerPackage;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;

import java.sql.*;

/**
 * REST Web Service
 *
 * @author catch
 */
@Path("generic")
public class GenericResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of GenericResource
     */
    public GenericResource() {
    }

    /**
     * Retrieves representation of an instance of ServerPackage.GenericResource
     * @return an instance of java.lang.String
     */
    @GET
    @Produces("application/xml")
    public String getXml() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }

    /**
     * PUT method for updating or creating an instance of GenericResource
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("application/xml")
    public void putXml(String content) {
    }
    
    @PUT
    @Consumes("application/xml")
    @Path("/ExecuteQuery")
    public String executeMyQuery(String query) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            String url="jdbc:mysql://localhost/ccdb1";
            Connection con= DriverManager.getConnection(url,"root","root");
            
            Statement st=con.createStatement();
            
            String q = query;
            st.execute(q);
            st.close();
            con.close();
            
            return "query is executed!!";
        }
        catch(Exception e){
            return e.getMessage();
        }
    }
    
    @PUT
    @Consumes("application/xml")
    @Path("/GetAllPlayers")
    public String GetAllPlayers(String query) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            String url="jdbc:mysql://localhost/ccdb1";
            Connection con= DriverManager.getConnection(url,"root","root");
            
            Statement st=con.createStatement();
            
            String q = query;
            
            String data="";
            
            ResultSet rs= st.executeQuery(q);
            
            while(rs.next())
            {
                data = data + rs.getString(1)+ " ";
                data = data + rs.getString(2)+ " ";
                data = data + rs.getString(3)+ " ";
                data = data + rs.getString(4)+ " ";
            }
            
            st.close();
            con.close();
            
            return data;
        }
        catch(Exception e){
            return e.getMessage();
        }
    }
}
