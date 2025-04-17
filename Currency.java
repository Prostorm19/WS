package server;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author catch
 */
@WebService(serviceName = "Currency")
public class Currency {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "InrtoDollr")
    public String InrtoDollr(@WebParam(name = "a") double a) {
        //TODO write your implementation code here:
        return "the Indian Rupees "+a+" is "+(a/83);
    }

    /**
     * This is a sample web service operation
     */
    
}
